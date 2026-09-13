<#
This example creates a new Device Enrollment Platform Restriction.
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
        IntuneDeviceEnrollmentPlatformRestriction 'IntuneDeviceEnrollmentPlatformRestriction-Example'
        {
            DisplayName           = "All users and all devices";
            Ensure                = "Absent";
            Id                    = "3868d43e-873e-4416-8fd1-fc3d67c7c15c_DefaultPlatformRestrictions";
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
