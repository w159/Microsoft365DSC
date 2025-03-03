<#
This example creates a new Intune Trusted Root Certificate Configuration Policy for Android Device Owner/Administrator devices
#>

Configuration Example
{
    param(
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
    Import-DscResource -ModuleName 'Microsoft365DSC'

    Node localhost
    {
        IntuneTrustedRootCertificateAndroidDeviceOwner "ConfigureIntuneTrustedRootCertificateAndroidDeviceOwner"
        {
            Description            = "IntuneTrustedRootCertificateAndroidDeviceOwner Description";
            DisplayName            = "IntuneTrustedRootCertificateAndroidDeviceOwner DisplayName";
            Ensure                 = "Absent";
            ApplicationId          = $ApplicationId;
            TenantId               = $TenantId;
            CertificateThumbprint  = $CertificateThumbprint;
        }
    }
}
