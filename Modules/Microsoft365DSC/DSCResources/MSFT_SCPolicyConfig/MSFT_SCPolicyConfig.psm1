function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $IsSingleInstance = 'Yes',

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
        foreach ($appEntry in $DlpAppGroupsObject.Apps)
        {
            $entry = @{
                ExecutableName = $appEntry.ExecutableName
                Name           = $appEntry.Name
                Quarantine     = [Boolean]$appEntry.Quarantine
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
        $DlpPrinterGroupsValue = @{
            groups = @()
        }
        foreach ($group in $DlpPrinterGroupsObject.groups)
        {
            $entry = @{
                groupName = $group.groupName
                groupId   = $group.groupId
            }

            $printers = @()
            foreach ($printer in $printers)
            {
                $current = @{
                    universalPrinter = [Boolean]$printer.universalPrinter
                    usbPrinter       = [Boolean]$printer.usbPrinter
                    usbPrinterId     = $printer.usbPrinterPID
                    name             = $printer.name
                    alias            = $printer.alias
                    usbPrinterVID    = $printer.usbPrinterVID
                    ipRange          = @{
                        from = $printer.ipRange.from
                        to   = $printer.ipRange.to
                    }
                    corporatePrinter = [Boolean]$printer.CorporatePrinter
                    printToLocal     = [Boolean]$printer.printToLocal
                    printToFile      = [Boolean]$printer.printToFile
                }

                $printers += $current
            }
            $entry.Add('printers', $printers)
            $DlpPrinterGroupsValue.groups += $entry
        }

        # DLPRemovableMediaGroups
        $DLPRemovableMediaGroupsValue = @{
            groups = @()
        }
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

            $DLPRemovableMediaGroupsValue.groups += $entry
        }

        # DlpNetworkShareGroups
        $DlpNetworkShareGroupsValue = @{
            groups = @()
        }
        foreach ($group in $DlpNetworkShareGroupsObject.groups)
        {
            $entry = @{
                groupName    = $group.groupName
                groupId      = $group.groupId
                networkPaths = [Array]$group.networkPaths
            }
            $DlpNetworkShareGroupsValue.groups += $entry
        }

        # VPNSettings
        $entity = ConvertFrom-Json ($EndpointDlpGlobalSettingsValue | Where-Object {$_.Setting -eq 'VPNSettings'}).Value
        $VPNSettingsValue = @{
            serverAddress = [Array]$entity.serverAddress
        }

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
            Ensure                                  = 'Present'
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
        ##TODO - Replace the PrimaryKey
        [Parameter(Mandatory = $true)]
        [System.String]
        $PrimaryKey,

        ##TODO - Add the list of Parameters

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

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

    $currentInstance = Get-TargetResource @PSBoundParameters

    $setParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $PSBoundParameters

    # CREATE
    if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    {
        ##TODO - Replace by the New cmdlet for the resource
        New-Cmdlet @SetParameters
    }
    # UPDATE
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        ##TODO - Replace by the Update/Set cmdlet for the resource
        Set-cmdlet @SetParameters
    }
    # REMOVE
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        ##TODO - Replace by the Remove cmdlet for the resource
        Remove-cmdlet @SetParameters
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        ##TODO - Replace the PrimaryKey
        [Parameter(Mandatory = $true)]
        [System.String]
        $PrimaryKey,

        ##TODO - Add the list of Parameters

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

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
        [void]$content.AppendLine("        MSFT_PolicyConfigBusinessJustificationList")
        [void]$content.AppendLine("        {")
        [void]$content.AppendLine("            Id                = '$($instance.Id)'")
        [void]$content.AppendLine("            Enable            = `$$($instance.Enable)")
        [void]$content.AppendLine("            justificationText = '$($instance.Id)'")
        [void]$content.AppendLine("        }")
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
        [void]$content.AppendLine("        MSFT_PolicyConfigDLPAppGroups")
        [void]$content.AppendLine("        {")
        [void]$content.AppendLine("            ExecutableName    = '$($instance.ExecutableName)'")
        [void]$content.AppendLine("            Name              = '$($instance.Name)'")
        [void]$content.AppendLine("            Quarantine        = `$$($instance.Quarantine)")
        [void]$content.AppendLine("        }")
    }
    [void]$content.Append(')')
    $result = $content.ToString()
    return $result
}

Export-ModuleMember -Function *-TargetResource
