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
        IntuneMobileAppsAutoUpdateCatalogAppWindows10 'IntuneMobileAppsAutoUpdateCatalogAppWindows10-Example'
        {
            Assignments                     = @(
                MSFT_DeviceManagementWindowsAutoUpdateCatalogMobileAppAssignment{
                    dataType = "#microsoft.graph.allLicensedUsersAssignmentTarget"
                    intent   = "available"
                }
            );
            Description                     = "A file archiver with a high compression ratio, kept up to date for all staff"; # Updated Property
            Developer                       = "Igor Pavlov";
            DisplayName                     = "7-Zip (x64) automatic updates";
            InformationUrl                  = "https://www.7-zip.org";
            InstallExperience               = MSFT_MicrosoftGraphWindowsAutoUpdateCatalogAppInstallExperience{
                DeviceRestartBehavior = "basedOnReturnCode"
                RunAsAccount          = "system"
            };
            IsFeatured                      = $false;
            LargeIcon                       = MSFT_MicrosoftGraphMimeContent{
                Type  = "image/png"
                Value = "<base64-encoded-app-icon>"
            };
            MobileAppCatalogPackageBranchId = "3da9c2f0-94e7-90b1-01e3-35e155728974";
            Notes                           = "Published from the Enterprise App Catalog";
            Owner                           = "Workplace Services";
            PrivacyInformationUrl           = "https://www.7-zip.org/faq.html";
            Publisher                       = "Igor Pavlov";
            RoleScopeTagIds                 = @("0");
            Ensure                          = "Present";
            ApplicationId                   = $ApplicationId;
            TenantId                        = $TenantId;
            CertificateThumbprint           = $CertificateThumbprint;
        }
    }
}
