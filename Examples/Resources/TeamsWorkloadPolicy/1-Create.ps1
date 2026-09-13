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
        TeamsWorkloadPolicy 'TeamsWorkloadPolicy-Example'
        {
            AllowCalling          = $True;
            AllowCallingPinned    = $True;
            AllowMeeting          = $True;
            AllowMeetingPinned    = $True;
            AllowMessaging        = $True;
            AllowMessagingPinned  = $True;
            Ensure                = "Present";
            Identity              = "Global";
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
