<#
.SYNOPSIS
    Emits the resource's unit test file in the class-based test pattern.

.DESCRIPTION
    The generated test mirrors the hand-written tests of converted resources: it instantiates the
    resource through New-M365DSCResourceInstance, asserts every scalar property value returned by
    Get() against the expected fake value, and drives the drift context with a mock returning
    genuinely different values - both things the old generator never did. The same emitter serves
    Graph and non-Graph workloads.

.PARAMETER ResourceModel
    Specifies the resource model.

.PARAMETER DestinationPath
    Specifies the .Tests.ps1 file to write. When omitted the content is returned as a string.
#>
function New-M365DSCUnitTestFile
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

    $tokens = @{
        ResourceName        = $ResourceModel.ResourceName
        HasEnsure           = -not $ResourceModel.IsSingleInstance
        GetCmdletName       = $ResourceModel.Cmdlets.GetCmdlet
        NewCmdletName       = $ResourceModel.Cmdlets.NewCmdlet
        SetCmdletName       = $ResourceModel.Cmdlets.UpdateCmdlet
        RemoveCmdletName    = $ResourceModel.Cmdlets.RemoveCmdlet
        GetMockBody         = New-M365DSCGetMockBody -ResourceModel $ResourceModel
        DriftGetMockBody    = New-M365DSCGetMockBody -ResourceModel $ResourceModel -Drift -IndentCount 20
        AdditionalMockBlock = New-M365DSCAdditionalMockBlock -ResourceModel $ResourceModel
        TestParamsBlock     = New-M365DSCTestParamsBlock -ResourceModel $ResourceModel
        KeysOnlyParamsBlock = New-M365DSCTestParamsBlock -ResourceModel $ResourceModel -KeysOnly
        PropertyAssertions  = New-M365DSCPropertyAssertionBlock -ResourceModel $ResourceModel
    }

    $templatePath = Join-Path -Path $PSScriptRoot -ChildPath '..\..\Templates\UnitTest.Template.ps1'

    if ($PSBoundParameters.ContainsKey('DestinationPath'))
    {
        return (Expand-M365DSCTemplate -TemplatePath $templatePath -Tokens $tokens -DestinationPath $DestinationPath)
    }

    return (Expand-M365DSCTemplate -TemplatePath $templatePath -Tokens $tokens)
}

<#
.SYNOPSIS
    Renders extra BeforeAll mocks required by the resource, e.g. for Intune assignments.
#>
function New-M365DSCAdditionalMockBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $cachedCollectionCmdlets = @(
        'Get-MgBetaDeviceManagementDeviceConfiguration',
        'Get-MgBetaDeviceManagementDeviceCompliancePolicy',
        'Get-MgBetaDeviceManagementDeviceEnrollmentConfiguration'
    )
    $usesCachedCollection = $ResourceModel.IsAdditionalProperty -and $cachedCollectionCmdlets -contains $ResourceModel.Cmdlets.GetCmdlet
    if (-not $ResourceModel.HasAssignments -and -not $usesCachedCollection)
    {
        return ''
    }

    $indent = ' ' * 12
    $builder = [System.Text.StringBuilder]::new()
    if ($usesCachedCollection)
    {
        $null = $builder.AppendLine('')
        $null = $builder.AppendLine("${indent}Mock -CommandName Get-M365DSCExportCachedCollection -MockWith {")
        $null = $builder.AppendLine("$indent    return $($ResourceModel.Cmdlets.GetCmdlet)")
        $null = $builder.Append("$indent}")
    }
    if ($ResourceModel.HasAssignments)
    {
        $null = $builder.AppendLine('')
        $null = $builder.AppendLine("${indent}Mock -CommandName $($ResourceModel.Cmdlets.AssignmentCmdlet) -MockWith {")
        $null = $builder.AppendLine("$indent}")
        $null = $builder.AppendLine('')
        $null = $builder.AppendLine("${indent}Mock -CommandName Update-DeviceConfigurationPolicyAssignment -MockWith {")
        $null = $builder.Append("$indent}")
    }

    return $builder.ToString()
}

