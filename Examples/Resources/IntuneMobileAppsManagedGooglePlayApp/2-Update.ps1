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
        IntuneMobileAppsManagedGooglePlayApp "IntuneMobileAppsManagedGooglePlayApp-Example"
        {
            DisplayName           = "Office";
            PackageId             = "com.microsoft.office";
            Publisher             = "Microsoft";
            Description           = "Managed Google Play release of Microsoft Office for corporate-owned Android devices";
            Developer             = "Microsoft Corporation";
            InformationUrl        = "https://intranet.contoso.com/apps/office-android";
            IsFeatured            = $true;
            LargeIcon             = MSFT_DeviceManagementMimeContent{
                Type  = "image/png"
                Value = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
            };
            Notes                 = "Reviewed annually by the mobility team";
            Owner                 = "Endpoint Management Team";
            PrivacyInformationUrl = "https://www.contoso.com/privacy";
            RoleScopeTagIds       = @("1"); # Updated Property
            Ensure                = "Present";
            Assignments           = @(
                MSFT_DeviceManagementManagedGooglePlayMobileAppAssignment{
                    groupDisplayName                           = 'All devices'
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    dataType                                   = '#microsoft.graph.allDevicesAssignmentTarget'
                    intent                                     = 'required'
                }
                MSFT_DeviceManagementManagedGooglePlayMobileAppAssignment{
                    dataType         = '#microsoft.graph.exclusionGroupAssignmentTarget'
                    groupDisplayName = 'Policy Exclusions'
                }
            );
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
