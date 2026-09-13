<#
.SYNOPSIS
    Emits the MSFT_<ResourceName>.psm1 class module from the resource model.

.DESCRIPTION
    Builds every token of Templates\ClassResource.Template.psm1 - property block, Get() lookup,
    Set() invocations, Export() enumeration, embedded CIM classes and per-resource helper
    functions - and expands the template in a single pass.

.PARAMETER ResourceModel
    Specifies the resource model.

.PARAMETER DestinationPath
    Specifies the .psm1 file to write. When omitted the content is returned as a string.
#>
function New-M365DSCClassModuleFile
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel,

        [Parameter()]
        [System.String]
        $DestinationPath
    )

    $cimClassBlocks = @()
    foreach ($complexClass in $ResourceModel.ComplexTypeClasses)
    {
        $cimClassBlocks += "class $($complexClass.CimClassName)`r`n{`r`n" +
        (New-M365DSCClassPropertyBlock -Properties $complexClass.Members) +
        "`r`n}"
    }

    $helperFunctionBlock = ''
    if ($ResourceModel.ComplexTypeClasses.Count -gt 0)
    {
        $helperFunctionBlock = New-M365DSCHelperFunctionBlock -ResourceModel $ResourceModel
    }

    $tokens = @{
        ResourceName           = $ResourceModel.ResourceName
        ResourceDescription    = $ResourceModel.ResourceDescription
        PrimaryKey             = $ResourceModel.PrimaryKey
        Workload               = $ResourceModel.Workload
        HasEnsure              = -not $ResourceModel.IsSingleInstance
        PropertyBlock          = New-M365DSCClassPropertyBlock -Properties $ResourceModel.Properties
        ExportOnlyPropertyBlock = New-M365DSCExportOnlyPropertyBlock -ResourceModel $ResourceModel
        GetInstanceBlock       = New-M365DSCGetInstanceBlock -ResourceModel $ResourceModel
        ComplexConversionBlock = New-M365DSCComplexConversionBlock -ResourceModel $ResourceModel
        HashtableMappingBlock  = New-M365DSCHashtableMappingBlock -ResourceModel $ResourceModel
        NewInvocationBlock     = New-M365DSCSetInvocationBlock -ResourceModel $ResourceModel -Operation 'New'
        UpdateInvocationBlock  = New-M365DSCSetInvocationBlock -ResourceModel $ResourceModel -Operation 'Update'
        RemoveInvocationBlock  = New-M365DSCSetInvocationBlock -ResourceModel $ResourceModel -Operation 'Remove'
        ExportGetAllBlock      = New-M365DSCExportGetAllBlock -ResourceModel $ResourceModel
        ExportParameterBlock   = New-M365DSCExportParameterBlock -ResourceModel $ResourceModel
        ExportComplexToStringBlock = New-M365DSCExportComplexToStringBlock -ResourceModel $ResourceModel
        ExportedInstanceLabel  = $ResourceModel.PrimaryKey
        AssignmentsGetBlock    = New-M365DSCAssignmentsGetBlock -ResourceModel $ResourceModel
        NoEscapeArgument       = ''
        CimInstanceClassBlock  = ($cimClassBlocks -join "`r`n`r`n")
        HelperFunctionBlock    = $helperFunctionBlock
    }

    if ($null -ne $ResourceModel.AlternativeKey)
    {
        $tokens.ExportedInstanceLabel = $ResourceModel.AlternativeKey
    }

    $complexPropertyNames = @($ResourceModel.SchemaProperties | Where-Object { $_.IsComplex }).Name
    if ($complexPropertyNames.Count -gt 0)
    {
        $quotedNames = "'" + ($complexPropertyNames -join "', '") + "'"
        $tokens.NoEscapeArgument = " ```r`n                    -NoEscape @($quotedNames)"
    }

    $templatePath = Join-Path -Path $PSScriptRoot -ChildPath '..\..\Templates\ClassResource.Template.psm1'

    if ($PSBoundParameters.ContainsKey('DestinationPath'))
    {
        return (Expand-M365DSCTemplate -TemplatePath $templatePath -Tokens $tokens -DestinationPath $DestinationPath)
    }

    return (Expand-M365DSCTemplate -TemplatePath $templatePath -Tokens $tokens)
}

<#
.SYNOPSIS
    Maps a cmdlet key parameter to the $this property that supplies its value.
