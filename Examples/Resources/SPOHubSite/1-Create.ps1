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
        SPOHubSite 'SPOHubSite-Example'
        {
            Url                   = "https://contoso.sharepoint.com/sites/marketing"
            Title                 = "Marketing"
            Description           = "Hub for the Marketing division"
            LogoUrl               = "https://contoso.sharepoint.com/sites/marketing/SiteAssets/hublogo.png"
            RequiresJoinApproval  = $true
            AllowedToJoin         = @("admin@$TenantId", "superuser@$TenantId")
            SiteDesignId          = "f7eba920-9cca-4de8-b5aa-1da75a2a893c"
            Ensure                = "Present"
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
