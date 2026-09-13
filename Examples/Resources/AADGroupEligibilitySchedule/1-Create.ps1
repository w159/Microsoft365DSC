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
        AADGroupEligibilitySchedule 'AADGroupEligibilitySchedule-Example'
        {
            AccessId              = "member";
            Ensure                = "Present";
            MemberType            = "direct";
            GroupDisplayName      = "sg-Retail";
            Principal             = "sg-Retail";
            PrincipalType         = "group";
            ScheduleInfo          = MSFT_MicrosoftGraphrequestSchedule{
                StartDateTime = '2032-12-23T08:59:28.1200000+00:00'
                Expiration    = MSFT_MicrosoftGraphExpirationPattern{
                    EndDateTime = '12/23/2032 8:59:00 AM +00:00'
                    Type        = 'afterDateTime'
                }
            };
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