#>
function Get-M365DSCKeyArgumentString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel,

        [Parameter()]
        [System.String[]]
        $Keys = @(),

        [Parameter()]
        [System.String[]]
        $SkipKeys = @()
    )

    $arguments = @()
    foreach ($key in $Keys)
    {
        if ($key -in $SkipKeys)
        {
            continue
        }

        $propertyName = $ResourceModel.PrimaryKey

        $matchingProperty = $ResourceModel.SchemaProperties | Where-Object -FilterScript { $_.Name -eq $key } | Select-Object -First 1
        if ($null -ne $matchingProperty)
        {
            $propertyName = $matchingProperty.Name
        }
        elseif ($key -notlike '*Id')
        {
            Write-Warning -Message "Key parameter '$key' has no matching resource property; mapping it to the primary key '$($ResourceModel.PrimaryKey)'. Review the generated code."
        }

        $arguments += "-$key `$this.$propertyName"
    }

    return ($arguments -join ' ')
}

<#
.SYNOPSIS
    Renders the primary-key lookup (plus the alternative-key fallback) inside Get().
#>
function New-M365DSCGetInstanceBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel,

        [Parameter()]
        [System.Int32]
        $IndentCount = 16
    )

    $indent = ' ' * $IndentCount
    $builder = [System.Text.StringBuilder]::new()
    $cmdlets = $ResourceModel.Cmdlets
    $getCmdlet = $cmdlets.GetCmdlet
    $primaryKey = $ResourceModel.PrimaryKey

    $keyArguments = Get-M365DSCKeyArgumentString -ResourceModel $ResourceModel -Keys $cmdlets.GetKeyParameters
    if ([System.String]::IsNullOrEmpty($keyArguments))
    {
        $keyArguments = "-Identity `$this.$primaryKey"
    }

    # Class methods parse-check variable assignment; $getValue must exist unconditionally.
    $null = $builder.AppendLine("$indent`$getValue = `$null")
    $null = $builder.AppendLine("${indent}if (-not [System.String]::IsNullOrEmpty(`$this.$primaryKey))")
    $null = $builder.AppendLine("$indent{")
    $null = $builder.AppendLine("$indent    `$getValue = $getCmdlet $keyArguments ``")
    $null = $builder.AppendLine("$indent        -ErrorAction SilentlyContinue")
    $null = $builder.AppendLine("$indent}")

    # Fallback lookup by the alternative key (usually DisplayName) when the id is unknown.
    if ($null -ne $ResourceModel.AlternativeKey)
    {
        $alternativeKey = $ResourceModel.AlternativeKey
        $null = $builder.AppendLine('')
        $null = $builder.AppendLine("${indent}if (`$null -eq `$getValue -and -not [System.String]::IsNullOrEmpty(`$this.$alternativeKey))")
        $null = $builder.AppendLine("$indent{")

        if ($cmdlets.SupportsFilter)
        {
            $filterExpression = "$alternativeKey eq '`$(`$this.$alternativeKey -replace `"'`", `"''`")'"
            if ($ResourceModel.IsAdditionalProperty)
            {
                $filterExpression += " and isof('microsoft.graph.$($ResourceModel.SelectedODataType)')"
            }

            $null = $builder.AppendLine("$indent    `$getValue = $getCmdlet ``")
            $null = $builder.AppendLine("$indent        -Filter `"$filterExpression`" ``")
            $null = $builder.AppendLine("$indent        -ErrorAction SilentlyContinue | Select-Object -First 1")
        }
        else
        {
            $null = $builder.AppendLine("$indent    `$getValue = $getCmdlet -ErrorAction SilentlyContinue | Where-Object ``")
            $null = $builder.AppendLine("$indent        -FilterScript { `$_.$alternativeKey -eq `$this.$alternativeKey } | Select-Object -First 1")
        }

        $null = $builder.AppendLine("$indent}")
    }

    return $builder.ToString().TrimEnd()
}

<#
.SYNOPSIS
    Renders the body of one Set() branch (create, update or remove).
