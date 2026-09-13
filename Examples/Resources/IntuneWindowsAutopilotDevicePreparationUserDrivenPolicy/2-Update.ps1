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
        IntuneWindowsAutopilotDevicePreparationUserDrivenPolicy 'IntuneWindowsAutopilotDevicePreparationUserDrivenPolicy-Example'
        {
            AccountType           = "1";
            AllowDiagnostics      = "true";
            AllowedApplications   = @("IntuneMobileAppsMicrosoftEdge_Windows","IntuneMobileAppsWindowsOfficeSuiteApp_1");
            AllowedScripts        = @("IntuneDeviceConfigurationPlatformScriptWindows_1");
            AllowSkip             = "true";
            Assignments           = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = "#microsoft.graph.groupAssignmentTarget"
                    deviceAndAppManagementAssignmentFilterType = "none"
                    groupDisplayName                           = "Include"
                }
            );
            AssignmentTarget      = "Exclude"; # Updated Property
            CustomErrorMessage    = "Contact your organization’s support person for help.";
            DeploymentMode        = "0";
            DeploymentType        = "0";
            Description           = "";
            DisplayName           = "IntuneWindowsAutopilotDevicePreparationPolicy_1";
            Ensure                = "Present";
            JoinType              = "0";
            RoleScopeTagIds       = @("0");
            Timeout               = 60;
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
