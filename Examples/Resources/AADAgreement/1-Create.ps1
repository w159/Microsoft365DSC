<#
This example creates a new Azure AD Terms of Use Agreement.
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
        AADAgreement 'AADAgreement-Example'
        {
            DisplayName                       = "Company Terms of Use"
            IsViewingBeforeAcceptanceRequired = $true
            IsPerDeviceAcceptanceRequired     = $false
            UserReacceptRequiredFrequency     = "P90D"
            FileData                          = "<h1>Company Terms of Use</h1><p>These are the terms and conditions for using our company resources...</p>"
            FileName                          = "CompanyToU.html"
            Language                          = "en-US"
            TermsExpiration                   = MSFT_TermsExpiration{
                Frequency     = "P365D"
                StartDateTime = "2026-01-01T00:00:00.0000000Z"
            }
            Ensure                            = "Present"
            ApplicationId                     = $ApplicationId
            TenantId                          = $TenantId
            CertificateThumbprint             = $CertificateThumbprint
        }
    }
}