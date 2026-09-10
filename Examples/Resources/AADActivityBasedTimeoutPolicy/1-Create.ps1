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
        AADActivityBasedTimeoutPolicy "AADActivityBasedTimeoutPolicy-Example"
        {
            AzurePortalTimeOut    = "02:00:00";
            DefaultTimeOut        = "03:00:00";
            Description           = "Signs out inactive administrators after two hours";
            DisplayName           = "displayName-value";
            Ensure                = "Present";
            Id                    = "000000-0000-0000-0000-000000000000";
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
