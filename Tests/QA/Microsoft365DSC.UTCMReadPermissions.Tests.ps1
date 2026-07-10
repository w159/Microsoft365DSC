BeforeDiscovery {
    $resourcesPath = Join-Path -Path $PSScriptRoot -ChildPath '../../Modules/Microsoft365DSC/DSCResources'
    $utcmMappingPath = Join-Path -Path $PSScriptRoot -ChildPath 'UTCM.ResourceMappings.csv'
    $utcmMappings = Import-Csv -Path $utcmMappingPath

    $mappedUtcmResources = foreach ($mapping in $utcmMappings)
    {
        if ($mapping.Exists -eq 'True')
        {
            @{
                Workload    = $mapping.Workload
                UTCM        = $mapping.UTCM
                DSC         = $mapping.DSC
                SettingsPath = Join-Path -Path $resourcesPath -ChildPath "MSFT_$($mapping.DSC)\settings.json"
                SourcePath   = Join-Path -Path $resourcesPath -ChildPath "MSFT_$($mapping.DSC)\MSFT_$($mapping.DSC).psm1"
                MappingType = 'Mapped'
            }
        }
        elseif ([System.String]::IsNullOrEmpty($mapping.DSC))
        {
            @{
                Workload    = $mapping.Workload
                UTCM        = $mapping.UTCM
                DSC         = $null
                SettingsPath = $null
                SourcePath   = $null
                MappingType = 'Unmapped'
            }
        }
        else
        {
            @{
                Workload    = $mapping.Workload
                UTCM        = $mapping.UTCM
                DSC         = $mapping.DSC
                SettingsPath = Join-Path -Path $resourcesPath -ChildPath "MSFT_$($mapping.DSC)\settings.json"
                SourcePath   = Join-Path -Path $resourcesPath -ChildPath "MSFT_$($mapping.DSC)\MSFT_$($mapping.DSC).psm1"
                MappingType = 'MissingLocalResource'
            }
        }
    }

    $supportedUtcmResources = $mappedUtcmResources | Where-Object -FilterScript { $_.MappingType -eq 'Mapped' }
    $unsupportedUtcmResources = $mappedUtcmResources | Where-Object -FilterScript { $_.MappingType -ne 'Mapped' }
}

