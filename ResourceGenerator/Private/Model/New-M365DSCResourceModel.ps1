<#
.SYNOPSIS
    Assembles the complete intermediate representation of a resource to generate.

.DESCRIPTION
    Every emitter (class module, unit test, example, settings, readme) is a projection of the
    object returned here.

.PARAMETER ResourceName
    Specifies the resource name, for example 'AADPermissionGrantPolicy'.

.PARAMETER Workload
    Specifies the workload.

.PARAMETER CmdletInfo
    Specifies the hashtable produced by Get-M365DSCGraphCmdletInfo or Get-M365DSCGenericCmdletInfo.

.PARAMETER Properties
    Specifies the schema property models. The auth and Ensure properties are appended here.

.PARAMETER ParametersToSkip
    Specifies property names to leave out of the generated resource.

.PARAMETER SelectedODataType
    Specifies the concrete OData subtype for polymorphic Graph entities.

.PARAMETER IsAdditionalProperty
    Indicates that the resource's typed properties travel under AdditionalProperties in the API.

.PARAMETER IsSingleInstance
    Indicates a singleton resource (gets an IsSingleInstance key instead of Id).

.PARAMETER CmdLetNoun
    Specifies the cmdlet noun the resource was generated from. Recorded in settings.json under
    generatedFrom.

.PARAMETER CmdLetVerb
    Specifies the verb of the cmdlet whose parameters describe the resource (non-Graph workloads).

.PARAMETER IncludeNavigationProperties
    Indicates that Graph navigation properties were included in the generated schema.
