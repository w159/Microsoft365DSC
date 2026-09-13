<#
.SYNOPSIS
    Builds the settings.json content of a resource.

.PARAMETER ResourceModel
    Specifies the resource model.

.PARAMETER DestinationPath
    Specifies the settings.json path to write. When omitted the content is returned as a string.
#>
function New-M365DSCSettingsFile
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

    $isGraph = $ResourceModel.Workload -in @('MicrosoftGraph', 'Intune')

    $cmdletNames = @(
        $ResourceModel.Cmdlets.GetCmdlet
        $ResourceModel.Cmdlets.NewCmdlet
        $ResourceModel.Cmdlets.UpdateCmdlet
        $ResourceModel.Cmdlets.RemoveCmdlet
    ) | Where-Object { -not [System.String]::IsNullOrEmpty($_) } | Sort-Object -Unique

    $commandGroups = [ordered]@{}
    $requiredModules = @()
    foreach ($cmdletName in $cmdletNames)
    {
        $command = Get-Command -Name $cmdletName -ErrorAction SilentlyContinue
        if ($null -eq $command)
        {
            continue
        }

        $moduleName = $command.ModuleName
        if (-not $commandGroups.Contains($moduleName))
        {
            $commandGroups[$moduleName] = @()
        }
        $commandGroups[$moduleName] += $cmdletName

        if ($isGraph -and $moduleName -like 'Microsoft.Graph*' -and $moduleName -notin $requiredModules)
        {
            $requiredModules += $moduleName
        }
    }

    $commands = @()
    foreach ($moduleName in $commandGroups.Keys)
    {
        $commands += [ordered]@{
            module  = $moduleName
            cmdlets = @($commandGroups[$moduleName] | Sort-Object)
        }
    }

    $permissions = [ordered]@{}
    if ($isGraph)
    {
        $permissions['graph'] = Get-M365DSCGraphPermission -ResourceModel $ResourceModel
    }

    $settings = [ordered]@{
        resourceName          = $ResourceModel.ResourceName
        generatedFrom         = Get-M365DSCGeneratedFromBlock -ResourceModel $ResourceModel
        excludedProperties    = @()
        description           = "This resource configures a $($ResourceModel.ResourceDescription)."
        roles                 = [ordered]@{
            read   = @()
            update = @()
        }
        permissions           = $permissions
        requiredModules       = @($requiredModules | Sort-Object)
        supportedEnvironments = @('Global', 'USGov')
        mode                  = 'Configuration'
        commands              = $commands
    }

    $content = ($settings | ConvertTo-Json -Depth 20) -replace "`r`n", "`n" -replace "`n", "`r`n"

    if ($PSBoundParameters.ContainsKey('DestinationPath'))
    {
        Set-Content -Path $DestinationPath -Value $content -Encoding UTF8
        return $null
    }

    return $content
}

<#
.SYNOPSIS
    Reads the Graph permissions of the resource's cmdlets from Find-MgGraphCommand.

.PARAMETER ResourceModel
    Specifies the resource model.
#>
function Get-M365DSCGraphPermission
{
    [CmdletBinding()]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $readPermissions = @()
    $updatePermissions = @()

    try
    {
        $apiVersion = $ResourceModel.Cmdlets.APIVersion
        if ([System.String]::IsNullOrEmpty($apiVersion))
        {
            $apiVersion = 'v1.0'
        }

        $getDetails = Find-MgGraphCommand -Command $ResourceModel.Cmdlets.GetCmdlet -ApiVersion $apiVersion -ErrorAction SilentlyContinue
        $readPermissions = @($getDetails.Permissions.Name | Sort-Object -Unique)

        $updateDetails = Find-MgGraphCommand -Command $ResourceModel.Cmdlets.UpdateCmdlet -ApiVersion $apiVersion -ErrorAction SilentlyContinue
        $updatePermissions = @($updateDetails.Permissions.Name | Sort-Object -Unique)
    }
    catch
    {
        Write-Warning -Message "Could not read Graph permissions: $($_.Exception.Message). Fill the permissions section of settings.json manually."
    }

    $readEntries = @($readPermissions | Where-Object { $_ } | ForEach-Object { [ordered]@{ name = $_ } })
    $updateEntries = @($updatePermissions | Where-Object { $_ } | ForEach-Object { [ordered]@{ name = $_ } })

    return [ordered]@{
        delegated   = [ordered]@{
            read   = $readEntries
            update = $updateEntries
        }
        application = [ordered]@{
            read   = $readEntries
            update = $updateEntries
        }
    }
}

<#
.SYNOPSIS
    Builds the generatedFrom block of settings.json.

.DESCRIPTION
    Polymorphic Graph entities keep the cmdlet's entity type in entityType and the concrete subtype
    in odataSubtype. Every other resource leaves odataSubtype null.

.PARAMETER ResourceModel
    Specifies the resource model.
#>
function Get-M365DSCGeneratedFromBlock
{
    [CmdletBinding()]
    [OutputType([System.Collections.Specialized.OrderedDictionary])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $ResourceModel
    )

    $isGraph = $ResourceModel.Workload -in @('MicrosoftGraph', 'Intune')

    $cmdletNoun = $ResourceModel.CmdLetNoun
    if ([System.String]::IsNullOrEmpty($cmdletNoun) -and -not [System.String]::IsNullOrEmpty($ResourceModel.Cmdlets.GetCmdlet))
    {
        $cmdletNoun = $ResourceModel.Cmdlets.GetCmdlet -replace '^Get-', ''
    }

    $cmdletVerb = $ResourceModel.CmdLetVerb
    if ([System.String]::IsNullOrEmpty($cmdletVerb))
    {
        $cmdletVerb = 'New'
    }

    $apiVersion = $null
    $entityType = $null
    $odataSubtype = $null
    if ($isGraph)
    {
        $apiVersion = $ResourceModel.Cmdlets.APIVersion
        if ([System.String]::IsNullOrEmpty($apiVersion))
        {
            $apiVersion = 'v1.0'
        }

        if (-not [System.String]::IsNullOrEmpty($ResourceModel.Cmdlets.EntityTypeName))
        {
            $entityType = $ResourceModel.Cmdlets.EntityTypeName
        }
        elseif (-not [System.String]::IsNullOrEmpty($ResourceModel.Cmdlets.ActualType))
        {
            $entityType = $ResourceModel.Cmdlets.ActualType
        }

        if (-not [System.String]::IsNullOrEmpty($ResourceModel.Cmdlets.ODataSubtypeName))
        {
            $odataSubtype = $ResourceModel.Cmdlets.ODataSubtypeName
        }
        elseif ($ResourceModel.IsAdditionalProperty -and
            -not [System.String]::IsNullOrEmpty($ResourceModel.SelectedODataType) -and
            $ResourceModel.SelectedODataType -ne $entityType)
        {
            $odataSubtype = $ResourceModel.SelectedODataType
        }
    }

    $generatorVersion = $null
    $generatorModule = $ExecutionContext.SessionState.Module
    if ($null -ne $generatorModule -and $null -ne $generatorModule.Version)
    {
        $generatorVersion = $generatorModule.Version.ToString()
    }

    return [ordered]@{
        workload                    = $ResourceModel.Workload
        apiVersion                  = $apiVersion
        entityType                  = $entityType
        odataSubtype                = $odataSubtype
        cmdletNoun                  = $cmdletNoun
        cmdletVerb                  = $cmdletVerb
        includeNavigationProperties = [System.Boolean] $ResourceModel.IncludeNavigationProperties
        generatorVersion            = $generatorVersion
    }
}
