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
        AADRoleAssignmentScheduleRequest "AADRoleAssignmentScheduleRequest-Example"
        {
            DirectoryScopeId      = "/";
            Ensure                = "Present";
            Principal             = "AdeleV@$TenantId";
            PrincipalType         = "User";
            RoleDefinition        = "Teams Communications Administrator";
            Justification         = "Assigning the Teams Communications Administrator role";
            ScheduleInfo          = MSFT_AADRoleAssignmentScheduleRequestSchedule {
                startDateTime = '2023-09-01T02:45:44Z' # Updated Property
                expiration    = MSFT_AADRoleAssignmentScheduleRequestScheduleExpiration
                    {
                        endDateTime = '2025-10-31T02:40:09Z'
                        type        = 'afterDateTime'
                    }
            };
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
