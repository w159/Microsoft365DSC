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
        IntuneVPNConfigurationPolicyAndroidWork "IntuneVPNConfigurationPolicyAndroidWork-Example"
        {
            alwaysOn              = $true;
            alwaysOnLockdown      = $false;
            Assignments           = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = "#microsoft.graph.groupAssignmentTarget"
                    deviceAndAppManagementAssignmentFilterType = "none"
                    groupDisplayName                           = "Android Work Profile Users"
                }
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType         = "#microsoft.graph.exclusionGroupAssignmentTarget"
                    groupDisplayName = "Field Service Contractors"
                }
            );
            authenticationMethod  = "usernameAndPassword";
            connectionName        = "Contoso Work Profile VPN";
            connectionType        = "pulseSecure";
            customData            = @(
                MSFT_customData{
                    key   = "ProfileName"
                    value = "Contoso-Mobile"
                }
            );
            customKeyValueData    = @(
                MSFT_customKeyValueData{
                    name  = "SplitTunnel"
                    value = "false"
                }
            );
            Description           = "Per-app VPN access to the corporate network from Android Enterprise work profiles";
            DisplayName           = "IntuneVPNConfigurationPolicyAndroidWork DisplayName";
            Ensure                = "Present";
            lockdownExclusionList = @("com.android.vending", "com.microsoft.windowsintune.companyportal");
            proxyExclusionList    = @("intranet.contoso.com", "*.contoso.local");
            proxyServer           = @(
                MSFT_MicrosoftvpnProxyServer{
                    address = "proxy.contoso.com"
                    port    = 8080
                }
            );
            realm                 = "corp.contoso.com";
            role                  = "Mobile Users";
            RoleScopeTagIds       = @("0");
            servers               = @(
                MSFT_MicrosoftGraphvpnServer{
                    isDefaultServer = $true
                    description     = "Primary VPN gateway"
                    address         = "vpn2.contoso.com" # Updated Property
                }
            );
            targetedMobileApps    = @(
                MSFT_targetedMobileApps{
                    name        = "Outlook"
                    publisher   = "Microsoft Corporation"
                    appStoreUrl = "https://play.google.com/store/apps/details?id=com.microsoft.office.outlook"
                    appId       = "com.microsoft.office.outlook"
                }
            );
            targetedPackageIds    = @("com.microsoft.office.outlook", "com.microsoft.sharepoint");
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