#>
function New-M365DSCSetInvocationBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel,

        [Parameter(Mandatory = $true)]
        [ValidateSet('New', 'Update', 'Remove')]
        [System.String]
        $Operation
    )

    $indent = ' ' * 16
    $builder = [System.Text.StringBuilder]::new()
    $cmdlets = $ResourceModel.Cmdlets
    $isGraph = $ResourceModel.Workload -in @('MicrosoftGraph', 'Intune')
    $primaryKey = $ResourceModel.PrimaryKey

    switch ($Operation)
    {
        'Remove'
        {
            $keyArguments = Get-M365DSCKeyArgumentString -ResourceModel $ResourceModel -Keys $cmdlets.RemoveKeyParameters
            if ([System.String]::IsNullOrEmpty($keyArguments))
            {
                $keyArguments = "-Identity `$this.$primaryKey -Confirm:`$false"
            }

            $null = $builder.AppendLine("$indent$($cmdlets.RemoveCmdlet) $keyArguments | Out-Null")
        }
        'New'
        {
            $variableName = 'createParameters'
            $cmdletName = $cmdlets.NewCmdlet
            $bodyKeys = $cmdlets.NewKeyParameters
        }
        'Update'
        {
            $variableName = 'updateParameters'
            $cmdletName = $cmdlets.UpdateCmdlet
            $bodyKeys = $cmdlets.UpdateKeyParameters
        }
    }

    if ($Operation -eq 'Remove')
    {
        return $builder.ToString().TrimEnd()
    }

    $null = $builder.AppendLine("$indent`$$variableName = Remove-M365DSCAuthenticationParameter -BoundParameters `$this.GetBoundParameters()")

    if ($isGraph)
    {
        if ($ResourceModel.HasAssignments)
        {
            $null = $builder.AppendLine("$indent`$$variableName.Remove('Assignments') | Out-Null")
        }

        $null = $builder.AppendLine("$indent`$$variableName = Rename-M365DSCCimInstanceParameter -Properties `$$variableName")
        $null = $builder.AppendLine("$indent`$$variableName.Remove('$primaryKey') | Out-Null")

        if ($ResourceModel.IsAdditionalProperty)
        {
            $null = $builder.AppendLine("$indent`$$variableName.Add('@odata.type', '#microsoft.graph.$($ResourceModel.SelectedODataType)')")
        }

        $keyArguments = Get-M365DSCKeyArgumentString -ResourceModel $ResourceModel -Keys $bodyKeys -SkipKeys @('BodyParameter')
        $argumentList = @()
        if (-not [System.String]::IsNullOrEmpty($keyArguments))
        {
            $argumentList += $keyArguments
        }
        $argumentList += "-BodyParameter `$$variableName"

        $null = $builder.AppendLine('')

        if ($ResourceModel.HasAssignments -and $Operation -eq 'New')
        {
            $null = $builder.AppendLine("$indent`$createdInstance = $cmdletName $($argumentList -join ' ')")
            $null = $builder.Append((New-M365DSCAssignmentsSetBlock -ResourceModel $ResourceModel -PolicyIdExpression '$createdInstance.Id'))
            $null = $builder.AppendLine('')
        }
        elseif ($ResourceModel.HasAssignments -and $Operation -eq 'Update')
        {
            $null = $builder.AppendLine("$indent$cmdletName $($argumentList -join ' ') | Out-Null")
            $null = $builder.Append((New-M365DSCAssignmentsSetBlock -ResourceModel $ResourceModel -PolicyIdExpression "`$this.$primaryKey"))
            $null = $builder.AppendLine('')
        }
        else
        {
            $null = $builder.AppendLine("$indent$cmdletName $($argumentList -join ' ') | Out-Null")
        }
    }
    else
    {
        if ($Operation -eq 'New')
        {
            # Most New- cmdlets refuse an explicit key when it doubles as the identity.
            $keyProperty = $ResourceModel.SchemaProperties | Where-Object -FilterScript { $_.Name -eq $primaryKey } | Select-Object -First 1
            if ($null -ne $keyProperty -and -not $keyProperty.IsMandatory -and $primaryKey -eq 'Identity')
            {
                $null = $builder.AppendLine("$indent`$$variableName.Remove('$primaryKey') | Out-Null")
            }
        }

        $null = $builder.AppendLine('')
        $null = $builder.AppendLine("$indent$cmdletName @$variableName | Out-Null")
    }

    return $builder.ToString().TrimEnd()
}

<#
.SYNOPSIS
    Renders the export-only property declarations.
#>
function New-M365DSCExportOnlyPropertyBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $declarations = @()

    if ($ResourceModel.Cmdlets.SupportsFilter)
    {
        $declarations += '[System.String] $Filter'
    }

    if (@($ResourceModel.Properties | Where-Object { $_.Name -eq 'ApplicationSecret' }).Count -eq 0)
    {
        $declarations += '[System.Management.Automation.PSCredential] $ApplicationSecret'
    }

    $indent = ' ' * 4
    $blocks = @()
    foreach ($declaration in $declarations)
    {
        $blocks += "$indent# Export-only. Not part of the resource schema.`r`n$indent$declaration"
    }

    return ($blocks -join "`r`n`r`n")
}

<#
.SYNOPSIS
    Renders the enumeration at the top of Export().
