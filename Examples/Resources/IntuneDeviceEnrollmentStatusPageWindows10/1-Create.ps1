<#
This example creates a new Device Enrollment Status Page.
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
        IntuneDeviceEnrollmentStatusPageWindows10 'IntuneDeviceEnrollmentStatusPageWindows10-Example'
        {
            AllowDeviceResetOnInstallFailure        = $True;
            AllowDeviceUseOnInstallFailure          = $True;
            AllowLogCollectionOnInstallFailure      = $True;
            AllowNonBlockingAppInstallation         = $False;
            Assignments                             = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    dataType                                   = '#microsoft.graph.allDevicesAssignmentTarget'
                }
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType         = '#microsoft.graph.exclusionGroupAssignmentTarget'
                    groupDisplayName = 'Policy Exclusions'
                }
            );
            BlockDeviceSetupRetryByUser             = $False;
            CustomErrorMessage                      = "Setup could not be completed. Please try again or contact your support person for help.";
            Description                             = "This is the default enrollment status screen configuration applied with the lowest priority to all users and all devices regardless of group membership.";
            DisableUserStatusTrackingAfterFirstUser = $True;
            DisplayName                             = "All users and all devices";
            Ensure                                  = "Present";
            InstallProgressTimeoutInMinutes         = 60;
            InstallQualityUpdates                   = $False;
            Priority                                = 0;
            SelectedMobileAppIds                    = @();
            ShowInstallationProgress                = $True;
            TrackInstallProgressForAutopilotOnly    = $True;
            ApplicationId                           = $ApplicationId;
            TenantId                                = $TenantId;
            CertificateThumbprint                   = $CertificateThumbprint;
        }
    }
}
