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
        SCInsiderRiskPolicy "SCInsiderRiskPolicy-Example"
        {
            AdaptiveProtectionEnabled                             = $false;
            AdaptiveProtectionHighProfileConfirmedIssue           = $true;
            AdaptiveProtectionHighProfileConfirmedIssueSeverity   = 3;
            AdaptiveProtectionHighProfileGeneratedIssueSeverity   = 3;
            AdaptiveProtectionHighProfileInsightCount             = 1;
            AdaptiveProtectionHighProfileInsightSeverity          = 3;
            AdaptiveProtectionHighProfileInsightTypes             = @("CumulativeExfiltrationDetector");
            AdaptiveProtectionHighProfileSourceType               = 1;
            AdaptiveProtectionLowProfileConfirmedIssue            = $false;
            AdaptiveProtectionLowProfileConfirmedIssueSeverity    = 1;
            AdaptiveProtectionLowProfileGeneratedIssueSeverity    = 1;
            AdaptiveProtectionLowProfileInsightCount              = 3;
            AdaptiveProtectionLowProfileInsightSeverity           = 1;
            AdaptiveProtectionLowProfileInsightTypes              = @("CumulativeExfiltrationDetector");
            AdaptiveProtectionLowProfileSourceType                = 1;
            AdaptiveProtectionMediumProfileConfirmedIssue         = $false;
            AdaptiveProtectionMediumProfileConfirmedIssueSeverity = 2;
            AdaptiveProtectionMediumProfileGeneratedIssueSeverity = 2;
            AdaptiveProtectionMediumProfileInsightCount           = 2;
            AdaptiveProtectionMediumProfileInsightSeverity        = 2;
            AdaptiveProtectionMediumProfileInsightTypes           = @("CumulativeExfiltrationDetector");
            AdaptiveProtectionMediumProfileSourceType             = 1;
            AIAppRiskyPrompt                                      = $true;
            Anonymization                                         = $false
            AlertVolume                                           = "Medium";
            AnalyticsNewInsightEnabled                            = $false;
            AnalyticsTurnedOffEnabled                             = $false;
            AnomalyDetections                                     = $false;
            AWSS3BlockPublicAccessDisabled                        = $false;
            AWSS3BucketDeleted                                    = $false;
            AWSS3PublicAccessEnabled                              = $false;
            AWSS3ServerLoggingDisabled                            = $false;
            AzureElevateAccessToAllSubscriptions                  = $false;
            AzureResourceThreatProtectionSettingsUpdated          = $false;
            AzureSQLServerAuditingSettingsUpdated                 = $false;
            AzureSQLServerFirewallRuleDeleted                     = $false;
            AzureSQLServerFirewallRuleUpdated                     = $false;
            AzureStorageAccountOrContainerDeleted                 = $false;
            BoxContentAccess                                      = $false;
            BoxContentDelete                                      = $false;
            BoxContentDownload                                    = $false;
            BoxContentExternallyShared                            = $false;
            CCFinancialRegulatoryRiskyTextSent                    = $false;
            CCInappropriateContentSent                            = $false;
            CCInappropriateImagesSent                             = $false;
            CCPromptShields                                       = $false;
            CCProtectedMaterialDetection                          = $false;
            CCSensitiveInformationType                            = $true;
            CCSupervisionRuleMatch                                = $false;
            CompromisedSignInAlerts                               = $true;
            CompromisedUserAlerts                                 = $true;
            ConnectedAIAppRiskyPrompt                             = $false;
            ConnectedAIAppSensitiveResponse                       = $false;
            CopilotRiskyPrompt                                    = $true;
            CopilotSensitiveResponse                              = $true;
            CopyToPersonalCloud                                   = $false;
            CopyToUSB                                             = $false;
            CumulativeExfiltrationDetector                        = $true;
            DLPUserRiskSync                                       = $true;
            DropboxContentAccess                                  = $false;
            DropboxContentDelete                                  = $false;
            DropboxContentDownload                                = $false;
            DropboxContentExternallyShared                        = $false;
            EmailExternal                                         = $false;
            EmailSignatureExclusionSettingsEnabled                = $true;
            EmployeeAccessedEmployeePatientData                   = $false;
            EmployeeAccessedFamilyData                            = $false;
            EmployeeAccessedHighVolumePatientData                 = $false;
            EmployeeAccessedNeighbourData                         = $false;
            EmployeeAccessedRestrictedData                        = $false;
            EnableTeam                                            = $true;
            Ensure                                                = "Present";
            EpoBrowseToChildAbuseSites                            = $false;
            EpoBrowseToCriminalActivitySites                      = $false;
            EpoBrowseToCultSites                                  = $false;
            EpoBrowseToGamblingSites                              = $false;
            EpoBrowseToHackingSites                               = $false;
            EpoBrowseToHateIntoleranceSites                       = $false;
            EpoBrowseToIllegalSoftwareSites                       = $false;
            EpoBrowseToKeyloggerSites                             = $false;
            EpoBrowseToLlmSites                                   = $false;
            EpoBrowseToMalwareSites                               = $false;
            EpoBrowseToPhishingSites                              = $false;
            EpoBrowseToPornographySites                           = $false;
            EpoBrowseToUnallowedDomain                            = $false;
            EpoBrowseToViolenceSites                              = $false;
            EpoCopyToClipboardFromSensitiveFile                   = $false;
            EpoCopyToNetworkShare                                 = $false;
            EpoFileArchived                                       = $false;
            EpoFileCopiedToRemoteDesktopSession                   = $false;
            EpoFileDeleted                                        = $false;
            EpoFileDownloadedFromBlacklistedDomain                = $false;
            EpoFileDownloadedFromEnterpriseDomain                 = $false;
            EpoFileRenamed                                        = $false;
            EpoFileStagedToCentralLocation                        = $false;
            EpoHiddenFileCreated                                  = $false;
            EpoRemovableMediaMount                                = $false;
            EpoSensitiveFileRead                                  = $false;
            FabricExternalDataSharingSwitchEnabled                = $false;
            FileVolCutoffLimits                                   = "59";
            GoogleDriveContentAccess                              = $false;
            GoogleDriveContentDelete                              = $false;
            GoogleDriveContentExternallyShared                    = $false;
            HighSeverityAlertsEnabled                             = $true;
            HighSeverityAlertsRoleGroups                          = @("InsiderRiskManagement", "InsiderRiskManagementAnalysts");
            HighSeverityDlpRuleMatch                              = $true;
            HistoricTimeSpan                                      = "89";
            InlineAlertPolicyCustomization                        = $true;
            InScopeTimeSpan                                       = "30";
            InsiderRiskScenario                                   = "TenantSetting";
            IRASettingsEnabled                                    = $true;
            LakehouseArtifactDeleted                              = $false;
            LakehouseExternalDataShareCreated                     = $false;
            LakehouseFileOrBlobDeleted                            = $false;
            LakehouseSensitivityLabelDowngraded                   = $false;
            LakehouseSensitivityLabelRemoved                      = $false;
            LookbackTimeSpan                                      = 30;
            Mcas3rdPartyAppDownload                               = $false;
            Mcas3rdPartyAppFileDelete                             = $false;
            Mcas3rdPartyAppFileSharing                            = $false;
            McasActivityFromInfrequentCountry                     = $false;
            McasImpossibleTravel                                  = $false;
            McasMultipleFailedLogins                              = $false;
            McasMultipleStorageDeletion                           = $false;
            McasMultipleVMCreation                                = $true;
            McasMultipleVMDeletion                                = $false;
            McasSuspiciousAdminActivities                         = $false;
            McasSuspiciousCloudCreation                           = $false;
            McasSuspiciousCloudTrailLoggingChange                 = $false;
            McasTerminatedEmployeeActivity                        = $false;
            MDATPTriageStatus                                     = @("Unknown", "TruePositive");
            Name                                                  = "IRM_Tenant_Setting";
            NetworkDownloadFile                                   = $false;
            NetworkDownloadText                                   = $false;
            NetworkUploadFile                                     = $true;
            NetworkUploadText                                     = $true;
            NotificationDetailsEnabled                            = $true;
            NotificationDetailsRoleGroups                         = @("InsiderRiskManagement", "InsiderRiskManagementInvestigators");
            OdbDownload                                           = $false;
            OdbSyncDownload                                       = $false;
            OptInIRMDataExport                                    = $true;
            PeerCumulativeExfiltrationDetector                    = $false;
            PhysicalAccess                                        = $false;
            PoliciesHealthEnabled                                 = $true;
            PoliciesHealthRoleGroups                              = @("InsiderRiskManagement", "InsiderRiskManagementAdmins");
            PotentialHighImpactUser                               = $false;
            PowerBIDashboardsDeleted                              = $false;
            PowerBIReportsDeleted                                 = $false;
            PowerBIReportsDownloaded                              = $false;
            PowerBIReportsExported                                = $false;
            PowerBIReportsViewed                                  = $false;
            PowerBISemanticModelsDeleted                          = $false;
            PowerBISensitivityLabelDowngradedForArtifacts         = $false;
            PowerBISensitivityLabelRemovedFromArtifacts           = $false;
            Print                                                 = $false;
            PriorityUserGroupMember                               = $false;
            ProfileInScopeTimeSpan                                = 30;
            RaiseAuditAlert                                       = $true;
            RetainSeverityAfterTriage                             = $true;
            SecurityAlertDefenseEvasion                           = $false;
            SecurityAlertUnwantedSoftware                         = $false;
            SpoAccessRequest                                      = $false;
            SpoApprovedAccess                                     = $false;
            SpoDownload                                           = $false;
            SpoDownloadV2                                         = $false;
            SpoFileAccessed                                       = $false;
            SpoFileDeleted                                        = $false;
            SpoFileDeletedFromFirstStageRecycleBin                = $false;
            SpoFileDeletedFromSecondStageRecycleBin               = $false;
            SpoFileLabelDowngraded                                = $false;
            SpoFileLabelRemoved                                   = $false;
            SpoFileSharing                                        = $true;
            SpoFolderDeleted                                      = $false;
            SpoFolderDeletedFromFirstStageRecycleBin              = $false;
            SpoFolderDeletedFromSecondStageRecycleBin             = $false;
            SpoFolderSharing                                      = $false;
            SpoSiteExternalUserAdded                              = $false;
            SpoSiteInternalUserAdded                              = $false;
            SpoSiteLabelRemoved                                   = $false;
            SpoSiteSharing                                        = $false;
            SpoSyncDownload                                       = $false;
            TeamsChannelFileSharedExternal                        = $false;
            TeamsChannelMemberAddedExternal                       = $false;
            TeamsChatFileSharedExternal                           = $true; # Updated Property
            TeamsFileDownload                                     = $false;
            TeamsFolderSharedExternal                             = $false;
            TeamsMemberAddedExternal                              = $false;
            TeamsSensitiveMessage                                 = $false;
            UserAnalyticsSettingsEnabled                          = $true;
            UserHistory                                           = $false;
            ApplicationId                                         = $ApplicationId;
            TenantId                                              = $TenantId;
            CertificateThumbprint                                 = $CertificateThumbprint;
        }
    }
}
