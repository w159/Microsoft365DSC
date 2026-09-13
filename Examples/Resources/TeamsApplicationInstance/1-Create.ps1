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
        TeamsApplicationInstance "TeamsApplicationInstance-Example"
        {
            DisplayName           = "JohnRA";
            Ensure                = "Present";
            ResourceAccountType   = "AutoAttendant";
            UserPrincipalName     = "John.Smith@M365x73318397.mail.onmicrosoft.com";
            ApplicationId         = $ConfigurationData.NonNodeData.ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $ConfigurationData.NonNodeData.CertificateThumbprint;
        }
    }
}