<#
.SYNOPSIS
    Projects a property's fake value into the shape the workload cmdlet returns.
#>
function ConvertTo-M365DSCApiShapeValue
{
    [CmdletBinding()]
    [OutputType([System.Object])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $Property,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Drift
    )

    $value = $Property.FakeValue
    if ($Drift)
    {
        $driftValue = $Property.DriftValue
        if ($null -ne $driftValue -and -not $Property.IsKey)
        {
            $value = $driftValue
        }
    }

    if ($null -eq $value)
    {
        return $null
    }

    if ($Property.IsComplex)
    {
        $instances = @()
        foreach ($instance in @($value))
        {
            $projected = [ordered]@{}
            foreach ($member in $Property.Members)
            {
                if ($instance -isnot [System.Collections.IDictionary] -or -not $instance.Contains($member.Name))
                {
                    continue
                }

                $memberValue = ConvertTo-M365DSCApiShapeMemberValue -Member $member -Value $instance[$member.Name]
                if ($null -eq $memberValue)
                {
                    continue
                }

                $key = $member.GraphName
                $projected[$key] = $memberValue
            }
            $instances += $projected
        }

        if ($Property.IsArray)
        {
            # The comma keeps a single-element array from unrolling on return.
            return , @($instances)
        }

        return $instances[0]
    }

    return (ConvertTo-M365DSCApiShapeMemberValue -Member $Property -Value $value)
}

<#
.SYNOPSIS
    Projects one scalar (or nested complex) fake value into API shape.
#>
function ConvertTo-M365DSCApiShapeMemberValue
{
    [CmdletBinding()]
    [OutputType([System.Object])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $Member,

        [Parameter()]
        [AllowNull()]
        [System.Object]
        $Value
    )

    if ($null -eq $Value)
    {
        return $null
    }

    if ($Member.IsComplex)
    {
        # Rebuild a pseudo property model call for nested complex values.
        $nested = [PSCustomObject]@{
            FakeValue  = $Value
            DriftValue = $null
            IsKey      = $false
            IsComplex  = $true
            IsArray    = $Member.IsArray
            Members    = $Member.Members
            GraphName  = $Member.GraphName
        }
        return (ConvertTo-M365DSCApiShapeValue -Property $nested)
    }

    switch ($Member.FakeKind)
    {
        'DateTime'
        {
            # A real DateTime, so the generated .ToUniversalTime().ToString('o') conversion runs.
            return [System.Management.Automation.ScriptBlock]::Create(
                "[System.DateTime]::Parse('$Value', [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::AdjustToUniversal)")
        }
        'Time'
        {
            return [System.Management.Automation.ScriptBlock]::Create("[System.TimeSpan]'$Value'")
        }
    }

    return $Value
}

<#
.SYNOPSIS
    Renders the body of the Get cmdlet mock: branch on -All and on the key parameter.
