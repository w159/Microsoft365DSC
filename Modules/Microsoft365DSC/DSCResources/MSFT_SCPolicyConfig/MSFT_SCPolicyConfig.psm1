function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [System.Boolean]
        $AdvancedClassificationEnabled,

        [Parameter()]
        [System.Boolean]
        $AuditFileActivity,

        [Parameter()]
        [System.Boolean]
        $BandwidthLimitEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $BusinessJustificationList,

        [Parameter()]
        [System.String]
        $CloudAppMode,

        [Parameter()]
        [System.String[]]
        $CloudAppRestrictionList,

        [Parameter()]
        [System.UInt32]
        $CustomBusinessJustificationNotification,

        [Parameter()]
        [System.UInt32]
        $DailyBandwidthLimitInMB,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPAppGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPNetworkShareGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPPrinterGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPRemovableMediaGroups,

        [Parameter()]
        [System.Boolean]
        $IncludePredefinedUnallowedBluetoothApps,

        [Parameter()]
        [System.String[]]
        $MacPathExclusion,

        [Parameter()]
        [System.Boolean]
        $NetworkPathEnforcementEnabled,

        [Parameter()]
        [System.String]
        $NetworkPathExclusion,

        [Parameter()]
        [System.String[]]
        $PathExclusion,

        [Parameter()]
        [System.Boolean]
        $serverDlpEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $SiteGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedApp,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedBluetoothApp,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedBrowser,

        [Parameter()]
        [System.String[]]
        $VPNSettings,

        [Parameter()]
        [System.Boolean]
        $EnableLabelCoauth,

        [Parameter()]
        [System.Boolean]
        $EnableSpoAipMigration,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    New-M365DSCConnection -Workload 'SecurityComplianceCenter' `
        -InboundParameters $PSBoundParameters | Out-Null

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $nullResult = $PSBoundParameters
    try
    {
        $instance = Get-PolicyConfig -ErrorAction Stop
        $EndpointDlpGlobalSettingsValue = ConvertFrom-Json $instance.EndpointDlpGlobalSettings
        $DlpPrinterGroupsObject = ConvertFrom-Json $instance.DlpPrinterGroups
        $DlpAppGroupsObject = ConvertFrom-Json $instance.DlpAppGroups
        $SiteGroupsObject = ConvertFrom-Json $instance.SiteGroups
        $DLPRemovableMediaGroupsObject = ConvertFrom-Json $instance.DLPRemovableMediaGroups
        $DlpNetworkShareGroupsObject = ConvertFrom-Json $instance.DlpNetworkShareGroups

        # AdvancedClassificationEnabled
        $AdvancedClassificationEnabledValue = [Boolean]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'AdvancedClassificationEnabled'}).Value

        # BandwidthLimitEnabled
        $BandwidthLimitEnabledValue = [Boolean]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'BandwidthLimitEnabledValue'}).Value

        # DailyBandwidthLimitInMB
        $DailyBandwidthLimitInMBValue = [UInt32]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'DailyBandwidthLimitInMB'}).Value

        # PathExclusion
        $PathExclusionValue = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'PathExclusion'}).Value

        # MacPathExclusion
        $MacPathExclusionValue = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'MacPathExclusion'}).Value

        # MacPathExclusion
        $MacPathExclusionValue = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'MacPathExclusion'}).Value

        #EvidenceStoreSettings
        $entry = $EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'EvidenceStoreSettings'}
        if ($null -ne $entry)
        {
            $entry = ConvertFrom-Json $entry.Value
            $EvidenceStoreSettingsValue = @{
                FileEvidenceIsEnabled = $entry.FileEvidenceIsEnabled
                NumberOfDaysToRetain  = [Uint32]$entry.NumberOfDaysToRetain
                StorageAccounts       = [Array]$entry.StorageAccounts
                Store                 = $entry.Store
            }
        }

        # NetworkPathEnforcementEnabled
        $NetworkPathEnforcementEnabledValue = [Boolean]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'NetworkPathEnforcementEnabled'}).Value

        # NetworkPathExclusion
        $NetworkPathExclusionValue = ($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'NetworkPathExclusion'}).Value

        # DlpAppGroups
        $DlpAppGroupsValue = @()
        foreach ($group in $DlpAppGroupsObject)
        {
            $entry = @{
                Name        = $group.Name
                Id          = $group.Id
                Description = $group.Description
                Apps        = @()
            }

            foreach ($appEntry in $group.Apps)
            {
                $app = @{
                    ExecutableName = $appEntry.ExecutableName
                    Name           = $appEntry.Name
                    Quarantine     = [Boolean]$appEntry.Quarantine
                }
                $entry.Apps += $app
            }
            $DlpAppGroupsValue += $entry
        }

        # UnallowedApp
        $entries = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'UnallowedApp'})
        $UnallowedAppValue = @()
        foreach ($entry in $entries)
        {
            $current = @{
                Value      = $entry.Value
                Executable = $entry.Executable
            }
            $UnallowedAppValue += $current
        }

        # IncludePredefinedUnallowedBluetoothApps
        $IncludePredefinedUnallowedBluetoothAppsValue = [Boolean]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'IncludePredefinedUnallowedBluetoothApps'}).Value

        # UnallowedBluetoothApp
        $entries = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'UnallowedBluetoothApp'})
        $UnallowedBluetoothAppValue = @()
        foreach ($entry in $entries)
        {
            $current = @{
                Value      = $entry.Value
                Executable = $entry.Executable
            }
            $UnallowedBluetoothAppValue += $current
        }

        # UnallowedBrowser
        $entries = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'UnallowedBrowser'})
        $UnallowedBrowserValue = @()
        foreach ($entry in $entries)
        {
            $current = @{
                Value      = $entry.Value
                Executable = $entry.Executable
            }
            $UnallowedBrowserValue += $current
        }

        # CloudAppMode
        $CloudAppModeValue = ($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'CloudAppMode'}).Value

        # CloudAppRestrictionList
        $CloudAppRestrictionListValue = [Array]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'CloudAppRestrictionList'}).Value

        # SiteGroups
        $SiteGroupsValue = @()
        foreach ($siteGroup in $SiteGroupsObject)
        {
            $entry = @{
                Id = $siteGroup.Id
                Name = $siteGroup.Name
            }

            $addresses = @()
            foreach ($address in $siteGroup.Addresses)
            {
                $addresses += @{
                    MatchType    = $address.MatchType
                    Url          = $address.Url
                    AddressLower = $address.AddressLower
                    AddressUpper = $address.AddressUpper
                }
            }
            $entry.Add('Addresses', $addresses)
            $SiteGroupsValue += $entry
        }

        # CustomBusinessJustificationNotification
        $CustomBusinessJustificationNotificationValue = [Uint32]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'CustomBusinessJustificationNotification'}).Value

        # BusinessJustificationList
        $entities = ConvertFrom-Json ($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'BusinessJustificationList'}).Value
        $BusinessJustificationListValue = @()
        foreach ($entity in $entities)
        {
            $current = @{
                Id                = $entity.Id
                Enable            = [Boolean]$entity.Enable
                justificationText = $entity.justificationText
            }
            $BusinessJustificationListValue += $current
        }

        # serverDlpEnabled
        $serverDlpEnabledValue = [Boolean]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'serverDlpEnabled'}).Value

        # AuditFileActivity
        $AuditFileActivityValue = [Boolean]($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'AuditFileActivity'}).Value

        # DlpPrinterGroups
        $DlpPrinterGroupsValue = @()
        foreach ($group in $DlpPrinterGroupsObject.groups)
        {
            $entry = @{
                groupName = $group.groupName
                groupId   = $group.groupId
            }

            $printers = @()
            foreach ($printer in $group.printers)
            {
                $current = @{
                    universalPrinter = [Boolean]$printer.universalPrinter
                    usbPrinter       = [Boolean]$printer.usbPrinter
                    usbPrinterId     = $printer.usbPrinterPID
                    name             = $printer.name
                    alias            = $printer.alias
                    usbPrinterVID    = $printer.usbPrinterVID
                    ipRange          = @{
                        fromAddress = $printer.ipRange.from
                        toAddress   = $printer.ipRange.to
                    }
                    corporatePrinter = [Boolean]$printer.CorporatePrinter
                    printToLocal     = [Boolean]$printer.printToLocal
                    printToFile      = [Boolean]$printer.printToFile
                }

                $printers += $current
            }
            $entry.Add('printers', $printers)
            $DlpPrinterGroupsValue += $entry
        }

        # DLPRemovableMediaGroups
        $DLPRemovableMediaGroupsValue = @()
        foreach ($group in $DLPRemovableMediaGroupsObject.groups)
        {
            $entry = @{
                groupName = $group.groupName
            }

            $medias = @()
            foreach ($media in $group.removableMedia)
            {
                $current = @{
                    deviceId = $media.deviceId
                    removableMediaVID = $media.removableMediaVID
                    name              = $media.name
                    alias             = $media.alias
                    removableMediaPID = $media.removableMediaPID
                    instancePathId    = $media.instancePathId
                    serialNumberId    = $media.serialNumberId
                    hardwareId        = $media.hardwareId
                }
                $medias += $current
            }
            $entry.Add('removableMedia', $medias)

            $DLPRemovableMediaGroupsValue += $entry
        }

        # DlpNetworkShareGroups
        $DlpNetworkShareGroupsValue = @()
        foreach ($group in $DlpNetworkShareGroupsObject.groups)
        {
            $entry = @{
                groupName    = $group.groupName
                groupId      = $group.groupId
                networkPaths = [Array]$group.networkPaths
            }
            $DlpNetworkShareGroupsValue += $entry
        }

        # VPNSettings
        $entity = ConvertFrom-Json ($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'VPNSettings'}).Value
        $VPNSettingsValue = [Array]$entity.serverAddress

        $results = @{
            IsSingleInstance                        = 'Yes'
            AdvancedClassificationEnabled           = $AdvancedClassificationEnabledValue
            BandwidthLimitEnabled                   = $BandwidthLimitEnabledValue
            DailyBandwidthLimitInMB                 = $DailyBandwidthLimitInMBValue
            PathExclusion                           = $PathExclusionValue
            MacPathExclusion                        = $MacPathExclusionValue
            EvidenceStoreSettings                   = $EvidenceStoreSettingsValue
            NetworkPathEnforcementEnabled           = $NetworkPathEnforcementEnabledValue
            NetworkPathExclusion                    = $NetworkPathExclusionValue
            DLPAppGroups                            = $DlpAppGroupsValue
            UnallowedApp                            = $UnallowedAppValue
            IncludePredefinedUnallowedBluetoothApps = $IncludePredefinedUnallowedBluetoothAppsValue
            UnallowedBluetoothApp                   = $UnallowedBluetoothAppValue
            UnallowedBrowser                        = $UnallowedBrowserValue
            CloudAppMode                            = $CloudAppModeValue
            CloudAppRestrictionList                 = $CloudAppRestrictionListValue
            SiteGroups                              = $SiteGroupsValue
            CustomBusinessJustificationNotification = $CustomBusinessJustificationNotificationValue
            BusinessJustificationList               = $BusinessJustificationListValue
            serverDlpEnabled                        = $serverDlpEnabledValue
            AuditFileActivity                       = $AuditFileActivityValue
            DLPPrinterGroups                        = $DlpPrinterGroupsValue
            DLPRemovableMediaGroups                 = $DLPRemovableMediaGroupsValue
            DLPNetworkShareGroups                   = $DlpNetworkShareGroupsValue
            VPNSettings                             = $VPNSettingsValue
            EnableLabelCoauth                       = $instance.EnableLabelCoauth
            EnableSpoAipMigration                   = $instance.EnableSpoAipMigration
            Credential                              = $Credential
            ApplicationId                           = $ApplicationId
            TenantId                                = $TenantId
            CertificateThumbprint                   = $CertificateThumbprint
            ManagedIdentity                         = $ManagedIdentity.IsPresent
            AccessTokens                            = $AccessTokens
        }
        return [System.Collections.Hashtable] $results
    }
    catch
    {
        Write-Verbose -Message $_
        New-M365DSCLogEntry -Message 'Error retrieving data:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return $nullResult
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [System.Boolean]
        $AdvancedClassificationEnabled,

        [Parameter()]
        [System.Boolean]
        $AuditFileActivity,

        [Parameter()]
        [System.Boolean]
        $BandwidthLimitEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $BusinessJustificationList,

        [Parameter()]
        [System.String]
        $CloudAppMode,

        [Parameter()]
        [System.String[]]
        $CloudAppRestrictionList,

        [Parameter()]
        [System.UInt32]
        $CustomBusinessJustificationNotification,

        [Parameter()]
        [System.UInt32]
        $DailyBandwidthLimitInMB,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPAppGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPNetworkShareGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPPrinterGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPRemovableMediaGroups,

        [Parameter()]
        [System.Boolean]
        $IncludePredefinedUnallowedBluetoothApps,

        [Parameter()]
        [System.String[]]
        $MacPathExclusion,

        [Parameter()]
        [System.Boolean]
        $NetworkPathEnforcementEnabled,

        [Parameter()]
        [System.String]
        $NetworkPathExclusion,

        [Parameter()]
        [System.String[]]
        $PathExclusion,

        [Parameter()]
        [System.Boolean]
        $serverDlpEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $SiteGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedApp,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedBluetoothApp,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedBrowser,

        [Parameter()]
        [System.String[]]
        $VPNSettings,

        [Parameter()]
        [System.Boolean]
        $EnableLabelCoauth,

        [Parameter()]
        [System.Boolean]
        $EnableSpoAipMigration,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    New-M365DSCConnection -Workload 'SecurityComplianceCenter' `
        -InboundParameters $PSBoundParameters | Out-Null

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $DLPAppGroupsValue = @()
    foreach ($group in $DLPAppGroups)
    {
        $entry = @{
            Name = $group.Name
            Id   = $group.Id
            Description = $group.Description
            Apps = @()
        }
        foreach ($app in $group.Apps)
        {
            $appEntry = @{
                ExecutableName = $app.ExecutableName
                Name           = $app.Name
                Quarantine     = $app.Quarantine
            }
            $entry.Apps += $appEntry
        }
        $DLPAppGroupsValue += $entry
    }
    Write-Verbose -Message "Hola: $($DLPAppGroupsValue | Out-String)"

    $params = @{
        DLPAppGroups          = $DLPAppGroupsValue
        EnableLabelCoauth     = $EnableLabelCoauth
        EnableSpoAipMigration = $EnableSpoAipMigration
    }
    Set-PolicyConfig @parameters
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [System.Boolean]
        $AdvancedClassificationEnabled,

        [Parameter()]
        [System.Boolean]
        $AuditFileActivity,

        [Parameter()]
        [System.Boolean]
        $BandwidthLimitEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $BusinessJustificationList,

        [Parameter()]
        [System.String]
        $CloudAppMode,

        [Parameter()]
        [System.String[]]
        $CloudAppRestrictionList,

        [Parameter()]
        [System.UInt32]
        $CustomBusinessJustificationNotification,

        [Parameter()]
        [System.UInt32]
        $DailyBandwidthLimitInMB,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPAppGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPNetworkShareGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPPrinterGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DLPRemovableMediaGroups,

        [Parameter()]
        [System.Boolean]
        $IncludePredefinedUnallowedBluetoothApps,

        [Parameter()]
        [System.String[]]
        $MacPathExclusion,

        [Parameter()]
        [System.Boolean]
        $NetworkPathEnforcementEnabled,

        [Parameter()]
        [System.String]
        $NetworkPathExclusion,

        [Parameter()]
        [System.String[]]
        $PathExclusion,

        [Parameter()]
        [System.Boolean]
        $serverDlpEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $SiteGroups,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedApp,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedBluetoothApp,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UnallowedBrowser,

        [Parameter()]
        [System.String[]]
        $VPNSettings,

        [Parameter()]
        [System.Boolean]
        $EnableLabelCoauth,

        [Parameter()]
        [System.Boolean]
        $EnableSpoAipMigration,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $CurrentValues = Get-TargetResource @PSBoundParameters
    $ValuesToCheck = ([Hashtable]$PSBoundParameters).Clone()

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $ValuesToCheck)"

    $testResult = Test-M365DSCParameterState -CurrentValues $CurrentValues `
        -Source $($MyInvocation.MyCommand.Source) `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck $ValuesToCheck.Keys

    Write-Verbose -Message "Test-TargetResource returned $testResult"

    return $testResult
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    $ConnectionMode = New-M365DSCConnection -Workload 'SecurityComplianceCenter' `
        -InboundParameters $PSBoundParameters

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    try
    {
        $Script:ExportMode = $true
        $params = @{
            IsSingleInstance      = 'Yes'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
            ManagedIdentity       = $ManagedIdentity.IsPresent
            AccessTokens          = $AccessTokens
        }
        if ($null -ne $Global:M365DSCExportResourceInstancesCount)
        {
            $Global:M365DSCExportResourceInstancesCount++
        }
        $Results = Get-TargetResource @Params

        if ($null -ne $Results.BusinessJustificationList)
        {
            $Results.BusinessJustificationList = ConvertTo-BusinessJustificationListString -ObjectHash $Results.BusinessJustificationList
        }

        if ($null -ne $Results.DLPAppGroups)
        {
            $Results.DLPAppGroups = ConvertTo-DLPAppGroupsString -ObjectHash $Results.DLPAppGroups
        }

        if ($null -ne $Results.DLPNetworkShareGroups)
        {
            $Results.DLPNetworkShareGroups = ConvertTo-DLPNetworkShareGroupsString -ObjectHash $Results.DLPNetworkShareGroups
        }

        if ($null -ne $Results.DLPPrinterGroups)
        {
            $Results.DLPPrinterGroups = ConvertTo-DLPPrinterGroupsString -ObjectHash $Results.DLPPrinterGroups
        }

        if ($null -ne $Results.DLPRemovableMediaGroups)
        {
            $Results.DLPRemovableMediaGroups = ConvertTo-DLPRemovableMediaGroupsString -ObjectHash $Results.DLPRemovableMediaGroups
        }

        if ($null -ne $Results.SiteGroups)
        {
            $Results.SiteGroups = ConvertTo-SiteGroupsString -ObjectHash $Results.SiteGroups
        }

        if ($null -ne $Results.UnallowedApp)
        {
            $Results.UnallowedApp = ConvertTo-AppsString -ObjectHash $Results.UnallowedApp
        }

        if ($null -ne $Results.UnallowedBluetoothApp)
        {
            $Results.UnallowedBluetoothApp = ConvertTo-AppsString -ObjectHash $Results.UnallowedBluetoothApp
        }

        if ($null -ne $Results.UnallowedBrowser)
        {
            $Results.UnallowedBrowser = ConvertTo-AppsString -ObjectHash $Results.UnallowedBrowser
        }

        $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
            -Results $Results

        $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
            -ConnectionMode $ConnectionMode `
            -ModulePath $PSScriptRoot `
            -Results $Results `
            -Credential $Credential

        if ($null -ne $Results.BusinessJustificationList)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'BusinessJustificationList' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.DLPAppGroups)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'DLPAppGroups' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.DLPNetworkShareGroups)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'DLPNetworkShareGroups' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.DLPPrinterGroups)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'DLPPrinterGroups' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.DLPRemovableMediaGroups)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'DLPRemovableMediaGroups' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.SiteGroups)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'SiteGroups' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.UnallowedApp)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'UnallowedApp' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.UnallowedBluetoothApp)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'UnallowedBluetoothApp' `
                                                                -IsCIMArray:$true
        }

        if ($null -ne $Results.UnallowedBrowser)
        {
            $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                                                                -ParameterName 'UnallowedBrowser' `
                                                                -IsCIMArray:$true
        }

        $dscContent += $currentDSCBlock
        Save-M365DSCPartialExport -Content $currentDSCBlock `
            -FileName $Global:PartialExportFileName
        Write-Host $Global:M365DSCEmojiGreenCheckMark

        return $dscContent
    }
    catch
    {
        Write-Host $Global:M365DSCEmojiRedX

        New-M365DSCLogEntry -Message 'Error during Export:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return ''
    }
}

function ConvertTo-BusinessJustificationListString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )

    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigBusinessJustificationList")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    Id                = '$($instance.Id)'")
        [void]$content.AppendLine("    Enable            = `$$($instance.Enable)")
        [void]$content.AppendLine("    justificationText = '$($instance.Id)'")
        [void]$content.AppendLine("}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

function ConvertTo-DLPAppGroupsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )
    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigDLPAppGroups")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    Name        = '$($instance.Name)'")
        [void]$content.AppendLine("    Id          = '$($instance.Id)'")
        [void]$content.AppendLine("    Description = '$($instance.Description)'")
        [void]$content.AppendLine("    Apps = @(")
        foreach ($app in $instance.Apps)
        {
            [void]$content.AppendLine("        MSFT_PolicyConfigDLPApp")
            [void]$content.AppendLine("        {")
            [void]$content.AppendLine("            ExecutableName    = '$($app.ExecutableName)'")
            [void]$content.AppendLine("            Name              = '$($app.Name)'")
            [void]$content.AppendLine("            Quarantine        = `$$($app.Quarantine)")
            [void]$content.AppendLine("        }")
        }
        [void]$content.AppendLine(")}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

function ConvertTo-DLPNetworkShareGroupsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )
    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigDLPNetworkShareGroups")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    groupName    = '$($instance.groupName)'")
        [void]$content.AppendLine("    groupId      = '$($instance.groupId)'")
        [void]$content.Append("    networkPaths = @(")
        $countPath = 1
        foreach ($path in $instance.networkPaths)
        {
            [void]$content.Append("'$path'")
            if ($countPath -lt $instance.networkPaths.Length)
            {
                [void]$content.Append(',')
            }
            $countPath++
        }
        [void]$content.AppendLine(')')
        [void]$content.AppendLine("}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

function ConvertTo-DLPPrinterGroupsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )
    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigDLPPrinterGroups")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    groupName    = '$($instance.groupName)'")
        [void]$content.AppendLine("    groupId      = '$($instance.groupId)'")
        [void]$content.AppendLine("    printers = @(")
        foreach ($printer in $instance.printers)
        {
            [void]$content.AppendLine("        MSFT_PolicyConfigPrinter")
            [void]$content.AppendLine("        {")
            [void]$content.AppendLine("            universalPrinter = `$$($printer.universalPrinter)")
            [void]$content.AppendLine("            usbPrinter       = `$$($printer.usbPrinter)")
            [void]$content.AppendLine("            usbPrinterId     = '$($printer.usbPrinterId)'")
            [void]$content.AppendLine("            name             = '$($printer.name)'")
            [void]$content.AppendLine("            alias            = '$($printer.alias)'")
            [void]$content.AppendLine("            usbPrinterVID    = '$($printer.usbPrinterVID)'")
            [void]$content.AppendLine("            ipRange          = MSFT_PolicyConfigIPRange")
            [void]$content.AppendLine("                {")
            [void]$content.AppendLine("                    fromAddress = '$($printer.ipRange.fromAddress)'")
            [void]$content.AppendLine("                    toAddress   = '$($printer.ipRange.toAddress)'")
            [void]$content.AppendLine("                }")
            [void]$content.AppendLine("            corporatePrinter = `$$($printer.corporatePrinter)")
            [void]$content.AppendLine("            printToLocal     = `$$($printer.printToLocal)")
            [void]$content.AppendLine("            printToFile      = `$$($printer.printToFile)")
            [void]$content.AppendLine("        }")
        }
        [void]$content.AppendLine("    )")
        [void]$content.AppendLine("}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

function ConvertTo-DLPRemovableMediaGroupsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )
    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigDLPRemovableMediaGroups")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    groupName = '$($instance.groupName)'")
        [void]$content.AppendLine("    medias    = @(")
        foreach ($media in $instance.removableMedia)
        {
            [void]$content.AppendLine("        MSFT_PolicyConfigRemovableMedia")
            [void]$content.AppendLine("        {")
            [void]$content.AppendLine("            deviceId          = '$($media.deviceId)'")
            [void]$content.AppendLine("            removableMediaVID = '$($media.removableMediaVID)'")
            [void]$content.AppendLine("            name              = '$($media.name)'")
            [void]$content.AppendLine("            alias             = '$($media.alias)'")
            [void]$content.AppendLine("            removableMediaPID = '$($media.removableMediaPID)'")
            [void]$content.AppendLine("            instancePathId    = '$($media.instancePathId)'")
            [void]$content.AppendLine("            serialNumberId    = '$($media.serialNumberId)'")
            [void]$content.AppendLine("            hardwareId        = '$($media.hardwareId)'")
            [void]$content.AppendLine("        }")
        }
        [void]$content.AppendLine("    )")
        [void]$content.AppendLine("}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}
function ConvertTo-SiteGroupsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )
    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigDLPSiteGroups")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    Id        = '$($instance.Id)'")
        [void]$content.AppendLine("    Name      = '$($instance.Name)'")
        [void]$content.AppendLine("    addresses = @(")
        foreach ($address in $instance.addresses)
        {
            [void]$content.AppendLine("        MSFT_PolicyConfigSiteGroupAddress")
            [void]$content.AppendLine("        {")
            [void]$content.AppendLine("            MatchType    = '$($address.MatchType)'")
            [void]$content.AppendLine("            Url          = '$($address.MatchType)'")
            [void]$content.AppendLine("            AddressLower = '$($address.MatchType)'")
            [void]$content.AppendLine("            AddressUpper = '$($address.MatchType)'")
            [void]$content.AppendLine("        }")
        }
        [void]$content.AppendLine("    )")
        [void]$content.AppendLine("}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

function ConvertTo-AppsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [Array]
        $ObjectHash
    )
    $content = [System.Text.StringBuilder]::new()

    [void]$content.Append('@(')
    foreach ($instance in $ObjectHash)
    {
        [void]$content.AppendLine("MSFT_PolicyConfigApp")
        [void]$content.AppendLine("{")
        [void]$content.AppendLine("    Value        = '$($instance.Value)'")
        [void]$content.AppendLine("    Executable   = '$($instance.Executable)'")
        [void]$content.AppendLine("}")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

Export-ModuleMember -Function *-TargetResource