#>
function New-M365DSCExportGetAllBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $indent = ' ' * 12
    $cmdlets = $ResourceModel.Cmdlets
    $arguments = @()
    $prelude = ''

    $cachedCollections = @{
        'Get-MgBetaDeviceManagementDeviceConfiguration'           = 'deviceConfigurations'
        'Get-MgBetaDeviceManagementDeviceCompliancePolicy'        = 'deviceCompliancePolicies'
        'Get-MgBetaDeviceManagementDeviceEnrollmentConfiguration' = 'deviceEnrollmentConfigurations'
    }
    if ($ResourceModel.IsAdditionalProperty -and $cachedCollections.ContainsKey($cmdlets.GetCmdlet))
    {
        return "$indent[array] `$exportedInstances = Get-M365DSCExportCachedCollection -Collection '$($cachedCollections[$cmdlets.GetCmdlet])' ``" + "`r`n" +
        "$indent    -ODataType 'microsoft.graph.$($ResourceModel.SelectedODataType)' ``" + "`r`n" +
        "$indent    -Filter `$this.Filter"
    }

    if ($cmdlets.SupportsAll)
    {
        $arguments += '-All'
    }

    if ($ResourceModel.HasAssignments)
    {
        $arguments += "-ExpandProperty 'assignments'"
    }

    if ($cmdlets.SupportsFilter)
    {
        if ($ResourceModel.IsAdditionalProperty)
        {
            $prelude = "$indent`$baseFilter = `"isof('microsoft.graph.$($ResourceModel.SelectedODataType)')`"`r`n" +
            "$indent`$mergedFilter = `$baseFilter`r`n" +
            "$indent" + 'if (-not [System.String]::IsNullOrEmpty($this.Filter))' + "`r`n" +
            "$indent{`r`n" +
            "$indent    `$mergedFilter = `"(`$baseFilter) and (`$(`$this.Filter))`"`r`n" +
            "$indent}`r`n"
            $arguments += '-Filter $mergedFilter'
        }
        else
        {
            $arguments += '-Filter $this.Filter'
        }
    }

    $argumentString = ''
    if ($arguments.Count -gt 0)
    {
        $argumentString = ' ' + ($arguments -join ' ')
    }

    return $prelude + "$indent[array] `$exportedInstances = $($cmdlets.GetCmdlet)$argumentString ``" + "`r`n" +
    "$indent    -ErrorAction Stop"
}

<#
.SYNOPSIS
    Renders the $Params hashtable inside the Export() loop.
#>
function New-M365DSCExportParameterBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $indent = ' ' * 20
    $builder = [System.Text.StringBuilder]::new()

    $entries = [ordered]@{}
    $entries[$ResourceModel.PrimaryKey] = "`$exportedInstance.$($ResourceModel.PrimaryKey)"
    if ($ResourceModel.IsSingleInstance)
    {
        $entries['IsSingleInstance'] = "'Yes'"
    }
    if ($null -ne $ResourceModel.AlternativeKey)
    {
        $entries[$ResourceModel.AlternativeKey] = "`$exportedInstance.$($ResourceModel.AlternativeKey)"
    }

    foreach ($authProperty in ($ResourceModel.Properties | Where-Object { $_.IsAuth }))
    {
        $entries[$authProperty.Name] = "`$this.$($authProperty.Name)"
    }

    $longestName = ($entries.Keys | Measure-Object -Property Length -Maximum).Maximum
    foreach ($entryName in $entries.Keys)
    {
        $padding = ' ' * ($longestName - $entryName.Length)
        $null = $builder.AppendLine("$indent$entryName$padding = $($entries[$entryName])")
    }

    return $builder.ToString().TrimEnd()
}

<#
.SYNOPSIS
    Renders the complex-property to string conversions inside the Export() loop.
#>
function New-M365DSCExportComplexToStringBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $indent = ' ' * 16
    $builder = [System.Text.StringBuilder]::new()

    foreach ($property in ($ResourceModel.SchemaProperties | Where-Object { $_.IsComplex }))
    {
        $name = $property.Name
        $null = $builder.AppendLine("${indent}if (`$null -ne `$Results.$name)")
        $null = $builder.AppendLine("$indent{")
        $null = $builder.AppendLine("$indent    `$complexTypeStringResult = Get-M365DSCDRGComplexTypeToString ``")
        $null = $builder.AppendLine("$indent        -ComplexObject `$Results.$name ``")
        $null = $builder.AppendLine("$indent        -CIMInstanceName '$($property.CimClassName)'")
        $null = $builder.AppendLine("$indent    if (-not [System.String]::IsNullOrWhiteSpace(`$complexTypeStringResult))")
        $null = $builder.AppendLine("$indent    {")
        $null = $builder.AppendLine("$indent        `$Results.$name = `$complexTypeStringResult")
        $null = $builder.AppendLine("$indent    }")
        $null = $builder.AppendLine("$indent    else")
        $null = $builder.AppendLine("$indent    {")
        $null = $builder.AppendLine("$indent        `$Results.Remove('$name') | Out-Null")
        $null = $builder.AppendLine("$indent    }")
        $null = $builder.AppendLine("$indent}")
        $null = $builder.AppendLine('')
    }

    return $builder.ToString().TrimEnd()
}
