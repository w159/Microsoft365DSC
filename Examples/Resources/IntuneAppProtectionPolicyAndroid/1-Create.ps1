<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param
    (
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )

    Import-DscResource -ModuleName Microsoft365DSC

    Node localhost
    {
        IntuneAppProtectionPolicyAndroid 'IntuneAppProtectionPolicyAndroid-Example'
        {
            DisplayName                                        = 'Android App Protection - Corporate'
            AllowedAndroidDeviceManufacturers                  = 'Samsung;Google;Motorola'
            AllowedAndroidDeviceModels                         = @('SM-G991B', 'SM-A546B', 'Pixel 8')
            Alloweddataingestionlocations                      = @('oneDriveForBusiness', 'sharePoint', 'camera', 'photoLibrary')
            AllowedDataStorageLocations                        = @('oneDriveForBusiness', 'sharePoint')
            AllowedInboundDataTransferSources                  = 'managedApps'
            AllowedOutboundClipboardSharingExceptionLength     = 0
            AllowedOutboundClipboardSharingLevel               = 'managedAppsWithPasteIn'
            AllowedOutboundDataTransferDestinations            = 'managedApps'
            AppActionIfAndroidDeviceManufacturerNotAllowed     = 'block'
            AppActionIfAndroidDeviceModelNotAllowed            = 'block'
            AppActionIfAndroidSafetyNetAppsVerificationFailed  = 'block'
            AppActionIfAndroidSafetyNetDeviceAttestationFailed = 'block'
            AppActionIfDeviceComplianceRequired                = 'block'
            AppActionIfDeviceLockNotSet                        = 'block'
            AppActionIfMaximumPinRetriesExceeded               = 'block'
            appActionIfUnableToAuthenticateUser                = 'block'
            AppGroupType                                       = 'selectedPublicApps'
            ApprovedKeyboards                                  = @('com.google.android.inputmethod.latin|Gboard', 'com.samsung.android.honeyboard|Samsung Keyboard')
            Apps                                               = @('com.microsoft.emmx', 'com.microsoft.office.outlook', 'com.microsoft.skydrive', 'com.microsoft.teams')
            Assignments                                        = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = '#microsoft.graph.groupAssignmentTarget'
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    groupDisplayName                           = 'Field Technicians'
                    groupId                                    = '3f7e6d2a-8b45-4c19-9f0e-1a2b3c4d5e6f'
                }
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = '#microsoft.graph.exclusionGroupAssignmentTarget'
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    groupDisplayName                           = 'Mobile Application Management Exclusions'
                    groupId                                    = '9c4b1e07-52da-4f83-a6d1-7e8f9a0b1c2d'
                }
            )
            BiometricAuthenticationBlocked                     = $false
            BlockAfterCompanyPortalUpdateDeferralInDays        = 60
            BlockDataIngestionIntoOrganizationDocuments        = $true
            ConnectToVpnOnLaunch                               = $false
            ContactSyncBlocked                                 = $false
            CustomBrowserDisplayName                           = 'Contoso Secure Browser'
            CustomBrowserPackageId                             = 'com.contoso.securebrowser'
            CustomDialerAppDisplayName                         = 'Contoso Softphone'
            CustomDialerAppPackageId                           = 'com.contoso.softphone'
            DataBackupBlocked                                  = $true
            Description                                        = 'Protects company data in the Android apps used by field technicians'
            DeviceComplianceRequired                           = $true
            DeviceLockRequired                                 = $true
            DialerRestrictionLevel                             = 'customApp'
            DisableAppEncryptionIfDeviceEncryptionIsEnabled    = $false
            DisableAppPinIfDevicePinIsSet                      = $false
            EncryptAppData                                     = $true
            ExemptedAppPackages                                = @('com.android.chrome|Google Chrome', 'com.google.android.apps.maps|Google Maps')
            FingerprintAndBiometricEnabled                     = $true
            FingerprintBlocked                                 = $false
            KeyboardsRestricted                                = $true
            ManagedBrowser                                     = 'notConfigured'
            ManagedBrowserToOpenLinksRequired                  = $true
            MaximumAllowedDeviceThreatLevel                    = 'medium'
            MaximumPinRetries                                  = 5
            MessagingRedirectAppDisplayName                    = 'Contoso Secure Messenger'
            MessagingRedirectAppPackageId                      = 'com.contoso.securemessenger'
            MinimumPinLength                                   = 6
            MinimumRequiredAppVersion                          = '16.0'
            MinimumRequiredOSVersion                           = '11.0'
            MinimumRequiredPatchVersion                        = '2023-01-01'
            MinimumWarningAppVersion                           = '16.5'
            MinimumWarningOSVersion                            = '12.0'
            MinimumWarningPatchVersion                         = '2024-01-01'
            MinimumWipeAppVersion                              = '15.0'
            MinimumWipeOsVersion                               = '10.0'
            MinimumWipePatchVersion                            = '2022-01-01'
            MobileThreatDefenseRemediationAction               = 'block'
            NotificationRestriction                            = 'blockOrganizationalData'
            OrganizationalCredentialsRequired                  = $false
            PeriodBeforePinReset                               = 'P90D'
            PeriodOfflineBeforeAccessCheck                     = 'PT12H'
            PeriodOfflineBeforeWipeIsEnforced                  = 'P90D'
            PeriodOnlineBeforeAccessCheck                      = 'PT30M'
            PinCharacterSet                                    = 'numeric'
            PinRequired                                        = $true
            PreviousPinBlockCount                              = 5
            PrintBlocked                                       = $true
            ProtectedMessagingRedirectAppType                  = 'specificApps'
            RequireClass3Biometrics                            = $true
            RequiredAndroidSafetyNetAppsVerificationType       = 'enabled'
            RequiredAndroidSafetyNetDeviceAttestationType      = 'basicIntegrityAndDeviceCertification'
            RequiredAndroidSafetyNetEvaluationType             = 'hardwareBacked'
            RequirePinAfterBiometricChange                     = $true
            RoleScopeTagIds                                    = @('0')
            SaveAsBlocked                                      = $true
            ScreenCaptureBlocked                               = $true
            SimplePinBlocked                                   = $true
            TargetedAppManagementLevels                        = 'unspecified'
            WarnAfterCompanyPortalUpdateDeferralInDays         = 30
            WipeAfterCompanyPortalUpdateDeferralInDays         = 90
            Ensure                                             = 'Present'
            ApplicationId                                      = $ApplicationId;
            TenantId                                           = $TenantId;
            CertificateThumbprint                              = $CertificateThumbprint;
        }
    }
}
