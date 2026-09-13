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
        TeamsUnassignedNumberTreatment 'TeamsUnassignedNumberTreatment-Example'
        {
            Ensure                = "Present";
            Identity              = "TR2";
            Pattern               = "^\+15552224444$";
            Target                = "ae274f0a-9c9c-496a-8dd3-8a57640d93aa";
            TargetType            = "User";
            TreatmentPriority     = 3;
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
