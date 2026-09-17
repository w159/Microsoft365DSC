using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class IntuneDeviceFeaturesConfigurationPolicyMacOS : M365DSCResourceBase
{
    [DscProperty()]
    [System.ComponentModel.Description('Whether to show admin host information on the login window.')]
    [System.Nullable[System.Boolean]] $AdminShowHostInfo

    [DscProperty()]
    [System.ComponentModel.Description('An array of AirPrint printers that should always be shown. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphAirPrintDestination[]] $AirPrintDestinations

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list that maps apps to their associated domains. Application identifiers must be unique. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphMacOSAssociatedDomainsItem[]] $AppAssociatedDomains

    [DscProperty()]
    [System.ComponentModel.Description('Represents the assignment to the Intune policy.')]
    [MSFT_DeviceManagementConfigurationPolicyAssignments[]] $Assignments

    [DscProperty()]
    [System.ComponentModel.Description('DEPRECATED: use appAssociatedDomains instead. Gets or sets a list that maps apps to their associated domains. The key should match the app''s ID, and the value should be a string in the form of ''service:domain'' where domain is a fully qualified hostname (e.g. webcredentials:example.com). This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphKeyValuePair2[]] $AssociatedDomains

    [DscProperty()]
    [System.ComponentModel.Description('Whether to show the name and password dialog or a list of users on the login window.')]
    [System.Nullable[System.Boolean]] $AuthorizedUsersListHidden

    [DscProperty()]
    [System.ComponentModel.Description('Whether to hide admin users in the authorized users list on the login window.')]
    [System.Nullable[System.Boolean]] $AuthorizedUsersListHideAdminUsers

    [DscProperty()]
    [System.ComponentModel.Description('Whether to show only network and system users in the authorized users list on the login window.')]
    [System.Nullable[System.Boolean]] $AuthorizedUsersListHideLocalUsers

    [DscProperty()]
    [System.ComponentModel.Description('Whether to hide mobile users in the authorized users list on the login window.')]
    [System.Nullable[System.Boolean]] $AuthorizedUsersListHideMobileAccounts

    [DscProperty()]
    [System.ComponentModel.Description('Whether to show network users in the authorized users list on the login window.')]
    [System.Nullable[System.Boolean]] $AuthorizedUsersListIncludeNetworkUsers

    [DscProperty()]
    [System.ComponentModel.Description('Whether to show other users in the authorized users list on the login window.')]
    [System.Nullable[System.Boolean]] $AuthorizedUsersListShowOtherManagedUsers

    [DscProperty()]
    [System.ComponentModel.Description('List of applications, files, folders, and other items to launch when the user logs in. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphMacOSLaunchItem[]] $AutoLaunchItems

    [DscProperty()]
    [System.ComponentModel.Description('Whether the Other user will disregard use of the console special user name.')]
    [System.Nullable[System.Boolean]] $ConsoleAccessDisabled

    [DscProperty()]
    [System.ComponentModel.Description('Prevents content caches from purging content to free up disk space for other apps.')]
    [System.Nullable[System.Boolean]] $ContentCachingBlockDeletion

    [DscProperty()]
    [System.ComponentModel.Description('A list of custom IP ranges content caches will use to listen for clients. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphIpRange2[]] $ContentCachingClientListenRanges

    [DscProperty()]
    [System.ComponentModel.Description('Determines the method in which content caching servers will listen for clients. Possible values are: notConfigured, clientsInLocalNetwork, clientsWithSamePublicIpAddress, clientsInCustomLocalNetworks, clientsInCustomLocalNetworksWithFallback.')]
    [ValidateSet('notConfigured', 'clientsInLocalNetwork', 'clientsWithSamePublicIpAddress', 'clientsInCustomLocalNetworks', 'clientsInCustomLocalNetworksWithFallback')]
    [System.String] $ContentCachingClientPolicy

    [DscProperty()]
    [System.ComponentModel.Description('The path to the directory used to store cached content. The value must be (or end with) /Library/Application Support/Apple/AssetCache/Data')]
    [System.String] $ContentCachingDataPath

    [DscProperty()]
    [System.ComponentModel.Description('Disables internet connection sharing.')]
    [System.Nullable[System.Boolean]] $ContentCachingDisableConnectionSharing

    [DscProperty()]
    [System.ComponentModel.Description('Enables content caching and prevents it from being disabled by the user.')]
    [System.Nullable[System.Boolean]] $ContentCachingEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Forces internet connection sharing. contentCachingDisableConnectionSharing overrides this setting.')]
    [System.Nullable[System.Boolean]] $ContentCachingForceConnectionSharing

    [DscProperty()]
    [System.ComponentModel.Description('Prevent the device from sleeping if content caching is enabled.')]
    [System.Nullable[System.Boolean]] $ContentCachingKeepAwake

    [DscProperty()]
    [System.ComponentModel.Description('Enables logging of IP addresses and ports of clients that request cached content.')]
    [System.Nullable[System.Boolean]] $ContentCachingLogClientIdentities

    [DscProperty()]
    [System.ComponentModel.Description('The maximum number of bytes of disk space that will be used for the content cache. A value of 0 (default) indicates unlimited disk space.')]
    [System.Nullable[System.Int64]] $ContentCachingMaxSizeBytes

    [DscProperty()]
    [System.ComponentModel.Description('A list of IP addresses representing parent content caches.')]
    [System.String[]] $ContentCachingParents

    [DscProperty()]
    [System.ComponentModel.Description('Determines the method in which content caching servers will select parents if multiple are present. Possible values are: notConfigured, roundRobin, firstAvailable, urlPathHash, random, stickyAvailable.')]
    [ValidateSet('notConfigured', 'roundRobin', 'firstAvailable', 'urlPathHash', 'random', 'stickyAvailable')]
    [System.String] $ContentCachingParentSelectionPolicy

    [DscProperty()]
    [System.ComponentModel.Description('A list of custom IP ranges content caches will use to query for content from peers caches. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphIpRange2[]] $ContentCachingPeerFilterRanges

    [DscProperty()]
    [System.ComponentModel.Description('A list of custom IP ranges content caches will use to listen for peer caches. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphIpRange2[]] $ContentCachingPeerListenRanges

    [DscProperty()]
    [System.ComponentModel.Description('Determines the method in which content caches peer with other caches. Possible values are: notConfigured, peersInLocalNetwork, peersWithSamePublicIpAddress, peersInCustomLocalNetworks.')]
    [ValidateSet('notConfigured', 'peersInLocalNetwork', 'peersWithSamePublicIpAddress', 'peersInCustomLocalNetworks')]
    [System.String] $ContentCachingPeerPolicy

    [DscProperty()]
    [System.ComponentModel.Description('Sets the port used for content caching. If the value is 0, a random available port will be selected. Valid values 0 to 65535')]
    [System.Nullable[System.Int32]] $ContentCachingPort

    [DscProperty()]
    [System.ComponentModel.Description('A list of custom IP ranges that Apple''s content caching service should use to match clients to content caches. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphIpRange2[]] $ContentCachingPublicRanges

    [DscProperty()]
    [System.ComponentModel.Description('Display content caching alerts as system notifications.')]
    [System.Nullable[System.Boolean]] $ContentCachingShowAlerts

    [DscProperty()]
    [System.ComponentModel.Description('Determines what type of content is allowed to be cached by Apple''s content caching service. Possible values are: notConfigured, userContentOnly, sharedContentOnly.')]
    [ValidateSet('notConfigured', 'userContentOnly', 'sharedContentOnly')]
    [System.String] $ContentCachingType

    [DscProperty()]
    [System.ComponentModel.Description('Admin provided description of the Device Configuration.')]
    [System.String] $Description

    [DscProperty(Key)]
    [System.ComponentModel.Description('Admin provided name of the device configuration.')]
    [System.String] $DisplayName

    [DscProperty()]
    [System.ComponentModel.Description('The unique identifier for an entity. Read-only.')]
    [System.String] $Id

    [DscProperty()]
    [System.ComponentModel.Description('Custom text to be displayed on the login window.')]
    [System.String] $LoginWindowText

    [DscProperty()]
    [System.ComponentModel.Description('Whether the Log Out menu item on the login window will be disabled while the user is logged in.')]
    [System.Nullable[System.Boolean]] $LogOutDisabledWhileLoggedIn

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a single sign-on extension profile.')]
    [MSFT_MicrosoftGraphMacOSSingleSignOnExtension] $MacOSSingleSignOnExtension

    [DscProperty()]
    [System.ComponentModel.Description('Whether the Power Off menu item on the login window will be disabled while the user is logged in.')]
    [System.Nullable[System.Boolean]] $PowerOffDisabledWhileLoggedIn

    [DscProperty()]
    [System.ComponentModel.Description('Whether to hide the Restart button item on the login window.')]
    [System.Nullable[System.Boolean]] $RestartDisabled

    [DscProperty()]
    [System.ComponentModel.Description('Whether the Restart menu item on the login window will be disabled while the user is logged in.')]
    [System.Nullable[System.Boolean]] $RestartDisabledWhileLoggedIn

    [DscProperty()]
    [System.ComponentModel.Description('List of Scope Tags for this Entity instance.')]
    [System.String[]] $RoleScopeTagIds

    [DscProperty()]
    [System.ComponentModel.Description('Whether to disable the immediate screen lock functions.')]
    [System.Nullable[System.Boolean]] $ScreenLockDisableImmediate

    [DscProperty()]
    [System.ComponentModel.Description('Whether to hide the Shut Down button item on the login window.')]
    [System.Nullable[System.Boolean]] $ShutDownDisabled

    [DscProperty()]
    [System.ComponentModel.Description('Whether the Shut Down menu item on the login window will be disabled while the user is logged in.')]
    [System.Nullable[System.Boolean]] $ShutDownDisabledWhileLoggedIn

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a single sign-on extension profile. Deprecated: use MacOSSingleSignOnExtension instead.')]
    [MSFT_MicrosoftGraphSingleSignOnExtension] $SingleSignOnExtension

    [DscProperty()]
    [System.ComponentModel.Description('Whether to hide the Sleep menu item on the login window.')]
    [System.Nullable[System.Boolean]] $SleepDisabled

    [DscProperty()]
    [System.ComponentModel.Description('Specify if the policy should exist.')]
    [ValidateSet('Present', 'Absent')]
    [System.String] $Ensure

    [DscProperty()]
    [System.ComponentModel.Description('Credentials of the Intune Admin')]
    [System.Management.Automation.PSCredential] $Credential

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Entra ID application to authenticate with.')]
    [System.String] $ApplicationId

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Entra ID tenant used for authentication.')]
    [System.String] $TenantId

    [DscProperty()]
    [System.ComponentModel.Description('Secret of the Entra ID application to authenticate with.')]
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [DscProperty()]
    [System.ComponentModel.Description('Thumbprint of the Entra ID application''s authentication certificate to use for authentication.')]
    [System.String] $CertificateThumbprint

    [DscProperty()]
    [System.ComponentModel.Description('Username can be made up to anything but password will be used for CertificatePassword')]
    [System.Management.Automation.PSCredential] $CertificatePassword

    [DscProperty()]
    [System.ComponentModel.Description('Path to certificate used in service principal usually a PFX file.')]
    [System.String] $CertificatePath

    [DscProperty()]
    [System.ComponentModel.Description('Managed ID being used for authentication.')]
    [System.Nullable[System.Boolean]] $ManagedIdentity

    [DscProperty()]
    [System.ComponentModel.Description('Access token used for authentication.')]
    [System.String[]] $AccessTokens

    # Export-only. Not part of the resource schema.
    [System.String] $Filter

    [IntuneDeviceFeaturesConfigurationPolicyMacOS] Get()
    {
        if ($this.RequiresPowerShellCore())
        {
            $remote = [IntuneDeviceFeaturesConfigurationPolicyMacOS]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration of Intune Device Features Configuration Policy for macOS {$($this.Id)}"

        try
        {
            $null = $this.Connect('MicrosoftGraph')

            #Ensure the proper dependencies are installed in the current environment.
            Confirm-M365DSCDependencies

            #region Telemetry
            $this.AddTelemetry('Get')
            #endregion

            $nullResult = $this.GetBoundParameters()
            $nullResult.Ensure = 'Absent'

            if (-not $this.ExportedInstance -or $this.ExportedInstance.Id -ne $this.Id)
            {
                $getValue = $null
                if (-not [System.String]::IsNullOrEmpty($this.Id))
                {
                    $getValue = Get-MgBetaDeviceManagementDeviceConfiguration -DeviceConfigurationId $this.Id `
                        -ErrorAction SilentlyContinue
                }

                if ($null -eq $getValue -and -not [System.String]::IsNullOrEmpty($this.DisplayName))
                {
                    $getValue = Get-MgBetaDeviceManagementDeviceConfiguration `
                        -Filter "DisplayName eq '$($this.DisplayName -replace "'", "''")' and isof('microsoft.graph.macOSDeviceFeaturesConfiguration')" `
                        -ErrorAction SilentlyContinue | Select-Object -First 1
                }
            }
            else
            {
                $getValue = $this.ExportedInstance
            }

            if ($null -eq $getValue)
            {
                Write-Verbose -Message "No Intune Device Features Configuration Policy for macOS with Id {$($this.Id)} was found"
                return $this.AsResult($nullResult)
            }

            Write-Verbose -Message "Found Intune Device Features Configuration Policy for macOS with Id {$($this.Id)}"

            $complexAirPrintDestinations = @()
            foreach ($currentAirPrintDestinations in $getValue.airPrintDestinations)
            {
                $complexAirPrintDestinations += $this.GetAirPrintDestinationAsHashtable($currentAirPrintDestinations)
            }

            $complexAppAssociatedDomains = @()
            foreach ($currentAppAssociatedDomains in $getValue.appAssociatedDomains)
            {
                $complexAppAssociatedDomains += $this.GetMacOSAssociatedDomainsItemAsHashtable($currentAppAssociatedDomains)
            }

            $complexAssociatedDomains = @()
            foreach ($currentAssociatedDomains in $getValue.associatedDomains)
            {
                $complexAssociatedDomains += $this.GetKeyValuePair2AsHashtable($currentAssociatedDomains)
            }

            $complexAutoLaunchItems = @()
            foreach ($currentAutoLaunchItems in $getValue.autoLaunchItems)
            {
                $complexAutoLaunchItems += $this.GetMacOSLaunchItemAsHashtable($currentAutoLaunchItems)
            }

            $complexContentCachingClientListenRanges = @()
            foreach ($currentContentCachingClientListenRanges in $getValue.contentCachingClientListenRanges)
            {
                $complexContentCachingClientListenRanges += $this.GetIpRange2AsHashtable($currentContentCachingClientListenRanges)
            }

            $enumContentCachingClientPolicy = $null
            if ($null -ne $getValue.contentCachingClientPolicy)
            {
                $enumContentCachingClientPolicy = $getValue.contentCachingClientPolicy.ToString()
            }

            $enumContentCachingParentSelectionPolicy = $null
            if ($null -ne $getValue.contentCachingParentSelectionPolicy)
            {
                $enumContentCachingParentSelectionPolicy = $getValue.contentCachingParentSelectionPolicy.ToString()
            }

            $complexContentCachingPeerFilterRanges = @()
            foreach ($currentContentCachingPeerFilterRanges in $getValue.contentCachingPeerFilterRanges)
            {
                $complexContentCachingPeerFilterRanges += $this.GetIpRange2AsHashtable($currentContentCachingPeerFilterRanges)
            }

            $complexContentCachingPeerListenRanges = @()
            foreach ($currentContentCachingPeerListenRanges in $getValue.contentCachingPeerListenRanges)
            {
                $complexContentCachingPeerListenRanges += $this.GetIpRange2AsHashtable($currentContentCachingPeerListenRanges)
            }

            $enumContentCachingPeerPolicy = $null
            if ($null -ne $getValue.contentCachingPeerPolicy)
            {
                $enumContentCachingPeerPolicy = $getValue.contentCachingPeerPolicy.ToString()
            }

            $complexContentCachingPublicRanges = @()
            foreach ($currentContentCachingPublicRanges in $getValue.contentCachingPublicRanges)
            {
                $complexContentCachingPublicRanges += $this.GetIpRange2AsHashtable($currentContentCachingPublicRanges)
            }

            $enumContentCachingType = $null
            if ($null -ne $getValue.contentCachingType)
            {
                $enumContentCachingType = $getValue.contentCachingType.ToString()
            }

            $complexMacOSSingleSignOnExtension = $this.GetMacOSSingleSignOnExtensionAsHashtable($getValue.macOSSingleSignOnExtension)

            $complexSingleSignOnExtension = $this.GetSingleSignOnExtensionAsHashtable($getValue.singleSignOnExtension)
            $result = @{
                AdminShowHostInfo                        = $getValue.adminShowHostInfo
                AirPrintDestinations                     = [Array]$complexAirPrintDestinations
                AppAssociatedDomains                     = [Array]$complexAppAssociatedDomains
                AssociatedDomains                        = [Array]$complexAssociatedDomains
                AuthorizedUsersListHidden                = $getValue.authorizedUsersListHidden
                AuthorizedUsersListHideAdminUsers        = $getValue.authorizedUsersListHideAdminUsers
                AuthorizedUsersListHideLocalUsers        = $getValue.authorizedUsersListHideLocalUsers
                AuthorizedUsersListHideMobileAccounts    = $getValue.authorizedUsersListHideMobileAccounts
                AuthorizedUsersListIncludeNetworkUsers   = $getValue.authorizedUsersListIncludeNetworkUsers
                AuthorizedUsersListShowOtherManagedUsers = $getValue.authorizedUsersListShowOtherManagedUsers
                AutoLaunchItems                          = [Array]$complexAutoLaunchItems
                ConsoleAccessDisabled                    = $getValue.consoleAccessDisabled
                ContentCachingBlockDeletion              = $getValue.contentCachingBlockDeletion
                ContentCachingClientListenRanges         = [Array]$complexContentCachingClientListenRanges
                ContentCachingClientPolicy               = $enumContentCachingClientPolicy
                ContentCachingDataPath                   = $getValue.contentCachingDataPath
                ContentCachingDisableConnectionSharing   = $getValue.contentCachingDisableConnectionSharing
                ContentCachingEnabled                    = $getValue.contentCachingEnabled
                ContentCachingForceConnectionSharing     = $getValue.contentCachingForceConnectionSharing
                ContentCachingKeepAwake                  = $getValue.contentCachingKeepAwake
                ContentCachingLogClientIdentities        = $getValue.contentCachingLogClientIdentities
                ContentCachingMaxSizeBytes               = $getValue.contentCachingMaxSizeBytes
                ContentCachingParents                    = $getValue.contentCachingParents
                ContentCachingParentSelectionPolicy      = $enumContentCachingParentSelectionPolicy
                ContentCachingPeerFilterRanges           = [Array]$complexContentCachingPeerFilterRanges
                ContentCachingPeerListenRanges           = [Array]$complexContentCachingPeerListenRanges
                ContentCachingPeerPolicy                 = $enumContentCachingPeerPolicy
                ContentCachingPort                       = $getValue.contentCachingPort
                ContentCachingPublicRanges               = [Array]$complexContentCachingPublicRanges
                ContentCachingShowAlerts                 = $getValue.contentCachingShowAlerts
                ContentCachingType                       = $enumContentCachingType
                Description                              = $getValue.Description
                DisplayName                              = $getValue.DisplayName
                Id                                       = $getValue.Id
                LoginWindowText                          = $getValue.loginWindowText
                LogOutDisabledWhileLoggedIn              = $getValue.logOutDisabledWhileLoggedIn
                MacOSSingleSignOnExtension               = $complexMacOSSingleSignOnExtension
                PowerOffDisabledWhileLoggedIn            = $getValue.powerOffDisabledWhileLoggedIn
                RestartDisabled                          = $getValue.restartDisabled
                RestartDisabledWhileLoggedIn             = $getValue.restartDisabledWhileLoggedIn
                RoleScopeTagIds                          = Resolve-M365DSCIntuneRoleScopeTagNames -CurrentValues $getValue.RoleScopeTagIds -DesiredValues $this.RoleScopeTagIds
                ScreenLockDisableImmediate               = $getValue.screenLockDisableImmediate
                ShutDownDisabled                         = $getValue.shutDownDisabled
                ShutDownDisabledWhileLoggedIn            = $getValue.shutDownDisabledWhileLoggedIn
                SingleSignOnExtension                    = $complexSingleSignOnExtension
                SleepDisabled                            = $getValue.sleepDisabled
                Ensure                                   = 'Present'
                Credential                               = $this.Credential
                ApplicationId                            = $this.ApplicationId
                TenantId                                 = $this.TenantId
                ApplicationSecret                        = $this.ApplicationSecret
                CertificateThumbprint                    = $this.CertificateThumbprint
                CertificatePassword                      = $this.CertificatePassword
                CertificatePath                          = $this.CertificatePath
                ManagedIdentity                          = $this.ManagedIdentity
                AccessTokens                             = $this.AccessTokens
            }

            $assignmentsValues = Get-M365DSCIntuneExpandedAssignments -Instance $getValue
            if ($null -eq $assignmentsValues)
            {
                $assignmentsValues = Get-MgBetaDeviceManagementDeviceConfigurationAssignment -DeviceConfigurationId $getValue.Id -ErrorAction SilentlyContinue
            }
            $assignmentResult = @()
            if ($null -ne $assignmentsValues -and $assignmentsValues.Count -gt 0)
            {
                $assignmentResult += ConvertFrom-IntunePolicyAssignment `
                    -IncludeDeviceFilter:$true `
                    -Assignments $assignmentsValues
            }
            $result.Add('Assignments', $assignmentResult)

            return $this.AsResult($result)
        }
        catch
        {
            $this.LogError($_, 'Error retrieving data:')

            throw
        }
    }

    [void] Set()
    {
        if ($this.RequiresPowerShellCore())
        {
            $null = $this.InvokeInPowerShellCore('Set')
            return
        }

        Write-Verbose -Message "Setting configuration of Intune Device Features Configuration Policy for macOS {$($this.Id)}"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        try
        {
            $null = $this.Connect('MicrosoftGraph')

            $currentInstance = $this.Get().ToHashtable()

            $boundParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()

            if ($boundParameters.ContainsKey('RoleScopeTagIds'))
            {
                $boundParameters.RoleScopeTagIds = Resolve-M365DSCIntuneRoleScopeTagIds -RoleScopeTagIds $this.RoleScopeTagIds
            }

            $boundParameters = Rename-M365DSCCimInstanceParameter -Properties $boundParameters
            $boundParameters.Remove('Id') | Out-Null
            $boundParameters.Remove('Assignments') | Out-Null
            $boundParameters.Add('@odata.type', '#microsoft.graph.macOSDeviceFeaturesConfiguration')

            if ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
            {
                Write-Verbose -Message "Creating new Intune Device Features Configuration Policy for macOS {$($this.Id)}"

                $createParameters = $boundParameters

                $createdInstance = New-MgBetaDeviceManagementDeviceConfiguration -BodyParameter $createParameters

                $assignmentsHash = ConvertTo-IntunePolicyAssignment -IncludeDeviceFilter:$true -Assignments $this.Assignments
                if ($createdInstance.Id)
                {
                    Update-DeviceConfigurationPolicyAssignment `
                        -DeviceConfigurationPolicyId $createdInstance.Id `
                        -Targets $assignmentsHash `
                        -Repository 'deviceManagement/deviceConfigurations'
                }
            }
            elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
            {
                Write-Verbose -Message "Updating Intune Device Features Configuration Policy for macOS {$($this.Id)}"

                $updateParameters = $boundParameters

                Update-MgBetaDeviceManagementDeviceConfiguration -DeviceConfigurationId $currentInstance.Id -BodyParameter $updateParameters | Out-Null

                $assignmentsHash = ConvertTo-IntunePolicyAssignment -IncludeDeviceFilter:$true -Assignments $this.Assignments
                if ($currentInstance.Id)
                {
                    Update-DeviceConfigurationPolicyAssignment `
                        -DeviceConfigurationPolicyId $currentInstance.Id `
                        -Targets $assignmentsHash `
                        -Repository 'deviceManagement/deviceConfigurations'
                }
            }
            elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
            {
                Write-Verbose -Message "Removing Intune Device Features Configuration Policy for macOS {$($this.Id)}"

                Remove-MgBetaDeviceManagementDeviceConfiguration -DeviceConfigurationId $currentInstance.Id | Out-Null
            }
        }
        catch
        {
            $this.LogError($_, 'Error updating data:')

            throw
        }
    }

    [bool] Test()
    {
        return ([M365DSCResourceBase] $this).Test()
    }

    [string] Export()
    {
        if ($this.RequiresPowerShellCore())
        {
            return [string] $this.InvokeInPowerShellCore('Export')
        }

        $ConnectionMode = $this.Connect('MicrosoftGraph')

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Export')

        try
        {
            [array] $exportedInstances = Get-M365DSCExportCachedCollection -Collection 'deviceConfigurations' `
                -ODataType 'microsoft.graph.macOSDeviceFeaturesConfiguration' `
                -Filter $this.Filter

            $dscContent = [System.Text.StringBuilder]::new()
            $i = 1

            if ($exportedInstances.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }

            foreach ($exportedInstance in $exportedInstances)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                Write-M365DSCHost -Message "    |---[$i/$($exportedInstances.Count)] $($exportedInstance.DisplayName)" -DeferWrite

                $Params = @{
                    Id                    = $exportedInstance.Id
                    DisplayName           = $exportedInstance.DisplayName
                    Credential            = $this.Credential
                    ApplicationId         = $this.ApplicationId
                    TenantId              = $this.TenantId
                    ApplicationSecret     = $this.ApplicationSecret
                    CertificateThumbprint = $this.CertificateThumbprint
                    CertificatePassword   = $this.CertificatePassword
                    CertificatePath       = $this.CertificatePath
                    ManagedIdentity       = $this.ManagedIdentity
                    AccessTokens          = $this.AccessTokens
                }

                $this.ExportedInstance = $exportedInstance
                $Results = $this.GetForExport($Params)

                if ($null -ne $Results.AirPrintDestinations)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.AirPrintDestinations `
                        -CIMInstanceName 'MSFT_MicrosoftGraphAirPrintDestination'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.AirPrintDestinations = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('AirPrintDestinations') | Out-Null
                    }
                }

                if ($null -ne $Results.AppAssociatedDomains)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.AppAssociatedDomains `
                        -CIMInstanceName 'MSFT_MicrosoftGraphMacOSAssociatedDomainsItem'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.AppAssociatedDomains = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('AppAssociatedDomains') | Out-Null
                    }
                }

                if ($null -ne $Results.Assignments)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.Assignments `
                        -CIMInstanceName 'MSFT_DeviceManagementConfigurationPolicyAssignments'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.Assignments = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('Assignments') | Out-Null
                    }
                }

                if ($null -ne $Results.AssociatedDomains)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.AssociatedDomains `
                        -CIMInstanceName 'MSFT_MicrosoftGraphKeyValuePair2'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.AssociatedDomains = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('AssociatedDomains') | Out-Null
                    }
                }

                if ($null -ne $Results.AutoLaunchItems)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.AutoLaunchItems `
                        -CIMInstanceName 'MSFT_MicrosoftGraphMacOSLaunchItem'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.AutoLaunchItems = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('AutoLaunchItems') | Out-Null
                    }
                }

                if ($null -ne $Results.ContentCachingClientListenRanges)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.ContentCachingClientListenRanges `
                        -CIMInstanceName 'MSFT_MicrosoftGraphIpRange2'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.ContentCachingClientListenRanges = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('ContentCachingClientListenRanges') | Out-Null
                    }
                }

                if ($null -ne $Results.ContentCachingPeerFilterRanges)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.ContentCachingPeerFilterRanges `
                        -CIMInstanceName 'MSFT_MicrosoftGraphIpRange2'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.ContentCachingPeerFilterRanges = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('ContentCachingPeerFilterRanges') | Out-Null
                    }
                }

                if ($null -ne $Results.ContentCachingPeerListenRanges)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.ContentCachingPeerListenRanges `
                        -CIMInstanceName 'MSFT_MicrosoftGraphIpRange2'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.ContentCachingPeerListenRanges = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('ContentCachingPeerListenRanges') | Out-Null
                    }
                }

                if ($null -ne $Results.ContentCachingPublicRanges)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.ContentCachingPublicRanges `
                        -CIMInstanceName 'MSFT_MicrosoftGraphIpRange2'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.ContentCachingPublicRanges = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('ContentCachingPublicRanges') | Out-Null
                    }
                }

                if ($null -ne $Results.MacOSSingleSignOnExtension)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.MacOSSingleSignOnExtension `
                        -CIMInstanceName 'MSFT_MicrosoftGraphMacOSSingleSignOnExtension'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.MacOSSingleSignOnExtension = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('MacOSSingleSignOnExtension') | Out-Null
                    }
                }

                if ($null -ne $Results.SingleSignOnExtension)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.SingleSignOnExtension `
                        -CIMInstanceName 'MSFT_MicrosoftGraphSingleSignOnExtension'
                    if (-not [System.String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.SingleSignOnExtension = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('SingleSignOnExtension') | Out-Null
                    }
                }
                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential `
                    -NoEscape @('AirPrintDestinations', 'AppAssociatedDomains', 'Assignments', 'AssociatedDomains', 'AutoLaunchItems', 'ContentCachingClientListenRanges', 'ContentCachingPeerFilterRanges', 'ContentCachingPeerListenRanges', 'ContentCachingPublicRanges', 'MacOSSingleSignOnExtension', 'SingleSignOnExtension')
                [void]$dscContent.Append($currentDSCBlock)
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName

                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
                $i++
            }

            return $dscContent.ToString()
        }
        catch
        {
            Write-M365DSCHost -Message $Global:M365DSCEmojiRedX

            $this.LogError($_, 'Error during Export:')

            throw
        }
    }

    hidden [IntuneDeviceFeaturesConfigurationPolicyMacOS] AsResult([System.Object] $Values)
    {
        if ($Values -is [IntuneDeviceFeaturesConfigurationPolicyMacOS])
        {
            return $Values
        }

        $result = [IntuneDeviceFeaturesConfigurationPolicyMacOS]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetAirPrintDestinationAsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.forceTls)
        {
            $result.Add('ForceTls', $ComplexObject.forceTls)
        }

        if ($null -ne $ComplexObject.ipAddress)
        {
            $result.Add('IpAddress', $ComplexObject.ipAddress)
        }

        if ($null -ne $ComplexObject.port)
        {
            $result.Add('Port', $ComplexObject.port)
        }

        if ($null -ne $ComplexObject.resourcePath)
        {
            $result.Add('ResourcePath', $ComplexObject.resourcePath)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetMacOSAssociatedDomainsItemAsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.applicationIdentifier)
        {
            $result.Add('ApplicationIdentifier', $ComplexObject.applicationIdentifier)
        }

        if ($null -ne $ComplexObject.directDownloadsEnabled)
        {
            $result.Add('DirectDownloadsEnabled', $ComplexObject.directDownloadsEnabled)
        }

        if ($null -ne $ComplexObject.domains)
        {
            $result.Add('Domains', [Array]$ComplexObject.domains)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetKeyValuePair2AsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.name)
        {
            $result.Add('Name', $ComplexObject.name)
        }

        if ($null -ne $ComplexObject.value)
        {
            $result.Add('Value', $ComplexObject.value)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetMacOSLaunchItemAsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.hide)
        {
            $result.Add('Hide', $ComplexObject.hide)
        }

        if ($null -ne $ComplexObject.path)
        {
            $result.Add('Path', $ComplexObject.path)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetIpRange2AsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.cidrAddress)
        {
            $result.Add('CidrAddress', $ComplexObject.cidrAddress)
        }

        if ($null -ne $ComplexObject.lowerAddress)
        {
            $result.Add('LowerAddress', $ComplexObject.lowerAddress)
        }

        $odataType = $ComplexObject.AdditionalProperties.'@odata.type'
        if ($null -eq $odataType)
        {
            $odataType = $ComplexObject.'@odata.type'
        }
        if ($null -ne $odataType)
        {
            $result.Add('ODataType', $odataType.ToString())
        }

        if ($null -ne $ComplexObject.upperAddress)
        {
            $result.Add('UpperAddress', $ComplexObject.upperAddress)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetKeyTypedValuePairAsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.key)
        {
            $result.Add('Key', $ComplexObject.key)
        }

        $odataType = $ComplexObject.AdditionalProperties.'@odata.type'
        if ($null -eq $odataType)
        {
            $odataType = $ComplexObject.'@odata.type'
        }
        if ($null -ne $odataType)
        {
            $result.Add('ODataType', $odataType.ToString())
        }

        if ($null -ne $ComplexObject.value)
        {
            $result.Add('Value', $ComplexObject.value)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetMacOSSingleSignOnExtensionAsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.activeDirectorySiteCode)
        {
            $result.Add('ActiveDirectorySiteCode', $ComplexObject.activeDirectorySiteCode)
        }

        if ($null -ne $ComplexObject.blockActiveDirectorySiteAutoDiscovery)
        {
            $result.Add('BlockActiveDirectorySiteAutoDiscovery', $ComplexObject.blockActiveDirectorySiteAutoDiscovery)
        }

        if ($null -ne $ComplexObject.blockAutomaticLogin)
        {
            $result.Add('BlockAutomaticLogin', $ComplexObject.blockAutomaticLogin)
        }

        if ($null -ne $ComplexObject.bundleIdAccessControlList)
        {
            $result.Add('BundleIdAccessControlList', [Array]$ComplexObject.bundleIdAccessControlList)
        }

        if ($null -ne $ComplexObject.cacheName)
        {
            $result.Add('CacheName', $ComplexObject.cacheName)
        }

        $nestedConfigurations = @()
        foreach ($currentConfigurations in $ComplexObject.configurations)
        {
            $nestedConfigurations += $this.GetKeyTypedValuePairAsHashtable($currentConfigurations)
        }
        if ($nestedConfigurations.Count -gt 0)
        {
            $result.Add('Configurations', [Array]$nestedConfigurations)
        }

        if ($null -ne $ComplexObject.credentialBundleIdAccessControlList)
        {
            $result.Add('CredentialBundleIdAccessControlList', [Array]$ComplexObject.credentialBundleIdAccessControlList)
        }

        if ($null -ne $ComplexObject.credentialsCacheMonitored)
        {
            $result.Add('CredentialsCacheMonitored', $ComplexObject.credentialsCacheMonitored)
        }

        if ($null -ne $ComplexObject.domainRealms)
        {
            $result.Add('DomainRealms', [Array]$ComplexObject.domainRealms)
        }

        if ($null -ne $ComplexObject.domains)
        {
            $result.Add('Domains', [Array]$ComplexObject.domains)
        }

        if ($null -ne $ComplexObject.enableSharedDeviceMode)
        {
            $result.Add('EnableSharedDeviceMode', $ComplexObject.enableSharedDeviceMode)
        }

        if ($null -ne $ComplexObject.extensionIdentifier)
        {
            $result.Add('ExtensionIdentifier', $ComplexObject.extensionIdentifier)
        }

        if ($null -ne $ComplexObject.isDefaultRealm)
        {
            $result.Add('IsDefaultRealm', $ComplexObject.isDefaultRealm)
        }

        if ($null -ne $ComplexObject.kerberosAppsInBundleIdACLIncluded)
        {
            $result.Add('KerberosAppsInBundleIdACLIncluded', $ComplexObject.kerberosAppsInBundleIdACLIncluded)
        }

        if ($null -ne $ComplexObject.managedAppsInBundleIdACLIncluded)
        {
            $result.Add('ManagedAppsInBundleIdACLIncluded', $ComplexObject.managedAppsInBundleIdACLIncluded)
        }

        if ($null -ne $ComplexObject.modeCredentialUsed)
        {
            $result.Add('ModeCredentialUsed', $ComplexObject.modeCredentialUsed)
        }

        $odataType = $ComplexObject.AdditionalProperties.'@odata.type'
        if ($null -eq $odataType)
        {
            $odataType = $ComplexObject.'@odata.type'
        }
        if ($null -ne $odataType)
        {
            $result.Add('ODataType', $odataType.ToString())
        }

        if ($null -ne $ComplexObject.passwordBlockModification)
        {
            $result.Add('PasswordBlockModification', $ComplexObject.passwordBlockModification)
        }

        if ($null -ne $ComplexObject.passwordChangeUrl)
        {
            $result.Add('PasswordChangeUrl', $ComplexObject.passwordChangeUrl)
        }

        if ($null -ne $ComplexObject.passwordEnableLocalSync)
        {
            $result.Add('PasswordEnableLocalSync', $ComplexObject.passwordEnableLocalSync)
        }

        if ($null -ne $ComplexObject.passwordExpirationDays)
        {
            $result.Add('PasswordExpirationDays', $ComplexObject.passwordExpirationDays)
        }

        if ($null -ne $ComplexObject.passwordExpirationNotificationDays)
        {
            $result.Add('PasswordExpirationNotificationDays', $ComplexObject.passwordExpirationNotificationDays)
        }

        if ($null -ne $ComplexObject.passwordMinimumAgeDays)
        {
            $result.Add('PasswordMinimumAgeDays', $ComplexObject.passwordMinimumAgeDays)
        }

        if ($null -ne $ComplexObject.passwordMinimumLength)
        {
            $result.Add('PasswordMinimumLength', $ComplexObject.passwordMinimumLength)
        }

        if ($null -ne $ComplexObject.passwordPreviousPasswordBlockCount)
        {
            $result.Add('PasswordPreviousPasswordBlockCount', $ComplexObject.passwordPreviousPasswordBlockCount)
        }

        if ($null -ne $ComplexObject.passwordRequireActiveDirectoryComplexity)
        {
            $result.Add('PasswordRequireActiveDirectoryComplexity', $ComplexObject.passwordRequireActiveDirectoryComplexity)
        }

        if ($null -ne $ComplexObject.passwordRequirementsDescription)
        {
            $result.Add('PasswordRequirementsDescription', $ComplexObject.passwordRequirementsDescription)
        }

        if ($null -ne $ComplexObject.preferredKDCs)
        {
            $result.Add('PreferredKDCs', [Array]$ComplexObject.preferredKDCs)
        }

        if ($null -ne $ComplexObject.realm)
        {
            $result.Add('Realm', $ComplexObject.realm)
        }

        if ($null -ne $ComplexObject.requireUserPresence)
        {
            $result.Add('RequireUserPresence', $ComplexObject.requireUserPresence)
        }

        if ($null -ne $ComplexObject.signInHelpText)
        {
            $result.Add('SignInHelpText', $ComplexObject.signInHelpText)
        }

        if ($null -ne $ComplexObject.teamIdentifier)
        {
            $result.Add('TeamIdentifier', $ComplexObject.teamIdentifier)
        }

        if ($null -ne $ComplexObject.tlsForLDAPRequired)
        {
            $result.Add('TlsForLDAPRequired', $ComplexObject.tlsForLDAPRequired)
        }

        if ($null -ne $ComplexObject.urlPrefixes)
        {
            $result.Add('UrlPrefixes', [Array]$ComplexObject.urlPrefixes)
        }

        if ($null -ne $ComplexObject.usernameLabelCustom)
        {
            $result.Add('UsernameLabelCustom', $ComplexObject.usernameLabelCustom)
        }

        if ($null -ne $ComplexObject.userPrincipalName)
        {
            $result.Add('UserPrincipalName', $ComplexObject.userPrincipalName)
        }

        if ($null -ne $ComplexObject.userSetupDelayed)
        {
            $result.Add('UserSetupDelayed', $ComplexObject.userSetupDelayed)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }

    hidden [System.Collections.Hashtable] GetSingleSignOnExtensionAsHashtable([System.Object] $ComplexObject)
    {
        if ($null -eq $ComplexObject)
        {
            return $null
        }

        $result = @{}

        if ($null -ne $ComplexObject.activeDirectorySiteCode)
        {
            $result.Add('ActiveDirectorySiteCode', $ComplexObject.activeDirectorySiteCode)
        }

        if ($null -ne $ComplexObject.blockActiveDirectorySiteAutoDiscovery)
        {
            $result.Add('BlockActiveDirectorySiteAutoDiscovery', $ComplexObject.blockActiveDirectorySiteAutoDiscovery)
        }

        if ($null -ne $ComplexObject.blockAutomaticLogin)
        {
            $result.Add('BlockAutomaticLogin', $ComplexObject.blockAutomaticLogin)
        }

        if ($null -ne $ComplexObject.cacheName)
        {
            $result.Add('CacheName', $ComplexObject.cacheName)
        }

        $nestedConfigurations = @()
        foreach ($currentConfigurations in $ComplexObject.configurations)
        {
            $nestedConfigurations += $this.GetKeyTypedValuePairAsHashtable($currentConfigurations)
        }
        if ($nestedConfigurations.Count -gt 0)
        {
            $result.Add('Configurations', [Array]$nestedConfigurations)
        }

        if ($null -ne $ComplexObject.credentialBundleIdAccessControlList)
        {
            $result.Add('CredentialBundleIdAccessControlList', [Array]$ComplexObject.credentialBundleIdAccessControlList)
        }

        if ($null -ne $ComplexObject.domainRealms)
        {
            $result.Add('DomainRealms', [Array]$ComplexObject.domainRealms)
        }

        if ($null -ne $ComplexObject.domains)
        {
            $result.Add('Domains', [Array]$ComplexObject.domains)
        }

        if ($null -ne $ComplexObject.extensionIdentifier)
        {
            $result.Add('ExtensionIdentifier', $ComplexObject.extensionIdentifier)
        }

        if ($null -ne $ComplexObject.isDefaultRealm)
        {
            $result.Add('IsDefaultRealm', $ComplexObject.isDefaultRealm)
        }

        $odataType = $ComplexObject.AdditionalProperties.'@odata.type'
        if ($null -eq $odataType)
        {
            $odataType = $ComplexObject.'@odata.type'
        }
        if ($null -ne $odataType)
        {
            $result.Add('ODataType', $odataType.ToString())
        }

        if ($null -ne $ComplexObject.passwordBlockModification)
        {
            $result.Add('PasswordBlockModification', $ComplexObject.passwordBlockModification)
        }

        if ($null -ne $ComplexObject.passwordChangeUrl)
        {
            $result.Add('PasswordChangeUrl', $ComplexObject.passwordChangeUrl)
        }

        if ($null -ne $ComplexObject.passwordEnableLocalSync)
        {
            $result.Add('PasswordEnableLocalSync', $ComplexObject.passwordEnableLocalSync)
        }

        if ($null -ne $ComplexObject.passwordExpirationDays)
        {
            $result.Add('PasswordExpirationDays', $ComplexObject.passwordExpirationDays)
        }

        if ($null -ne $ComplexObject.passwordExpirationNotificationDays)
        {
            $result.Add('PasswordExpirationNotificationDays', $ComplexObject.passwordExpirationNotificationDays)
        }

        if ($null -ne $ComplexObject.passwordMinimumAgeDays)
        {
            $result.Add('PasswordMinimumAgeDays', $ComplexObject.passwordMinimumAgeDays)
        }

        if ($null -ne $ComplexObject.passwordMinimumLength)
        {
            $result.Add('PasswordMinimumLength', $ComplexObject.passwordMinimumLength)
        }

        if ($null -ne $ComplexObject.passwordPreviousPasswordBlockCount)
        {
            $result.Add('PasswordPreviousPasswordBlockCount', $ComplexObject.passwordPreviousPasswordBlockCount)
        }

        if ($null -ne $ComplexObject.passwordRequireActiveDirectoryComplexity)
        {
            $result.Add('PasswordRequireActiveDirectoryComplexity', $ComplexObject.passwordRequireActiveDirectoryComplexity)
        }

        if ($null -ne $ComplexObject.passwordRequirementsDescription)
        {
            $result.Add('PasswordRequirementsDescription', $ComplexObject.passwordRequirementsDescription)
        }

        if ($null -ne $ComplexObject.realm)
        {
            $result.Add('Realm', $ComplexObject.realm)
        }

        if ($null -ne $ComplexObject.requireUserPresence)
        {
            $result.Add('RequireUserPresence', $ComplexObject.requireUserPresence)
        }

        if ($null -ne $ComplexObject.teamIdentifier)
        {
            $result.Add('TeamIdentifier', $ComplexObject.teamIdentifier)
        }

        if ($null -ne $ComplexObject.urlPrefixes)
        {
            $result.Add('UrlPrefixes', [Array]$ComplexObject.urlPrefixes)
        }

        if ($null -ne $ComplexObject.userPrincipalName)
        {
            $result.Add('UserPrincipalName', $ComplexObject.userPrincipalName)
        }

        if ($result.Count -eq 0)
        {
            return $null
        }

        return $result
    }
}

class MSFT_MicrosoftGraphAirPrintDestination
{
    [DscProperty()]
    [System.ComponentModel.Description('If true AirPrint connections are secured by Transport Layer Security (TLS). Default is false. Available in iOS 11.0 and later.')]
    [System.Nullable[System.Boolean]] $ForceTls

    [DscProperty()]
    [System.ComponentModel.Description('The IP Address of the AirPrint destination.')]
    [System.String] $IpAddress

    [DscProperty()]
    [System.ComponentModel.Description('The listening port of the AirPrint destination. If this key is not specified AirPrint will use the default port. Available in iOS 11.0 and later.')]
    [System.Nullable[System.Int32]] $Port

    [DscProperty()]
    [System.ComponentModel.Description('The Resource Path associated with the printer. This corresponds to the rp parameter of the ipps.tcp Bonjour record. For example: printers/CanonMG5300series, printers/XeroxPhaser7600, ipp/print, EpsonIPPPrinter.')]
    [System.String] $ResourcePath
}

class MSFT_MicrosoftGraphMacOSAssociatedDomainsItem
{
    [DscProperty()]
    [System.ComponentModel.Description('The application identifier of the app to associate domains with.')]
    [System.String] $ApplicationIdentifier

    [DscProperty()]
    [System.ComponentModel.Description('Determines whether data should be downloaded directly or via a CDN.')]
    [System.Nullable[System.Boolean]] $DirectDownloadsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('The list of domains to associate.')]
    [System.String[]] $Domains
}

class MSFT_DeviceManagementConfigurationPolicyAssignments
{
    [DscProperty(Mandatory)]
    [System.ComponentModel.Description('The type of the target assignment.')]
    [ValidateSet('#microsoft.graph.cloudPcManagementGroupAssignmentTarget', '#microsoft.graph.groupAssignmentTarget', '#microsoft.graph.allLicensedUsersAssignmentTarget', '#microsoft.graph.allDevicesAssignmentTarget', '#microsoft.graph.exclusionGroupAssignmentTarget', '#microsoft.graph.configurationManagerCollectionAssignmentTarget')]
    [System.String] $dataType

    [DscProperty()]
    [System.ComponentModel.Description('The type of filter of the target assignment i.e. Exclude or Include. Possible values are:none, include, exclude.')]
    [ValidateSet('none', 'include', 'exclude')]
    [System.String] $deviceAndAppManagementAssignmentFilterType

    [DscProperty()]
    [System.ComponentModel.Description('The Id of the filter for the target assignment.')]
    [System.String] $deviceAndAppManagementAssignmentFilterId

    [DscProperty()]
    [System.ComponentModel.Description('The display name of the filter for the target assignment.')]
    [System.String] $deviceAndAppManagementAssignmentFilterDisplayName

    [DscProperty()]
    [System.ComponentModel.Description('The group Id that is the target of the assignment.')]
    [System.String] $groupId

    [DscProperty()]
    [System.ComponentModel.Description('The group Display Name that is the target of the assignment.')]
    [System.String] $groupDisplayName

    [DscProperty()]
    [System.ComponentModel.Description('The collection Id that is the target of the assignment.(ConfigMgr)')]
    [System.String] $collectionId
}

class MSFT_MicrosoftGraphKeyValuePair2
{
    [DscProperty()]
    [System.ComponentModel.Description('Name for this key-value pair')]
    [System.String] $Name

    [DscProperty()]
    [System.ComponentModel.Description('Value for this key-value pair')]
    [System.String] $Value
}

class MSFT_MicrosoftGraphMacOSLaunchItem
{
    [DscProperty()]
    [System.ComponentModel.Description('Whether or not to hide the item from the Users and Groups List.')]
    [System.Nullable[System.Boolean]] $Hide

    [DscProperty()]
    [System.ComponentModel.Description('Path to the launch item.')]
    [System.String] $Path
}

class MSFT_MicrosoftGraphIpRange2
{
    [DscProperty()]
    [System.ComponentModel.Description('IPv4 address in CIDR notation. Not nullable.')]
    [System.String] $CidrAddress

    [DscProperty()]
    [System.ComponentModel.Description('Lower address.')]
    [System.String] $LowerAddress

    [DscProperty()]
    [System.ComponentModel.Description('The type of the entity.')]
    [ValidateSet('#microsoft.graph.iPv4CidrRange', '#microsoft.graph.iPv4Range', '#microsoft.graph.iPv6CidrRange', '#microsoft.graph.iPv6Range')]
    [System.String] $ODataType

    [DscProperty()]
    [System.ComponentModel.Description('Upper address.')]
    [System.String] $UpperAddress
}

class MSFT_MicrosoftGraphKeyTypedValuePair
{
    [DscProperty()]
    [System.ComponentModel.Description('The string key of the key-value pair.')]
    [System.String] $Key

    [DscProperty()]
    [System.ComponentModel.Description('The type of the entity.')]
    [ValidateSet('#microsoft.graph.keyBooleanValuePair', '#microsoft.graph.keyIntegerValuePair', '#microsoft.graph.keyRealValuePair', '#microsoft.graph.keyStringValuePair')]
    [System.String] $ODataType

    [DscProperty()]
    [System.ComponentModel.Description('The Boolean value of the key-value pair.')]
    [System.Nullable[System.Boolean]] $Value
}

class MSFT_MicrosoftGraphMacOSSingleSignOnExtension
{
    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the Active Directory site.')]
    [System.String] $ActiveDirectorySiteCode

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables whether the Kerberos extension can automatically determine its site name.')]
    [System.Nullable[System.Boolean]] $BlockActiveDirectorySiteAutoDiscovery

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables Keychain usage.')]
    [System.Nullable[System.Boolean]] $BlockAutomaticLogin

    [DscProperty()]
    [System.ComponentModel.Description('An optional list of additional bundle IDs allowed to use the AAD extension for single sign-on.')]
    [System.String[]] $BundleIdAccessControlList

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the Generic Security Services name of the Kerberos cache to use for this profile.')]
    [System.String] $CacheName

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of typed key-value pairs used to configure Credential-type profiles. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphKeyTypedValuePair[]] $Configurations

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of app Bundle IDs allowed to access the Kerberos Ticket Granting Ticket.')]
    [System.String[]] $CredentialBundleIdAccessControlList

    [DscProperty()]
    [System.ComponentModel.Description('When set to True, the credential is requested on the next matching Kerberos challenge or network state change. When the credential is expired or missing, a new credential is created. Available for devices running macOS versions 12 and later.')]
    [System.Nullable[System.Boolean]] $CredentialsCacheMonitored

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of realms for custom domain-realm mapping. Realms are case sensitive.')]
    [System.String[]] $DomainRealms

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of hosts or domain names for which the app extension performs SSO.')]
    [System.String[]] $Domains

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables shared device mode.')]
    [System.Nullable[System.Boolean]] $EnableSharedDeviceMode

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the bundle ID of the app extension that performs SSO for the specified URLs.')]
    [System.String] $ExtensionIdentifier

    [DscProperty()]
    [System.ComponentModel.Description('When true, this profile''s realm will be selected as the default. Necessary if multiple Kerberos-type profiles are configured.')]
    [System.Nullable[System.Boolean]] $IsDefaultRealm

    [DscProperty()]
    [System.ComponentModel.Description('When set to True, the Kerberos extension allows any apps entered with the app bundle ID, managed apps, and standard Kerberos utilities, such as TicketViewer and klist, to access and use the credential. Available for devices running macOS versions 12 and later.')]
    [System.Nullable[System.Boolean]] $KerberosAppsInBundleIdACLIncluded

    [DscProperty()]
    [System.ComponentModel.Description('When set to True, the Kerberos extension allows managed apps, and any apps entered with the app bundle ID to access the credential. When set to False, the Kerberos extension allows all apps to access the credential. Available for devices running iOS and iPadOS versions 14 and later.')]
    [System.Nullable[System.Boolean]] $ManagedAppsInBundleIdACLIncluded

    [DscProperty()]
    [System.ComponentModel.Description('Select how other processes use the Kerberos Extension credential.')]
    [System.String] $ModeCredentialUsed

    [DscProperty()]
    [System.ComponentModel.Description('The type of the entity.')]
    [ValidateSet('#microsoft.graph.macOSAzureAdSingleSignOnExtension', '#microsoft.graph.macOSCredentialSingleSignOnExtension', '#microsoft.graph.macOSKerberosSingleSignOnExtension', '#microsoft.graph.macOSRedirectSingleSignOnExtension')]
    [System.String] $ODataType

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables password changes.')]
    [System.Nullable[System.Boolean]] $PasswordBlockModification

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the URL that the user will be sent to when they initiate a password change.')]
    [System.String] $PasswordChangeUrl

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables password syncing. This won''t affect users logged in with a mobile account on macOS.')]
    [System.Nullable[System.Boolean]] $PasswordEnableLocalSync

    [DscProperty()]
    [System.ComponentModel.Description('Overrides the default password expiration in days. For most domains, this value is calculated automatically.')]
    [System.Nullable[System.Int32]] $PasswordExpirationDays

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the number of days until the user is notified that their password will expire (default is 15).')]
    [System.Nullable[System.Int32]] $PasswordExpirationNotificationDays

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the minimum number of days until a user can change their password again.')]
    [System.Nullable[System.Int32]] $PasswordMinimumAgeDays

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the minimum length of a password.')]
    [System.Nullable[System.Int32]] $PasswordMinimumLength

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the number of previous passwords to block.')]
    [System.Nullable[System.Int32]] $PasswordPreviousPasswordBlockCount

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables whether passwords must meet Active Directory''s complexity requirements.')]
    [System.Nullable[System.Boolean]] $PasswordRequireActiveDirectoryComplexity

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a description of the password complexity requirements.')]
    [System.String] $PasswordRequirementsDescription

    [DscProperty()]
    [System.ComponentModel.Description('Add creates an ordered list of preferred Key Distribution Centers (KDCs) to use for Kerberos traffic. This list is used when the servers are not discoverable using DNS. When the servers are discoverable, the list is used for both connectivity checks, and used first for Kerberos traffic. If the servers dont respond, then the device uses DNS discovery. Delete removes an existing list, and devices use DNS discovery. Available for devices running macOS versions 12 and later.')]
    [System.String[]] $PreferredKDCs

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the case-sensitive realm name for this profile.')]
    [System.String] $Realm

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets whether to require authentication via Touch ID, Face ID, or a passcode to access the keychain entry.')]
    [System.Nullable[System.Boolean]] $RequireUserPresence

    [DscProperty()]
    [System.ComponentModel.Description('Text displayed to the user at the Kerberos sign in window. Available for devices running iOS and iPadOS versions 14 and later.')]
    [System.String] $SignInHelpText

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the team ID of the app extension that performs SSO for the specified URLs.')]
    [System.String] $TeamIdentifier

    [DscProperty()]
    [System.ComponentModel.Description('When set to True, LDAP connections are required to use Transport Layer Security (TLS). Available for devices running macOS versions 11 and later.')]
    [System.Nullable[System.Boolean]] $TlsForLDAPRequired

    [DscProperty()]
    [System.ComponentModel.Description('One or more URL prefixes of identity providers on whose behalf the app extension performs single sign-on. URLs must begin with http:// or https://. All URL prefixes must be unique for all profiles.')]
    [System.String[]] $UrlPrefixes

    [DscProperty()]
    [System.ComponentModel.Description('This label replaces the user name shown in the Kerberos extension. You can enter a name to match the name of your company or organization. Available for devices running macOS versions 11 and later.')]
    [System.String] $UsernameLabelCustom

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the principle user name to use for this profile. The realm name does not need to be included.')]
    [System.String] $UserPrincipalName

    [DscProperty()]
    [System.ComponentModel.Description('When set to True, the user isnt prompted to set up the Kerberos extension until the extension is enabled by the admin, or a Kerberos challenge is received. Available for devices running macOS versions 11 and later.')]
    [System.Nullable[System.Boolean]] $UserSetupDelayed
}

class MSFT_MicrosoftGraphSingleSignOnExtension
{
    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the Active Directory site.')]
    [System.String] $ActiveDirectorySiteCode

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables whether the Kerberos extension can automatically determine its site name.')]
    [System.Nullable[System.Boolean]] $BlockActiveDirectorySiteAutoDiscovery

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables Keychain usage.')]
    [System.Nullable[System.Boolean]] $BlockAutomaticLogin

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the Generic Security Services name of the Kerberos cache to use for this profile.')]
    [System.String] $CacheName

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of typed key-value pairs used to configure Credential-type profiles. This collection can contain a maximum of 500 elements.')]
    [MSFT_MicrosoftGraphKeyTypedValuePair[]] $Configurations

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of app Bundle IDs allowed to access the Kerberos Ticket Granting Ticket.')]
    [System.String[]] $CredentialBundleIdAccessControlList

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of realms for custom domain-realm mapping. Realms are case sensitive.')]
    [System.String[]] $DomainRealms

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a list of hosts or domain names for which the app extension performs SSO.')]
    [System.String[]] $Domains

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the bundle ID of the app extension that performs SSO for the specified URLs.')]
    [System.String] $ExtensionIdentifier

    [DscProperty()]
    [System.ComponentModel.Description('When true, this profile''s realm will be selected as the default. Necessary if multiple Kerberos-type profiles are configured.')]
    [System.Nullable[System.Boolean]] $IsDefaultRealm

    [DscProperty()]
    [System.ComponentModel.Description('The type of the entity.')]
    [ValidateSet('#microsoft.graph.credentialSingleSignOnExtension', '#microsoft.graph.iosSingleSignOnExtension', '#microsoft.graph.kerberosSingleSignOnExtension', '#microsoft.graph.macOSSingleSignOnExtension', '#microsoft.graph.redirectSingleSignOnExtension')]
    [System.String] $ODataType

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables password changes.')]
    [System.Nullable[System.Boolean]] $PasswordBlockModification

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the URL that the user will be sent to when they initiate a password change.')]
    [System.String] $PasswordChangeUrl

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables password syncing. This won''t affect users logged in with a mobile account on macOS.')]
    [System.Nullable[System.Boolean]] $PasswordEnableLocalSync

    [DscProperty()]
    [System.ComponentModel.Description('Overrides the default password expiration in days. For most domains, this value is calculated automatically.')]
    [System.Nullable[System.Int32]] $PasswordExpirationDays

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the number of days until the user is notified that their password will expire (default is 15).')]
    [System.Nullable[System.Int32]] $PasswordExpirationNotificationDays

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the minimum number of days until a user can change their password again.')]
    [System.Nullable[System.Int32]] $PasswordMinimumAgeDays

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the minimum length of a password.')]
    [System.Nullable[System.Int32]] $PasswordMinimumLength

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the number of previous passwords to block.')]
    [System.Nullable[System.Int32]] $PasswordPreviousPasswordBlockCount

    [DscProperty()]
    [System.ComponentModel.Description('Enables or disables whether passwords must meet Active Directory''s complexity requirements.')]
    [System.Nullable[System.Boolean]] $PasswordRequireActiveDirectoryComplexity

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets a description of the password complexity requirements.')]
    [System.String] $PasswordRequirementsDescription

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the case-sensitive realm name for this profile.')]
    [System.String] $Realm

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets whether to require authentication via Touch ID, Face ID, or a passcode to access the keychain entry.')]
    [System.Nullable[System.Boolean]] $RequireUserPresence

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the team ID of the app extension that performs SSO for the specified URLs.')]
    [System.String] $TeamIdentifier

    [DscProperty()]
    [System.ComponentModel.Description('One or more URL prefixes of identity providers on whose behalf the app extension performs single sign-on. URLs must begin with http:// or https://. All URL prefixes must be unique for all profiles.')]
    [System.String[]] $UrlPrefixes

    [DscProperty()]
    [System.ComponentModel.Description('Gets or sets the principle user name to use for this profile. The realm name does not need to be included.')]
    [System.String] $UserPrincipalName
}
