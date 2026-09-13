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
        SCDLPCompliancePolicy 'SCDLPCompliancePolicy-Example'
        {
            Name                                  = "Customer Financial Data Protection"
            Comment                               = "Blocks sharing of credit card numbers"
            Priority                              = 1
            SharePointLocation                    = @("All")
            SharePointLocationException           = @("https://contoso.sharepoint.com/sites/publicrelations")
            EndpointDlpLocation                   = @("All")
            EndpointDlpLocationException          = @("securityoperations@contoso.com")
            OnPremisesScannerDlpLocation          = @("All")
            OnPremisesScannerDlpLocationException = @("\\fs01.contoso.com\PublicArchive")
            ThirdPartyAppDlpLocation              = @("All")
            ThirdPartyAppDlpLocationException     = @("Dropbox")
            ExchangeLocation                      = @("All")
            ExchangeSenderMemberOfException       = @("executives@contoso.com")
            OneDriveLocation                      = @("All")
            ExceptIfOneDriveSharedBy              = @("avery.howard@contoso.com")
            ExceptIfOneDriveSharedByMemberOf      = @("legal@contoso.com")
            TeamsLocation                         = @("All")
            TeamsLocationException                = @("engineering@contoso.com")
            Mode                                  = "TestWithoutNotifications"
            Ensure                                = "Present"
            ApplicationId                         = $ApplicationId
            TenantId                              = $TenantId
            CertificateThumbprint                 = $CertificateThumbprint
        }
    }
}
