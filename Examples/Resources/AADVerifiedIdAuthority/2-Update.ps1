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
        AADVerifiedIdAuthority 'AADVerifiedIdAuthority-Example'
        {
            DidMethod             = "web";
            Ensure                = "Present";
            KeyVaultMetadata      = MSFT_AADVerifiedIdAuthorityKeyVaultMetadata{
                SubscriptionId = '<subscription-id>'
                ResourceName   = 'xtakeyvault'
                ResourceUrl    = '<key-vault-uri>'
                ResourceGroup  = 'TBD'
            };
            LinkedDomainUrl       = "https://nik-charlebois.com/";
            Name                  = "Contoso 2"; # Updated Property
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
