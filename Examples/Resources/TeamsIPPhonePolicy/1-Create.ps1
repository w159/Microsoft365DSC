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
        TeamsIPPhonePolicy 'TeamsIPPhonePolicy-Example'
        {
            AllowBetterTogether            = "Enabled";
            AllowHomeScreen                = "EnabledUserOverride";
            AllowHotDesking                = $True;
            Ensure                         = "Present";
            HotDeskingIdleTimeoutInMinutes = 120;
            Identity                       = "Global";
            SearchOnCommonAreaPhoneMode    = "Enabled";
            SignInMode                     = "UserSignIn";
            ApplicationId                  = $ApplicationId;
            TenantId                       = $TenantId;
            CertificateThumbprint          = $CertificateThumbprint;
        }
    }
}
