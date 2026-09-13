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
        IntuneAttackSurfaceReductionRulesPolicyWindows10ConfigManager 'IntuneAttackSurfaceReductionRulesPolicyWindows10ConfigManager-Example'
        {
            DisplayName                                                                = 'Attack Surface Reduction (ConfigMgr)'
            Assignments                                                                = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = '#microsoft.graph.groupAssignmentTarget'
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    groupDisplayName                           = 'Co-managed Windows Workstations'
                    groupId                                    = '7a1d4c58-93b2-4e07-8f6a-0c3e5b8d21f9'
                }
                MSFT_DeviceManagementConfigurationPolicyAssignments{
                    dataType                                   = '#microsoft.graph.exclusionGroupAssignmentTarget'
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    groupDisplayName                           = 'Engineering Build Servers'
                    groupId                                    = '2e9f0b73-15ca-4d38-9b41-6d7a8c2e5f04'
                }
            )
            AttackSurfaceReductionOnlyExclusions                                       = @('C:\Program Files\Contoso Payroll\', 'C:\ProgramData\Contoso\Agent\agent.exe')
            BlockAbuseOfExploitedVulnerableSignedDrivers                               = 'block'
            BlockAdobeReaderFromCreatingChildProcesses                                 = 'block'
            BlockAllOfficeApplicationsFromCreatingChildProcesses                       = 'block'
            BlockCredentialStealingFromWindowsLocalSecurityAuthoritySubsystem          = 'block'
            BlockExecutableContentFromEmailClientAndWebmail                            = 'block'
            BlockExecutableFilesRunningUnlessTheyMeetPrevalenceAgeTrustedListCriterion = 'audit'
            BlockExecutionOfPotentiallyObfuscatedScripts                               = 'block'
            BlockJavaScriptOrVBScriptFromLaunchingDownloadedExecutableContent          = 'block'
            BlockOfficeApplicationsFromCreatingExecutableContent                       = 'block'
            BlockOfficeApplicationsFromInjectingCodeIntoOtherProcesses                 = 'block'
            BlockOfficeCommunicationAppFromCreatingChildProcesses                      = 'block'
            BlockPersistenceThroughWMIEventSubscription                                = 'block'
            BlockProcessCreationsFromPSExecAndWMICommands                              = 'block'
            BlockUntrustedUnsignedProcessesThatRunFromUSB                              = 'warn'
            BlockWin32APICallsFromOfficeMacros                                         = 'block'
            ControlledFolderAccessAllowedApplications                                  = @('C:\Program Files\Contoso Payroll\payroll.exe')
            ControlledFolderAccessProtectedFolders                                     = @('C:\Finance Records', 'D:\Shared Projects')
            Description                                                                = 'Blocks high-risk Office, script and USB behaviour on co-managed workstations'
            EnableControlledFolderAccess                                               = '2'
            RoleScopeTagIds                                                            = @('0')
            UseAdvancedProtectionAgainstRansomware                                     = 'block'
            Ensure                                                                     = 'Present'
            ApplicationId                                                              = $ApplicationId;
            TenantId                                                                   = $TenantId;
            CertificateThumbprint                                                      = $CertificateThumbprint;
        }
    }
}
