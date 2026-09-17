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
        IntuneVPNConfigurationPolicyMacOS 'IntuneVPNConfigurationPolicyMacOS-Example'
        {
            Assignments                    = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = "#microsoft.graph.allDevicesAssignmentTarget"
                    deviceAndAppManagementAssignmentFilterType = "none"
                }
            );
            AssociatedDomains              = @("contoso.com", "corp.contoso.com");
            AuthenticationMethod           = "certificate";
            ConnectionName                 = "Contoso Corporate VPN (Zurich)"; # Updated Property
            ConnectionType                 = "ciscoAnyConnect";
            CustomData                     = @(
                MSFT_MicrosoftGraphKeyValue{
                    Key   = "tunnelGroup"
                    Value = "CONTOSO-EMPLOYEES"
                }
            );
            CustomKeyValueData             = @(
                MSFT_MicrosoftGraphKeyValuePair2{
                    Name  = "vpnProfile"
                    Value = "contoso-full-tunnel"
                }
            );
            DeploymentChannel              = "deviceChannel";
            Description                    = "Corporate VPN for managed Macs";
            DisableOnDemandUserOverride    = $true;
            DisconnectOnIdle               = $true;
            DisconnectOnIdleTimerInSeconds = 300;
            DisplayName                    = "macOS Corporate VPN";
            EnablePerApp                   = $false;
            EnableSplitTunneling           = $false;
            ExcludedDomains                = @("guest.contoso.com", "cdn.contoso.com");
            ExcludeLocalNetworks           = $true;
            IncludeAllNetworks             = $false;
            LoginGroupOrDomain             = "CONTOSO-EMPLOYEES";
            OnDemandRules                  = @(
                MSFT_MicrosoftGraphVpnOnDemandRule{
                    Action                = "connect"
                    DnsSearchDomains      = @("contoso.com", "corp.contoso.com")
                    DnsServerAddressMatch = @("10.10.0.10", "10.10.0.11")
                    DomainAction          = "connectIfNeeded"
                    Domains               = @("intranet.contoso.com", "portal.contoso.com")
                    InterfaceTypeMatch    = "wiFi"
                    ProbeRequiredUrl      = "https://vpnprobe.contoso.com/required"
                    ProbeUrl              = "https://vpnprobe.contoso.com"
                    Ssids                 = @("Contoso-Corp", "Contoso-Guest")
                }
            );
            OptInToDeviceIdSharing         = $true;
            ProviderType                   = "notConfigured";
            ProxyServer                    = MSFT_MicrosoftGraphVpnProxyServer{
                Address                          = "proxy.contoso.com"
                AutomaticallyDetectProxySettings = $false
                AutomaticConfigurationScriptUrl  = "https://proxy.contoso.com/proxy.pac"
                BypassProxyServerForLocalAddress = $true
                ODataType                        = "#microsoft.graph.windows10VpnProxyServer"
                Port                             = 8080
            };
            Realm                          = "CONTOSO.COM";
            Role                           = "Employees";
            RoleScopeTagIds                = @("0");
            SafariDomains                  = @("intranet.contoso.com", "portal.contoso.com");
            Server                         = MSFT_MicrosoftGraphVpnServer1{
                Address         = "vpn.contoso.com"
                Description     = "Zurich datacentre"
                IsDefaultServer = $true
            };
            Ensure                         = "Present";
            ApplicationId                  = $ApplicationId;
            TenantId                       = $TenantId;
            CertificateThumbprint          = $CertificateThumbprint;
        }
    }
}