#>
function New-M365DSCResourceModel
{
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ResourceName,

        [Parameter(Mandatory = $true)]
        [ValidateSet('ExchangeOnline', 'Intune', 'SecurityComplianceCenter', 'PnP', 'PowerPlatforms', 'MicrosoftTeams', 'MicrosoftGraph')]
        [System.String]
        $Workload,

        [Parameter(Mandatory = $true)]
        [System.Collections.Hashtable]
        $CmdletInfo,

        [Parameter(Mandatory = $true)]
        [System.Object[]]
        $Properties,

        [Parameter()]
        [System.String[]]
        $ParametersToSkip = @(),

        [Parameter()]
        [System.String]
        $SelectedODataType,

        [Parameter()]
        [System.Boolean]
        $IsAdditionalProperty = $false,

        [Parameter()]
        [System.Boolean]
        $IsSingleInstance = $false,

        [Parameter()]
        [System.String]
        $CmdLetNoun,

        [Parameter()]
        [System.String]
        $CmdLetVerb = 'New',

        [Parameter()]
        [System.Boolean]
        $IncludeNavigationProperties = $false
    )

    # Read-only server-side properties that never belong in a DSC schema.
    $readOnlyProperties = @(
        'createdDateTime', 'deletedDateTime', 'isAssigned', 'lastModifiedDateTime', 'priorityMetaData',
        'retryCount', 'settingCount', 'templateReference', 'creationSource'
    )

    $schemaProperties = @($Properties | Where-Object -FilterScript {
            $_.GraphName -notin $readOnlyProperties -and
            $_.Name -notin $ParametersToSkip
        })

    # Only polymorphic Graph resources round-trip subtype properties through AdditionalProperties.
    if (-not $IsAdditionalProperty)
    {
        foreach ($property in $schemaProperties)
        {
            $property.IsFromAdditionalProperties = $false
        }
    }

    # Primary key precedence is the acquired value, then Id, then the first property.
    $primaryKey = $CmdletInfo.PrimaryKey
    if ([System.String]::IsNullOrEmpty($primaryKey))
    {
        if ($schemaProperties.Name -contains 'Id')
        {
            $primaryKey = 'Id'
        }
        elseif ($schemaProperties.Count -gt 0)
        {
            $primaryKey = $schemaProperties[0].Name
        }
    }

    $alternativeKey = $null
    if ($schemaProperties.Name -contains 'DisplayName')
    {
        $alternativeKey = 'DisplayName'
    }
    elseif ($schemaProperties.Name -contains 'Name')
    {
        $alternativeKey = 'Name'
    }
    if ($alternativeKey -eq $primaryKey)
    {
        $alternativeKey = $null
    }

    if ($IsSingleInstance)
    {
        $schemaProperties = @(
            New-M365DSCPropertyModel -Name 'IsSingleInstance' `
                -Description "Only valid value is 'Yes'." `
                -EnumValues @('Yes') `
                -IsKey $true
        ) + $schemaProperties
        $primaryKey = 'IsSingleInstance'
    }
    else
    {
        foreach ($property in $schemaProperties)
        {
            if ($property.Name -eq $primaryKey)
            {
                $property.IsKey = $true
                $property.ClrType = $property.ClrType -replace '^System\.Nullable\[(.+)\]$', '$1'
            }
        }
    }

    $resourceDescriptor = Get-M365DSCResourceDescriptor -ResourceName $ResourceName

    $hasAssignments = $CmdletInfo.ContainsKey('HasAssignments') -and $CmdletInfo.HasAssignments
    if ($hasAssignments)
    {
        $schemaProperties = @($schemaProperties) + (Get-M365DSCAssignmentPropertyModel)
    }

    # Every downstream artifact renders in model order. Alphabetical keeps it readable.
    $schemaProperties = @($schemaProperties | Sort-Object -Property Name)

    $allProperties = @($schemaProperties)
    if (-not $IsSingleInstance)
    {
        $allProperties += Get-M365DSCEnsurePropertyModel -ResourceDescriptor $resourceDescriptor.ShortDescriptor
    }
    $allProperties += Get-M365DSCAuthPropertySet -Workload $Workload

    $cmdlets = @{}
    foreach ($key in $CmdletInfo.Keys)
    {
        $cmdlets[$key] = $CmdletInfo[$key]
    }

    return [PSCustomObject]@{
        ResourceName         = $ResourceName
        Workload             = $Workload
        ResourceDescription  = $resourceDescriptor.Description
        ResourceDescriptor   = $resourceDescriptor.ShortDescriptor
        PrimaryKey           = $primaryKey
        AlternativeKey       = $alternativeKey
        SelectedODataType    = $SelectedODataType
        IsAdditionalProperty = $IsAdditionalProperty
        IsSingleInstance     = $IsSingleInstance
        Cmdlets              = $cmdlets
        Properties           = $allProperties
        SchemaProperties     = $schemaProperties
        ComplexTypeClasses   = @(Get-M365DSCComplexTypeClass -Properties $schemaProperties)
        HasAssignments       = $hasAssignments
        SettingsCatalog      = $null
        CmdLetNoun           = $CmdLetNoun
        CmdLetVerb           = $CmdLetVerb
        IncludeNavigationProperties = $IncludeNavigationProperties
    }
}

<#
.SYNOPSIS
    Derives the human-readable resource description from the resource name.

.DESCRIPTION
    'IntuneDeviceCompliancePolicyWindows10' becomes 'Intune Device Compliance Policy for
    Windows10'. The short descriptor used in the Ensure description is the last non platform
    noun, for example 'policy'.

.PARAMETER ResourceName
    Specifies the resource name.
#>
function Get-M365DSCResourceDescriptor
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ResourceName
    )

    $platforms = @{
        'Windows10' = 'for Windows10'
        'Windows11' = 'for Windows11'
        'Android'   = 'for Android'
        'Mac O S'   = 'for macOS'
        'I O S'     = 'for iOS'
        'A A D'     = 'Entra ID'
        'Linux'     = 'for Linux'
    }

    $description = ($ResourceName -split '_')[0] -creplace '(?<=\w)([A-Z])', ' $1'
    foreach ($platform in $platforms.Keys)
    {
        if ($description -like "*$platform*")
        {
            $description = $description.Replace($platform, $platforms.$platform)
        }
    }

    $descriptorWords = @(($description -split ' ') | Where-Object {
            $_ -notmatch '^(for|Windows10|Windows11|Android|macOS|iOS|Linux|Entra|ID)$' -and $_.Length -gt 1
        })
    $shortDescriptor = 'resource'
    if ($descriptorWords.Count -gt 0)
    {
        $shortDescriptor = $descriptorWords[-1].ToLowerInvariant()
    }

    return @{
        Description     = $description
        ShortDescriptor = $shortDescriptor
    }
}

<#
.SYNOPSIS
    Flattens the unique CIM classes declared by a property tree.

.DESCRIPTION
    Depth first order puts a nested class before the class that references it.

.PARAMETER Properties
    Specifies the property models to walk.

.PARAMETER Seen
    Specifies the CIM class names already collected on the current walk.
#>
function Get-M365DSCComplexTypeClass
{
    [CmdletBinding()]
    [OutputType([System.Object[]])]
    param
    (
        [Parameter()]
        [System.Object[]]
        $Properties = @(),

        [Parameter()]
        [System.Collections.Generic.HashSet[System.String]]
        $Seen
    )

    if ($null -eq $Seen)
    {
        $Seen = [System.Collections.Generic.HashSet[System.String]]::new([System.StringComparer]::OrdinalIgnoreCase)
    }

    $classes = @()
    foreach ($property in $Properties)
    {
        if (-not $property.IsComplex)
        {
            continue
        }

        $classes += @(Get-M365DSCComplexTypeClass -Properties $property.Members -Seen $Seen)

        if ($Seen.Add($property.CimClassName))
        {
            $classes += [PSCustomObject]@{
                CimClassName = $property.CimClassName
                Members      = $property.Members
            }
        }
    }

    return $classes
}
