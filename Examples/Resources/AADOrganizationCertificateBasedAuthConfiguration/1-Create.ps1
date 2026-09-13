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
        AADOrganizationCertificateBasedAuthConfiguration "AADOrganizationCertificateBasedAuthConfiguration-Example"
        {
            CertificateAuthorities = @(
                MSFT_MicrosoftGraphcertificateAuthority{
                    IsRootAuthority                   = $True
                    DeltaCertificateRevocationListUrl = 'pqr.com'
                    Certificate                       = '<base64-encoded-certificate>'
                }
                MSFT_MicrosoftGraphcertificateAuthority{
                    IsRootAuthority                   = $True
                    CertificateRevocationListUrl      = 'xyz.com'
                    DeltaCertificateRevocationListUrl = 'pqr.com'
                    Certificate                       = '<base64-encoded-certificate-2>'
                }
            );
            Ensure                 = "Present";
            OrganizationId         = "e91d4e0e-d5a5-4e3a-be14-2192592a59af";
            ApplicationId          = $ApplicationId
            TenantId               = $TenantId
            CertificateThumbprint  = $CertificateThumbprint
        }
    }
}
