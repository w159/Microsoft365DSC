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
        SCRetentionCompliancePolicy 'SCRetentionCompliancePolicy-Example'
        {
            Name                         = "Finance Records Retention"
            Comment                      = "Keeps finance records available for the seven year statutory period"
            Enabled                      = $true
            ExchangeLocation             = @("All")
            ExchangeLocationException    = @("meetingroom.oslo@contoso.com")
            ModernGroupLocation          = @("All")
            ModernGroupLocationException = @("socialclub@contoso.com")
            OneDriveLocation             = @("All")
            OneDriveLocationException    = @("https://contoso-my.sharepoint.com/personal/lee_gu_contoso_com")
            PublicFolderLocation         = @("All")
            RestrictiveRetention         = $false
            SharePointLocation           = @("All")
            SharePointLocationException  = @("https://contoso.sharepoint.com/sites/pressroom")
            SkypeLocation                = @("adele.vance@contoso.com")
            Ensure                       = "Present"
            ApplicationId                = $ApplicationId
            TenantId                     = $TenantId
            CertificateThumbprint        = $CertificateThumbprint
        }
    }
}