#>
function New-M365DSCGetMockBody
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Drift,

        [Parameter()]
        [System.Int32]
        $IndentCount = 16
    )

    $indent = ' ' * $IndentCount
    $builder = [System.Text.StringBuilder]::new()

    $apiValue = [ordered]@{}
    $additionalProperties = [ordered]@{}

    foreach ($property in $ResourceModel.SchemaProperties)
    {
        $value = ConvertTo-M365DSCApiShapeValue -Property $property -Drift:$Drift
        if ($null -eq $value)
        {
            continue
        }

        if ($property.IsFromAdditionalProperties)
        {
            $additionalProperties[$property.GraphName] = $value
        }
        else
        {
            $apiValue[$property.Name] = $value
        }
    }

    if ($ResourceModel.IsAdditionalProperty)
    {
        $ordered = [ordered]@{ '@odata.type' = "#microsoft.graph.$($ResourceModel.SelectedODataType)" }
        foreach ($key in $additionalProperties.Keys)
        {
            $ordered[$key] = $additionalProperties[$key]
        }
        $apiValue['AdditionalProperties'] = $ordered
    }

    $literal = ConvertTo-M365DSCPSLiteral -Value $apiValue -IndentCount ($IndentCount + 4)

    $keyVariable = $ResourceModel.PrimaryKey
    if ($ResourceModel.Cmdlets.GetKeyParameters.Count -gt 0)
    {
        $keyVariable = $ResourceModel.Cmdlets.GetKeyParameters[0]
    }

    if ($ResourceModel.Cmdlets.SupportsAll)
    {
        $null = $builder.AppendLine("${indent}if (`$All)")
        $null = $builder.AppendLine("$indent{")
        $null = $builder.AppendLine("$indent    return @(")
        $null = $builder.AppendLine("$indent        $(ConvertTo-M365DSCPSLiteral -Value $apiValue -IndentCount ($IndentCount + 8))")
        $null = $builder.AppendLine("$indent    )")
        $null = $builder.AppendLine("$indent}")
    }

    $null = $builder.AppendLine("${indent}if (`$$keyVariable)")
    $null = $builder.AppendLine("$indent{")
    $null = $builder.AppendLine("$indent    return $(ConvertTo-M365DSCPSLiteral -Value $apiValue -IndentCount ($IndentCount + 4))")
    $null = $builder.AppendLine("$indent}")

    if ($ResourceModel.Cmdlets.SupportsAll -or -not [System.String]::IsNullOrEmpty($keyVariable))
    {
        $null = $builder.AppendLine("${indent}return `$null")
    }
    else
    {
        $null = $builder.AppendLine("${indent}return $literal")
    }

    return $builder.ToString().TrimEnd()
}

<#
.SYNOPSIS
    Renders the $testParams hashtable body (DSC-shaped desired state).
#>
function New-M365DSCTestParamsBlock
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $KeysOnly,

        [Parameter()]
        [System.Int32]
        $IndentCount = 20
    )

    $indent = ' ' * $IndentCount
    $entries = [ordered]@{}

    foreach ($property in $ResourceModel.SchemaProperties)
    {
        if ($KeysOnly -and -not $property.IsKey)
        {
            continue
        }

        $value = $property.FakeValue
        if ($null -eq $value)
        {
            continue
        }

        $entries[$property.Name] = ConvertTo-M365DSCPSLiteral -Value $value -IndentCount $IndentCount
    }

    if (-not $ResourceModel.IsSingleInstance)
    {
        if ($KeysOnly)
        {
            $entries['Ensure'] = "'Absent'"
        }
        else
        {
            $entries['Ensure'] = "'Present'"
        }
    }
    else
    {
        $entries['IsSingleInstance'] = "'Yes'"
    }

    $entries['Credential'] = '$Credential'

    $longestName = ($entries.Keys | Measure-Object -Property Length -Maximum).Maximum
    $builder = [System.Text.StringBuilder]::new()
    foreach ($entryName in $entries.Keys)
    {
        $padding = ' ' * ($longestName - $entryName.Length)
        $null = $builder.AppendLine("$indent$entryName$padding = $($entries[$entryName])")
    }

    return $builder.ToString().TrimEnd()
}

<#
.SYNOPSIS
    Renders one Should -Be assertion per scalar property against its fake value.
#>
function New-M365DSCPropertyAssertionBlock
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

    foreach ($property in $ResourceModel.SchemaProperties)
    {
        # Complex values are covered by the Test() assertion; scalars are asserted one by one.
        if ($property.IsComplex -or $null -eq $property.FakeValue)
        {
            continue
        }

        $literal = ConvertTo-M365DSCPSLiteral -Value $property.FakeValue
        $null = $builder.AppendLine("$indent`$result.$($property.Name) | Should -Be $literal")
    }

    return $builder.ToString().TrimEnd()
}
