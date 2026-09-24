using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class SCInsiderRiskPolicy : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('Name of the insider risk policy.')]
    [System.String] $Name

    [DscProperty(Key)]
    [System.ComponentModel.Description('Name of the scenario supported by the policy.')]
    [System.String] $InsiderRiskScenario

    [DscProperty()]
    [System.ComponentModel.Description('When turned on, data is aggregated at tenant level and is shown as insights in Analytics reports.')]
    [System.Nullable[System.Boolean]] $IRASettingsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('When turned on, if an email containing only a signature as attachment is sent to someone outside your org, your policies will attempt to ignore the activity when assigning risk scores, thereby helping reduce inessential alerts.')]
    [System.Nullable[System.Boolean]] $EmailSignatureExclusionSettingsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('When turned on, data is aggregated at user level and is shown as insights in user activity summary of Data Loss Prevention, Communication Compliance and Microsoft Defender along with Advanced Hunting tables. Data sharing needs to be turned on along with this.')]
    [System.Nullable[System.Boolean]] $UserAnalyticsSettingsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('For users who perform activities matching your insider risk policies, decide whether to show their actual names or use pseudonymized versions to mask their identities.')]
    [System.Nullable[System.Boolean]] $Anonymization

    [DscProperty()]
    [System.ComponentModel.Description('When turned on, admins with the correct permissions will be able to review user risk details from Insider Risk Management within other solutions such as Data Loss Prevention (DLP), Communication Compliance, and user entity pages in Microsoft Defender.')]
    [System.Nullable[System.Boolean]] $DLPUserRiskSync

    [DscProperty()]
    [System.ComponentModel.Description('When turned on, admins with the correct permissions will be able to review user risk details from Insider Risk Management within other solutions such as Data Loss Prevention (DLP), Communication Compliance, and user entity pages in Microsoft Defender.')]
    [System.Nullable[System.Boolean]] $OptInIRMDataExport

    [DscProperty()]
    [System.ComponentModel.Description('Insider risk management alert information is exportable to security information and event management (SIEM) services by using Office 365 Management Activity APIs. Turn this on to use these APIs to export insider risk alert details to other applications your organization might use to manage or aggregate insider risk data.')]
    [System.Nullable[System.Boolean]] $RaiseAuditAlert

    [DscProperty()]
    [System.ComponentModel.Description('Enable inline alert customization for all alert reviewers.')]
    [System.Nullable[System.Boolean]] $InlineAlertPolicyCustomization

    [DscProperty()]
    [System.ComponentModel.Description('Minimum number of daily events to boost score for unusual activity.')]
    [System.String] $FileVolCutoffLimits

    [DscProperty()]
    [System.ComponentModel.Description('Alert volume.')]
    [System.String] $AlertVolume

    [DscProperty()]
    [System.ComponentModel.Description('Risk score boosters indicator.')]
    [System.Nullable[System.Boolean]] $AnomalyDetections

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Entering risky prompt in other AI apps')]
    [System.Nullable[System.Boolean]] $AIAppRiskyPrompt

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Entering prompt attacks in AI apps')]
    [System.Nullable[System.Boolean]] $CCPromptShields

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Receiving AI app responses containing protected materials')]
    [System.Nullable[System.Boolean]] $CCProtectedMaterialDetection

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Sending messages that contain specific sesitive info types')]
    [System.Nullable[System.Boolean]] $CCSensitiveInformationType

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Detect messages matched by specific Communication Compliance policies')]
    [System.Nullable[System.Boolean]] $CCSupervisionRuleMatch

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Potentially risky sign-in activity')]
    [System.Nullable[System.Boolean]] $CompromisedSignInAlerts

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > User account potentially compromised')]
    [System.Nullable[System.Boolean]] $CompromisedUserAlerts

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Entering risky prompt in enterprise AI apps')]
    [System.Nullable[System.Boolean]] $ConnectedAIAppRiskyPrompt

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Receiving sensitive response from enterprise AI apps')]
    [System.Nullable[System.Boolean]] $ConnectedAIAppSensitiveResponse

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Entering risky prompt in Copilot')]
    [System.Nullable[System.Boolean]] $CopilotRiskyPrompt

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Receiving sensitive response from Copilot')]
    [System.Nullable[System.Boolean]] $CopilotSensitiveResponse

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Enabling external sharing of Microsoft Fabric data')]
    [System.Nullable[System.Boolean]] $FabricExternalDataSharingSwitchEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Generating alerts from selected DLP policies')]
    [System.Nullable[System.Boolean]] $HighSeverityDlpRuleMatch

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Deleting Microsoft Fabric lakehouses')]
    [System.Nullable[System.Boolean]] $LakehouseArtifactDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Sharing lakehouse data with people outside the organization')]
    [System.Nullable[System.Boolean]] $LakehouseExternalDataShareCreated

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Deleted lakehouse files or tables')]
    [System.Nullable[System.Boolean]] $LakehouseFileOrBlobDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Downgrading sensitivity labels of lakehouses')]
    [System.Nullable[System.Boolean]] $LakehouseSensitivityLabelDowngraded

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Removing sensitivity labels of lakehouses')]
    [System.Nullable[System.Boolean]] $LakehouseSensitivityLabelRemoved

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Files downloaded from the web')]
    [System.Nullable[System.Boolean]] $NetworkDownloadFile

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Sensitive text downloaded from the web')]
    [System.Nullable[System.Boolean]] $NetworkDownloadText

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Files uploaded to the web')]
    [System.Nullable[System.Boolean]] $NetworkUploadFile

    [DscProperty()]
    [System.ComponentModel.Description('Policy indicators > Sensitive text uploaded to the web')]
    [System.Nullable[System.Boolean]] $NetworkUploadText

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $CopyToPersonalCloud

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $CopyToUSB

    [DscProperty()]
    [System.ComponentModel.Description('Cumulative exfiltration detection indicator.')]
    [System.Nullable[System.Boolean]] $CumulativeExfiltrationDetector

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $EmailExternal

    [DscProperty()]
    [System.ComponentModel.Description('Health record access indicator.')]
    [System.Nullable[System.Boolean]] $EmployeeAccessedEmployeePatientData

    [DscProperty()]
    [System.ComponentModel.Description('Health record access indicator.')]
    [System.Nullable[System.Boolean]] $EmployeeAccessedFamilyData

    [DscProperty()]
    [System.ComponentModel.Description('Health record access indicator.')]
    [System.Nullable[System.Boolean]] $EmployeeAccessedHighVolumePatientData

    [DscProperty()]
    [System.ComponentModel.Description('Health record access indicator.')]
    [System.Nullable[System.Boolean]] $EmployeeAccessedNeighbourData

    [DscProperty()]
    [System.ComponentModel.Description('Health record access indicator.')]
    [System.Nullable[System.Boolean]] $EmployeeAccessedRestrictedData

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToChildAbuseSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToCriminalActivitySites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToCultSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToGamblingSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToHackingSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToHateIntoleranceSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToIllegalSoftwareSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToKeyloggerSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToLlmSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToMalwareSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToPhishingSites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToPornographySites

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToUnallowedDomain

    [DscProperty()]
    [System.ComponentModel.Description('Risky browsing indicator.')]
    [System.Nullable[System.Boolean]] $EpoBrowseToViolenceSites

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoCopyToClipboardFromSensitiveFile

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoCopyToNetworkShare

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileArchived

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileCopiedToRemoteDesktopSession

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileDownloadedFromBlacklistedDomain

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileDownloadedFromEnterpriseDomain

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileRenamed

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoFileStagedToCentralLocation

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoHiddenFileCreated

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoRemovableMediaMount

    [DscProperty()]
    [System.ComponentModel.Description('Device indicator.')]
    [System.Nullable[System.Boolean]] $EpoSensitiveFileRead

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $Mcas3rdPartyAppDownload

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $Mcas3rdPartyAppFileDelete

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $Mcas3rdPartyAppFileSharing

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasActivityFromInfrequentCountry

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasImpossibleTravel

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasMultipleFailedLogins

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasMultipleStorageDeletion

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasMultipleVMCreation

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasMultipleVMDeletion

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasSuspiciousAdminActivities

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasSuspiciousCloudCreation

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasSuspiciousCloudTrailLoggingChange

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Cloud Apps indicator.')]
    [System.Nullable[System.Boolean]] $McasTerminatedEmployeeActivity

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $OdbDownload

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $OdbSyncDownload

    [DscProperty()]
    [System.ComponentModel.Description('Cumulative exfiltration detection indicator.')]
    [System.Nullable[System.Boolean]] $PeerCumulativeExfiltrationDetector

    [DscProperty()]
    [System.ComponentModel.Description('Physical access indicator.')]
    [System.Nullable[System.Boolean]] $PhysicalAccess

    [DscProperty()]
    [System.ComponentModel.Description('Risk score boosters indicator.')]
    [System.Nullable[System.Boolean]] $PotentialHighImpactUser

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $Print

    [DscProperty()]
    [System.ComponentModel.Description('Risk score boosters indicator.')]
    [System.Nullable[System.Boolean]] $PriorityUserGroupMember

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Endpoint indicator.')]
    [System.Nullable[System.Boolean]] $SecurityAlertDefenseEvasion

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Endpoint indicator.')]
    [System.Nullable[System.Boolean]] $SecurityAlertUnwantedSoftware

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoAccessRequest

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoApprovedAccess

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoDownload

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoDownloadV2

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileAccessed

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileDeletedFromFirstStageRecycleBin

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileDeletedFromSecondStageRecycleBin

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileLabelDowngraded

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileLabelRemoved

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFileSharing

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFolderDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFolderDeletedFromFirstStageRecycleBin

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFolderDeletedFromSecondStageRecycleBin

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoFolderSharing

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoSiteExternalUserAdded

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoSiteInternalUserAdded

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoSiteLabelRemoved

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoSiteSharing

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $SpoSyncDownload

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsChannelFileSharedExternal

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsChannelMemberAddedExternal

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsChatFileSharedExternal

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsFileDownload

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsFolderSharedExternal

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsMemberAddedExternal

    [DscProperty()]
    [System.ComponentModel.Description('Office Indicator.')]
    [System.Nullable[System.Boolean]] $TeamsSensitiveMessage

    [DscProperty()]
    [System.ComponentModel.Description('Risk score boosters indicator.')]
    [System.Nullable[System.Boolean]] $UserHistory

    [DscProperty()]
    [System.ComponentModel.Description('AWS indicator.')]
    [System.Nullable[System.Boolean]] $AWSS3BlockPublicAccessDisabled

    [DscProperty()]
    [System.ComponentModel.Description('AWS indicator.')]
    [System.Nullable[System.Boolean]] $AWSS3BucketDeleted

    [DscProperty()]
    [System.ComponentModel.Description('AWS indicator.')]
    [System.Nullable[System.Boolean]] $AWSS3PublicAccessEnabled

    [DscProperty()]
    [System.ComponentModel.Description('AWS indicator.')]
    [System.Nullable[System.Boolean]] $AWSS3ServerLoggingDisabled

    [DscProperty()]
    [System.ComponentModel.Description('Azure indicator.')]
    [System.Nullable[System.Boolean]] $AzureElevateAccessToAllSubscriptions

    [DscProperty()]
    [System.ComponentModel.Description('Azure indicator.')]
    [System.Nullable[System.Boolean]] $AzureResourceThreatProtectionSettingsUpdated

    [DscProperty()]
    [System.ComponentModel.Description('Azure indicator.')]
    [System.Nullable[System.Boolean]] $AzureSQLServerAuditingSettingsUpdated

    [DscProperty()]
    [System.ComponentModel.Description('Azure indicator.')]
    [System.Nullable[System.Boolean]] $AzureSQLServerFirewallRuleDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Azure indicator.')]
    [System.Nullable[System.Boolean]] $AzureSQLServerFirewallRuleUpdated

    [DscProperty()]
    [System.ComponentModel.Description('Azure indicator.')]
    [System.Nullable[System.Boolean]] $AzureStorageAccountOrContainerDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Box indicator.')]
    [System.Nullable[System.Boolean]] $BoxContentAccess

    [DscProperty()]
    [System.ComponentModel.Description('Box indicator.')]
    [System.Nullable[System.Boolean]] $BoxContentDelete

    [DscProperty()]
    [System.ComponentModel.Description('Box indicator.')]
    [System.Nullable[System.Boolean]] $BoxContentDownload

    [DscProperty()]
    [System.ComponentModel.Description('Box indicator.')]
    [System.Nullable[System.Boolean]] $BoxContentExternallyShared

    [DscProperty()]
    [System.ComponentModel.Description('Detect messages matching specific trainable classifiers.')]
    [System.Nullable[System.Boolean]] $CCFinancialRegulatoryRiskyTextSent

    [DscProperty()]
    [System.ComponentModel.Description('Detect messages matching specific trainable classifiers.')]
    [System.Nullable[System.Boolean]] $CCInappropriateContentSent

    [DscProperty()]
    [System.ComponentModel.Description('Detect messages matching specific trainable classifiers.')]
    [System.Nullable[System.Boolean]] $CCInappropriateImagesSent

    [DscProperty()]
    [System.ComponentModel.Description('Dropbox indicator.')]
    [System.Nullable[System.Boolean]] $DropboxContentAccess

    [DscProperty()]
    [System.ComponentModel.Description('Dropbox indicator.')]
    [System.Nullable[System.Boolean]] $DropboxContentDelete

    [DscProperty()]
    [System.ComponentModel.Description('Dropbox indicator.')]
    [System.Nullable[System.Boolean]] $DropboxContentDownload

    [DscProperty()]
    [System.ComponentModel.Description('Dropbox indicator.')]
    [System.Nullable[System.Boolean]] $DropboxContentExternallyShared

    [DscProperty()]
    [System.ComponentModel.Description('Google Drive indicator.')]
    [System.Nullable[System.Boolean]] $GoogleDriveContentAccess

    [DscProperty()]
    [System.ComponentModel.Description('Google Drive indicator.')]
    [System.Nullable[System.Boolean]] $GoogleDriveContentDelete

    [DscProperty()]
    [System.ComponentModel.Description('Google Drive indicator.')]
    [System.Nullable[System.Boolean]] $GoogleDriveContentExternallyShared

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBIDashboardsDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBIReportsDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBIReportsDownloaded

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBIReportsExported

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBIReportsViewed

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBISemanticModelsDeleted

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBISensitivityLabelDowngradedForArtifacts

    [DscProperty()]
    [System.ComponentModel.Description('Power BI indicator.')]
    [System.Nullable[System.Boolean]] $PowerBISensitivityLabelRemovedFromArtifacts

    [DscProperty()]
    [System.ComponentModel.Description('Determines how far back a policy should go to detect user activity and is triggered when a user performs the first activity matching a policy.')]
    [System.String] $HistoricTimeSpan

    [DscProperty()]
    [System.ComponentModel.Description('Determines how long policies will actively detect activity for users and is triggered when a user performs the first activity matching a policy.')]
    [System.String] $InScopeTimeSpan

    [DscProperty()]
    [System.ComponentModel.Description('Integrate Microsoft Teams capabilities with insider risk case management to enhance collaboration with stakeholders. ')]
    [System.Nullable[System.Boolean]] $EnableTeam

    [DscProperty()]
    [System.ComponentModel.Description('Send a monthly email summarizing new analytics scan insights.')]
    [System.Nullable[System.Boolean]] $AnalyticsNewInsightEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Send an email when analytics is turned off for your organization.')]
    [System.Nullable[System.Boolean]] $AnalyticsTurnedOffEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Send a daily email when new high severity alerts are generated.')]
    [System.Nullable[System.Boolean]] $HighSeverityAlertsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Specifies the groups of high severity alerts to include. Possible values are: InsiderRiskManagement, InsiderRiskManagementAnalysts, and InsiderRiskManagementInvestigators.')]
    [System.String[]] $HighSeverityAlertsRoleGroups

    [DscProperty()]
    [System.ComponentModel.Description('Send a weekly email summarizing policies that have unresolved warnings.')]
    [System.Nullable[System.Boolean]] $PoliciesHealthEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Specifies the groups to notify with weekly email. Possible values are: InsiderRiskManagement and InsiderRiskManagementAdmins.')]
    [System.String[]] $PoliciesHealthRoleGroups

    [DscProperty()]
    [System.ComponentModel.Description('Send a notification email when the first alert is generated for a new policy.')]
    [System.Nullable[System.Boolean]] $NotificationDetailsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Specifies the groups to notify when the first alert is generated. Possible values are: InsiderRiskManagement, InsiderRiskManagementAnalysts, and InsiderRiskManagementInvestigators.')]
    [System.String[]] $NotificationDetailsRoleGroups

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $ClipDeletionEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $SessionRecordingEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String] $RecordingTimeframePreEventInSec

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String] $RecordingTimeframePostEventInSec

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String] $BandwidthCapInMb

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String] $OfflineRecordingStorageLimitInMb

    [DscProperty()]
    [System.ComponentModel.Description('Determines if Adaptive Protection is enabled for Purview.')]
    [System.Nullable[System.Boolean]] $AdaptiveProtectionEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionHighProfileSourceType

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionHighProfileConfirmedIssueSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionHighProfileGeneratedIssueSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionHighProfileInsightSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionHighProfileInsightCount

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String[]] $AdaptiveProtectionHighProfileInsightTypes

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $AdaptiveProtectionHighProfileConfirmedIssue

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionMediumProfileSourceType

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionMediumProfileConfirmedIssueSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionMediumProfileGeneratedIssueSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionMediumProfileInsightSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionMediumProfileInsightCount

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String[]] $AdaptiveProtectionMediumProfileInsightTypes

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $AdaptiveProtectionMediumProfileConfirmedIssue

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionLowProfileSourceType

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionLowProfileConfirmedIssueSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionLowProfileGeneratedIssueSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionLowProfileInsightSeverity

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $AdaptiveProtectionLowProfileInsightCount

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.String[]] $AdaptiveProtectionLowProfileInsightTypes

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $AdaptiveProtectionLowProfileConfirmedIssue

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.Boolean]] $RetainSeverityAfterTriage

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $LookbackTimeSpan

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $ProfileInScopeTimeSpan

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $GPUUtilizationLimit

    [DscProperty()]
    [System.ComponentModel.Description('Official documentation to come.')]
    [System.Nullable[System.UInt32]] $CPUUtilizationLimit

    [DscProperty()]
    [System.ComponentModel.Description('Microsoft Defender for Endpoint alert statuses.')]
    [System.String[]] $MDATPTriageStatus

    [DscProperty()]
    [System.ComponentModel.Description('Present ensures the instance exists, absent ensures it is removed.')]
    [ValidateSet('Absent', 'Present')]
    [System.String] $Ensure

    [DscProperty()]
    [System.ComponentModel.Description('Credentials of the workload''s Admin')]
    [System.Management.Automation.PSCredential] $Credential

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Azure Active Directory application to authenticate with.')]
    [System.String] $ApplicationId

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Azure Active Directory tenant used for authentication.')]
    [System.String] $TenantId

    [DscProperty()]
    [System.ComponentModel.Description('Thumbprint of the Azure Active Directory application''s authentication certificate to use for authentication.')]
    [System.String] $CertificateThumbprint

    [DscProperty()]
    [System.ComponentModel.Description('Username can be made up to anything but password will be used for CertificatePassword')]
    [System.Management.Automation.PSCredential] $CertificatePassword

    [DscProperty()]
    [System.ComponentModel.Description('Path to certificate used in service principal usually a PFX file.')]
    [System.String] $CertificatePath

    [DscProperty()]
    [System.ComponentModel.Description('Managed ID being used for authentication.')]
    [System.Nullable[System.Boolean]] $ManagedIdentity

    [DscProperty()]
    [System.ComponentModel.Description('Access token used for authentication.')]
    [System.String[]] $AccessTokens

    # Export-only. Not part of the resource schema.
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [SCInsiderRiskPolicy] Get()
    {
        $EmailSignatureExclusionSettingsEnabledValue = $null
        $UserAnalyticsSettingsEnabledValue = $null
        $IRASettingsEnabledValue = $null
        if ($this.RequiresPowerShellCore())
        {
            $remote = [SCInsiderRiskPolicy]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration of SCInsiderRiskPolicy for $($this.Name)"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.Name -ne $this.Name)
            {
                $null = $this.Connect('SecurityComplianceCenter')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullResult = $this.GetBoundParameters()
                $nullResult.Ensure = 'Absent'

                $instance = Invoke-M365DSCCommand -ScriptBlock { Get-InsiderRiskPolicy -Identity $this.Name -ErrorAction Stop } -SuppressNotFoundError
                if ($null -eq $instance)
                {
                    return $this.AsResult($nullResult)
                }
            }
            else
            {
                $instance = $this.ExportedInstance
            }

            $results = @{
                Name                  = $instance.Name
                InsiderRiskScenario   = $instance.InsiderRiskScenario
                Ensure                = 'Present'
                Credential            = $this.Credential
                ApplicationId         = $this.ApplicationId
                TenantId              = $this.TenantId
                CertificateThumbprint = $this.CertificateThumbprint
                CertificatePath       = $this.CertificatePath
                CertificatePassword   = $this.CertificatePassword
                ManagedIdentity       = $this.ManagedIdentity
                AccessTokens          = $this.AccessTokens
            }

            if (-not [System.String]::IsNullOrEmpty($instance.SessionRecordingSettings))
            {
                $SessionRecordingSettings = ConvertFrom-Json $instance.SessionRecordingSettings
                $forensicSettingsHash = @{
                    ClipDeletionEnabled              = [Boolean]($SessionRecordingSettings.ClipDeletionEnabled)
                    SessionRecordingEnabled          = [Boolean]($SessionRecordingSettings.Enabled)
                    RecordingTimeframePreEventInSec  = $SessionRecordingSettings.RecordingTimeframePreEventInSec
                    RecordingTimeframePostEventInSec = $SessionRecordingSettings.RecordingTimeframePostEventInSec
                    BandwidthCapInMb                 = $SessionRecordingSettings.BandwidthCapInMb
                    OfflineRecordingStorageLimitInMb = $SessionRecordingSettings.OfflineRecordingStorageLimitInMb
                    GPUUtilizationLimit              = $SessionRecordingSettings.GPUUtilizationLimit
                    CPUUtilizationLimit              = $SessionRecordingSettings.CPUUtilizationLimit
                }
                $results += $forensicSettingsHash
            }

            if (-not [System.String]::IsNullOrEmpty($instance.TenantSettings) -and $instance.TenantSettings.Length -gt 0)
            {
                $tenantSettings = ConvertFrom-Json $instance.TenantSettings[0]

                $DLPUserRiskSyncValue = $null
                if (-not [System.String]::IsNullOrEmpty($tenantSettings.FeatureSettings.DLPUserRiskSync))
                {
                    $DLPUserRiskSyncValue = [Boolean]::Parse($tenantSettings.FeatureSettings.DLPUserRiskSync)
                }

                $AnonymizationValue = $null
                if (-not [System.String]::IsNullOrEmpty($tenantSettings.FeatureSettings.Anonymization))
                {
                    $AnonymizationValue = [Boolean]::Parse($tenantSettings.FeatureSettings.Anonymization)
                }

                $OptInIRMDataExportValue = $null
                if (-not [System.String]::IsNullOrEmpty($tenantSettings.FeatureSettings.OptInIRMDataExport))
                {
                    $OptInIRMDataExportValue = [Boolean]::Parse($tenantSettings.FeatureSettings.OptInIRMDataExport)
                }

                $RaiseAuditAlertValue = $null
                if (-not [System.String]::IsNullOrEmpty($tenantSettings.FeatureSettings.RaiseAuditAlert))
                {
                    $RaiseAuditAlertValue = [Boolean]::Parse($tenantSettings.FeatureSettings.RaiseAuditAlert)
                }

                $MDATPTriageStatusValue = @()
                if (-not [System.String]::IsNullOrEmpty($tenantSettings.IntelligentDetections.MDATPTriageStatus))
                {
                    $MDATPTriageStatusValue = [Array]($tenantSettings.IntelligentDetections.MDATPTriageStatus.Replace('"', '').Replace('[', '').Replace(']', '').Split(','))
                }

                if ($null -ne $tenantSettings.InterpretedSettings)
                {
                    $IRASettingsEnabledValue = $false
                    if (-not [System.String]::IsNullOrEmpty($tenantSettings.InterpretedSettings.IRASettings.Enabled))
                    {
                        $IRASettingsEnabledValue = [Boolean]::Parse($tenantSettings.InterpretedSettings.IRASettings.Enabled)
                    }
                    $EmailSignatureExclusionSettingsEnabledValue = $false
                    if (-not [System.String]::IsNullOrEmpty($tenantSettings.InterpretedSettings.EmailSignatureExclusionSettings.Enabled))
                    {
                        $EmailSignatureExclusionSettingsEnabledValue = [Boolean]::Parse($tenantSettings.InterpretedSettings.EmailSignatureExclusionSettings.Enabled)
                    }
                    $UserAnalyticsSettingsEnabledValue = $false
                    if (-not [System.String]::IsNullOrEmpty($tenantSettings.InterpretedSettings.UserAnalyticsSettings.Enabled))
                    {
                        $UserAnalyticsSettingsEnabledValue = [Boolean]::Parse($tenantSettings.InterpretedSettings.UserAnalyticsSettings.Enabled)
                    }
                }

                $InlineAlertPolicyCustomizationValue = $true
                if ($null -ne $tenantSettings.FeatureSettings -and `
                        -not [System.String]::IsNullOrEmpty($tenantSettings.FeatureSettings.InlineAlertPolicyCustomization))
                {
                    $InlineAlertPolicyCustomizationValue = [Boolean]::Parse($tenantSettings.FeatureSettings.InlineAlertPolicyCustomization)
                }

                $tenantSettingsHash = @{
                    Anonymization                                 = $AnonymizationValue
                    DLPUserRiskSync                               = $DLPUserRiskSyncValue
                    OptInIRMDataExport                            = $OptInIRMDataExportValue
                    RaiseAuditAlert                               = $RaiseAuditAlertValue
                    FileVolCutoffLimits                           = $tenantSettings.IntelligentDetections.FileVolCutoffLimits
                    AlertVolume                                   = $tenantSettings.IntelligentDetections.AlertVolume
                    MDATPTriageStatus                             = $MDATPTriageStatusValue
                    IRASettingsEnabled                            = $IRASettingsEnabledValue
                    EmailSignatureExclusionSettingsEnabled        = $EmailSignatureExclusionSettingsEnabledValue
                    UserAnalyticsSettingsEnabled                  = $UserAnalyticsSettingsEnabledValue
                    InlineAlertPolicyCustomization                = $InlineAlertPolicyCustomizationValue
                    AnomalyDetections                             = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'AnomalyDetections' }).Enabled
                    CopyToPersonalCloud                           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'CopyToPersonalCloud' }).Enabled
                    CopyToUSB                                     = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'CopyToUSB' }).Enabled
                    CumulativeExfiltrationDetector                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'CumulativeExfiltrationDetector' }).Enabled
                    EmailExternal                                 = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EmailExternal' }).Enabled
                    EmployeeAccessedEmployeePatientData           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EmployeeAccessedEmployeePatientData' }).Enabled
                    EmployeeAccessedFamilyData                    = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EmployeeAccessedFamilyData' }).Enabled
                    EmployeeAccessedHighVolumePatientData         = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EmployeeAccessedHighVolumePatientData' }).Enabled
                    EmployeeAccessedNeighbourData                 = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EmployeeAccessedNeighbourData' }).Enabled
                    EmployeeAccessedRestrictedData                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EmployeeAccessedRestrictedData' }).Enabled
                    EpoBrowseToChildAbuseSites                    = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToChildAbuseSites' }).Enabled
                    EpoBrowseToCriminalActivitySites              = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToCriminalActivitySites' }).Enabled
                    EpoBrowseToCultSites                          = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToCultSites' }).Enabled
                    EpoBrowseToGamblingSites                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToGamblingSites' }).Enabled
                    EpoBrowseToHackingSites                       = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToHackingSites' }).Enabled
                    EpoBrowseToHateIntoleranceSites               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToHateIntoleranceSites' }).Enabled
                    EpoBrowseToIllegalSoftwareSites               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToIllegalSoftwareSites' }).Enabled
                    EpoBrowseToKeyloggerSites                     = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToKeyloggerSites' }).Enabled
                    EpoBrowseToLlmSites                           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToLlmSites' }).Enabled
                    EpoBrowseToMalwareSites                       = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToMalwareSites' }).Enabled
                    EpoBrowseToPhishingSites                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToPhishingSites' }).Enabled
                    EpoBrowseToPornographySites                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToPornographySites' }).Enabled
                    EpoBrowseToUnallowedDomain                    = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToUnallowedDomain' }).Enabled
                    EpoBrowseToViolenceSites                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoBrowseToViolenceSites' }).Enabled
                    EpoCopyToClipboardFromSensitiveFile           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoCopyToClipboardFromSensitiveFile' }).Enabled
                    EpoCopyToNetworkShare                         = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoCopyToNetworkShare' }).Enabled
                    EpoFileArchived                               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileArchived' }).Enabled
                    EpoFileCopiedToRemoteDesktopSession           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileCopiedToRemoteDesktopSession' }).Enabled
                    EpoFileDeleted                                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileDeleted' }).Enabled
                    EpoFileDownloadedFromBlacklistedDomain        = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileDownloadedFromBlacklistedDomain' }).Enabled
                    EpoFileDownloadedFromEnterpriseDomain         = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileDownloadedFromEnterpriseDomain' }).Enabled
                    EpoFileRenamed                                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileRenamed' }).Enabled
                    EpoFileStagedToCentralLocation                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoFileStagedToCentralLocation' }).Enabled
                    EpoHiddenFileCreated                          = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoHiddenFileCreated' }).Enabled
                    EpoRemovableMediaMount                        = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoRemovableMediaMount' }).Enabled
                    EpoSensitiveFileRead                          = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'EpoSensitiveFileRead' }).Enabled
                    Mcas3rdPartyAppDownload                       = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'Mcas3rdPartyAppDownload' }).Enabled
                    Mcas3rdPartyAppFileDelete                     = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'Mcas3rdPartyAppFileDelete' }).Enabled
                    Mcas3rdPartyAppFileSharing                    = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'Mcas3rdPartyAppFileSharing' }).Enabled
                    McasActivityFromInfrequentCountry             = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasActivityFromInfrequentCountry' }).Enabled
                    McasImpossibleTravel                          = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasImpossibleTravel' }).Enabled
                    McasMultipleFailedLogins                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasMultipleFailedLogins' }).Enabled
                    McasMultipleStorageDeletion                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasMultipleStorageDeletion' }).Enabled
                    McasMultipleVMCreation                        = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasMultipleVMCreation' }).Enabled
                    McasMultipleVMDeletion                        = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasMultipleVMDeletion' }).Enabled
                    McasSuspiciousAdminActivities                 = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasSuspiciousAdminActivities' }).Enabled
                    McasSuspiciousCloudCreation                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasSuspiciousCloudCreation' }).Enabled
                    McasSuspiciousCloudTrailLoggingChange         = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasSuspiciousCloudTrailLoggingChange' }).Enabled
                    McasTerminatedEmployeeActivity                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'McasTerminatedEmployeeActivity' }).Enabled
                    OdbDownload                                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'OdbDownload' }).Enabled
                    OdbSyncDownload                               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'OdbSyncDownload' }).Enabled
                    PeerCumulativeExfiltrationDetector            = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'PeerCumulativeExfiltrationDetector' }).Enabled
                    PhysicalAccess                                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'PhysicalAccess' }).Enabled
                    PotentialHighImpactUser                       = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'PotentialHighImpactUser' }).Enabled
                    Print                                         = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'Print' }).Enabled
                    PriorityUserGroupMember                       = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'PriorityUserGroupMember' }).Enabled
                    SecurityAlertDefenseEvasion                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SecurityAlertDefenseEvasion' }).Enabled
                    SecurityAlertUnwantedSoftware                 = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SecurityAlertUnwantedSoftware' }).Enabled
                    SpoAccessRequest                              = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoAccessRequest' }).Enabled
                    SpoApprovedAccess                             = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoApprovedAccess' }).Enabled
                    SpoDownload                                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoDownload' }).Enabled
                    SpoDownloadV2                                 = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoDownloadV2' }).Enabled
                    SpoFileAccessed                               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileAccessed' }).Enabled
                    SpoFileDeleted                                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileDeleted' }).Enabled
                    SpoFileDeletedFromFirstStageRecycleBin        = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileDeletedFromFirstStageRecycleBin' }).Enabled
                    SpoFileDeletedFromSecondStageRecycleBin       = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileDeletedFromSecondStageRecycleBin' }).Enabled
                    SpoFileLabelDowngraded                        = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileLabelDowngraded' }).Enabled
                    SpoFileLabelRemoved                           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileLabelRemoved' }).Enabled
                    SpoFileSharing                                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFileSharing' }).Enabled
                    SpoFolderDeleted                              = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFolderDeleted' }).Enabled
                    SpoFolderDeletedFromFirstStageRecycleBin      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFolderDeletedFromFirstStageRecycleBin' }).Enabled
                    SpoFolderDeletedFromSecondStageRecycleBin     = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFolderDeletedFromSecondStageRecycleBin' }).Enabled
                    SpoFolderSharing                              = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoFolderSharing' }).Enabled
                    SpoSiteExternalUserAdded                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoSiteExternalUserAdded' }).Enabled
                    SpoSiteInternalUserAdded                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoSiteInternalUserAdded' }).Enabled
                    SpoSiteLabelRemoved                           = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoSiteLabelRemoved' }).Enabled
                    SpoSiteSharing                                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoSiteSharing' }).Enabled
                    SpoSyncDownload                               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'SpoSyncDownload' }).Enabled
                    TeamsChannelFileSharedExternal                = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsChannelFileSharedExternal' }).Enabled
                    TeamsChannelMemberAddedExternal               = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsChannelMemberAddedExternal' }).Enabled
                    TeamsChatFileSharedExternal                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsChatFileSharedExternal' }).Enabled
                    TeamsFileDownload                             = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsFileDownload' }).Enabled
                    TeamsFolderSharedExternal                     = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsFolderSharedExternal' }).Enabled
                    TeamsMemberAddedExternal                      = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsMemberAddedExternal' }).Enabled
                    TeamsSensitiveMessage                         = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'TeamsSensitiveMessage' }).Enabled
                    UserHistory                                   = ($tenantSettings.Indicators | Where-Object -FilterScript { $_.Name -eq 'UserHistory' }).Enabled
                    AIAppRiskyPrompt                              = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AIAppRiskyPrompt' }).Enabled
                    AWSS3BlockPublicAccessDisabled                = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AWSS3BlockPublicAccessDisabled' }).Enabled
                    AWSS3BucketDeleted                            = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AWSS3BucketDeleted' }).Enabled
                    AWSS3PublicAccessEnabled                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AWSS3PublicAccessEnabled' }).Enabled
                    AWSS3ServerLoggingDisabled                    = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AWSS3ServerLoggingDisabled' }).Enabled
                    AzureElevateAccessToAllSubscriptions          = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AzureElevateAccessToAllSubscriptions' }).Enabled
                    AzureResourceThreatProtectionSettingsUpdated  = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AzureResourceThreatProtectionSettingsUpdated' }).Enabled
                    AzureSQLServerAuditingSettingsUpdated         = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AzureSQLServerAuditingSettingsUpdated' }).Enabled
                    AzureSQLServerFirewallRuleDeleted             = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AzureSQLServerFirewallRuleDeleted' }).Enabled
                    AzureSQLServerFirewallRuleUpdated             = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AzureSQLServerFirewallRuleUpdated' }).Enabled
                    AzureStorageAccountOrContainerDeleted         = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'AzureStorageAccountOrContainerDeleted' }).Enabled
                    BoxContentAccess                              = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'BoxContentAccess' }).Enabled
                    BoxContentDelete                              = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'BoxContentDelete' }).Enabled
                    BoxContentDownload                            = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'BoxContentDownload' }).Enabled
                    BoxContentExternallyShared                    = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'BoxContentExternallyShared' }).Enabled
                    CCFinancialRegulatoryRiskyTextSent            = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCFinancialRegulatoryRiskyTextSent' }).Enabled
                    CCInappropriateContentSent                    = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCInappropriateContentSent' }).Enabled
                    CCInappropriateImagesSent                     = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCInappropriateImagesSent' }).Enabled
                    CCPromptShields                               = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCPromptShields' }).Enabled
                    CCProtectedMaterialDetection                  = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCProtectedMaterialDetection' }).Enabled
                    CCSensitiveInformationType                    = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCSensitiveInformationType' }).Enabled
                    CCSupervisionRuleMatch                        = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CCSupervisionRuleMatch' }).Enabled
                    CompromisedSignInAlerts                       = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CompromisedSignInAlerts' }).Enabled
                    CompromisedUserAlerts                         = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CompromisedUserAlerts' }).Enabled
                    ConnectedAIAppRiskyPrompt                     = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'ConnectedAIAppRiskyPrompt' }).Enabled
                    ConnectedAIAppSensitiveResponse               = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'ConnectedAIAppSensitiveResponse' }).Enabled
                    CopilotRiskyPrompt                            = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CopilotRiskyPrompt' }).Enabled
                    CopilotSensitiveResponse                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'CopilotSensitiveResponse' }).Enabled
                    DropboxContentAccess                          = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'DropboxContentAccess' }).Enabled
                    DropboxContentDelete                          = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'DropboxContentDelete' }).Enabled
                    DropboxContentDownload                        = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'DropboxContentDownload' }).Enabled
                    DropboxContentExternallyShared                = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'DropboxContentExternallyShared' }).Enabled
                    FabricExternalDataSharingSwitchEnabled        = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'FabricExternalDataSharingSwitchEnabled' }).Enabled
                    GoogleDriveContentAccess                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'GoogleDriveContentAccess' }).Enabled
                    GoogleDriveContentDelete                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'GoogleDriveContentDelete' }).Enabled
                    GoogleDriveContentExternallyShared            = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'GoogleDriveContentExternallyShared' }).Enabled
                    HighSeverityDlpRuleMatch                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'HighSeverityDlpRuleMatch' }).Enabled
                    LakehouseArtifactDeleted                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'LakehouseArtifactDeleted' }).Enabled
                    LakehouseExternalDataShareCreated             = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'LakehouseExternalDataShareCreated' }).Enabled
                    LakehouseFileOrBlobDeleted                    = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'LakehouseFileOrBlobDeleted' }).Enabled
                    LakehouseSensitivityLabelDowngraded           = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'LakehouseSensitivityLabelDowngraded' }).Enabled
                    LakehouseSensitivityLabelRemoved              = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'LakehouseSensitivityLabelRemoved' }).Enabled
                    NetworkDownloadFile                           = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'NetworkDownloadFile' }).Enabled
                    NetworkDownloadText                           = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'NetworkDownloadText' }).Enabled
                    NetworkUploadFile                             = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'NetworkUploadFile' }).Enabled
                    NetworkUploadText                             = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'NetworkUploadText' }).Enabled
                    PowerBIDashboardsDeleted                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBIDashboardsDeleted' }).Enabled
                    PowerBIReportsDeleted                         = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBIReportsDeleted' }).Enabled
                    PowerBIReportsDownloaded                      = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBIReportsDownloaded' }).Enabled
                    PowerBIReportsExported                        = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBIReportsExported' }).Enabled
                    PowerBIReportsViewed                          = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBIReportsViewed' }).Enabled
                    PowerBISemanticModelsDeleted                  = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBISemanticModelsDeleted' }).Enabled
                    PowerBISensitivityLabelDowngradedForArtifacts = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBISensitivityLabelDowngradedForArtifacts' }).Enabled
                    PowerBISensitivityLabelRemovedFromArtifacts   = ($tenantSettings.ExtensibleIndicators | Where-Object -FilterScript { $_.Name -eq 'PowerBISensitivityLabelRemovedFromArtifacts' }).Enabled
                    HistoricTimeSpan                              = $tenantSettings.TimeSpan.HistoricTimeSpan
                    InScopeTimeSpan                               = $tenantSettings.TimeSpan.InScopeTimeSpan
                }

                if (-not [System.String]::IsNullOrEmpty($tenantSettings.FeatureSettings.EnableTeam))
                {
                    $tenantSettingsHash.Add('EnableTeam', [Boolean]::Parse($tenantSettings.FeatureSettings.EnableTeam))
                }

                $AnalyticsNewInsight = $tenantSettings.NotificationPreferences | Where-Object -FilterScript { $_.NotificationType -eq 'AnalyticsNewInsight' }
                if ($null -ne $AnalyticsNewInsight)
                {
                    $tenantSettingsHash.Add('AnalyticsNewInsightEnabled', [Boolean]::Parse($AnalyticsNewInsight.Enabled))
                }
                else
                {
                    # Defaults
                    $tenantSettingsHash.Add('AnalyticsNewInsightEnabled', $false)
                }

                $AnalyticsTurnedOff = $tenantSettings.NotificationPreferences | Where-Object -FilterScript { $_.NotificationType -eq 'AnalyticsTurnedOff' }
                if ($null -ne $AnalyticsTurnedOff)
                {
                    $tenantSettingsHash.Add('AnalyticsTurnedOffEnabled', [Boolean]::Parse($AnalyticsTurnedOff.Enabled))
                }
                else
                {
                    # Defaults
                    $tenantSettingsHash.Add('AnalyticsTurnedOffEnabled', $false)
                }

                $highSeverityAlerts = $tenantSettings.NotificationPreferences | Where-Object -FilterScript { $_.NotificationType -eq 'HighSeverityAlerts' }
                if ($null -ne $highSeverityAlerts)
                {
                    $tenantSettingsHash.Add('HighSeverityAlertsEnabled', [Boolean]::Parse($highSeverityAlerts.Enabled))
                    $tenantSettingsHash.Add('HighSeverityAlertsRoleGroups', [Array]$highSeverityAlerts.RoleGroups)
                }
                else
                {
                    # Defaults
                    $tenantSettingsHash.Add('HighSeverityAlertsEnabled', $false)
                    $tenantSettingsHash.Add('HighSeverityAlertsRoleGroups', [Array]@())
                }

                $policiesHealth = $tenantSettings.NotificationPreferences | Where-Object -FilterScript { $_.NotificationType -eq 'PoliciesHealth' }
                if ($null -ne $policiesHealth)
                {
                    $tenantSettingsHash.Add('PoliciesHealthEnabled', [Boolean]::Parse($policiesHealth.Enabled))
                    $tenantSettingsHash.Add('PoliciesHealthRoleGroups', [Array]$policiesHealth.RoleGroups)
                }
                else
                {
                    # Defaults
                    $tenantSettingsHash.Add('PoliciesHealthEnabled', $false)
                    $tenantSettingsHash.Add('PoliciesHealthRoleGroups', [Array]@())
                }

                if ($null -ne $tenantSettings.FeatureSettings.NotificationDetails)
                {
                    $tenantSettingsHash.Add('NotificationDetailsEnabled', $true)
                    $roleGroupsObject = ConvertFrom-Json ($tenantSettings.FeatureSettings.NotificationDetails)
                    $tenantSettingsHash.Add('NotificationDetailsRoleGroups', [Array]$roleGroupsObject.RoleGroups)
                }
                else
                {
                    # Defaults
                    $tenantSettingsHash.Add('NotificationDetailsEnabled', $false)
                    $tenantSettingsHash.Add('NotificationDetailsRoleGroups', @())
                }

                # Adaptive Protection
                $AdaptiveProtectionEnabledValue = $false
                if ($null -ne $tenantSettings.DynamicRiskPreventionSettings -and `
                        $null -ne $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings)
                {
                    if ($tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.ActivationStatus -eq 0)
                    {
                        $AdaptiveProtectionEnabledValue = $true
                    }
                    else
                    {
                        $AdaptiveProtectionEnabledValue = $false
                    }

                    # High Profile
                    if ($null -ne $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.HighProfile)
                    {
                        $highProfile = $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.HighProfile
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileSourceType', $highProfile.ProfileSourceType)
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileConfirmedIssueSeverity', $highProfile.ConfirmedIssueSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileGeneratedIssueSeverity', $highProfile.GeneratedIssueSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileInsightSeverity', $highProfile.InsightSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileInsightCount', $highProfile.InsightCount)
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileInsightTypes', [Array]($highProfile.InsightTypes))
                        $tenantSettingsHash.Add('AdaptiveProtectionHighProfileConfirmedIssue', $highProfile.ConfirmedIssue)
                    }

                    # Medium Profile
                    if ($null -ne $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.MediumProfile)
                    {
                        $mediumProfile = $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.MediumProfile
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileSourceType', $mediumProfile.ProfileSourceType)
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileConfirmedIssueSeverity', $mediumProfile.ConfirmedIssueSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileGeneratedIssueSeverity', $mediumProfile.GeneratedIssueSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileInsightSeverity', $mediumProfile.InsightSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileInsightCount', $mediumProfile.InsightCount)
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileInsightTypes', [Array]($mediumProfile.InsightTypes))
                        $tenantSettingsHash.Add('AdaptiveProtectionMediumProfileConfirmedIssue', $mediumProfile.ConfirmedIssue)
                    }

                    # Low Profile
                    if ($null -ne $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.LowProfile)
                    {
                        $lowProfile = $tenantSettings.DynamicRiskPreventionSettings.DynamicRiskScenarioSettings.LowProfile
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileSourceType', $lowProfile.ProfileSourceType)
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileConfirmedIssueSeverity', $lowProfile.ConfirmedIssueSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileGeneratedIssueSeverity', $lowProfile.GeneratedIssueSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileInsightSeverity', $lowProfile.InsightSeverity)
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileInsightCount', $lowProfile.InsightCount)
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileInsightTypes', [Array]($lowProfile.InsightTypes))
                        $tenantSettingsHash.Add('AdaptiveProtectionLowProfileConfirmedIssue', $lowProfile.ConfirmedIssue)
                    }

                    $tenantSettingsHash.Add('ProfileInScopeTimeSpan', $tenantSettings.DynamicRiskPreventionSettings.ProfileInScopeTimeSpan)
                    $tenantSettingsHash.Add('LookbackTimeSpan', $tenantSettings.DynamicRiskPreventionSettings.LookbackTimeSpan)
                    $tenantSettingsHash.Add('RetainSeverityAfterTriage', $tenantSettings.DynamicRiskPreventionSettings.RetainSeverityAfterTriage)
                }
                $tenantSettingsHash.Add('AdaptiveProtectionEnabled', $AdaptiveProtectionEnabledValue)
                $results += $tenantSettingsHash
            }

            return $this.AsResult($results)
        }
        catch
        {
            $this.LogError($_, 'Error retrieving data:')

            throw
        }
    }

    [void] Set()
    {
        $sessionRecordingValues = $null
        if ($this.RequiresPowerShellCore())
        {
            $null = $this.InvokeInPowerShellCore('Set')
            return
        }

        Write-Verbose -Message "Setting configuration of SCInsiderRiskPolicy for $($this.Name)"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $currentInstance = $this.Get().ToHashtable()
        $indicatorsProperties = @(
            'AnomalyDetections', 'CopyToPersonalCloud', 'CopyToUSB', 'CumulativeExfiltrationDetector', `
            'EmailExternal', 'EmployeeAccessedEmployeePatientData', 'EmployeeAccessedFamilyData', `
            'EmployeeAccessedHighVolumePatientData', 'EmployeeAccessedNeighbourData', `
            'EmployeeAccessedRestrictedData', 'EpoBrowseToChildAbuseSites', 'EpoBrowseToCriminalActivitySites', `
            'EpoBrowseToCultSites', 'EpoBrowseToGamblingSites', 'EpoBrowseToHackingSites', `
            'EpoBrowseToHateIntoleranceSites', 'EpoBrowseToIllegalSoftwareSites', 'EpoBrowseToKeyloggerSites', `
            'EpoBrowseToLlmSites', 'EpoBrowseToMalwareSites', 'EpoBrowseToPhishingSites', `
            'EpoBrowseToPornographySites', 'EpoBrowseToUnallowedDomain', 'EpoBrowseToViolenceSites', `
            'EpoCopyToClipboardFromSensitiveFile', 'EpoCopyToNetworkShare', 'EpoFileArchived', `
            'EpoFileCopiedToRemoteDesktopSession', 'EpoFileDeleted', 'EpoFileDownloadedFromBlacklistedDomain', `
            'EpoFileDownloadedFromEnterpriseDomain', 'EpoFileRenamed', 'EpoFileStagedToCentralLocation', `
            'EpoHiddenFileCreated', 'EpoRemovableMediaMount', 'EpoSensitiveFileRead', 'Mcas3rdPartyAppDownload', `
            'Mcas3rdPartyAppFileDelete', 'Mcas3rdPartyAppFileSharing', 'McasActivityFromInfrequentCountry', `
            'McasImpossibleTravel', 'McasMultipleFailedLogins', 'McasMultipleStorageDeletion', `
            'McasMultipleVMCreation', 'McasMultipleVMDeletion', 'McasSuspiciousAdminActivities', `
            'McasSuspiciousCloudCreation', 'McasSuspiciousCloudTrailLoggingChange', 'McasTerminatedEmployeeActivity', `
            'OdbDownload', 'OdbSyncDownload', 'PeerCumulativeExfiltrationDetector', 'PhysicalAccess', `
            'PotentialHighImpactUser', 'Print', 'PriorityUserGroupMember', 'SecurityAlertDefenseEvasion', `
            'SecurityAlertUnwantedSoftware', 'SpoAccessRequest', 'SpoApprovedAccess', 'SpoDownload', 'SpoDownloadV2', `
            'SpoFileAccessed', 'SpoFileDeleted', 'SpoFileDeletedFromFirstStageRecycleBin', `
            'SpoFileDeletedFromSecondStageRecycleBin', 'SpoFileLabelDowngraded', 'SpoFileLabelRemoved', `
            'SpoFileSharing', 'SpoFolderDeleted', 'SpoFolderDeletedFromFirstStageRecycleBin', `
            'SpoFolderDeletedFromSecondStageRecycleBin', 'SpoFolderSharing', 'SpoSiteExternalUserAdded', `
            'SpoSiteInternalUserAdded', 'SpoSiteLabelRemoved', 'SpoSiteSharing', 'SpoSyncDownload', `
            'TeamsChannelFileSharedExternal', 'TeamsChannelMemberAddedExternal', 'TeamsChatFileSharedExternal', `
            'TeamsFileDownload', 'TeamsFolderSharedExternal', 'TeamsMemberAddedExternal', 'TeamsSensitiveMessage', `
            'UserHistory'
        )

        $indicatorValues = @()
        foreach ($indicatorProperty in $indicatorsProperties)
        {
            if ($this.GetBoundParameters().ContainsKey($indicatorProperty))
            {
                $indicatorValues += "{`"Name`":`"$indicatorProperty`",`"Type`":`"Insight`",`"Enabled`":$($this.BoolToJson($this.GetBoundParameters().$indicatorProperty)),`"UseDefault`":true,`"ThresholdMode`":`"Default`"}"
            }
        }

        $extensibleIndicatorsProperties = @(
            'AIAppRiskyPrompt', 'AWSS3BlockPublicAccessDisabled', 'AWSS3BucketDeleted', 'AWSS3PublicAccessEnabled',
            'AWSS3ServerLoggingDisabled', 'AzureElevateAccessToAllSubscriptions', 'AzureResourceThreatProtectionSettingsUpdated',
            'AzureSQLServerAuditingSettingsUpdated', 'AzureSQLServerFirewallRuleDeleted', 'AzureSQLServerFirewallRuleUpdated',
            'AzureStorageAccountOrContainerDeleted', 'BoxContentAccess', 'BoxContentDelete', 'BoxContentDownload', 'BoxContentExternallyShared',
            'CCFinancialRegulatoryRiskyTextSent', 'CCInappropriateContentSent', 'CCInappropriateImagesSent', 'CCPromptShields',
            'CCProtectedMaterialDetection', 'CCSensitiveInformationType', 'CCSupervisionRuleMatch', 'CompromisedSignInAlerts',
            'CompromisedUserAlerts', 'ConnectedAIAppRiskyPrompt', 'ConnectedAIAppSensitiveResponse', 'CopilotRiskyPrompt',
            'CopilotSensitiveResponse', 'DropboxContentAccess', 'DropboxContentDelete', 'DropboxContentDownload', 'DropboxContentExternallyShared',
            'FabricExternalDataSharingSwitchEnabled', 'GoogleDriveContentAccess', 'GoogleDriveContentDelete', 'GoogleDriveContentExternallyShared',
            'HighSeverityDlpRuleMatch', 'LakehouseArtifactDeleted', 'LakehouseExternalDataShareCreated', 'LakehouseFileOrBlobDeleted',
            'LakehouseSensitivityLabelDowngraded', 'LakehouseSensitivityLabelRemoved', 'NetworkDownloadFile', 'NetworkDownloadText',
            'NetworkUploadFile', 'NetworkUploadText', 'PowerBIDashboardsDeleted', 'PowerBIReportsDeleted', 'PowerBIReportsDownloaded',
            'PowerBIReportsExported', 'PowerBIReportsViewed', 'PowerBISemanticModelsDeleted', 'PowerBISensitivityLabelDowngradedForArtifacts',
            'PowerBISensitivityLabelRemovedFromArtifacts'
        )

        $extensibleIndicatorsValues = @()
        foreach ($extensibleIndicatorsProperty in $extensibleIndicatorsProperties)
        {
            if ($this.GetBoundParameters().ContainsKey($extensibleIndicatorsProperty))
            {
                $extensibleIndicatorsValues += "{`"Name`":`"$extensibleIndicatorsProperty`",`"Type`":`"ExtensibleInsight`",`"Enabled`":$($this.BoolToJson($this.GetBoundParameters().$extensibleIndicatorsProperty)),`"UseDefault`":true,`"ThresholdMode`":`"Default`"}"
            }
        }

        # Tenant Settings
        $MDATPTriageStatusValue = '['
        foreach ($status in $this.MDATPTriageStatus)
        {
            $MDATPTriageStatusValue += "\`"$($status)\`","
        }
        if ($MDATPTriageStatusValue.EndsWith(','))
        {
            $MDATPTriageStatusValue = $MDATPTriageStatusValue.Substring(0, $MDATPTriageStatusValue.Length - 1)
        }
        $MDATPTriageStatusValue += ']'

        $notificationDetailsValue = ''
        if ($this.NotificationDetailsEnabled)
        {
            $notificationDetailsValue = ", `"NotificationDetails`":`"{\`"Rolegroups\`":$((ConvertTo-Json -InputObject $this.NotificationDetailsRoleGroups -Compress) -replace '"', '\"'),\`"Recepients\`":[]}`""
        }
        $featureSettingsValue = "{`"Anonymization`":$($this.BoolToJson($this.Anonymization)), `"DLPUserRiskSync`":$($this.BoolToJson($this.DLPUserRiskSync)), `"OptInIRMDataExport`":$($this.BoolToJson($this.OptInIRMDataExport)), `"RaiseAuditAlert`":$($this.BoolToJson($this.RaiseAuditAlert)), `"EnableTeam`":$($this.BoolToJson($this.EnableTeam)), `"InlineAlertPolicyCustomization`":$($this.BoolToJson($this.InlineAlertPolicyCustomization))$notificationDetailsValue}"
        $intelligentDetectionValue = "{`"FileVolCutoffLimits`":`"$($this.FileVolCutoffLimits)`", `"AlertVolume`":`"$($this.AlertVolume)`", `"MDATPTriageStatus`": `"$($MDATPTriageStatusValue)`"}"

        $tenantSettingsValue = "{`"Region`":`"WW`", `"FeatureSettings`":$($featureSettingsValue), " + `
            "`"IntelligentDetections`":$($intelligentDetectionValue)"
        if ($null -ne $this.AdaptiveProtectionEnabled)
        {
            Write-Verbose -Message 'Adding Adaptive Protection setting to the set parameters.'
            $AdaptiveProtectionActivatonStatus = 1
            if ($this.AdaptiveProtectionEnabled)
            {
                $AdaptiveProtectionActivatonStatus = 0
            }
            $dynamicRiskPreventionSettings = "{`"RetainSeverityAfterTriage`":$($this.BoolToJson($this.RetainSeverityAfterTriage)),`"ProfileInScopeTimeSpan`":$($this.NumberToJson($this.ProfileInscopeTimeSpan)), `"LookbackTimeSpan`":$($this.NumberToJson($this.LookbackTimeSpan)), `"DynamicRiskScenarioSettings`":[{`"ActivationStatus`":$AdaptiveProtectionActivatonStatus"
            $dynamicRiskPreventionSettings += ", `"HighProfile`":{`"ProfileSourceType`":$($this.NumberToJson($this.AdaptiveProtectionHighProfileSourceType)), `"ConfirmedIssueSeverity`":$($this.NumberToJson($this.AdaptiveProtectionHighProfileConfirmedIssueSeverity)), `"GeneratedIssueSeverity`":$($this.NumberToJson($this.AdaptiveProtectionHighProfileGeneratedIssueSeverity)), `"InsightSeverity`": $($this.NumberToJson($this.AdaptiveProtectionHighProfileInsightSeverity)), `"InsightCount`": $($this.NumberToJson($this.AdaptiveProtectionHighProfileInsightCount)), `"InsightTypes`": $(ConvertTo-Json -InputObject $this.AdaptiveProtectionHighProfileInsightTypes -Compress), `"ConfirmedIssue`": $($this.BoolToJson($this.AdaptiveProtectionHighProfileConfirmedIssue))}"
            $dynamicRiskPreventionSettings += ", `"MediumProfile`":{`"ProfileSourceType`":$($this.NumberToJson($this.AdaptiveProtectionMediumProfileSourceType)), `"ConfirmedIssueSeverity`":$($this.NumberToJson($this.AdaptiveProtectionMediumProfileConfirmedIssueSeverity)), `"GeneratedIssueSeverity`":$($this.NumberToJson($this.AdaptiveProtectionMediumProfileGeneratedIssueSeverity)), `"InsightSeverity`": $($this.NumberToJson($this.AdaptiveProtectionMediumProfileInsightSeverity)), `"InsightCount`": $($this.NumberToJson($this.AdaptiveProtectionMediumProfileInsightCount)), `"InsightTypes`": $(ConvertTo-Json -InputObject $this.AdaptiveProtectionMediumProfileInsightTypes -Compress), `"ConfirmedIssue`": $($this.BoolToJson($this.AdaptiveProtectionMediumProfileConfirmedIssue))}"
            $dynamicRiskPreventionSettings += ", `"LowProfile`":{`"ProfileSourceType`":$($this.NumberToJson($this.AdaptiveProtectionLowProfileSourceType)), `"ConfirmedIssueSeverity`":$($this.NumberToJson($this.AdaptiveProtectionLowProfileConfirmedIssueSeverity)), `"GeneratedIssueSeverity`":$($this.NumberToJson($this.AdaptiveProtectionLowProfileGeneratedIssueSeverity)), `"InsightSeverity`": $($this.NumberToJson($this.AdaptiveProtectionLowProfileInsightSeverity)), `"InsightCount`": $($this.NumberToJson($this.AdaptiveProtectionLowProfileInsightCount)), `"InsightTypes`": $(ConvertTo-Json -InputObject $this.AdaptiveProtectionLowProfileInsightTypes -Compress), `"ConfirmedIssue`": $($this.BoolToJson($this.AdaptiveProtectionLowProfileConfirmedIssue))}"
            $dynamicRiskPreventionSettings += '}]}'
            $tenantSettingsValue += ", `"DynamicRiskPreventionSettings`":$dynamicRiskPreventionSettings"
        }
        if ($null -ne $this.IRASettingsEnabled -or $null -ne $this.EmailSignatureExclusionSettingsEnabled -or $null -ne $this.UserAnalyticsSettingsEnabled)
        {
            $tenantSettingsValue += ", `"InterpretedSettings`":{"
            if ($null -ne $this.IRASettingsEnabled)
            {
                $tenantSettingsValue += "`"IRASettings`":{`"Enabled`":$($this.BoolToJson($this.IRASettingsEnabled))},"
            }
            if ($null -ne $this.EmailSignatureExclusionSettingsEnabled)
            {
                $tenantSettingsValue += "`"EmailSignatureExclusionSettings`":{`"Enabled`":$($this.BoolToJson($this.EmailSignatureExclusionSettingsEnabled))},"
            }
            if ($null -ne $this.UserAnalyticsSettingsEnabled)
            {
                $tenantSettingsValue += "`"UserAnalyticsSettings`":{`"Enabled`":$($this.BoolToJson($this.UserAnalyticsSettingsEnabled))}"
            }
            $tenantSettingsValue = $tenantSettingsValue.TrimEnd(',')
            $tenantSettingsValue += "}"
        }
        # NotificationPreferences
        if ($null -ne $this.AnalyticsNewInsightEnabled -or $null -ne $this.AnalyticsTurnedOffEnabled -or $null -ne $this.HighSeverityAlertsEnabled -or $null -ne $this.PoliciesHealthEnabled)
        {
            $tenantSettingsValue += ", `"NotificationPreferences`":["
            if ($this.AnalyticsNewInsightEnabled)
            {
                $tenantSettingsValue += "{`"NotificationType`":`"AnalyticsNewInsight`",`"Enabled`":$($this.BoolToJson($this.AnalyticsNewInsightEnabled)), `"RoleGroups`":[`"InsiderRiskManagement`",`"InsiderRiskManagementAdmins`"]},"
            }
            if ($this.AnalyticsTurnedOffEnabled)
            {
                $tenantSettingsValue += "{`"NotificationType`":`"AnalyticsTurnedOff`",`"Enabled`":$($this.BoolToJson($this.AnalyticsTurnedOffEnabled)), `"RoleGroups`":[`"InsiderRiskManagement`",`"InsiderRiskManagementAdmins`"]},"
            }
            if ($this.HighSeverityAlertsEnabled)
            {
                $tenantSettingsValue += "{`"NotificationType`":`"HighSeverityAlerts`",`"Enabled`":$($this.BoolToJson($this.HighSeverityAlertsEnabled)),`"RoleGroups`":$(ConvertTo-Json -InputObject $this.HighSeverityAlertsRoleGroups -Compress)},"
            }
            if ($this.PoliciesHealthEnabled)
            {
                $tenantSettingsValue += "{`"NotificationType`":`"PoliciesHealth`",`"Enabled`":$($this.BoolToJson($this.PoliciesHealthEnabled)),`"RoleGroups`":$(ConvertTo-Json -InputObject $this.PoliciesHealthRoleGroups -Compress)}"
            }
            $tenantSettingsValue = $tenantSettingsValue.TrimEnd(',')
            $tenantSettingsValue += "]"
        }

        $tenantSettingsValue += '}'

        # CREATE
        if ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
        {
            Write-Verbose -Message "Creating new Insider Risk Policy {$($this.Name)} with values:`r`nIndicators: $($indicatorValues)`r`n`r`nExtensibleIndicators: $($extensibleIndicatorsValues)`r`n`r`nTenantSettings: $($tenantSettingsValue)`r`n`r`nSessionRecordingSettings: $($sessionRecordingValues)"
            New-InsiderRiskPolicy -Name $this.Name -InsiderRiskScenario $this.InsiderRiskScenario `
                -Indicators $indicatorValues `
                -ExtensibleIndicators $extensibleIndicatorsValues `
                -TenantSetting $tenantSettingsValue `
                -HistoricTimeSpan $this.HistoricTimeSpan `
                -InScopeTimeSpan $this.InScopeTimeSpan `
                -SessionRecordingSettings $sessionRecordingValues
        }
        # UPDATE
        elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Updating existing Insider Risk Policy {$($this.Name)} with values:`r`nIndicators: $($indicatorValues)`r`n`r`nExtensibleIndicators: $($extensibleIndicatorsValues)`r`n`r`nTenantSettings: $($tenantSettingsValue)`r`n`r`nSessionRecordingSettings: $($sessionRecordingValues)"

            if ($this.InsiderRiskScenario -eq 'SessionRecordingSetting')
            {
                $sessionRecordingValues = "{`"RecordingMode`":`"EventDriven`", `"RecordingTimeframePreEventInSec`":$($this.RecordingTimeframePreEventInSec),`"RecordingTimeframePostEventInSec`":$($this.RecordingTimeframePostEventInSec),`"BandwidthCapInMb`":$($this.BandwidthCapInMb),`"OfflineRecordingStorageLimitInMb`":$($this.OfflineRecordingStorageLimitInMb),`"ClipDeletionEnabled`":$($this.BoolToJson($this.ClipDeletionEnabled)),`"Enabled`":$($this.BoolToJson($this.SessionRecordingEnabled)),`"FpsNumerator`":0,`"FpsDenominator`":0, `"GPUUtilizationLimit`": $($this.NumberToJson($this.GPUUtilizationLimit)), `"CPUUtilizationLimit`": $($this.NumberToJson($this.CPUUtilizationLimit))}"
                Write-Verbose -Message 'Updating Session Recording Settings'
                Set-InsiderRiskPolicy -Identity $this.Name -SessionRecordingSettings $sessionRecordingValues | Out-Null
            }
            else
            {
                Set-InsiderRiskPolicy -Identity $this.Name -Indicators $indicatorValues `
                    -ExtensibleIndicators $extensibleIndicatorsValues `
                    -TenantSetting $tenantSettingsValue `
                    -HistoricTimeSpan $this.HistoricTimeSpan `
                    -InScopeTimeSpan $this.InScopeTimeSpan
            }
        }
        # REMOVE
        elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Removing Insider Risk Policy {$($this.Name)}"
            Remove-InsiderRiskPolicy -Identity $this.Name -Confirm:$false
        }
    }

    [bool] Test()
    {
        return ([M365DSCResourceBase] $this).Test()
    }

    [string] Export()
    {
        if ($this.RequiresPowerShellCore())
        {
            return [string] $this.InvokeInPowerShellCore('Export')
        }

        $ConnectionMode = $this.Connect('SecurityComplianceCenter')

        #Ensure the proper dependencies are installed in the current environment.
        Confirm-M365DSCDependencies

        #region Telemetry
        $this.AddTelemetry('Export')
        #endregion

        try
        {
            [array] $exportedInstances = Get-InsiderRiskPolicy -ErrorAction Stop

            $dscContent = [System.Text.StringBuilder]::new()
            $i = 1
            if ($exportedInstances.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }
            foreach ($config in $exportedInstances)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }
                $displayedKey = $config.Name
                Write-M365DSCHost -Message "    |---[$i/$($exportedInstances.Count)] $displayedKey" -DeferWrite
                $params = @{
                    Name                  = $config.Name
                    InsiderRiskScenario   = $config.InsiderRiskScenario
                    Credential            = $this.Credential
                    ApplicationId         = $this.ApplicationId
                    TenantId              = $this.TenantId
                    CertificateThumbprint = $this.CertificateThumbprint
                    CertificatePath       = $this.CertificatePath
                    CertificatePassword   = $this.CertificatePassword
                    ManagedIdentity       = $this.ManagedIdentity
                    AccessTokens          = $this.AccessTokens
                }

                $this.ExportedInstance = $config
                $Results = $this.GetForExport($Params)

                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential
                [void]$dscContent.Append($currentDSCBlock)
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
                $i++
            }
            return $dscContent.ToString()
        }
        catch
        {
            $this.LogError($_, 'Error during Export:')

            throw
        }
    }

    hidden [SCInsiderRiskPolicy] AsResult([System.Object] $Values)
    {
        if ($Values -is [SCInsiderRiskPolicy])
        {
            return $Values
        }

        $result = [SCInsiderRiskPolicy]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}
