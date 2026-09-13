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
        AADFilteringPolicyRule "AADFilteringPolicyRule-Example1"
        {
            Destinations          = @(
                MSFT_AADFilteringPolicyRuleDestination{
                    value = 'fabrikam.com'
                }
            );
            Ensure                = "Present";
            Name                  = "MyFQDN";
            Policy                = "MyPolicy";
            RuleType              = "fqdn";
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
        AADFilteringPolicyRule "AADFilteringPolicyRule-Example2"
        {
            Destinations          = @(
                MSFT_AADFilteringPolicyRuleDestination{
                    name = 'ChildAbuseImages'
                }
            );
            Ensure                = "Present";
            Name                  = "MyWebContentRule";
            Policy                = "MyPolicy";
            RuleType              = "webCategory";
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