BeforeAll {
    $script:GraphPermissionsFile = Join-Path -Path $PSScriptRoot -ChildPath '../../Tests/QA/Graph.PermissionList.txt'
    $script:KnownGraphPermissions = (Get-Content -Path $script:GraphPermissionsFile -Raw).Split(',') |
        Where-Object -FilterScript { -not [System.String]::IsNullOrWhiteSpace($_) } |
        Select-Object -Unique

    $script:CmdletMappingPath = Join-Path -Path $PSScriptRoot -ChildPath '../../Utilities/cmdlet-mapping.json'
    $script:CmdletMapping = Get-Content -Path $script:CmdletMappingPath -Raw | ConvertFrom-Json

    $script:GraphCommandPermissionCache = @{}

    function Get-UTCMSettings
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.String]
            $Path
        )

        return Get-Content -Path $Path -Raw | ConvertFrom-Json
    }

    function Get-UTCMReadCommand
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.Object]
            $Settings,

            [Parameter(Mandatory = $true)]
            [System.String]
            $SourcePath,

            [Parameter(Mandatory = $true)]
            [System.String]
            $Workload
        )

        $readVerbs = @('Find', 'Get', 'Search', 'Test')
        $commands = foreach ($commandGroup in $Settings.commands)
        {
            foreach ($cmdlet in $commandGroup.cmdlets)
            {
                $verb = ($cmdlet -split '-', 2)[0]
                if ($verb -in $readVerbs -or $cmdlet -eq 'Invoke-MgGraphRequest')
                {
                    [PSCustomObject]@{
                        Module              = $commandGroup.module
                        Cmdlet              = $cmdlet
                        OfficialDocs        = Get-UTCMCommandDocumentationUri -ModuleName $commandGroup.module -CmdletName $cmdlet
                        IsGraphSdkCommand   = $commandGroup.module -like 'Microsoft.Graph*' -and $cmdlet -ne 'Invoke-MgGraphRequest'
                        IsGraphRequest      = $cmdlet -eq 'Invoke-MgGraphRequest'
                        IsPowerShellCommand = $commandGroup.module -notlike 'Microsoft.Graph*'
                    }
                }
            }
        }

        if (@($commands).Count -gt 0 -or -not (Test-Path -Path $SourcePath))
        {
            return $commands
        }

        return Get-UTCMReadCommandFromSource -SourcePath $SourcePath -Workload $Workload
    }

    function Get-UTCMReadCommandFromSource
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.String]
            $SourcePath,

            [Parameter(Mandatory = $true)]
            [System.String]
            $Workload
        )

        $parseErrors = $null
        $ast = [System.Management.Automation.Language.Parser]::ParseFile($SourcePath, [ref]$null, [ref]$parseErrors)
        if ($parseErrors.Count -gt 0)
        {
            return @()
        }

        $readVerbs = @('Find', 'Get', 'Search', 'Test')
        $excludedPrefixes = @('Get-M365DSC', 'Get-MSCloudLogin', 'Get-TargetResource', 'Test-TargetResource')
        $commandNames = $ast.FindAll(
            {
                param($Item)
                return $Item -is [System.Management.Automation.Language.CommandAst]
            }, $true) |
            ForEach-Object -Process { $_.CommandElements[0].Value } |
            Where-Object -FilterScript {
                $cmdlet = $_
                if ([System.String]::IsNullOrWhiteSpace($cmdlet))
                {
                    return $false
                }

                $verb = ($cmdlet -split '-', 2)[0]
                if ($verb -notin $readVerbs)
                {
                    return $false
                }

                foreach ($excludedPrefix in $excludedPrefixes)
                {
                    if ($cmdlet -like "$excludedPrefix*")
                    {
                        return $false
                    }
                }

                return $true
            } |
            Sort-Object -Unique

        foreach ($cmdlet in $commandNames)
        {
            $moduleName = switch -Wildcard ($Workload)
            {
                'Microsoft Exchange' { 'ExchangePowerShell' }
                'Microsoft Security and Compliance' { 'ExchangePowerShell' }
                default { 'PowerShell' }
            }

            [PSCustomObject]@{
                Module              = $moduleName
                Cmdlet              = $cmdlet
                OfficialDocs        = Get-UTCMCommandDocumentationUri -ModuleName $moduleName -CmdletName $cmdlet
                IsGraphSdkCommand   = $cmdlet -like '*-Mg*' -and $cmdlet -ne 'Invoke-MgGraphRequest'
                IsGraphRequest      = $cmdlet -eq 'Invoke-MgGraphRequest'
                IsPowerShellCommand = $true
            }
        }
    }

    function Get-UTCMCommandDocumentationUri
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.String]
            $ModuleName,

            [Parameter(Mandatory = $true)]
            [System.String]
            $CmdletName
        )

        if ($ModuleName -like 'Microsoft.Graph*')
        {
            return "https://learn.microsoft.com/powershell/module/$($ModuleName.ToLowerInvariant())/$($CmdletName.ToLowerInvariant())"
        }
        elseif ($ModuleName -eq 'MicrosoftTeams')
        {
            return "https://learn.microsoft.com/powershell/module/microsoftteams/$($CmdletName.ToLowerInvariant())"
        }
        elseif ($ModuleName -like 'ExchangeOnlineManagement*' -or $ModuleName -eq 'ExchangePowerShell')
        {
            return "https://learn.microsoft.com/powershell/module/exchange/$($CmdletName.ToLowerInvariant())"
        }

        return $null
    }

    function Get-UTCMGraphEndpoint
    {
        [CmdletBinding()]
        param
        (
            [Parameter()]
            [System.Object[]]
            $ReadCommands,

            [Parameter(Mandatory = $true)]
            [System.String]
            $SourcePath
        )

        foreach ($readCommand in $ReadCommands)
        {
            if ($readCommand.IsGraphSdkCommand)
            {
                $mapping = $script:CmdletMapping.PSObject.Properties[$readCommand.Cmdlet].Value
                if ($null -ne $mapping)
                {
                    foreach ($variant in $mapping.Variants | Where-Object -FilterScript { $_.Method -eq 'GET' })
                    {
                        [PSCustomObject]@{
                            Cmdlet       = $readCommand.Cmdlet
                            Method       = $variant.Method
                            Uri          = $variant.URI
                            ApiVersion   = $variant.ApiVersion
                            OfficialDocs = "https://learn.microsoft.com/graph/api/overview?view=graph-rest-$($variant.ApiVersion)"
                        }
                    }
                }
            }
        }

        if (Test-Path -Path $SourcePath)
        {
            $source = Get-Content -Path $SourcePath -Raw
            $literalGraphUris = [regex]::Matches($source, '(?<Method>GET|Get)\s+.*?(?<Uri>/(beta|v1\.0)/[A-Za-z0-9_./{}()''"$-]+)') |
                ForEach-Object -Process {
                    [PSCustomObject]@{
                        Cmdlet       = 'Invoke-MgGraphRequest'
                        Method       = 'GET'
                        Uri          = $_.Groups['Uri'].Value
                        ApiVersion   = if ($_.Groups['Uri'].Value -like '/beta/*') { 'beta' } else { 'v1.0' }
                        OfficialDocs = if ($_.Groups['Uri'].Value -like '/beta/*') {
                            'https://learn.microsoft.com/graph/api/overview?view=graph-rest-beta'
                        } else {
                            'https://learn.microsoft.com/graph/api/overview?view=graph-rest-1.0'
                        }
                    }
                }

            $literalGraphUris | Select-Object -Unique -Property Cmdlet, Method, Uri, ApiVersion, OfficialDocs
        }
    }

    function Get-UTCMReadPermission
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.Object]
            $Settings
        )

        foreach ($permission in $Settings.permissions.graph.delegated.read)
        {
            [PSCustomObject]@{
                Name   = $permission.Name
                Type   = 'Delegated'
                Source = 'Graph'
            }
        }

        foreach ($permission in $Settings.permissions.graph.application.read)
        {
            [PSCustomObject]@{
                Name   = $permission.Name
                Type   = 'Application'
                Source = 'Graph'
            }
        }

        foreach ($permission in $Settings.permissions.'Office 365 Exchange Online'.application.read)
        {
            [PSCustomObject]@{
                Name   = $permission.Name
                Type   = 'Application'
                Source = 'Office 365 Exchange Online'
            }
        }

        foreach ($role in $Settings.permissions.exchange.requiredroles.read)
        {
            [PSCustomObject]@{
                Name   = $role
                Type   = 'Role'
                Source = 'Exchange'
            }
        }

        foreach ($roleGroup in $Settings.permissions.exchange.requiredrolegroups.read)
        {
            [PSCustomObject]@{
                Name   = $roleGroup
                Type   = 'RoleGroup'
                Source = 'Exchange'
            }
        }
    }

    function Get-UTCMOfficialGraphCommandPermission
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.String]
            $CmdletName,

            [Parameter()]
            [System.String]
            $ApiVersion
        )

        $cacheKey = "$CmdletName|$ApiVersion"
        if ($script:GraphCommandPermissionCache.ContainsKey($cacheKey))
        {
            return $script:GraphCommandPermissionCache[$cacheKey]
        }

        if ($null -eq (Get-Command -Name Find-MgGraphCommand -ErrorAction SilentlyContinue))
        {
            $script:GraphCommandPermissionCache[$cacheKey] = @()
            return @()
        }

        $parameters = @{
            Command     = $CmdletName
            ErrorAction = 'SilentlyContinue'
        }
        if (-not [System.String]::IsNullOrEmpty($ApiVersion))
        {
            $parameters.ApiVersion = $ApiVersion
        }

        $permissions = @(Find-MgGraphCommand @parameters | ForEach-Object -Process { $_.Permissions })
        $script:GraphCommandPermissionCache[$cacheKey] = $permissions
        return $permissions
    }

    function Test-UTCMReadPermissionIsLeastPrivileged
    {
        [CmdletBinding()]
        param
        (
            [Parameter(Mandatory = $true)]
            [System.String]
            $PermissionName,

            [Parameter(Mandatory = $true)]
            [System.String]
            $PermissionType,

            [Parameter()]
            [System.Object[]]
            $ReadCommands
        )

        if ([System.Guid]::TryParse($PermissionName, [ref][System.Guid]::Empty))
        {
            return $true
        }

        $candidateTypes = if ($PermissionType -eq 'Application')
        {
            @('Application')
        }
        else
        {
            @('DelegatedWork', 'DelegatedPersonal')
        }

        foreach ($readCommand in $ReadCommands | Where-Object -FilterScript { $_.IsGraphSdkCommand })
        {
            $mapping = $script:CmdletMapping.PSObject.Properties[$readCommand.Cmdlet].Value
            $apiVersion = if ($null -ne $mapping) { $mapping.ApiVersion } else { $null }
            $officialPermissions = Get-UTCMOfficialGraphCommandPermission -CmdletName $readCommand.Cmdlet -ApiVersion $apiVersion
            $matchedPermission = $officialPermissions | Where-Object -FilterScript {
                $_.Name -eq $PermissionName -and $_.PermissionType -in $candidateTypes
            }

            if ($matchedPermission | Where-Object -FilterScript { $_.IsLeastPrivilege -eq $true })
            {
                return $true
            }
        }

        if ($PermissionName -match 'ReadWrite|Write|Manage|FullControl|Delete|Create|Update')
        {
            $readEquivalent = $PermissionName `
                -replace 'ReadWrite', 'Read' `
                -replace 'Write', 'Read' `
                -replace 'Manage', 'Read' `
                -replace 'FullControl', 'Read' `
                -replace 'Delete', 'Read' `
                -replace 'Create', 'Read' `
                -replace 'Update', 'Read'

            return -not ($readEquivalent -in $script:KnownGraphPermissions)
        }

        return $PermissionName -match '(^|[.:-])Read($|[.:-])|ReadBasic|^Organization\.Read\.All$'
    }
}

Describe -Name "Validate UTCM read permission mapping for '<UTCM>'" -ForEach $supportedUtcmResources {
    BeforeAll {
        $resourceSettings = Get-UTCMSettings -Path $SettingsPath
        $readCommands = @(Get-UTCMReadCommand -Settings $resourceSettings -SourcePath $SourcePath -Workload $Workload)
        $readPermissions = @(Get-UTCMReadPermission -Settings $resourceSettings)
        $graphEndpoints = @(Get-UTCMGraphEndpoint -ReadCommands $readCommands -SourcePath $SourcePath)
    }

    It 'Maps to an existing Microsoft365DSC settings.json file' {
        $SettingsPath | Should -Exist
        $resourceSettings.resourceName | Should -Be $DSC
    }

    It 'Identifies the read cmdlets used by the mapped Microsoft365DSC resource' {
        $readCommands.Count | Should -BeGreaterThan 0
        foreach ($readCommand in $readCommands)
        {
            $readCommand.Cmdlet | Should -Not -BeNullOrEmpty
            $readCommand.Module | Should -Not -BeNullOrEmpty
            if ($readCommand.Module -like 'Microsoft.Graph*' -or $readCommand.Module -eq 'MicrosoftTeams' -or $readCommand.Module -like 'ExchangeOnlineManagement*' -or $readCommand.Module -eq 'ExchangePowerShell')
            {
                $readCommand.OfficialDocs | Should -Not -BeNullOrEmpty
            }
        }
    }

    It 'Lists the minimal read role or permission surface in settings.json' {
        $readRoles = @($resourceSettings.roles.read) |
            Where-Object -FilterScript { -not [System.String]::IsNullOrWhiteSpace($_) }
        ($readRoles.Count + $readPermissions.Count) | Should -BeGreaterThan 0

        foreach ($readRole in $readRoles)
        {
            $readRole | Should -Not -BeNullOrEmpty
        }

        foreach ($permission in $readPermissions)
        {
            $permission.Name | Should -Not -BeNullOrEmpty
            if ($permission.Source -eq 'Office 365 Exchange Online')
            {
                $permission.Name | Should -Be 'Exchange.ManageAsApp'
            }
        }
    }

    It 'Identifies Graph API endpoints for Graph SDK read cmdlets when the resource uses Graph' {
        $usesGraphSdkReadCommand = @($readCommands | Where-Object -FilterScript { $_.IsGraphSdkCommand }).Count -gt 0
        if ($usesGraphSdkReadCommand)
        {
            $graphEndpoints.Count | Should -BeGreaterThan 0
            foreach ($endpoint in $graphEndpoints)
            {
                $endpoint.Method | Should -Be 'GET'
                $endpoint.Uri | Should -Not -BeNullOrEmpty
                $endpoint.ApiVersion | Should -BeIn @('v1.0', 'beta')
            }
        }
        else
        {
            $true | Should -BeTrue
        }
    }

    It 'Uses valid Graph read permissions from settings.json' {
        foreach ($permission in $readPermissions | Where-Object -FilterScript { $_.Source -eq 'Graph' })
        {
            if (-not [System.Guid]::TryParse($permission.Name, [ref][System.Guid]::Empty) -and
                $permission.Name -ne 'Tasks.Read.All')
            {
                $permission.Name | Should -BeIn $script:KnownGraphPermissions -ErrorAction Continue
            }
        }
    }

    It 'Uses least-privileged read permissions according to official Graph metadata when available' {
        foreach ($permission in $readPermissions | Where-Object -FilterScript { $_.Source -eq 'Graph' })
        {
            $isLeastPrivileged = Test-UTCMReadPermissionIsLeastPrivileged `
                -PermissionName $permission.Name `
                -PermissionType $permission.Type `
                -ReadCommands $readCommands

            $isLeastPrivileged | Should -BeTrue -Because "$($permission.Name) should be a least-privileged read permission for $UTCM / $DSC"
        }
    }
}

Describe -Name 'Track UTCM resources that cannot be validated locally' {
    It "Documents unmapped or locally missing UTCM resource '<UTCM>'" -TestCases $unsupportedUtcmResources {
        $MappingType | Should -BeIn @('Unmapped', 'MissingLocalResource')
    }
}
