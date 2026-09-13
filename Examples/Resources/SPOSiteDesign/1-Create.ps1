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
        SPOSiteDesign 'SPOSiteDesign-Example'
        {
            Title                 = "Contoso Team Site Design"
            SiteScriptNames       = @("Cust List", "List_Views")
            WebTemplate           = "TeamSite"
            IsDefault             = $false
            Description           = "Standard layout for departmental team sites"
            PreviewImageAltText   = "Office 365"
            Ensure                = "Present"
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
