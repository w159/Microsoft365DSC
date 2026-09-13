<#
.SYNOPSIS
    Discovers cmdlet and property information for the non-Graph workloads.

.DESCRIPTION
    Introspects the workload cmdlet (ExchangeOnline, MicrosoftTeams, SecurityComplianceCenter,
    PnP, PowerPlatforms) through Get-Command: the default parameter set supplies the property
    list, parameter help supplies the descriptions and the first mandatory parameter becomes the
    primary key (Teams resources force 'Identity'). Returns cmdlet names plus ready property
    models - the same shape the Graph acquisition produces, so everything downstream is shared.

.PARAMETER CmdLetNoun
    Specifies the cmdlet noun, e.g. 'DistributionGroup'.

.PARAMETER CmdLetVerb
    Specifies the verb of the cmdlet whose parameters describe the resource, usually 'New' or 'Set'.

.PARAMETER Workload
    Specifies the workload the cmdlet belongs to.
#>
function Get-M365DSCGenericCmdletInfo
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $CmdLetNoun,

        [Parameter()]
        [System.String]
        $CmdLetVerb = 'New',

        [Parameter(Mandatory = $true)]
        [System.String]
        $Workload
    )

    $commonParameters = @(
        'Verbose', 'Debug', 'ErrorAction', 'WarningAction', 'InformationAction', 'ErrorVariable',
        'WarningVariable', 'InformationVariable', 'OutVariable', 'OutBuffer', 'PipelineVariable',
        'WhatIf', 'Confirm', 'ProgressAction'
    )

    $cmdletName = "$CmdLetVerb-$CmdLetNoun"
    $cmdlet = Get-Command -Name $cmdletName -ErrorAction Stop

    $defaultParameterSet = $cmdlet.ParameterSets | Where-Object -FilterScript { $_.IsDefault }
    if ($null -eq $defaultParameterSet)
    {
        if ($cmdlet.ParameterSets.Count -eq 1)
        {
            $defaultParameterSet = $cmdlet.ParameterSets[0]
        }
        else
        {
            throw "Cmdlet '$cmdletName' does not have a default parameter set."
        }
    }

    $parameters = @($defaultParameterSet.Parameters | Where-Object -FilterScript {
            $_.Name -notin $commonParameters -and -not $_.Name.StartsWith('MsftInternal')
        })

    $primaryKey = ''
    $models = @()
    foreach ($parameter in $parameters)
    {
        # Descriptions come back as MamlDescription object arrays; flatten them to plain text.
        $description = ''
        $rawDescription = $null
        if ($null -ne $parameter.PSObject.Properties['Description'])
        {
            $rawDescription = $parameter.Description
        }
        if ($null -eq $rawDescription)
        {
            try
            {
                $rawDescription = (Get-Help -Name $cmdletName -Parameter $parameter.Name -ErrorAction SilentlyContinue).Description
            }
            catch
            {
                $rawDescription = $null
            }
        }
        if ($null -ne $rawDescription)
        {
            $description = (@($rawDescription | ForEach-Object {
                        if ($null -ne $_.PSObject.Properties['Text'])
                        {
                            $_.Text
                        }
                        else
                        {
                            [System.String] $_
                        }
                    }) -join ' ').Trim()
        }
        if ([System.String]::IsNullOrEmpty($description))
        {
            $description = "The $($parameter.Name) parameter of the $CmdLetNoun."
        }
        $description = $description.Replace('"', "'") -replace '\s+', ' '

        $isKey = $false
        if ($parameter.IsMandatory -or ($Workload -eq 'MicrosoftTeams' -and $parameter.Name -eq 'Identity'))
        {
            if ([System.String]::IsNullOrEmpty($primaryKey) -or $parameter.Name -eq 'Identity')
            {
                $primaryKey = $parameter.Name
            }
            $isKey = $true
        }

        $parameterType = $parameter.ParameterType
        $isArray = $parameterType.IsArray
        $typeName = $parameterType.FullName
        if ($isArray)
        {
            $typeName = $parameterType.GetElementType().FullName
        }

        $enumValues = @()
        if ($parameterType.IsEnum)
        {
            $enumValues = [System.String[]] [System.Enum]::GetNames($parameterType)
        }

        $models += New-M365DSCPropertyModel -Name $parameter.Name `
            -Type $typeName `
            -Description $description `
            -IsArray $isArray `
            -IsKey $isKey `
            -IsMandatory $parameter.IsMandatory `
            -EnumValues $enumValues
    }

    # Which cmdlets exist decides what Set() can do and what the tests mock.
    $result = @{
        Workload      = $Workload
        PrimaryKey    = $primaryKey
        Properties    = $models
        GetCmdlet     = "Get-$CmdLetNoun"
        NewCmdlet     = "New-$CmdLetNoun"
        UpdateCmdlet  = "Set-$CmdLetNoun"
        RemoveCmdlet  = "Remove-$CmdLetNoun"
    }

    foreach ($operation in @('Get', 'New', 'Update', 'Remove'))
    {
        $verb = $operation
        if ($operation -eq 'Update')
        {
            $verb = 'Set'
        }

        $exists = $null -ne (Get-Command -Name "$verb-$CmdLetNoun" -ErrorAction SilentlyContinue)
        $result["Supports$operation"] = $exists
        if (-not $exists)
        {
            Write-Warning -Message "Cmdlet '$verb-$CmdLetNoun' does not exist; the generated $operation logic will need manual attention."
        }
    }

    # Whether Export() can pass the -Filters entry the reverse engine collected. Also decides
    # whether the class declares the export-only $Filter property that the engine probes for.
    $getCommand = Get-Command -Name "Get-$CmdLetNoun" -ErrorAction SilentlyContinue
    $result.SupportsFilter = $null -ne $getCommand -and $getCommand.Parameters.ContainsKey('Filter')

    # Key parameter of the Get cmdlet, for the Get() lookup.
    $getKeys = @(Get-M365DSCCmdletKeyParameter -CmdletName "Get-$CmdLetNoun" -ParameterSetNames @('Identity', 'Default'))
    $result.GetKeyParameters = $getKeys

    return $result
}
