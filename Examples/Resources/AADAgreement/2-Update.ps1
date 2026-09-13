<#
This example creates a Terms of Use Agreement that requires re-acceptance every 30 days on each device.
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
            IsPerDeviceAcceptanceRequired     = $true
            UserReacceptRequiredFrequency     = "P30D"
            FileData                          = "TERMS OF USE FOR DEVICE ACCESS\n\nBy accepting these terms, you agree to comply with all company policies..."
            FileName                          = "device_terms.txt"
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