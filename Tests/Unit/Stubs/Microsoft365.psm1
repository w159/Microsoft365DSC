#region ExchangeOnlineManagement
function Get-DefaultTenantBriefingConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [PSObject]
        $ResultSize
    )
}
function Get-DefaultTenantMyAnalyticsFeatureConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [PSObject]
        $ResultSize
    )
}
function Set-DefaultTenantBriefingConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $IsEnabledByDefault,

        [Parameter()]
        [PSObject]
        $ResultSize
    )
}
function Set-DefaultTenantMyAnalyticsFeatureConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Feature,

        [Parameter()]
        [System.Boolean]
        $IsEnabled,

        [Parameter()]
        [PSObject]
        $ResultSize,

        [Parameter()]
        [System.Nullable`1[System.Double]]
        $SamplingRate
    )
}
#endregion
#region ExchangeOnlineManagement
function Add-AvailabilityAddressSpace
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credentials,

        [Parameter()]
        [System.String]
        $ForestName,

        [Parameter()]
        [System.Uri]
        $TargetAutodiscoverEpr,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $TargetTenantId,

        [Parameter()]
        [System.String]
        $TargetServiceEpr,

        [Parameter()]
        [System.Object]
        $AccessMethod
    )
}
function Add-MailboxFolderPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object[]]
        $AccessRights,

        [Parameter()]
        [System.Object]
        $SharingPermissionFlags,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $SendNotificationToUser
    )
}
function Add-MailboxPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object[]]
        $AccessRights,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GroupMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Deny,

        [Parameter()]
        [System.Object]
        $AutoMapping,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Owner,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDefaultScope,

        [Parameter()]
        [System.DirectoryServices.ActiveDirectorySecurityInheritance]
        $InheritanceType
    )
}
function Add-RecipientPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $AccessRights,

        [Parameter()]
        [System.Object]
        $Trustee,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Add-RoleGroupMember
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck,

        [Parameter()]
        [System.Object]
        $Member
    )
}
function Disable-ATPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Disable-EOPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Enable-ATPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Enable-EOPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Enable-OrganizationCustomization
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Get-AcceptedDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-ActiveSyncDevice
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-ActiveSyncDeviceAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-ActiveSyncMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-AddressBookPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-AddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SearchText,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Container
    )
}
function Get-AdminAuditLogConfig
{
    [CmdletBinding()]
    param(

    )
}
function Get-AdministrativeUnit
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-AntiPhishPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Impersonation,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Advanced,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Spoof
    )
}
function Get-AntiPhishRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-App
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $OrganizationApp,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PrivateCatalog
    )
}
function Get-ApplicationAccessPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-ArcConfig
{
    [CmdletBinding()]
    param(

    )
}
function Get-ATPBuiltInProtectionRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-AtpPolicyForO365
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-ATPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-AuditConfig
{
    [CmdletBinding()]
    param(

    )
}
function Get-AuditConfigurationPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-AuthenticationPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowLegacyExchangeTokens
    )
}
function Get-AvailabilityAddressSpace
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-AvailabilityConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-CalendarProcessing
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-CASMailbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RecalculateHasActiveSyncDevicePartnership,

        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ProtocolSettings,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ReadIsOptimizedForAccessibility,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ActiveSyncDebugLogging,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDefaultScope,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ActiveSyncSuppressReadReceipt,

        [Parameter()]
        [System.String]
        $Anr
    )
}
function Get-CASMailboxPlan
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDefaultScope,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter
    )
}
function Get-ClientAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Get-ComplianceTag
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludingLabelState,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-DataClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ClassificationRuleCollectionIdentity
    )
}
function Get-DataEncryptionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Get-DeviceConditionalAccessPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-DeviceConditionalAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-DeviceConfigurationPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-DeviceConfigurationRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-DistributionGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $Anr,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromSendersOrMembersWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromDLMembersWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.String[]]
        $Properties,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Async,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeBypassModerationFromSendersOrMembersWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeGrantSendOnBehalfToWithDisplayNames,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Object]
        $ManagedBy,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeModeratedByWithDisplayNames
    )
}
function Get-DistributionGroupMember
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeSoftDeletedObjects,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-DkimSigningConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-DnssecStatusForVerifiedDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipMtaStsValidation,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipMxValidation,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipDnsValidation,

        [Parameter()]
        [System.String]
        $DomainName
    )
}
function Get-EmailAddressPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-EmailTenantSettings
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-EOPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-ExoPhishSimOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Policy,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Get-ExoSecOpsOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Policy,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Get-ExternalInOutlook
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-FocusedInbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-GlobalAddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $DefaultOnly
    )
}
function Get-Group
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.String]
        $Anr
    )
}
function Get-HostedConnectionFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-HostedContentFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-HostedContentFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-HostedOutboundSpamFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-HostedOutboundSpamFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-InboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-IntraOrganizationConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-IRMConfiguration
{
    [CmdletBinding()]
    param(

    )
}
function Get-JournalRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-M365DataAtRestEncryptionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Get-M365DataAtRestEncryptionPolicyAssignment
{
    [CmdletBinding()]
    param(

    )
}
function Get-Mailbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $InactiveMailboxOnly,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.String]
        $Anr,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Archive,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SoftDeletedMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromSendersOrMembersWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromDLMembersWithDisplayNames,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object]
        $MailboxPlan,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Migration,

        [Parameter()]
        [System.String[]]
        $Properties,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Async,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeGrantSendOnBehalfToWithDisplayNames,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GroupMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeInactiveMailbox,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeEmailAddressDisplayNames
    )
}
function Get-MailboxAuditBypassAssociation
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-MailboxAutoReplyConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-MailboxCalendarConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $MailboxLocation,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-MailboxCalendarFolder
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-MailboxFolderPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $SkipCount,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GroupMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-MailboxFolderStatistics
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Database,

        [Parameter()]
        [System.String]
        $DiagnosticInfo,

        [Parameter()]
        [System.Object]
        $StoreMailboxIdentity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeOldestAndNewestItems,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Archive,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeSoftDeletedRecipients,

        [Parameter()]
        [System.Int32]
        $SkipCount,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAnalysis,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object]
        $FolderScope,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-MailboxIRMAccess
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-MailboxPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ReadFromDomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeUnresolvedPermissions,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GroupMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeSoftDeletedUserPermissions,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Owner,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SoftDeletedMailbox,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-MailboxPlan
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDefaultScope,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllMailboxPlanReleases
    )
}
function Get-MailboxRegionalConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $VerifyDefaultFolderNameLanguage,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Archive,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $MailboxLocation
    )
}
function Get-MailContact
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.String]
        $Anr
    )
}
function Get-MalwareFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-MalwareFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-ManagementRole
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RoleType,

        [Parameter()]
        [System.String[]]
        $CmdletParameters,

        [Parameter()]
        [System.String[]]
        $ScriptParameters,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $Cmdlet,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Recurse,

        [Parameter()]
        [System.String]
        $Script,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GetChildren
    )
}
function Get-ManagementRoleAssignment
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RoleAssigneeType,

        [Parameter()]
        [System.Object]
        $CustomRecipientWriteScope,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $RecipientGroupScope,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Object]
        $RecipientWriteScope,

        [Parameter()]
        [System.Object]
        $WritableRecipient,

        [Parameter()]
        [System.Object]
        $ConfigWriteScope,

        [Parameter()]
        [System.Boolean]
        $Delegating,

        [Parameter()]
        [System.Boolean]
        $Exclusive,

        [Parameter()]
        [System.Object[]]
        $AssignmentMethod,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GetEffectiveUsers,

        [Parameter()]
        [System.Object]
        $Role,

        [Parameter()]
        [System.Object]
        $RecipientAdministrativeUnitScope,

        [Parameter()]
        [System.Object]
        $ExclusiveRecipientWriteScope,

        [Parameter()]
        [System.Object]
        $RecipientOrganizationalUnitScope,

        [Parameter()]
        [System.Object]
        $RoleAssignee
    )
}
function Get-ManagementRoleEntry
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object[]]
        $Type,

        [Parameter()]
        [System.String]
        $PSSnapinName,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String[]]
        $Parameters,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-ManagementScope
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $Exclusive,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Orphan
    )
}
function Get-MessageClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeLocales
    )
}
function Get-MigrationBatch
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $DiagnosticInfo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeReport,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Partition,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object]
        $Status,

        [Parameter()]
        [System.Object]
        $Endpoint
    )
}
function Get-MigrationEndpoint
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $DiagnosticInfo,

        [Parameter()]
        [System.Object]
        $Type,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Partition
    )
}
function Get-MigrationUser
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $EmailAddress,

        [Parameter()]
        [System.Object]
        $MailboxGuid,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAssociatedUsers,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $BatchId,

        [Parameter()]
        [System.Object]
        $Partition,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object]
        $Status,

        [Parameter()]
        [System.Object]
        $StatusSummary
    )
}
function Get-MobileDevice
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $OWAforDevices,

        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UniversalOutlook,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ActiveSync,

        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RestApi,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter
    )
}
function Get-MobileDeviceMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-OfflineAddressBook
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-OMEConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-OnPremisesOrganization
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-OrganizationConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RetrieveEwsOperationAccessPolicy
    )
}
function Get-OrganizationRelationship
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-OutboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $IncludeTestModeConnectors,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Boolean]
        $IsTransportRuleScoped
    )
}
function Get-OwaMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-PartnerApplication
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-PerimeterConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-Place
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Type,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-PolicyConfig
{
    [CmdletBinding()]
    param(

    )
}
function Get-PolicyTipConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Action,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Original,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $Locale,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-ProtectionAlert
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-QuarantinePolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $QuarantinePolicyType
    )
}
function Get-Recipient
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $RecipientPreviewFilter,

        [Parameter()]
        [System.String]
        $Anr,

        [Parameter()]
        [System.String]
        $BookmarkDisplayName,

        [Parameter()]
        [System.Object]
        $Capabilities,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.String[]]
        $Properties,

        [Parameter()]
        [System.Object]
        $PropertySet,

        [Parameter()]
        [System.Object]
        $AuthenticationType,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeSoftDeletedRecipients,

        [Parameter()]
        [System.Object[]]
        $RecipientType,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Boolean]
        $IncludeBookmarkObject
    )
}
function Get-RecipientPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ReadFromDomainController,

        [Parameter()]
        [System.Object]
        $AccessRights,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Object]
        $Trustee
    )
}
function Get-RemoteDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-ReportSubmissionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-ReportSubmissionRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-ResourceConfig
{
    [CmdletBinding()]
    param(

    )
}
function Get-RetentionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-RoleAssignmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-RoleGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ShowPartnerLinked,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-RoleGroupMember
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-SafeAttachmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-SafeAttachmentRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-SafeLinksPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-SafeLinksRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $State
    )
}
function Get-ServicePrincipal
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Organization
    )
}
function Get-SharingPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-SupervisoryReviewPolicyV2
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-SupervisoryReviewRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Policy
    )
}
function Get-SweepRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $SkipCount,

        [Parameter()]
        [System.String]
        $Provider,

        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassScopeCheck,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ResultSize
    )
}
function Get-TenantAllowBlockListItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.DateTime]
        $ExpirationDate,

        [Parameter()]
        [System.Object[]]
        $ListSubType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Block,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $OutputJson,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $NoExpiration,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Allow,

        [Parameter()]
        [System.String]
        $Entry,

        [Parameter()]
        [System.Object]
        $ListType
    )
}
function Get-TenantAllowBlockListSpoofItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Action,

        [Parameter()]
        [System.String]
        $SpoofType,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-TransportConfig
{
    [CmdletBinding()]
    param(

    )
}
function Get-TransportRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $DlpPolicy,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.Boolean]
        $ExcludeConditionActionDetails,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Object]
        $State,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Get-UnifiedGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeGrantSendOnBehalfToWithDisplayNames,

        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeSoftDeletedGroups,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAcceptMessagesOnlyFromSendersOrMembersWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeModeratedByWithDisplayNames,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeAllProperties,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeBypassModerationFromSendersOrMembersWithDisplayNames,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeRejectMessagesFromSendersOrMembersWithDisplayNames,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.String]
        $Anr
    )
}
function Get-User
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SortBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsVIP,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $RecipientTypeDetails,

        [Parameter()]
        [System.Object]
        $ResultSize,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.String]
        $Anr
    )
}
function New-ActiveSyncDeviceAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $QueryString,

        [Parameter()]
        [System.Object]
        $Characteristic,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $AccessLevel
    )
}
function New-ActiveSyncMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $AllowUnsignedApplications,

        [Parameter()]
        [System.Boolean]
        $AllowUnsignedInstallationPackages,

        [Parameter()]
        [System.Boolean]
        $AllowExternalDeviceManagement,

        [Parameter()]
        [System.Boolean]
        $AllowIrDA,

        [Parameter()]
        [System.Boolean]
        $AllowStorageCard,

        [Parameter()]
        [System.Boolean]
        $AllowNonProvisionableDevices,

        [Parameter()]
        [System.Boolean]
        $AllowRemoteDesktop,

        [Parameter()]
        [System.Object]
        $UnapprovedInROMApplicationList,

        [Parameter()]
        [System.Boolean]
        $DevicePasswordEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireEncryptedSMIMEMessages,

        [Parameter()]
        [System.Int32]
        $DevicePasswordHistory,

        [Parameter()]
        [System.Boolean]
        $RequireDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $AllowInternetSharing,

        [Parameter()]
        [System.Int32]
        $MinDevicePasswordComplexCharacters,

        [Parameter()]
        [System.Object]
        $RequireSignedSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $MaxEmailHTMLBodyTruncationSize,

        [Parameter()]
        [System.Object]
        $DevicePasswordExpiration,

        [Parameter()]
        [System.Boolean]
        $UNCAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowCamera,

        [Parameter()]
        [System.Object]
        $MaxDevicePasswordFailedAttempts,

        [Parameter()]
        [System.Boolean]
        $AllowBrowser,

        [Parameter()]
        [System.Boolean]
        $RequireManualSyncWhenRoaming,

        [Parameter()]
        [System.Object]
        $AllowSMIMEEncryptionAlgorithmNegotiation,

        [Parameter()]
        [System.Boolean]
        $DeviceEncryptionEnabled,

        [Parameter()]
        [System.Object]
        $MaxEmailBodyTruncationSize,

        [Parameter()]
        [System.Object]
        $AllowBluetooth,

        [Parameter()]
        [System.Object]
        $RequireEncryptionSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $DevicePolicyRefreshInterval,

        [Parameter()]
        [System.Boolean]
        $AllowMobileOTAUpdate,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $MaxAttachmentSize,

        [Parameter()]
        [System.Boolean]
        $AllowConsumerEmail,

        [Parameter()]
        [System.Boolean]
        $AllowDesktopSync,

        [Parameter()]
        [System.Object]
        $MaxInactivityTimeDeviceLock,

        [Parameter()]
        [System.Boolean]
        $AlphanumericDevicePasswordRequired,

        [Parameter()]
        [System.Boolean]
        $RequireStorageCardEncryption,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AttachmentsEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowSMIMESoftCerts,

        [Parameter()]
        [System.Object]
        $MaxEmailAgeFilter,

        [Parameter()]
        [System.Boolean]
        $AllowSimpleDevicePassword,

        [Parameter()]
        [System.Boolean]
        $PasswordRecoveryEnabled,

        [Parameter()]
        [System.Object]
        $MaxCalendarAgeFilter,

        [Parameter()]
        [System.Boolean]
        $AllowWiFi,

        [Parameter()]
        [System.Boolean]
        $AllowApplePushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowPOPIMAPEmail,

        [Parameter()]
        [System.Boolean]
        $IsDefault,

        [Parameter()]
        [System.Boolean]
        $IsDefaultPolicy,

        [Parameter()]
        [System.Object]
        $ApprovedApplicationList,

        [Parameter()]
        [System.Boolean]
        $AllowTextMessaging,

        [Parameter()]
        [System.Boolean]
        $WSSAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireSignedSMIMEMessages,

        [Parameter()]
        [System.Boolean]
        $AllowHTMLEmail,

        [Parameter()]
        [System.Object]
        $MinDevicePasswordLength,

        [Parameter()]
        [System.Boolean]
        $IrmEnabled
    )
}
function New-AddressBookPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RoomList,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $GlobalAddressList,

        [Parameter()]
        [System.Object[]]
        $AddressLists,

        [Parameter()]
        [System.Object]
        $OfflineAddressBook
    )
}
function New-AddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.Object]
        $IncludedRecipients,

        [Parameter()]
        [System.Object]
        $ConditionalCompany,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.Object]
        $Container,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.Object]
        $ConditionalDepartment,

        [Parameter()]
        [System.Object]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute11,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute1,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute5
    )
}
function New-AntiPhishPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $EnableFirstContactSafetyTips,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeDefault,

        [Parameter()]
        [System.Int32]
        $PhishThresholdLevel,

        [Parameter()]
        [System.Boolean]
        $EnableTargetedUserProtection,

        [Parameter()]
        [System.Boolean]
        $EnableTargetedDomainsProtection,

        [Parameter()]
        [System.Boolean]
        $HonorDmarcPolicy,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Boolean]
        $EnableViaTag,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $TargetedDomainsToProtect,

        [Parameter()]
        [System.Boolean]
        $EnableSpoofIntelligence,

        [Parameter()]
        [System.Boolean]
        $EnableSimilarUsersSafetyTips,

        [Parameter()]
        [System.Object]
        $ExcludedDomains,

        [Parameter()]
        [System.Object]
        $MailboxIntelligenceProtectionAction,

        [Parameter()]
        [System.Object]
        $MailboxIntelligenceProtectionActionRecipients,

        [Parameter()]
        [System.Object]
        $TargetedDomainActionRecipients,

        [Parameter()]
        [System.Object]
        $DmarcQuarantineAction,

        [Parameter()]
        [System.String]
        $TargetedDomainQuarantineTag,

        [Parameter()]
        [System.String]
        $SimilarUsersSafetyTipsCustomText,

        [Parameter()]
        [System.Object]
        $ImpersonationProtectionState,

        [Parameter()]
        [System.Boolean]
        $EnableOrganizationDomainsProtection,

        [Parameter()]
        [System.Object]
        $TargetedDomainProtectionAction,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $TargetedUsersToProtect,

        [Parameter()]
        [System.Object]
        $TargetedUserProtectionAction,

        [Parameter()]
        [System.Object]
        $RecommendedPolicyType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $MailboxIntelligenceQuarantineTag,

        [Parameter()]
        [System.String]
        $UnusualCharactersSafetyTipsCustomText,

        [Parameter()]
        [System.Boolean]
        $EnableSimilarDomainsSafetyTips,

        [Parameter()]
        [System.String]
        $SpoofQuarantineTag,

        [Parameter()]
        [System.Boolean]
        $EnableUnauthenticatedSender,

        [Parameter()]
        [System.Object]
        $DmarcRejectAction,

        [Parameter()]
        [System.String]
        $PolicyTag,

        [Parameter()]
        [System.String]
        $TargetedUserQuarantineTag,

        [Parameter()]
        [System.Object]
        $ExcludedSubDomains,

        [Parameter()]
        [System.Boolean]
        $EnableMailboxIntelligenceProtection,

        [Parameter()]
        [System.Boolean]
        $EnableUnusualCharactersSafetyTips,

        [Parameter()]
        [System.Boolean]
        $EnableMailboxIntelligence,

        [Parameter()]
        [System.Object]
        $AuthenticationFailAction,

        [Parameter()]
        [System.Object]
        $TargetedUserActionRecipients,

        [Parameter()]
        [System.Object]
        $ExcludedSenders
    )
}
function New-AntiPhishRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object]
        $AntiPhishPolicy,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-App
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowReadWriteMailbox,

        [Parameter()]
        [System.Uri]
        $Url,

        [Parameter()]
        [System.IO.Stream]
        $FileStream,

        [Parameter()]
        [System.Byte[]]
        $FileData
    )
}
function New-ApplicationAccessPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Object]
        $PolicyScopeGroupId,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $AccessRight,

        [Parameter()]
        [System.String[]]
        $AppId
    )
}
function New-ATPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $SafeAttachmentPolicy,

        [Parameter()]
        [System.Object]
        $SafeLinksPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-AuthenticationPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthPop,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthSmtp,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthMapi,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthImap,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthAutodiscover,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthPowershell,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthRpc,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthOfflineAddressBook,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthReportingWebServices,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthOutlookService,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthActiveSync,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowBasicAuthWebServices
    )
}
function New-AvailabilityConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $OrgWideAccount,

        [Parameter()]
        [System.Object]
        $AllowedTenantIds
    )
}
function New-ClientAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $ExceptAnyOfClientIPAddressesOrRanges,

        [Parameter()]
        [System.Object]
        $Action,

        [Parameter()]
        [System.Object]
        $AnyOfClientIPAddressesOrRanges,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $UserRecipientFilter,

        [Parameter()]
        [System.Object]
        $ExceptAnyOfProtocols,

        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.Object]
        $ExceptUsernameMatchesAnyOfPatterns,

        [Parameter()]
        [System.Object]
        $UsernameMatchesAnyOfPatterns,

        [Parameter()]
        [System.Object]
        $AnyOfAuthenticationTypes,

        [Parameter()]
        [System.Object]
        $AnyOfProtocols,

        [Parameter()]
        [System.Object]
        $ExceptAnyOfAuthenticationTypes,

        [Parameter()]
        [System.Object]
        $Scope
    )
}
function New-DataEncryptionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $AzureKeyIDs,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-DistributionGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.Boolean]
        $RequireSenderAuthenticationEnabled,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Object]
        $MemberDepartRestriction,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreNamingPolicy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RoomList,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $HiddenGroupMembershipEnabled,

        [Parameter()]
        [System.Boolean]
        $BypassNestedModerationEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $CopyOwnerToMember,

        [Parameter()]
        [System.Boolean]
        $BccBlocked,

        [Parameter()]
        [System.Object]
        $Members,

        [Parameter()]
        [System.Object]
        $Description,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Notes,

        [Parameter()]
        [System.Object]
        $MemberJoinRestriction,

        [Parameter()]
        [System.Object]
        $Type,

        [Parameter()]
        [System.Object]
        $ManagedBy,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.Object]
        $PrimarySmtpAddress,

        [Parameter()]
        [System.Object]
        $SendModerationNotifications,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit
    )
}
function New-DkimSigningConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $BodyCanonicalization,

        [Parameter()]
        [System.Object]
        $HeaderCanonicalization,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.UInt16]
        $KeySize,

        [Parameter()]
        [System.Object]
        $DomainName,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-EmailAddressPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $EnabledEmailAddressTemplates,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $EnabledPrimarySMTPAddressTemplate,

        [Parameter()]
        [System.String]
        $ManagedByFilter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IncludeUnifiedGroupRecipients
    )
}
function New-ExoPhishSimOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $SenderIpRanges,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Domains,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Object]
        $Policy
    )
}
function New-ExoSecOpsOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $Policy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function New-GlobalAddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.Object]
        $IncludedRecipients,

        [Parameter()]
        [System.Object]
        $ConditionalCompany,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.Object]
        $ConditionalDepartment,

        [Parameter()]
        [System.Object]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute11,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute1,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute5
    )
}
function New-HostedConnectionFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $ConfigurationXmlRaw,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Boolean]
        $EnableSafeList,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $IPBlockList,

        [Parameter()]
        [System.Object]
        $IPAllowList
    )
}
function New-HostedContentFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $InlineSafetyTipsEnabled,

        [Parameter()]
        [System.Object]
        $RegionBlockList,

        [Parameter()]
        [System.String]
        $HighConfidencePhishQuarantineTag,

        [Parameter()]
        [System.Int32]
        $EndUserSpamNotificationFrequency,

        [Parameter()]
        [System.Int32]
        $QuarantineRetentionPeriod,

        [Parameter()]
        [System.Int32]
        $EndUserSpamNotificationLimit,

        [Parameter()]
        [System.Int32]
        $BulkThreshold,

        [Parameter()]
        [System.Object]
        $TestModeBccToRecipients,

        [Parameter()]
        [System.String]
        $PhishQuarantineTag,

        [Parameter()]
        [System.String]
        $AddXHeaderValue,

        [Parameter()]
        [System.Object]
        $MarkAsSpamEmbedTagsInHtml,

        [Parameter()]
        [System.Object]
        $MarkAsSpamFramesInHtml,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithImageLinks,

        [Parameter()]
        [System.Boolean]
        $EnableLanguageBlockList,

        [Parameter()]
        [System.Object]
        $PhishSpamAction,

        [Parameter()]
        [System.String]
        $EndUserSpamNotificationCustomFromName,

        [Parameter()]
        [System.Object]
        $MarkAsSpamSensitiveWordList,

        [Parameter()]
        [System.String]
        $SpamQuarantineTag,

        [Parameter()]
        [System.Object]
        $MarkAsSpamNdrBackscatter,

        [Parameter()]
        [System.Object]
        $BlockedSenders,

        [Parameter()]
        [System.Object]
        $LanguageBlockList,

        [Parameter()]
        [System.Object]
        $HighConfidenceSpamAction,

        [Parameter()]
        [System.Object]
        $AllowedSenderDomains,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithBizOrInfoUrls,

        [Parameter()]
        [System.Object]
        $MarkAsSpamWebBugsInHtml,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $IntraOrgFilterState,

        [Parameter()]
        [System.Object]
        $MarkAsSpamFromAddressAuthFail,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $MarkAsSpamEmptyMessages,

        [Parameter()]
        [System.String]
        $BulkQuarantineTag,

        [Parameter()]
        [System.Object]
        $MarkAsSpamFormTagsInHtml,

        [Parameter()]
        [System.Object]
        $MarkAsSpamObjectTagsInHtml,

        [Parameter()]
        [System.Object]
        $BulkSpamAction,

        [Parameter()]
        [System.Object]
        $EndUserSpamNotificationLanguage,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithRedirectToOtherPort,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $HighConfidencePhishAction,

        [Parameter()]
        [System.Object]
        $RedirectToRecipients,

        [Parameter()]
        [System.Boolean]
        $SpamZapEnabled,

        [Parameter()]
        [System.Object]
        $TestModeAction,

        [Parameter()]
        [System.Boolean]
        $EnableRegionBlockList,

        [Parameter()]
        [System.String]
        $EndUserSpamNotificationCustomSubject,

        [Parameter()]
        [System.Object]
        $MarkAsSpamSpfRecordHardFail,

        [Parameter()]
        [System.Object]
        $EndUserSpamNotificationCustomFromAddress,

        [Parameter()]
        [System.Boolean]
        $DownloadLink,

        [Parameter()]
        [System.Object]
        $SpamAction,

        [Parameter()]
        [System.String]
        $ModifySubjectValue,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithNumericIps,

        [Parameter()]
        [System.Object]
        $AllowedSenders,

        [Parameter()]
        [System.Object]
        $MarkAsSpamJavaScriptInHtml,

        [Parameter()]
        [System.Object]
        $MarkAsSpamBulkMail,

        [Parameter()]
        [System.Object]
        $BlockedSenderDomains,

        [Parameter()]
        [System.Object]
        $RecommendedPolicyType,

        [Parameter()]
        [System.Boolean]
        $PhishZapEnabled,

        [Parameter()]
        [System.Boolean]
        $EnableEndUserSpamNotifications,

        [Parameter()]
        [System.String]
        $HighConfidenceSpamQuarantineTag
    )
}
function New-HostedContentFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object]
        $HostedContentFilterPolicy,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-HostedOutboundSpamFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RecommendedPolicyType,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $BccSuspiciousOutboundAdditionalRecipients,

        [Parameter()]
        [System.Object]
        $NotifyOutboundSpamRecipients,

        [Parameter()]
        [System.UInt32]
        $RecipientLimitPerDay,

        [Parameter()]
        [System.Object]
        $ActionWhenThresholdReached,

        [Parameter()]
        [System.Object]
        $AutoForwardingMode,

        [Parameter()]
        [System.Boolean]
        $NotifyOutboundSpam,

        [Parameter()]
        [System.Boolean]
        $BccSuspiciousOutboundMail,

        [Parameter()]
        [System.UInt32]
        $RecipientLimitInternalPerHour,

        [Parameter()]
        [System.UInt32]
        $RecipientLimitExternalPerHour
    )
}
function New-HostedOutboundSpamFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromMemberOf,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFrom,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderDomainIs,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $FromMemberOf,

        [Parameter()]
        [System.Object[]]
        $SenderDomainIs,

        [Parameter()]
        [System.Object]
        $HostedOutboundSpamFilterPolicy,

        [Parameter()]
        [System.Object[]]
        $From,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-InboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $RestrictDomainsToIPAddresses,

        [Parameter()]
        [System.Boolean]
        $CloudServicesMailEnabled,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Object]
        $ClientHostNames,

        [Parameter()]
        [System.Object]
        $EFSkipMailGateway,

        [Parameter()]
        [System.Boolean]
        $EFTestMode,

        [Parameter()]
        [System.Object]
        $TrustedOrganizations,

        [Parameter()]
        [System.Object]
        $TlsSenderCertificateName,

        [Parameter()]
        [System.Object]
        $ScanAndDropRecipients,

        [Parameter()]
        [System.Object]
        $AssociatedAcceptedDomains,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Boolean]
        $RequireTls,

        [Parameter()]
        [System.Object]
        $SenderDomains,

        [Parameter()]
        [System.Object]
        $SenderIPAddresses,

        [Parameter()]
        [System.Boolean]
        $EFSkipLastIP,

        [Parameter()]
        [System.Object]
        $EFUsers,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConnectorType,

        [Parameter()]
        [System.Boolean]
        $RestrictDomainsToCertificate,

        [Parameter()]
        [System.Object]
        $EFSkipIPs,

        [Parameter()]
        [System.Boolean]
        $TreatMessagesAsInternal,

        [Parameter()]
        [System.Object]
        $ConnectorSource
    )
}
function New-IntraOrganizationConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $TargetAddressDomains,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function New-M365DataAtRestEncryptionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $AzureKeyIDs,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-Mailbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $MailboxRegion,

        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.String]
        $Office,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Security.SecureString]
        $Password,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $RemovedMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.String]
        $LastName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $TargetAllMDBs,

        [Parameter()]
        [System.Object]
        $RoleAssignmentPolicy,

        [Parameter()]
        [System.Object]
        $ResourceCapacity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Archive,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Equipment,

        [Parameter()]
        [System.String]
        $ImmutableId,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $CopyCustomAttributes,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Scheduling,

        [Parameter()]
        [System.Security.SecureString]
        $RoomMailboxPassword,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Shared,

        [Parameter()]
        [System.Boolean]
        $IsExcludedFromServingHierarchy,

        [Parameter()]
        [System.Object]
        $MailboxPlan,

        [Parameter()]
        [System.Object]
        $MicrosoftOnlineServicesID,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Migration,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Room,

        [Parameter()]
        [System.String]
        $Initials,

        [Parameter()]
        [System.Object]
        $InactiveMailbox,

        [Parameter()]
        [System.String]
        $FederatedIdentity,

        [Parameter()]
        [System.Object]
        $ActiveSyncMailboxPolicy,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $HoldForMigration,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Discovery,

        [Parameter()]
        [System.Boolean]
        $ResetPasswordOnNextLogon,

        [Parameter()]
        [System.Boolean]
        $EnableRoomMailboxAccount,

        [Parameter()]
        [System.String]
        $FirstName,

        [Parameter()]
        [System.String]
        $Phone,

        [Parameter()]
        [System.Object]
        $PrimarySmtpAddress,

        [Parameter()]
        [System.Object]
        $SendModerationNotifications,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.Boolean]
        $RemotePowerShellEnabled
    )
}
function New-MailContact
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.Object]
        $MacAttachmentFormat,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $LastName,

        [Parameter()]
        [System.Boolean]
        $UsePreferMessageFormat,

        [Parameter()]
        [System.Object]
        $MessageBodyFormat,

        [Parameter()]
        [System.String]
        $Initials,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ExternalEmailAddress,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.Object]
        $MessageFormat,

        [Parameter()]
        [System.String]
        $FirstName,

        [Parameter()]
        [System.Object]
        $SendModerationNotifications,

        [Parameter()]
        [System.Object]
        $OrganizationalUnit
    )
}
function New-MalwareFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $CustomFromName,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $CustomExternalBody,

        [Parameter()]
        [System.String]
        $QuarantineTag,

        [Parameter()]
        [System.Boolean]
        $CustomNotifications,

        [Parameter()]
        [System.Boolean]
        $EnableExternalSenderAdminNotifications,

        [Parameter()]
        [System.Object]
        $InternalSenderAdminAddress,

        [Parameter()]
        [System.String[]]
        $FileTypes,

        [Parameter()]
        [System.Boolean]
        $EnableInternalSenderAdminNotifications,

        [Parameter()]
        [System.Object]
        $CustomFromAddress,

        [Parameter()]
        [System.String]
        $CustomExternalSubject,

        [Parameter()]
        [System.Boolean]
        $ZapEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ExternalSenderAdminAddress,

        [Parameter()]
        [System.Object]
        $RecommendedPolicyType,

        [Parameter()]
        [System.Object]
        $FileTypeAction,

        [Parameter()]
        [System.String]
        $CustomInternalSubject,

        [Parameter()]
        [System.String]
        $CustomInternalBody,

        [Parameter()]
        [System.Boolean]
        $EnableFileFilter
    )
}
function New-MalwareFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object]
        $MalwareFilterPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-ManagementRole
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $EnabledCmdlets,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Parent,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function New-ManagementRoleAssignment
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $CustomRecipientWriteScope,

        [Parameter()]
        [System.Object]
        $RecipientGroupScope,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.Object]
        $RecipientAdministrativeUnitScope,

        [Parameter()]
        [System.Object]
        $SecurityGroup,

        [Parameter()]
        [System.Object]
        $ExclusiveRecipientWriteScope,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Delegating,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $App,

        [Parameter()]
        [System.Object]
        $Role,

        [Parameter()]
        [System.Object]
        $CustomResourceScope,

        [Parameter()]
        [System.Object]
        $Policy,

        [Parameter()]
        [System.Object]
        $RecipientOrganizationalUnitScope,

        [Parameter()]
        [System.Object]
        $RecipientRelativeWriteScope
    )
}
function New-ManagementScope
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Exclusive,

        [Parameter()]
        [System.Object]
        $RecipientRoot,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $RecipientRestrictionFilter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function New-MessageClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SenderDescription,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $RecipientDescription,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $Locale,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $PermissionMenuVisible,

        [Parameter()]
        [System.Guid]
        $ClassificationID,

        [Parameter()]
        [System.Object]
        $DisplayPrecedence,

        [Parameter()]
        [System.Boolean]
        $RetainClassificationEnabled
    )
}
function New-MigrationBatch
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Partition,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipRules,

        [Parameter()]
        [System.Object]
        $TargetDatabases,

        [Parameter()]
        [System.Byte[]]
        $CSVData,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipDelegates,

        [Parameter()]
        [System.Object]
        $Users,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipMail,

        [Parameter()]
        [System.Object]
        $TimeZone,

        [Parameter()]
        [System.Object]
        $NotificationEmails,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ManagedGmailTeams,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipCalendar,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AutoStart,

        [Parameter()]
        [System.Boolean]
        $AllowUnknownColumnsInCSV,

        [Parameter()]
        [System.Object]
        $MoveOptions,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AdoptPreexisting,

        [Parameter()]
        [System.Object]
        $ExcludeFolders,

        [Parameter()]
        [System.Object]
        $TargetEndpoint,

        [Parameter()]
        [System.Object]
        $StartAfter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveOnCopy,

        [Parameter()]
        [System.Byte[]]
        $XMLData,

        [Parameter()]
        [System.Object]
        $UserIds,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolderToUnifiedGroup,

        [Parameter()]
        [System.Object]
        $ReportInterval,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AutoProvisioning,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $DisableOnCopy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ArchiveOnly,

        [Parameter()]
        [System.Object]
        $SkipMerging,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MigrateTasks,

        [Parameter()]
        [System.Object]
        $CompleteAfter,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $ContentFilterLanguage,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GoogleResource,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Analyze,

        [Parameter()]
        [System.Guid]
        $SourcePFPrimaryMailboxGuid,

        [Parameter()]
        [System.Object]
        $TargetDeliveryDomain,

        [Parameter()]
        [System.String]
        $ArchiveDomain,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PrimaryOnly,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipProvisioning,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SimplifiedSwitchOver,

        [Parameter()]
        [System.Object]
        $EndpointPartition,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Restore,

        [Parameter()]
        [System.Object]
        $IncludeFolders,

        [Parameter()]
        [System.String]
        $ContentFilter,

        [Parameter()]
        [System.Object]
        $SkipMoving,

        [Parameter()]
        [System.String]
        $WorkflowTemplate,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $SourceEndpoint,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AvoidMergeOverlap,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipReports,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipContacts,

        [Parameter()]
        [System.Object]
        $BadItemLimit,

        [Parameter()]
        [System.Object]
        $TargetArchiveDatabases,

        [Parameter()]
        [System.Object]
        $WorkflowControlFlags,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AutoComplete,

        [Parameter()]
        [System.Object]
        $LargeItemLimit,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PointInTimeRecoveryProvisionOnly,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ForwardingDisposition,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ExcludeDumpsters,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RenamePrimaryCalendar,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PointInTimeRecovery
    )
}
function New-MigrationEndpoint
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AcceptUntrustedCertificates,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ExchangeRemoteMove,

        [Parameter()]
        [System.Object]
        $MaxConcurrentMigrations,

        [Parameter()]
        [System.Byte[]]
        $ServiceAccountKeyFileData,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.Object]
        $TestMailbox,

        [Parameter()]
        [System.String]
        $ExchangeServer,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipVerification,

        [Parameter()]
        [System.Object]
        $Authentication,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ExchangeOutlookAnywhere,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Gmail,

        [Parameter()]
        [System.String]
        $AppSecretKeyVaultUrl,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Compliance,

        [Parameter()]
        [System.Int32]
        $Port,

        [Parameter()]
        [System.Security.SecureString]
        $OAuthCode,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.Object]
        $RemoteServer,

        [Parameter()]
        [System.Object]
        $Partition,

        [Parameter()]
        [System.Object]
        $MailboxPermission,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $SourceMailboxLegacyDN,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IMAP,

        [Parameter()]
        [System.String]
        $RemoteTenant,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolderToUnifiedGroup,

        [Parameter()]
        [System.String]
        $NspiServer,

        [Parameter()]
        [System.String]
        $RedirectUri,

        [Parameter()]
        [System.Object]
        $RPCProxyServer,

        [Parameter()]
        [System.Object]
        $EmailAddress,

        [Parameter()]
        [System.Object]
        $Security,

        [Parameter()]
        [System.Object]
        $MaxConcurrentIncrementalSyncs,

        [Parameter()]
        [System.String]
        $PublicFolderDatabaseServerLegacyDN,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credentials,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Autodiscover
    )
}
function New-MobileDeviceMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $AllowMicrosoftPushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowUnsignedApplications,

        [Parameter()]
        [System.Boolean]
        $AllowUnsignedInstallationPackages,

        [Parameter()]
        [System.Boolean]
        $AllowExternalDeviceManagement,

        [Parameter()]
        [System.Boolean]
        $AllowIrDA,

        [Parameter()]
        [System.Boolean]
        $RequireSignedSMIMEMessages,

        [Parameter()]
        [System.Boolean]
        $AllowStorageCard,

        [Parameter()]
        [System.Int32]
        $PasswordHistory,

        [Parameter()]
        [System.Boolean]
        $AllowNonProvisionableDevices,

        [Parameter()]
        [System.Object]
        $UnapprovedInROMApplicationList,

        [Parameter()]
        [System.Boolean]
        $RequireEncryptedSMIMEMessages,

        [Parameter()]
        [System.Boolean]
        $RequireDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $AllowInternetSharing,

        [Parameter()]
        [System.Boolean]
        $PasswordEnabled,

        [Parameter()]
        [System.Object]
        $RequireSignedSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $MaxEmailHTMLBodyTruncationSize,

        [Parameter()]
        [System.Int32]
        $MinPasswordComplexCharacters,

        [Parameter()]
        [System.Boolean]
        $UNCAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowCamera,

        [Parameter()]
        [System.Boolean]
        $IrmEnabled,

        [Parameter()]
        [System.Object]
        $PasswordExpiration,

        [Parameter()]
        [System.Boolean]
        $AllowBrowser,

        [Parameter()]
        [System.Object]
        $MaxEmailAgeFilter,

        [Parameter()]
        [System.Boolean]
        $RequireManualSyncWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $AlphanumericPasswordRequired,

        [Parameter()]
        [System.Object]
        $AllowSMIMEEncryptionAlgorithmNegotiation,

        [Parameter()]
        [System.Object]
        $MaxEmailBodyTruncationSize,

        [Parameter()]
        [System.Object]
        $AllowBluetooth,

        [Parameter()]
        [System.Boolean]
        $WSSAccessEnabled,

        [Parameter()]
        [System.Object]
        $RequireEncryptionSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $DevicePolicyRefreshInterval,

        [Parameter()]
        [System.Boolean]
        $AllowGooglePushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowMobileOTAUpdate,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $MaxAttachmentSize,

        [Parameter()]
        [System.Boolean]
        $AllowSimplePassword,

        [Parameter()]
        [System.Boolean]
        $AllowConsumerEmail,

        [Parameter()]
        [System.Boolean]
        $AllowDesktopSync,

        [Parameter()]
        [System.Boolean]
        $PasswordRecoveryEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireStorageCardEncryption,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AllowSMIMESoftCerts,

        [Parameter()]
        [System.Boolean]
        $AllowRemoteDesktop,

        [Parameter()]
        [System.Boolean]
        $AttachmentsEnabled,

        [Parameter()]
        [System.Object]
        $MaxCalendarAgeFilter,

        [Parameter()]
        [System.Boolean]
        $AllowWiFi,

        [Parameter()]
        [System.Boolean]
        $AllowApplePushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowPOPIMAPEmail,

        [Parameter()]
        [System.Boolean]
        $IsDefault,

        [Parameter()]
        [System.Object]
        $MaxInactivityTimeLock,

        [Parameter()]
        [System.Object]
        $ApprovedApplicationList,

        [Parameter()]
        [System.Boolean]
        $AllowTextMessaging,

        [Parameter()]
        [System.Object]
        $MaxPasswordFailedAttempts,

        [Parameter()]
        [System.Boolean]
        $DeviceEncryptionEnabled,

        [Parameter()]
        [System.Object]
        $MinPasswordLength,

        [Parameter()]
        [System.Boolean]
        $AllowHTMLEmail
    )
}
function New-OfflineAddressBook
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $DiffRetentionPeriod,

        [Parameter()]
        [System.Object[]]
        $AddressLists,

        [Parameter()]
        [System.Boolean]
        $IsDefault
    )
}
function New-OMEConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Double]
        $ExternalMailExpiryInDays,

        [Parameter()]
        [System.String]
        $ReadButtonText,

        [Parameter()]
        [System.String]
        $PortalText,

        [Parameter()]
        [System.Byte[]]
        $Image,

        [Parameter()]
        [System.String]
        $IntroductionText,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $BackgroundColor,

        [Parameter()]
        [System.String]
        $DisclaimerText,

        [Parameter()]
        [System.String]
        $PrivacyStatementUrl,

        [Parameter()]
        [System.Boolean]
        $SocialIdSignIn,

        [Parameter()]
        [System.String]
        $EmailText,

        [Parameter()]
        [System.Boolean]
        $OTPEnabled,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function New-OnPremisesOrganization
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $InboundConnector,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $OutboundConnector,

        [Parameter()]
        [System.String]
        $OrganizationName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Guid]
        $OrganizationGuid,

        [Parameter()]
        [System.Object]
        $OrganizationRelationship,

        [Parameter()]
        [System.Object]
        $HybridDomains
    )
}
function New-OrganizationRelationship
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $MailboxMovePublishedScopes,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $MailTipsAccessLevel,

        [Parameter()]
        [System.String]
        $OAuthApplicationId,

        [Parameter()]
        [System.Object]
        $MailTipsAccessScope,

        [Parameter()]
        [System.Object]
        $MailboxMoveCapability,

        [Parameter()]
        [System.Object]
        $DomainNames,

        [Parameter()]
        [System.Boolean]
        $DeliveryReportEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $MailTipsAccessEnabled
    )
}
function New-OutboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $RouteAllMessagesViaOnPremises,

        [Parameter()]
        [System.Object]
        $RecipientDomains,

        [Parameter()]
        [System.Boolean]
        $CloudServicesMailEnabled,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Guid]
        $LinkForModifiedConnector,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Boolean]
        $AllAcceptedDomains,

        [Parameter()]
        [System.Object]
        $TlsDomain,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Boolean]
        $IsTransportRuleScoped,

        [Parameter()]
        [System.Boolean]
        $UseMXRecord,

        [Parameter()]
        [System.Object]
        $TlsSettings,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConnectorType,

        [Parameter()]
        [System.Object]
        $SmartHosts,

        [Parameter()]
        [System.Boolean]
        $SenderRewritingEnabled,

        [Parameter()]
        [System.Boolean]
        $TestMode,

        [Parameter()]
        [System.Object]
        $ConnectorSource
    )
}
function New-OwaMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault
    )
}
function New-PartnerApplication
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $ApplicationIdentifier,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $LinkedAccount,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AcceptSecurityIdentifierInformation,

        [Parameter()]
        [System.Object]
        $AccountType,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-PolicyTipConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Value,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function New-ProtectionAlert
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function New-QuarantinePolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $IncludeMessagesFromBlockedSenderAddress,

        [Parameter()]
        [System.Object]
        $MultiLanguageCustomDisclaimer,

        [Parameter()]
        [System.Object]
        $AdminNotificationLanguage,

        [Parameter()]
        [System.String]
        $EndUserSpamNotificationCustomFromAddress,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.String]
        $CustomDisclaimer,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Int32]
        $EndUserQuarantinePermissionsValue,

        [Parameter()]
        [System.Boolean]
        $ESNEnabled,

        [Parameter()]
        [System.Object]
        $EndUserQuarantinePermissions,

        [Parameter()]
        [System.Boolean]
        $AdminNotificationsEnabled,

        [Parameter()]
        [System.Object]
        $EndUserSpamNotificationLanguage,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Object]
        $MultiLanguageSenderName,

        [Parameter()]
        [System.Object]
        $AdminQuarantinePermissionsList,

        [Parameter()]
        [System.Object]
        $MultiLanguageSetting,

        [Parameter()]
        [System.TimeSpan]
        $EndUserSpamNotificationFrequency,

        [Parameter()]
        [System.Int32]
        $QuarantineRetentionDays,

        [Parameter()]
        [System.Object]
        $EsnCustomSubject,

        [Parameter()]
        [System.Boolean]
        $OrganizationBrandingEnabled,

        [Parameter()]
        [System.Int32]
        $AdminNotificationFrequencyInDays,

        [Parameter()]
        [System.Object]
        $QuarantinePolicyType
    )
}
function New-RemoteDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $DomainName
    )
}
function New-ReportSubmissionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $PostSubmitMessage,

        [Parameter()]
        [System.Object]
        $ReportJunkAddresses,

        [Parameter()]
        [System.Boolean]
        $NotificationsForPhishMalwareSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.String]
        $PhishingReviewResultMessage,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitle,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonTextForNotJunk,

        [Parameter()]
        [System.Boolean]
        $EnableCustomizedMsg,

        [Parameter()]
        [System.Object]
        $NotificationSenderAddress,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonTextForJunk,

        [Parameter()]
        [System.Boolean]
        $NotificationsForSpamSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.String]
        $PostSubmitMessageForJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageForPhishing,

        [Parameter()]
        [System.Boolean]
        $EnableThirdPartyAddress,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String]
        $PreSubmitMessageForJunk,

        [Parameter()]
        [System.Int32]
        $UserSubmissionOptions,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonTextForPhishing,

        [Parameter()]
        [System.String]
        $PreSubmitMessageForNotJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageTitleForNotJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonTextForJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageForNotJunk,

        [Parameter()]
        [System.Boolean]
        $ReportJunkToCustomizedAddress,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonLinkForPhishing,

        [Parameter()]
        [System.Boolean]
        $ReportNotJunkToCustomizedAddress,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitleForJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageForPhishing,

        [Parameter()]
        [System.String]
        $NotificationFooterMessage,

        [Parameter()]
        [System.Boolean]
        $EnableOrganizationBranding,

        [Parameter()]
        [System.String]
        $PreSubmitMessageForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonLinkForNotJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonLinkForPhishing,

        [Parameter()]
        [System.Boolean]
        $EnableReportToMicrosoft,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitleForJunk,

        [Parameter()]
        [System.Boolean]
        $ReportChatMessageEnabled,

        [Parameter()]
        [System.Object]
        $ThirdPartyReportAddresses,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonLinkForJunk,

        [Parameter()]
        [System.Boolean]
        $NotificationsForCleanSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.String]
        $PostSubmitMessageForNotJunk,

        [Parameter()]
        [System.Object]
        $MultiLanguageSetting,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageForJunk,

        [Parameter()]
        [System.Boolean]
        $DisableQuarantineReportingOption,

        [Parameter()]
        [System.Object]
        $ReportNotJunkAddresses,

        [Parameter()]
        [System.Boolean]
        $EnableUserEmailNotification,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageForJunk,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageTitleForJunk,

        [Parameter()]
        [System.Boolean]
        $DisableUserSubmissionOptions,

        [Parameter()]
        [System.Boolean]
        $OnlyShowPhishingDisclaimer,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitleForNotJunk,

        [Parameter()]
        [System.String]
        $PreSubmitMessage,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitleForNotJunk,

        [Parameter()]
        [System.String]
        $JunkReviewResultMessage,

        [Parameter()]
        [System.Boolean]
        $EnableCustomNotificationSender,

        [Parameter()]
        [System.Boolean]
        $ReportChatMessageToCustomizedAddressEnabled,

        [Parameter()]
        [System.Object]
        $ReportPhishAddresses,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageTitleForJunk,

        [Parameter()]
        [System.String]
        $NotJunkReviewResultMessage,

        [Parameter()]
        [System.Boolean]
        $NotificationsForSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.Boolean]
        $PreSubmitMessageEnabled,

        [Parameter()]
        [System.Boolean]
        $PostSubmitMessageEnabled,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitle,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonTextForPhishing,

        [Parameter()]
        [System.String]
        $UserSubmissionOptionsMessage,

        [Parameter()]
        [System.String]
        $PostSubmitMessageForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonLinkForJunk,

        [Parameter()]
        [System.Boolean]
        $ReportPhishToCustomizedAddress
    )
}
function New-ReportSubmissionRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object]
        $ReportSubmissionPolicy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-RetentionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $RetentionPolicyTagLinks,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefaultArbitrationMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault,

        [Parameter()]
        [System.Guid]
        $RetentionId,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function New-RoleAssignmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $Roles,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault
    )
}
function New-RoleGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Object]
        $CustomRecipientWriteScope,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Object]
        $Members,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $Roles,

        [Parameter()]
        [System.String]
        $WellKnownObject,

        [Parameter()]
        [System.Object]
        $ManagedBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function New-SafeAttachmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Action,

        [Parameter()]
        [System.Object]
        $RecommendedPolicyType,

        [Parameter()]
        [System.Boolean]
        $Redirect,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeBuiltInProtection,

        [Parameter()]
        [System.Boolean]
        $Enable,

        [Parameter()]
        [System.Object]
        $RedirectAddress,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $QuarantineTag
    )
}
function New-SafeAttachmentRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $SafeAttachmentPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-SafeLinksPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $EnableOrganizationBranding,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Boolean]
        $UseTranslatedNotificationText,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeBuiltInProtection,

        [Parameter()]
        [System.Object]
        $DoNotRewriteUrls,

        [Parameter()]
        [System.Boolean]
        $EnableSafeLinksForTeams,

        [Parameter()]
        [System.Boolean]
        $DisableUrlRewrite,

        [Parameter()]
        [System.Boolean]
        $EnableSafeLinksForOffice,

        [Parameter()]
        [System.Boolean]
        $TrackClicks,

        [Parameter()]
        [System.Boolean]
        $AllowClickThrough,

        [Parameter()]
        [System.Object]
        $RecommendedPolicyType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $CustomNotificationText,

        [Parameter()]
        [System.Boolean]
        $DeliverMessageAfterScan,

        [Parameter()]
        [System.Boolean]
        $EnableSafeLinksForEmail,

        [Parameter()]
        [System.Boolean]
        $ScanUrls,

        [Parameter()]
        [System.Boolean]
        $EnableForInternalSenders
    )
}
function New-SafeLinksRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object]
        $SafeLinksPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-ServicePrincipal
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $ObjectId,

        [Parameter()]
        [System.String]
        $ServiceId,

        [Parameter()]
        [System.String]
        $AppId
    )
}
function New-SweepRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $DestinationFolder,

        [Parameter()]
        [System.String]
        $Provider,

        [Parameter()]
        [System.Object]
        $SystemCategory,

        [Parameter()]
        [System.Object]
        $KeepLatest,

        [Parameter()]
        [System.Object]
        $SourceFolder,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Object]
        $Sender,

        [Parameter()]
        [System.Object]
        $KeepForDays,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function New-TenantAllowBlockListItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.DateTime]
        $ExpirationDate,

        [Parameter()]
        [System.Object]
        $ListSubType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Block,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $LogExtraDetails,

        [Parameter()]
        [System.String]
        $Notes,

        [Parameter()]
        [System.Int32]
        $RemoveAfter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $OutputJson,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $NoExpiration,

        [Parameter()]
        [System.String]
        $SubmissionID,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Allow,

        [Parameter()]
        [System.String[]]
        $Entries,

        [Parameter()]
        [System.Object]
        $ListType
    )
}
function New-TenantAllowBlockListSpoofItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Action,

        [Parameter()]
        [System.String]
        $SendingInfrastructure,

        [Parameter()]
        [System.String]
        $SpoofType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $SpoofedUser
    )
}
function New-TransportRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $ActivationDate,

        [Parameter()]
        [System.Object[]]
        $AddToRecipients,

        [Parameter()]
        [System.Object]
        $ApplyHtmlDisclaimerFallbackAction,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientADAttributeContainsWords,

        [Parameter()]
        [System.Object]
        $AttachmentSizeOver,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderADAttributeContainsWords,

        [Parameter()]
        [System.Object]
        $SetSCL,

        [Parameter()]
        [System.Object[]]
        $AnyOfToHeaderMemberOf,

        [Parameter()]
        [System.Boolean]
        $Disconnect,

        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfCcHeader,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $ManagerForEvaluatedUser,

        [Parameter()]
        [System.Object[]]
        $ExceptIfHeaderMatchesPatterns,

        [Parameter()]
        [System.Object]
        $ExceptIfFromScope,

        [Parameter()]
        [System.Object]
        $AdComparisonAttribute,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfHeaderContainsWords,

        [Parameter()]
        [System.Object[]]
        $HeaderMatchesPatterns,

        [Parameter()]
        [System.Object]
        $AddManagerAsRecipientType,

        [Parameter()]
        [System.Boolean]
        $DeleteMessage,

        [Parameter()]
        [System.Boolean]
        $HasSenderOverride,

        [Parameter()]
        [System.Object]
        $SmtpRejectMessageRejectStatusCode,

        [Parameter()]
        [System.String]
        $ExceptIfHasClassification,

        [Parameter()]
        [System.Boolean]
        $Quarantine,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfRecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientInSenderList,

        [Parameter()]
        [System.Object]
        $RecipientAddressType,

        [Parameter()]
        [System.Object[]]
        $ExceptIfContentCharacterSetContainsWords,

        [Parameter()]
        [System.Object[]]
        $BlindCopyTo,

        [Parameter()]
        [System.Object]
        $ApplyHtmlDisclaimerLocation,

        [Parameter()]
        [System.Object]
        $ExceptIfMessageTypeMatches,

        [Parameter()]
        [System.Object]
        $SenderIpRanges,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $ExceptIfMessageContainsDataClassifications,

        [Parameter()]
        [System.Object[]]
        $ModerateMessageByUser,

        [Parameter()]
        [System.Boolean]
        $HasNoClassification,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderInRecipientList,

        [Parameter()]
        [System.Object]
        $HeaderContainsMessageHeader,

        [Parameter()]
        [System.Object]
        $RemoveHeader,

        [Parameter()]
        [System.String]
        $HasClassification,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $MessageContainsDataClassifications,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromMemberOf,

        [Parameter()]
        [System.Object]
        $RuleSubType,

        [Parameter()]
        [System.Object[]]
        $AnyOfRecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Object]
        $SentToScope,

        [Parameter()]
        [System.Object[]]
        $AnyOfToCcHeaderMemberOf,

        [Parameter()]
        [System.Object[]]
        $From,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfRecipientAddressContainsWords,

        [Parameter()]
        [System.Object]
        $ExceptIfWithImportance,

        [Parameter()]
        [System.Object[]]
        $ContentCharacterSetContainsWords,

        [Parameter()]
        [System.Object[]]
        $SubjectContainsWords,

        [Parameter()]
        [System.Object]
        $RejectMessageEnhancedStatusCode,

        [Parameter()]
        [System.Object[]]
        $SenderADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $IncidentReportContent,

        [Parameter()]
        [System.Boolean]
        $UseLegacyRegex,

        [Parameter()]
        [System.Object[]]
        $FromMemberOf,

        [Parameter()]
        [System.Object[]]
        $AttachmentContainsWords,

        [Parameter()]
        [System.Object]
        $ExceptIfSCLOver,

        [Parameter()]
        [System.Object[]]
        $ExceptIfBetweenMemberOf1,

        [Parameter()]
        [System.Object]
        $GenerateNotification,

        [Parameter()]
        [System.Object]
        $NotifySender,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentIsPasswordProtected,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentNameMatchesPatterns,

        [Parameter()]
        [System.Object]
        $ExceptIfSenderManagementRelationship,

        [Parameter()]
        [System.String]
        $SetAuditSeverity,

        [Parameter()]
        [System.Object[]]
        $AttachmentPropertyContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToHeader,

        [Parameter()]
        [System.Object]
        $ApplyRightsProtectionCustomizationTemplate,

        [Parameter()]
        [System.Object]
        $SetHeaderName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $RouteMessageOutboundRequireTls,

        [Parameter()]
        [System.Object]
        $WithImportance,

        [Parameter()]
        [System.Object]
        $RuleErrorAction,

        [Parameter()]
        [System.Object]
        $FromScope,

        [Parameter()]
        [System.Object[]]
        $AttachmentNameMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromAddressMatchesPatterns,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Object]
        $ExceptIfAttachmentSizeOver,

        [Parameter()]
        [System.Object]
        $ExceptIfManagerForEvaluatedUser,

        [Parameter()]
        [System.Boolean]
        $RemoveOMEv2,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromAddressContainsWords,

        [Parameter()]
        [System.Boolean]
        $AttachmentHasExecutableContent,

        [Parameter()]
        [System.Object]
        $RouteMessageOutboundConnector,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderDomainIs,

        [Parameter()]
        [System.Object]
        $SenderManagementRelationship,

        [Parameter()]
        [System.Object[]]
        $ExceptIfBetweenMemberOf2,

        [Parameter()]
        [System.Object[]]
        $RedirectMessageTo,

        [Parameter()]
        [System.Boolean]
        $ApplyOME,

        [Parameter()]
        [System.Object[]]
        $SenderDomainIs,

        [Parameter()]
        [System.Object[]]
        $SenderADAttributeContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfCcHeaderMemberOf,

        [Parameter()]
        [System.Object]
        $ApplyHtmlDisclaimerText,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentHasExecutableContent,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentIsUnsupported,

        [Parameter()]
        [System.Boolean]
        $RemoveOME,

        [Parameter()]
        [System.Object]
        $RejectMessageReasonText,

        [Parameter()]
        [System.Object[]]
        $RecipientAddressContainsWords,

        [Parameter()]
        [System.Object]
        $GenerateIncidentReport,

        [Parameter()]
        [System.Object[]]
        $FromAddressContainsWords,

        [Parameter()]
        [System.Boolean]
        $RemoveRMSAttachmentEncryption,

        [Parameter()]
        [System.Object[]]
        $RecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFrom,

        [Parameter()]
        [System.Object[]]
        $AnyOfToCcHeader,

        [Parameter()]
        [System.Object]
        $ExceptIfSentToScope,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToCcHeaderMemberOf,

        [Parameter()]
        [System.Boolean]
        $ModerateMessageByManager,

        [Parameter()]
        [System.Object]
        $AdComparisonOperator,

        [Parameter()]
        [System.Object]
        $MessageSizeOver,

        [Parameter()]
        [System.Object[]]
        $BetweenMemberOf2,

        [Parameter()]
        [System.Object[]]
        $SubjectMatchesPatterns,

        [Parameter()]
        [System.Boolean]
        $AttachmentProcessingLimitExceeded,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectMatchesPatterns,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientAddressContainsWords,

        [Parameter()]
        [System.Object]
        $HeaderMatchesMessageHeader,

        [Parameter()]
        [System.Object[]]
        $AnyOfRecipientAddressContainsWords,

        [Parameter()]
        [System.Object[]]
        $HeaderContainsWords,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object]
        $ExceptIfAdComparisonAttribute,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Object]
        $ExceptIfAdComparisonOperator,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToHeaderMemberOf,

        [Parameter()]
        [System.Object]
        $Mode,

        [Parameter()]
        [System.Object[]]
        $RecipientInSenderList,

        [Parameter()]
        [System.Object[]]
        $SubjectOrBodyMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentExtensionMatchesWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectOrBodyMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Boolean]
        $ExceptIfHasNoClassification,

        [Parameter()]
        [System.Object]
        $ExceptIfSenderIpRanges,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $RecipientADAttributeContainsWords,

        [Parameter()]
        [System.Boolean]
        $AttachmentIsUnsupported,

        [Parameter()]
        [System.Object]
        $ExpiryDate,

        [Parameter()]
        [System.Object[]]
        $AttachmentExtensionMatchesWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectOrBodyContainsWords,

        [Parameter()]
        [System.Object]
        $LogEventText,

        [Parameter()]
        [System.Object[]]
        $ExceptIfManagerAddresses,

        [Parameter()]
        [System.Object[]]
        $SenderInRecipientList,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToCcHeader,

        [Parameter()]
        [System.Object[]]
        $AttachmentMatchesPatterns,

        [Parameter()]
        [System.String]
        $DlpPolicy,

        [Parameter()]
        [System.Object[]]
        $ManagerAddresses,

        [Parameter()]
        [System.Object]
        $SenderAddressLocation,

        [Parameter()]
        [System.Object[]]
        $CopyTo,

        [Parameter()]
        [System.Object[]]
        $SubjectOrBodyContainsWords,

        [Parameter()]
        [System.String]
        $ApplyClassification,

        [Parameter()]
        [System.Object[]]
        $RecipientADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object]
        $SetHeaderValue,

        [Parameter()]
        [System.Boolean]
        $AttachmentIsPasswordProtected,

        [Parameter()]
        [System.Object[]]
        $BetweenMemberOf1,

        [Parameter()]
        [System.Object]
        $ExceptIfMessageSizeOver,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $ExceptIfMessageContainsAllDataClassifications,

        [Parameter()]
        [System.Object[]]
        $AnyOfCcHeader,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentProcessingLimitExceeded,

        [Parameter()]
        [System.Object[]]
        $FromAddressMatchesPatterns,

        [Parameter()]
        [System.Object]
        $ExceptIfHeaderMatchesMessageHeader,

        [Parameter()]
        [System.Object]
        $SmtpRejectMessageRejectText,

        [Parameter()]
        [System.Object[]]
        $AnyOfCcHeaderMemberOf,

        [Parameter()]
        [System.Object[]]
        $AnyOfToHeader,

        [Parameter()]
        [System.Boolean]
        $ExceptIfHasSenderOverride,

        [Parameter()]
        [System.Object]
        $SCLOver,

        [Parameter()]
        [System.Object]
        $PrependSubject,

        [Parameter()]
        [System.Object]
        $ApplyRightsProtectionTemplate,

        [Parameter()]
        [System.Object]
        $MessageTypeMatches,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentPropertyContainsWords,

        [Parameter()]
        [System.Boolean]
        $StopRuleProcessing,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $MessageContainsAllDataClassifications,

        [Parameter()]
        [System.Object]
        $ExceptIfHeaderContainsMessageHeader
    )
}
function Remove-ActiveSyncDevice
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ActiveSyncDeviceAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ActiveSyncMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-AddressBookPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-AddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Recursive
    )
}
function Remove-AntiPhishPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-AntiPhishRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ApplicationAccessPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ATPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-AuditConfigurationPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Remove-AuthenticationPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AllowLegacyExchangeTokens
    )
}
function Remove-AvailabilityAddressSpace
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-AvailabilityConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ClientAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-DataClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-DistributionGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck
    )
}
function Remove-EmailAddressPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ExoPhishSimOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Remove-ExoSecOpsOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Remove-GlobalAddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-HostedConnectionFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-HostedContentFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-HostedContentFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-HostedOutboundSpamFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-HostedOutboundSpamFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-InboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-Mailbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PermanentlyDelete,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveCNFPublicFolderMailboxPermanently,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Migration,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-MailboxFolderPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ResetDelegateUserCollection,

        [Parameter()]
        [System.Boolean]
        $SendNotificationToUser,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-MailboxIRMAccess
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-MailboxPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ClearAutoMapping,

        [Parameter()]
        [System.Object[]]
        $AccessRights,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GroupMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Deny,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassMasterAccountSid,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDefaultScope,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SoftDeletedMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ResetDefault,

        [Parameter()]
        [System.DirectoryServices.ActiveDirectorySecurityInheritance]
        $InheritanceType
    )
}
function Remove-MailContact
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-MalwareFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-MalwareFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ManagementRole
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Recurse,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-ManagementRoleAssignment
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-ManagementScope
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-MessageClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-MigrationBatch
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Partition
    )
}
function Remove-MigrationEndpoint
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Partition
    )
}
function Remove-MobileDevice
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-MobileDeviceMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-OfflineAddressBook
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-OMEConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-OnPremisesOrganization
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-OutboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-OwaMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-PartnerApplication
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-PolicyTipConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-QuarantinePolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Remove-RecipientPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipDomainValidationForMailContact,

        [Parameter()]
        [System.Object]
        $AccessRights,

        [Parameter()]
        [System.Object]
        $Trustee,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Deny,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipDomainValidationForMailUser,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipDomainValidationForSharedMailbox
    )
}
function Remove-RemoteDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ReportSubmissionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ReportSubmissionRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-RetentionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-RoleAssignmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-RoleGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-RoleGroupMember
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck,

        [Parameter()]
        [System.Object]
        $Member
    )
}
function Remove-SafeAttachmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-SafeAttachmentRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-SafeLinksPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Remove-SafeLinksRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-ServicePrincipal
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-SweepRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Remove-TenantAllowBlockListItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $ListSubType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $OutputJson,

        [Parameter()]
        [System.String[]]
        $Ids,

        [Parameter()]
        [System.String[]]
        $Entries,

        [Parameter()]
        [System.Object]
        $ListType
    )
}
function Remove-TenantAllowBlockListSpoofItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String[]]
        $Ids
    )
}
function Remove-TransportRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-AcceptedDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $SendingToDomainDisabled,

        [Parameter()]
        [System.Boolean]
        $EnableNego2Authentication,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $SendingFromDomainDisabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $CanHaveCloudCache,

        [Parameter()]
        [System.Object]
        $DomainType,

        [Parameter()]
        [System.String]
        $MailFlowRegion,

        [Parameter()]
        [System.Boolean]
        $MatchSubDomains,

        [Parameter()]
        [System.Boolean]
        $OutboundOnly
    )
}
function Set-ActiveSyncDeviceAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $AccessLevel
    )
}
function Set-ActiveSyncMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $AllowUnsignedApplications,

        [Parameter()]
        [System.Boolean]
        $AllowUnsignedInstallationPackages,

        [Parameter()]
        [System.Boolean]
        $AllowExternalDeviceManagement,

        [Parameter()]
        [System.Boolean]
        $AllowIrDA,

        [Parameter()]
        [System.Boolean]
        $AllowStorageCard,

        [Parameter()]
        [System.Boolean]
        $AllowNonProvisionableDevices,

        [Parameter()]
        [System.Boolean]
        $AllowRemoteDesktop,

        [Parameter()]
        [System.Object]
        $UnapprovedInROMApplicationList,

        [Parameter()]
        [System.Boolean]
        $DevicePasswordEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireEncryptedSMIMEMessages,

        [Parameter()]
        [System.Int32]
        $DevicePasswordHistory,

        [Parameter()]
        [System.Boolean]
        $RequireDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $AllowInternetSharing,

        [Parameter()]
        [System.Int32]
        $MinDevicePasswordComplexCharacters,

        [Parameter()]
        [System.Object]
        $RequireSignedSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $MaxEmailHTMLBodyTruncationSize,

        [Parameter()]
        [System.Object]
        $DevicePasswordExpiration,

        [Parameter()]
        [System.Boolean]
        $UNCAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowCamera,

        [Parameter()]
        [System.Object]
        $MaxDevicePasswordFailedAttempts,

        [Parameter()]
        [System.Boolean]
        $AllowBrowser,

        [Parameter()]
        [System.Boolean]
        $RequireManualSyncWhenRoaming,

        [Parameter()]
        [System.Object]
        $AllowSMIMEEncryptionAlgorithmNegotiation,

        [Parameter()]
        [System.Boolean]
        $DeviceEncryptionEnabled,

        [Parameter()]
        [System.Object]
        $MaxEmailBodyTruncationSize,

        [Parameter()]
        [System.Object]
        $AllowBluetooth,

        [Parameter()]
        [System.Object]
        $RequireEncryptionSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $DevicePolicyRefreshInterval,

        [Parameter()]
        [System.Boolean]
        $AllowMobileOTAUpdate,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $MaxAttachmentSize,

        [Parameter()]
        [System.Boolean]
        $AllowConsumerEmail,

        [Parameter()]
        [System.Boolean]
        $AllowDesktopSync,

        [Parameter()]
        [System.Object]
        $MaxInactivityTimeDeviceLock,

        [Parameter()]
        [System.Boolean]
        $AlphanumericDevicePasswordRequired,

        [Parameter()]
        [System.Boolean]
        $RequireStorageCardEncryption,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AttachmentsEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowSMIMESoftCerts,

        [Parameter()]
        [System.Object]
        $MaxEmailAgeFilter,

        [Parameter()]
        [System.Boolean]
        $AllowSimpleDevicePassword,

        [Parameter()]
        [System.Boolean]
        $PasswordRecoveryEnabled,

        [Parameter()]
        [System.Object]
        $MaxCalendarAgeFilter,

        [Parameter()]
        [System.Boolean]
        $AllowWiFi,

        [Parameter()]
        [System.Boolean]
        $AllowApplePushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowPOPIMAPEmail,

        [Parameter()]
        [System.Boolean]
        $IsDefault,

        [Parameter()]
        [System.Boolean]
        $IsDefaultPolicy,

        [Parameter()]
        [System.Object]
        $ApprovedApplicationList,

        [Parameter()]
        [System.Boolean]
        $AllowTextMessaging,

        [Parameter()]
        [System.Boolean]
        $WSSAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireSignedSMIMEMessages,

        [Parameter()]
        [System.Boolean]
        $AllowHTMLEmail,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $MinDevicePasswordLength,

        [Parameter()]
        [System.Boolean]
        $IrmEnabled
    )
}
function Set-AddressBookPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RoomList,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $GlobalAddressList,

        [Parameter()]
        [System.Object[]]
        $AddressLists,

        [Parameter()]
        [System.Object]
        $OfflineAddressBook
    )
}
function Set-AddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.Object]
        $IncludedRecipients,

        [Parameter()]
        [System.Object]
        $ConditionalCompany,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.Object]
        $ConditionalDepartment,

        [Parameter()]
        [System.Object]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute11,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute1,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute5
    )
}
function Set-AdminAuditLogConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $UnifiedAuditLogIngestionEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-AntiPhishPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $EnableFirstContactSafetyTips,

        [Parameter()]
        [System.Boolean]
        $EnableMailboxIntelligenceProtection,

        [Parameter()]
        [System.Int32]
        $PhishThresholdLevel,

        [Parameter()]
        [System.Boolean]
        $EnableTargetedDomainsProtection,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $HonorDmarcPolicy,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Boolean]
        $EnableViaTag,

        [Parameter()]
        [System.Object]
        $MailboxIntelligenceProtectionAction,

        [Parameter()]
        [System.Object]
        $TargetedDomainsToProtect,

        [Parameter()]
        [System.Boolean]
        $EnableSpoofIntelligence,

        [Parameter()]
        [System.Boolean]
        $EnableSimilarUsersSafetyTips,

        [Parameter()]
        [System.Object]
        $ExcludedDomains,

        [Parameter()]
        [System.String]
        $PolicyTag,

        [Parameter()]
        [System.Object]
        $MailboxIntelligenceProtectionActionRecipients,

        [Parameter()]
        [System.Object]
        $TargetedDomainActionRecipients,

        [Parameter()]
        [System.Object]
        $DmarcQuarantineAction,

        [Parameter()]
        [System.Boolean]
        $EnableMailboxIntelligence,

        [Parameter()]
        [System.String]
        $TargetedDomainQuarantineTag,

        [Parameter()]
        [System.Object]
        $ImpersonationProtectionState,

        [Parameter()]
        [System.Boolean]
        $EnableOrganizationDomainsProtection,

        [Parameter()]
        [System.Object]
        $TargetedDomainProtectionAction,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $TargetedUsersToProtect,

        [Parameter()]
        [System.Object]
        $TargetedUserProtectionAction,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeDefault,

        [Parameter()]
        [System.String]
        $MailboxIntelligenceQuarantineTag,

        [Parameter()]
        [System.Boolean]
        $EnableSimilarDomainsSafetyTips,

        [Parameter()]
        [System.String]
        $SpoofQuarantineTag,

        [Parameter()]
        [System.Boolean]
        $EnableUnauthenticatedSender,

        [Parameter()]
        [System.Object]
        $DmarcRejectAction,

        [Parameter()]
        [System.String]
        $TargetedUserQuarantineTag,

        [Parameter()]
        [System.Object]
        $ExcludedSubDomains,

        [Parameter()]
        [System.Boolean]
        $EnableUnusualCharactersSafetyTips,

        [Parameter()]
        [System.Boolean]
        $EnableTargetedUserProtection,

        [Parameter()]
        [System.Object]
        $AuthenticationFailAction,

        [Parameter()]
        [System.Object]
        $TargetedUserActionRecipients,

        [Parameter()]
        [System.Object]
        $ExcludedSenders
    )
}
function Set-AntiPhishRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object]
        $AntiPhishPolicy,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-ApplicationAccessPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-ArcConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String[]]
        $ArcTrustedSealers,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-ATPBuiltInProtectionRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-AtpPolicyForO365
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $EnableATPForSPOTeamsODB,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $EnableSafeDocs,

        [Parameter()]
        [System.Boolean]
        $AllowSafeDocsOpen,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Set-ATPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-AvailabilityConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $OrgWideAccount,

        [Parameter()]
        [System.Object]
        $AllowedTenantIds
    )
}
function Set-CalendarProcessing
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $MaximumConflictInstances,

        [Parameter()]
        [System.Object]
        $BookingType,

        [Parameter()]
        [System.Boolean]
        $ForwardRequestsToDelegates,

        [Parameter()]
        [System.Boolean]
        $RemoveCanceledMeetings,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ResourceDelegates,

        [Parameter()]
        [System.Boolean]
        $DeleteNonCalendarItems,

        [Parameter()]
        [System.Boolean]
        $RemovePrivateProperty,

        [Parameter()]
        [System.Boolean]
        $DeleteComments,

        [Parameter()]
        [System.Boolean]
        $EnforceSchedulingHorizon,

        [Parameter()]
        [System.Boolean]
        $EnableResponseDetails,

        [Parameter()]
        [System.Object[]]
        $RequestInPolicy,

        [Parameter()]
        [System.Boolean]
        $EnforceCapacity,

        [Parameter()]
        [System.Boolean]
        $AllowConflicts,

        [Parameter()]
        [System.Boolean]
        $AllRequestInPolicy,

        [Parameter()]
        [System.Boolean]
        $AddOrganizerToSubject,

        [Parameter()]
        [System.Object[]]
        $BookInPolicy,

        [Parameter()]
        [System.Int32]
        $ConflictPercentageAllowed,

        [Parameter()]
        [System.Object]
        $AutomateProcessing,

        [Parameter()]
        [System.Boolean]
        $AllRequestOutOfPolicy,

        [Parameter()]
        [System.Boolean]
        $AddNewRequestsTentatively,

        [Parameter()]
        [System.Boolean]
        $EnableAutoRelease,

        [Parameter()]
        [System.Int32]
        $PostReservationMaxClaimTimeInMinutes,

        [Parameter()]
        [System.Boolean]
        $AllBookInPolicy,

        [Parameter()]
        [System.Boolean]
        $ProcessExternalMeetingMessages,

        [Parameter()]
        [System.Boolean]
        $DeleteAttachments,

        [Parameter()]
        [System.Boolean]
        $ScheduleOnlyDuringWorkHours,

        [Parameter()]
        [System.String]
        $AdditionalResponse,

        [Parameter()]
        [System.Boolean]
        $TentativePendingApproval,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Int32]
        $MaximumDurationInMinutes,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDefaultScope,

        [Parameter()]
        [System.Object[]]
        $RequestOutOfPolicy,

        [Parameter()]
        [System.Boolean]
        $RemoveOldMeetingMessages,

        [Parameter()]
        [System.Boolean]
        $OrganizerInfo,

        [Parameter()]
        [System.Int32]
        $MinimumDurationInMinutes,

        [Parameter()]
        [System.Boolean]
        $AddAdditionalResponse,

        [Parameter()]
        [System.Boolean]
        $RemoveForwardedMeetingNotifications,

        [Parameter()]
        [System.Int32]
        $BookingWindowInDays,

        [Parameter()]
        [System.Boolean]
        $AllowRecurringMeetings,

        [Parameter()]
        [System.Boolean]
        $DeleteSubject
    )
}
function Set-CASMailbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $IsOptimizedForAccessibility,

        [Parameter()]
        [System.Boolean]
        $ImapEnabled,

        [Parameter()]
        [System.Boolean]
        $ImapSuppressReadReceipt,

        [Parameter()]
        [System.Boolean]
        $ActiveSyncSuppressReadReceipt,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $EwsBlockList,

        [Parameter()]
        [System.Object]
        $EwsAllowEntourage,

        [Parameter()]
        [System.Object]
        $OwaMailboxPolicy,

        [Parameter()]
        [System.Boolean]
        $PopUseProtocolDefaults,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $SmtpClientAuthenticationDisabled,

        [Parameter()]
        [System.Boolean]
        $PopForceICalForCalendarRetrievalOption,

        [Parameter()]
        [System.Boolean]
        $ImapForceICalForCalendarRetrievalOption,

        [Parameter()]
        [System.Boolean]
        $ShowGalAsDefaultView,

        [Parameter()]
        [System.Object]
        $ActiveSyncBlockedDeviceIDs,

        [Parameter()]
        [System.Boolean]
        $MAPIEnabled,

        [Parameter()]
        [System.Object]
        $EwsAllowOutlook,

        [Parameter()]
        [System.Boolean]
        $PopEnabled,

        [Parameter()]
        [System.Object]
        $ActiveSyncAllowedDeviceIDs,

        [Parameter()]
        [System.Object]
        $EwsEnabled,

        [Parameter()]
        [System.Object]
        $OutlookMobileEnabled,

        [Parameter()]
        [System.Object]
        $EwsAllowMacOutlook,

        [Parameter()]
        [System.Object]
        $EwsApplicationAccessPolicy,

        [Parameter()]
        [System.Object]
        $OneWinNativeOutlookEnabled,

        [Parameter()]
        [System.Boolean]
        $OWAEnabled,

        [Parameter()]
        [System.Boolean]
        $PublicFolderClientAccess,

        [Parameter()]
        [System.Object]
        $ActiveSyncMailboxPolicy,

        [Parameter()]
        [System.Object]
        $UniversalOutlookEnabled,

        [Parameter()]
        [System.Boolean]
        $ImapUseProtocolDefaults,

        [Parameter()]
        [System.Boolean]
        $ActiveSyncDebugLogging,

        [Parameter()]
        [System.Boolean]
        $OWAforDevicesEnabled,

        [Parameter()]
        [System.Object]
        $ImapMessagesRetrievalMimeFormat,

        [Parameter()]
        [System.Boolean]
        $ActiveSyncEnabled,

        [Parameter()]
        [System.Object]
        $MacOutlookEnabled,

        [Parameter()]
        [System.Boolean]
        $PopSuppressReadReceipt,

        [Parameter()]
        [System.Object]
        $EwsAllowList,

        [Parameter()]
        [System.Object]
        $PopMessagesRetrievalMimeFormat
    )
}
function set-CASMailboxPlan
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $ImapEnabled,

        [Parameter()]
        [System.Object]
        $OwaMailboxPolicy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $OWAEnabled,

        [Parameter()]
        [System.Object]
        $EwsEnabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $ECPEnabled,

        [Parameter()]
        [System.Boolean]
        $PopEnabled,

        [Parameter()]
        [System.Boolean]
        $ActiveSyncEnabled,

        [Parameter()]
        [System.Boolean]
        $MAPIEnabled
    )
}
function Set-ClientAccessRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $UsernameMatchesAnyOfPatterns,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Action,

        [Parameter()]
        [System.Object]
        $AnyOfClientIPAddressesOrRanges,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Object]
        $ExceptAnyOfClientIPAddressesOrRanges,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $UserRecipientFilter,

        [Parameter()]
        [System.Object]
        $ExceptAnyOfProtocols,

        [Parameter()]
        [System.Object]
        $AnyOfProtocols,

        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.Object]
        $ExceptUsernameMatchesAnyOfPatterns,

        [Parameter()]
        [System.Object]
        $AnyOfAuthenticationTypes,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ExceptAnyOfAuthenticationTypes,

        [Parameter()]
        [System.Object]
        $Scope
    )
}
function Set-DataClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $Locale,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Fingerprints,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault
    )
}
function Set-DataEncryptionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PermanentDataPurgeRequested,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $PermanentDataPurgeReason,

        [Parameter()]
        [System.String]
        $PermanentDataPurgeContact,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Refresh,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function Set-DistributionGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $EmailAddresses,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromDLMembers,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RoomList,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromSendersOrMembers,

        [Parameter()]
        [System.String]
        $CustomAttribute14,

        [Parameter()]
        [System.String]
        $CustomAttribute12,

        [Parameter()]
        [System.String]
        $CustomAttribute10,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute5,

        [Parameter()]
        [System.String]
        $CustomAttribute8,

        [Parameter()]
        [System.String]
        $CustomAttribute5,

        [Parameter()]
        [System.Boolean]
        $BccBlocked,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromDLMembers,

        [Parameter()]
        [System.String]
        $SimpleDisplayName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreNamingPolicy,

        [Parameter()]
        [System.String]
        $MailTip,

        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.Object]
        $PrimarySmtpAddress,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ResetMigrationToUnifiedGroup,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFrom,

        [Parameter()]
        [System.Boolean]
        $BypassNestedModerationEnabled,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.Object]
        $MemberDepartRestriction,

        [Parameter()]
        [System.String]
        $CustomAttribute15,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromSendersOrMembers,

        [Parameter()]
        [System.Object]
        $WindowsEmailAddress,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Boolean]
        $ReportToOriginatorEnabled,

        [Parameter()]
        [System.Object]
        $BypassModerationFromSendersOrMembers,

        [Parameter()]
        [System.Object]
        $RejectMessagesFrom,

        [Parameter()]
        [System.String]
        $CustomAttribute1,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ForceUpgrade,

        [Parameter()]
        [System.Object]
        $ManagedBy,

        [Parameter()]
        [System.Object]
        $Description,

        [Parameter()]
        [System.Object]
        $GrantSendOnBehalfTo,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute1,

        [Parameter()]
        [System.Boolean]
        $ReportToManagerEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireSenderAuthenticationEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute9,

        [Parameter()]
        [System.String]
        $CustomAttribute6,

        [Parameter()]
        [System.Boolean]
        $SendOofMessageToOriginatorEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UpdateMemberCount,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute2,

        [Parameter()]
        [System.String]
        $CustomAttribute13,

        [Parameter()]
        [System.String]
        $CustomAttribute2,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $SendModerationNotifications,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $HiddenGroupMembershipEnabled,

        [Parameter()]
        [System.Object]
        $MemberJoinRestriction,

        [Parameter()]
        [System.Boolean]
        $HiddenFromAddressListsEnabled,

        [Parameter()]
        [System.Object]
        $MailTipTranslations,

        [Parameter()]
        [System.String]
        $CustomAttribute7,

        [Parameter()]
        [System.String]
        $CustomAttribute4,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute3,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute4,

        [Parameter()]
        [System.String]
        $CustomAttribute3,

        [Parameter()]
        [System.String]
        $CustomAttribute11,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-DkimSigningConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $BodyCanonicalization,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublishTxtRecords,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Object]
        $HeaderCanonicalization
    )
}
function Set-EmailAddressPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $EnabledEmailAddressTemplates,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ForceUpgrade,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $EnabledPrimarySMTPAddressTemplate,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-EmailTenantSettings
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $EnablePriorityAccountProtection,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDehydratedFlag
    )
}
function Set-EOPProtectionPolicyRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-ExoPhishSimOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $AddDomains,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Object]
        $AddSenderIpRanges,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $RemoveDomains,

        [Parameter()]
        [System.Object]
        $RemoveSenderIpRanges,

        [Parameter()]
        [System.Object]
        $DomainController
    )
}
function Set-ExoSecOpsOverrideRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-ExternalInOutlook
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $AllowList,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Enabled
    )
}
function Set-FocusedInbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $FocusedInboxOn
    )
}
function Set-GlobalAddressList
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.Object]
        $IncludedRecipients,

        [Parameter()]
        [System.Object]
        $ConditionalCompany,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.Object]
        $ConditionalDepartment,

        [Parameter()]
        [System.Object]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute1,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute5,

        [Parameter()]
        [System.Object]
        $ConditionalCustomAttribute11
    )
}
function Set-HostedConnectionFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $ConfigurationXmlRaw,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Boolean]
        $EnableSafeList,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $IPBlockList,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $IPAllowList,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeDefault
    )
}
function Set-HostedContentFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $InlineSafetyTipsEnabled,

        [Parameter()]
        [System.Object]
        $RegionBlockList,

        [Parameter()]
        [System.String]
        $HighConfidencePhishQuarantineTag,

        [Parameter()]
        [System.Int32]
        $EndUserSpamNotificationFrequency,

        [Parameter()]
        [System.Int32]
        $QuarantineRetentionPeriod,

        [Parameter()]
        [System.Int32]
        $EndUserSpamNotificationLimit,

        [Parameter()]
        [System.Int32]
        $BulkThreshold,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeDefault,

        [Parameter()]
        [System.Object]
        $TestModeBccToRecipients,

        [Parameter()]
        [System.String]
        $PhishQuarantineTag,

        [Parameter()]
        [System.String]
        $AddXHeaderValue,

        [Parameter()]
        [System.Object]
        $MarkAsSpamEmbedTagsInHtml,

        [Parameter()]
        [System.Object]
        $MarkAsSpamFramesInHtml,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithImageLinks,

        [Parameter()]
        [System.Boolean]
        $EnableLanguageBlockList,

        [Parameter()]
        [System.Object]
        $PhishSpamAction,

        [Parameter()]
        [System.String]
        $EndUserSpamNotificationCustomFromName,

        [Parameter()]
        [System.Object]
        $MarkAsSpamSensitiveWordList,

        [Parameter()]
        [System.String]
        $SpamQuarantineTag,

        [Parameter()]
        [System.Object]
        $MarkAsSpamNdrBackscatter,

        [Parameter()]
        [System.Object]
        $BlockedSenders,

        [Parameter()]
        [System.Object]
        $LanguageBlockList,

        [Parameter()]
        [System.Object]
        $HighConfidenceSpamAction,

        [Parameter()]
        [System.Object]
        $AllowedSenderDomains,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithBizOrInfoUrls,

        [Parameter()]
        [System.Object]
        $MarkAsSpamWebBugsInHtml,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $IntraOrgFilterState,

        [Parameter()]
        [System.Object]
        $MarkAsSpamFromAddressAuthFail,

        [Parameter()]
        [System.Object]
        $MarkAsSpamEmptyMessages,

        [Parameter()]
        [System.String]
        $BulkQuarantineTag,

        [Parameter()]
        [System.Object]
        $MarkAsSpamFormTagsInHtml,

        [Parameter()]
        [System.Object]
        $MarkAsSpamObjectTagsInHtml,

        [Parameter()]
        [System.Object]
        $BulkSpamAction,

        [Parameter()]
        [System.Object]
        $EndUserSpamNotificationLanguage,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithRedirectToOtherPort,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $HighConfidencePhishAction,

        [Parameter()]
        [System.Object]
        $RedirectToRecipients,

        [Parameter()]
        [System.Boolean]
        $SpamZapEnabled,

        [Parameter()]
        [System.Object]
        $TestModeAction,

        [Parameter()]
        [System.Boolean]
        $EnableRegionBlockList,

        [Parameter()]
        [System.String]
        $EndUserSpamNotificationCustomSubject,

        [Parameter()]
        [System.Object]
        $MarkAsSpamSpfRecordHardFail,

        [Parameter()]
        [System.Object]
        $EndUserSpamNotificationCustomFromAddress,

        [Parameter()]
        [System.Boolean]
        $DownloadLink,

        [Parameter()]
        [System.Object]
        $SpamAction,

        [Parameter()]
        [System.String]
        $ModifySubjectValue,

        [Parameter()]
        [System.Object]
        $IncreaseScoreWithNumericIps,

        [Parameter()]
        [System.Object]
        $AllowedSenders,

        [Parameter()]
        [System.Object]
        $MarkAsSpamJavaScriptInHtml,

        [Parameter()]
        [System.Object]
        $MarkAsSpamBulkMail,

        [Parameter()]
        [System.Object]
        $BlockedSenderDomains,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $PhishZapEnabled,

        [Parameter()]
        [System.Boolean]
        $EnableEndUserSpamNotifications,

        [Parameter()]
        [System.String]
        $HighConfidenceSpamQuarantineTag
    )
}
function Set-HostedContentFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object]
        $HostedContentFilterPolicy,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-HostedOutboundSpamFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Object]
        $BccSuspiciousOutboundAdditionalRecipients,

        [Parameter()]
        [System.Object]
        $NotifyOutboundSpamRecipients,

        [Parameter()]
        [System.UInt32]
        $RecipientLimitPerDay,

        [Parameter()]
        [System.Object]
        $ActionWhenThresholdReached,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.UInt32]
        $RecipientLimitExternalPerHour,

        [Parameter()]
        [System.Object]
        $AutoForwardingMode,

        [Parameter()]
        [System.Boolean]
        $NotifyOutboundSpam,

        [Parameter()]
        [System.UInt32]
        $RecipientLimitInternalPerHour,

        [Parameter()]
        [System.Boolean]
        $BccSuspiciousOutboundMail
    )
}
function Set-HostedOutboundSpamFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromMemberOf,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFrom,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderDomainIs,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $FromMemberOf,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $SenderDomainIs,

        [Parameter()]
        [System.Object]
        $HostedOutboundSpamFilterPolicy,

        [Parameter()]
        [System.Object[]]
        $From,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Set-InboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $RestrictDomainsToIPAddresses,

        [Parameter()]
        [System.Boolean]
        $CloudServicesMailEnabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $EFSkipMailGateway,

        [Parameter()]
        [System.Boolean]
        $EFTestMode,

        [Parameter()]
        [System.Object]
        $TrustedOrganizations,

        [Parameter()]
        [System.Object]
        $TlsSenderCertificateName,

        [Parameter()]
        [System.Object]
        $ScanAndDropRecipients,

        [Parameter()]
        [System.Object]
        $AssociatedAcceptedDomains,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Boolean]
        $RequireTls,

        [Parameter()]
        [System.Object]
        $SenderDomains,

        [Parameter()]
        [System.Object]
        $SenderIPAddresses,

        [Parameter()]
        [System.Boolean]
        $EFSkipLastIP,

        [Parameter()]
        [System.Object]
        $EFUsers,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConnectorType,

        [Parameter()]
        [System.Boolean]
        $RestrictDomainsToCertificate,

        [Parameter()]
        [System.Object]
        $EFSkipIPs,

        [Parameter()]
        [System.Boolean]
        $TreatMessagesAsInternal,

        [Parameter()]
        [System.Object]
        $ConnectorSource
    )
}
function Set-IntraOrganizationConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-M365DataAtRestEncryptionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Refresh,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function Set-M365DataAtRestEncryptionPolicyAssignment
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $DataEncryptionPolicy
    )
}
function Set-Mailbox
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $EmailAddresses,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromDLMembers,

        [Parameter()]
        [System.Object]
        $AuditOwner,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromSendersOrMembers,

        [Parameter()]
        [System.Object]
        $Type,

        [Parameter()]
        [System.String]
        $CustomAttribute10,

        [Parameter()]
        [System.Boolean]
        $DeliverToMailboxAndForward,

        [Parameter()]
        [System.String]
        $RetentionUrl,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute5,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RecalculateInactiveMailbox,

        [Parameter()]
        [System.String]
        $CustomAttribute8,

        [Parameter()]
        [System.Object]
        $ProhibitSendReceiveQuota,

        [Parameter()]
        [System.String]
        $CustomAttribute5,

        [Parameter()]
        [System.Security.SecureString]
        $RoomMailboxPassword,

        [Parameter()]
        [System.Boolean]
        $CalendarVersionStoreDisabled,

        [Parameter()]
        [System.Object]
        $UseDatabaseQuotaDefaults,

        [Parameter()]
        [System.Boolean]
        $ElcProcessingDisabled,

        [Parameter()]
        [System.String[]]
        $ExcludeFromOrgHolds,

        [Parameter()]
        [System.String]
        $MailboxRegion,

        [Parameter()]
        [System.String]
        $MailTip,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $GroupMailbox,

        [Parameter()]
        [System.Object]
        $ResourceCapacity,

        [Parameter()]
        [System.Object]
        $GrantSendOnBehalfTo,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFrom,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveDisabledArchive,

        [Parameter()]
        [System.Object]
        $JournalArchiveAddress,

        [Parameter()]
        [System.Object]
        $LitigationHoldDuration,

        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ProvisionedForOfficeGraph,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $InactiveMailbox,

        [Parameter()]
        [System.String]
        $RetentionComment,

        [Parameter()]
        [System.Object]
        $MaxReceiveSize,

        [Parameter()]
        [System.Boolean]
        $MessageCopyForSendOnBehalfEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute15,

        [Parameter()]
        [System.Boolean]
        $LitigationHoldEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UpdateEnforcedTimestamp,

        [Parameter()]
        [System.String]
        $ImmutableId,

        [Parameter()]
        [System.Object]
        $WindowsEmailAddress,

        [Parameter()]
        [System.Boolean]
        $UseDatabaseRetentionDefaults,

        [Parameter()]
        [System.Boolean]
        $SchedulerAssistant,

        [Parameter()]
        [System.String[]]
        $RemoveOrphanedHolds,

        [Parameter()]
        [System.Object]
        $RulesQuota,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.String]
        $EnforcedTimestamps,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromSendersOrMembers,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Object]
        $ResourceCustom,

        [Parameter()]
        [System.Boolean]
        $MessageCopyForSMTPClientSubmissionEnabled,

        [Parameter()]
        [System.Object]
        $BypassModerationFromSendersOrMembers,

        [Parameter()]
        [System.Object]
        $DefaultAuditSet,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromDLMembers,

        [Parameter()]
        [System.String]
        $CustomAttribute1,

        [Parameter()]
        [System.Object]
        $EmailAddressDisplayNames,

        [Parameter()]
        [System.Boolean]
        $CalendarRepairDisabled,

        [Parameter()]
        [System.Object]
        $AddressBookPolicy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveMailboxProvisioningConstraint,

        [Parameter()]
        [System.Object]
        $NonCompliantDevices,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.String]
        $LitigationHoldOwner,

        [Parameter()]
        [System.Object]
        $ProhibitSendQuota,

        [Parameter()]
        [System.Boolean]
        $AccountDisabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ClearThrottlingPolicyAssignment,

        [Parameter()]
        [System.Object]
        $AuditDelegate,

        [Parameter()]
        [System.String]
        $CustomAttribute14,

        [Parameter()]
        [System.Object]
        $Languages,

        [Parameter()]
        [System.Boolean]
        $RequireSenderAuthenticationEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute9,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $CustomAttribute6,

        [Parameter()]
        [System.Object]
        $DataEncryptionPolicy,

        [Parameter()]
        [System.Object]
        $ExternalOofOptions,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute4,

        [Parameter()]
        [System.Object]
        $LitigationHoldDate,

        [Parameter()]
        [System.Boolean]
        $EnableRoomMailboxAccount,

        [Parameter()]
        [System.Boolean]
        $HiddenFromAddressListsEnabled,

        [Parameter()]
        [System.Object]
        $RetainDeletedItemsFor,

        [Parameter()]
        [System.Object]
        $MicrosoftOnlineServicesID,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveDelayReleaseHoldApplied,

        [Parameter()]
        [System.Object]
        $AuditAdmin,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute2,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderMailbox,

        [Parameter()]
        [System.Boolean]
        $RetentionHoldEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute13,

        [Parameter()]
        [System.Object]
        $RetentionPolicy,

        [Parameter()]
        [System.String]
        $CustomAttribute2,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveDelayHoldApplied,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $AuditLogAgeLimit,

        [Parameter()]
        [System.Object]
        $StartDateForRetentionHold,

        [Parameter()]
        [System.Object]
        $SendModerationNotifications,

        [Parameter()]
        [System.Object]
        $EndDateForRetentionHold,

        [Parameter()]
        [System.Object]
        $RoleAssignmentPolicy,

        [Parameter()]
        [System.Boolean]
        $IsExcludedFromServingHierarchy,

        [Parameter()]
        [System.String]
        $Office,

        [Parameter()]
        [System.Object]
        $MaxSendSize,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ApplyMandatoryProperties,

        [Parameter()]
        [System.Object]
        $RejectMessagesFrom,

        [Parameter()]
        [System.Object]
        $RecipientLimits,

        [Parameter()]
        [System.Boolean]
        $MessageCopyForSentAsEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.Object]
        $MailTipTranslations,

        [Parameter()]
        [System.String]
        $CustomAttribute7,

        [Parameter()]
        [System.Object]
        $SharingPolicy,

        [Parameter()]
        [System.String]
        $CustomAttribute4,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute1,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ExcludeFromAllOrgHolds,

        [Parameter()]
        [System.Object]
        $ArchiveName,

        [Parameter()]
        [System.Boolean]
        $AuditEnabled,

        [Parameter()]
        [System.Boolean]
        $SingleItemRecoveryEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.Object]
        $IssueWarningQuota,

        [Parameter()]
        [System.Object]
        $StsRefreshTokensValidFrom,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute3,

        [Parameter()]
        [System.Object]
        $ForwardingAddress,

        [Parameter()]
        [System.String]
        $CustomAttribute12,

        [Parameter()]
        [System.String]
        $CustomAttribute3,

        [Parameter()]
        [System.String]
        $CustomAttribute11,

        [Parameter()]
        [System.String]
        $SimpleDisplayName,

        [Parameter()]
        [System.Object]
        $ForwardingSmtpAddress,

        [Parameter()]
        [System.Boolean]
        $MessageTrackingReadStatusEnabled
    )
}
function Set-MailboxAuditBypassAssociation
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AuditBypassEnabled,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-MailboxAutoReplyConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $OOFEventSubject,

        [Parameter()]
        [System.String]
        $DeclineMeetingMessage,

        [Parameter()]
        [System.Object]
        $ExternalAudience,

        [Parameter()]
        [System.Boolean]
        $DeclineEventsForScheduledOOF,

        [Parameter()]
        [System.Boolean]
        $AutoDeclineFutureRequestsWhenOOF,

        [Parameter()]
        [System.Object]
        $AutoReplyState,

        [Parameter()]
        [System.String[]]
        $EventsToDeleteIDs,

        [Parameter()]
        [System.DateTime]
        $StartTime,

        [Parameter()]
        [System.Boolean]
        $CreateOOFEvent,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $DeclineAllEventsForScheduledOOF,

        [Parameter()]
        [System.DateTime]
        $EndTime,

        [Parameter()]
        [System.String]
        $InternalMessage,

        [Parameter()]
        [System.String]
        $ExternalMessage
    )
}
function Set-MailboxCalendarConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $WeatherLocationBookmark,

        [Parameter()]
        [System.Object]
        $WorkspaceUserEnabled,

        [Parameter()]
        [System.Boolean]
        $ConversationalSchedulingEnabled,

        [Parameter()]
        [System.Boolean]
        $HotelEventsFromEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $SkipAgendaMailOnFreeDays,

        [Parameter()]
        [System.Boolean]
        $DiningEventsFromEmailEnabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $CreateEventsFromEmailAsPrivate,

        [Parameter()]
        [System.String]
        $CalendarFeedsPreferredLanguage,

        [Parameter()]
        [System.Boolean]
        $PackageDeliveryEventsFromEmailEnabled,

        [Parameter()]
        [System.Object]
        $WorkingHoursTimeZone,

        [Parameter()]
        [System.Object]
        $WeatherLocations,

        [Parameter()]
        [System.Boolean]
        $FlightEventsFromEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $RentalCarEventsFromEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $DeleteMeetingRequestOnRespond,

        [Parameter()]
        [System.Int32]
        $DefaultMeetingDuration,

        [Parameter()]
        [System.Boolean]
        $ReminderSoundEnabled,

        [Parameter()]
        [System.TimeSpan]
        $WorkingHoursEndTime,

        [Parameter()]
        [System.Object]
        $ShortenEventScopeDefault,

        [Parameter()]
        [System.Boolean]
        $InvoiceEventsFromEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $UseBrightCalendarColorThemeInOwa,

        [Parameter()]
        [System.TimeSpan]
        $DefaultReminderTime,

        [Parameter()]
        [System.Object]
        $LocationDetailsInFreeBusy,

        [Parameter()]
        [System.Object]
        $WeatherEnabled,

        [Parameter()]
        [System.String]
        $CalendarFeedsPreferredRegion,

        [Parameter()]
        [System.Boolean]
        $ServiceAppointmentEventsFromEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $ShowWeekNumbers,

        [Parameter()]
        [System.Boolean]
        $RemindersEnabled,

        [Parameter()]
        [System.Object]
        $WeekStartDay,

        [Parameter()]
        [System.Object]
        $FirstWeekOfYear,

        [Parameter()]
        [System.Int32]
        $DefaultMinutesToReduceShortEventsBy,

        [Parameter()]
        [System.Boolean]
        $AgendaMailIntroductionEnabled,

        [Parameter()]
        [System.TimeSpan]
        $WorkingHoursStartTime,

        [Parameter()]
        [System.String]
        $CalendarFeedsRootPageId,

        [Parameter()]
        [System.Object]
        $DailyAgendaMailSchedule,

        [Parameter()]
        [System.Int32]
        $DefaultMinutesToReduceLongEventsBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AutoDeclineWhenBusy,

        [Parameter()]
        [System.Object]
        $OnlineMeetingsByDefaultEnabled,

        [Parameter()]
        [System.Boolean]
        $PreserveDeclinedMeetings,

        [Parameter()]
        [System.Object]
        $TimeIncrement,

        [Parameter()]
        [System.Object]
        $WorkDays,

        [Parameter()]
        [System.Boolean]
        $EntertainmentEventsFromEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $EventsFromEmailEnabled,

        [Parameter()]
        [System.Object]
        $WeatherUnit,

        [Parameter()]
        [System.Object]
        $DefaultOnlineMeetingProvider,

        [Parameter()]
        [System.Object]
        $MailboxLocation,

        [Parameter()]
        [System.Boolean]
        $AgendaMailEnabled,

        [Parameter()]
        [System.Boolean]
        $AgendaPaneEnabled
    )
}
function Set-MailboxCalendarFolder
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $SharedCalendarSyncStartDate,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SetAsSharingSource,

        [Parameter()]
        [System.Boolean]
        $SearchableUrlEnabled,

        [Parameter()]
        [System.Boolean]
        $PublishEnabled,

        [Parameter()]
        [System.Object]
        $PublishDateRangeTo,

        [Parameter()]
        [System.Object]
        $PublishDateRangeFrom,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseHttps,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ResetUrl,

        [Parameter()]
        [System.Object]
        $DetailLevel,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Set-MailboxFolderPermission
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object[]]
        $AccessRights,

        [Parameter()]
        [System.Object]
        $SharingPermissionFlags,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $SendNotificationToUser
    )
}
function Set-MailboxIRMAccess
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $User,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $AccessLevel
    )
}
function Set-MailboxPlan
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $IssueWarningQuota,

        [Parameter()]
        [System.Object]
        $RoleAssignmentPolicy,

        [Parameter()]
        [System.Object]
        $RetentionPolicy,

        [Parameter()]
        [System.Object]
        $ProhibitSendReceiveQuota,

        [Parameter()]
        [System.Object]
        $MaxSendSize,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ProhibitSendQuota,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $RetainDeletedItemsFor,

        [Parameter()]
        [System.Object]
        $RecipientLimits,

        [Parameter()]
        [System.Object]
        $MaxReceiveSize,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-MailboxRegionalConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $DateFormat,

        [Parameter()]
        [System.String]
        $TimeFormat,

        [Parameter()]
        [System.Object]
        $MailboxLocation,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseCustomRouting,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Archive,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $LocalizeDefaultFolderName,

        [Parameter()]
        [System.Object]
        $TimeZone,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $Language
    )
}
function Set-MailContact
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $WindowsEmailAddress,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromDLMembers,

        [Parameter()]
        [System.String]
        $CustomAttribute10,

        [Parameter()]
        [System.Boolean]
        $RequireSenderAuthenticationEnabled,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute4,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $MacAttachmentFormat,

        [Parameter()]
        [System.String]
        $CustomAttribute8,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $CustomAttribute3,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromSendersOrMembers,

        [Parameter()]
        [System.Object]
        $MailTipTranslations,

        [Parameter()]
        [System.String]
        $CustomAttribute7,

        [Parameter()]
        [System.Object]
        $UseMapiRichTextFormat,

        [Parameter()]
        [System.String]
        $CustomAttribute5,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromSendersOrMembers,

        [Parameter()]
        [System.Boolean]
        $HiddenFromAddressListsEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute6,

        [Parameter()]
        [System.Boolean]
        $UsePreferMessageFormat,

        [Parameter()]
        [System.String]
        $CustomAttribute1,

        [Parameter()]
        [System.Object]
        $BypassModerationFromSendersOrMembers,

        [Parameter()]
        [System.String]
        $CustomAttribute11,

        [Parameter()]
        [System.String]
        $CustomAttribute13,

        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.String]
        $CustomAttribute14,

        [Parameter()]
        [System.String]
        $MailTip,

        [Parameter()]
        [System.Object]
        $MessageBodyFormat,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFrom,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute3,

        [Parameter()]
        [System.String]
        $CustomAttribute15,

        [Parameter()]
        [System.Object]
        $RejectMessagesFrom,

        [Parameter()]
        [System.Object]
        $UserSMimeCertificate,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute1,

        [Parameter()]
        [System.Object]
        $MessageFormat,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute5,

        [Parameter()]
        [System.Object]
        $ExternalEmailAddress,

        [Parameter()]
        [System.String]
        $CustomAttribute4,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute2,

        [Parameter()]
        [System.String]
        $CustomAttribute9,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromDLMembers,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.String]
        $SimpleDisplayName,

        [Parameter()]
        [System.String]
        $CustomAttribute2,

        [Parameter()]
        [System.Object]
        $UserCertificate,

        [Parameter()]
        [System.Object]
        $SendModerationNotifications,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $EmailAddresses,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ForceUpgrade,

        [Parameter()]
        [System.Object]
        $GrantSendOnBehalfTo,

        [Parameter()]
        [System.String]
        $CustomAttribute12
    )
}
function Set-MalwareFilterPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $MakeDefault,

        [Parameter()]
        [System.String]
        $CustomFromName,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.String]
        $CustomExternalBody,

        [Parameter()]
        [System.String]
        $QuarantineTag,

        [Parameter()]
        [System.Boolean]
        $CustomNotifications,

        [Parameter()]
        [System.Boolean]
        $EnableExternalSenderAdminNotifications,

        [Parameter()]
        [System.Object]
        $InternalSenderAdminAddress,

        [Parameter()]
        [System.String[]]
        $FileTypes,

        [Parameter()]
        [System.Boolean]
        $EnableInternalSenderAdminNotifications,

        [Parameter()]
        [System.Object]
        $CustomFromAddress,

        [Parameter()]
        [System.Boolean]
        $IsPolicyOverrideApplied,

        [Parameter()]
        [System.Boolean]
        $ZapEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ExternalSenderAdminAddress,

        [Parameter()]
        [System.String]
        $CustomExternalSubject,

        [Parameter()]
        [System.Object]
        $FileTypeAction,

        [Parameter()]
        [System.String]
        $CustomInternalSubject,

        [Parameter()]
        [System.String]
        $CustomInternalBody,

        [Parameter()]
        [System.Boolean]
        $EnableFileFilter
    )
}
function Set-MalwareFilterRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object]
        $MalwareFilterPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-ManagementRoleAssignment
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RecipientGroupScope,

        [Parameter()]
        [System.Object]
        $CustomRecipientWriteScope,

        [Parameter()]
        [System.Object]
        $RecipientAdministrativeUnitScope,

        [Parameter()]
        [System.Object]
        $ExclusiveRecipientWriteScope,

        [Parameter()]
        [System.Object]
        $CustomResourceScope,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $RecipientOrganizationalUnitScope,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $RecipientRelativeWriteScope,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-ManagementRoleEntry
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String[]]
        $Parameters,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveParameter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AddParameter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-ManagementScope
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $RecipientRoot,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $RecipientRestrictionFilter,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-MessageClassification
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $SenderDescription,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $RecipientDescription,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $PermissionMenuVisible,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Guid]
        $ClassificationID,

        [Parameter()]
        [System.Object]
        $DisplayPrecedence,

        [Parameter()]
        [System.Boolean]
        $RetainClassificationEnabled
    )
}
function Set-MigrationBatch
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Byte[]]
        $CSVData,

        [Parameter()]
        [System.Object]
        $ReportInterval,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $MoveOptions,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Update,

        [Parameter()]
        [System.Object]
        $NotificationEmails,

        [Parameter()]
        [System.Boolean]
        $SkipReports,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ApproveSkippedItems,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SyncNow,

        [Parameter()]
        [System.Object]
        $SkipMerging,

        [Parameter()]
        [System.Object]
        $SkipMoving,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AddUsers,

        [Parameter()]
        [System.Object]
        $CompleteAfter,

        [Parameter()]
        [System.Object]
        $Partition,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $BadItemLimit,

        [Parameter()]
        [System.Boolean]
        $AllowUnknownColumnsInCSV,

        [Parameter()]
        [System.Object]
        $StartAfter,

        [Parameter()]
        [System.Object]
        $LargeItemLimit
    )
}
function Set-MigrationEndpoint
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $AcceptUntrustedCertificates,

        [Parameter()]
        [System.Object]
        $MaxConcurrentMigrations,

        [Parameter()]
        [System.Byte[]]
        $ServiceAccountKeyFileData,

        [Parameter()]
        [System.Object]
        $TestMailbox,

        [Parameter()]
        [System.String]
        $ExchangeServer,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SkipVerification,

        [Parameter()]
        [System.Object]
        $Authentication,

        [Parameter()]
        [System.String]
        $AppSecretKeyVaultUrl,

        [Parameter()]
        [System.Object]
        $Port,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.Object]
        $RemoteServer,

        [Parameter()]
        [System.Object]
        $Partition,

        [Parameter()]
        [System.Object]
        $MailboxPermission,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $SourceMailboxLegacyDN,

        [Parameter()]
        [System.String]
        $NspiServer,

        [Parameter()]
        [System.Object]
        $RPCProxyServer,

        [Parameter()]
        [System.String]
        $PublicFolderDatabaseServerLegacyDN,

        [Parameter()]
        [System.Object]
        $Security,

        [Parameter()]
        [System.Object]
        $MaxConcurrentIncrementalSyncs,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credentials
    )
}
function Set-MobileDeviceMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $AllowMicrosoftPushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowUnsignedApplications,

        [Parameter()]
        [System.Boolean]
        $AllowUnsignedInstallationPackages,

        [Parameter()]
        [System.Boolean]
        $AllowExternalDeviceManagement,

        [Parameter()]
        [System.Boolean]
        $AllowIrDA,

        [Parameter()]
        [System.Boolean]
        $AllowStorageCard,

        [Parameter()]
        [System.Int32]
        $PasswordHistory,

        [Parameter()]
        [System.Boolean]
        $AllowNonProvisionableDevices,

        [Parameter()]
        [System.Object]
        $UnapprovedInROMApplicationList,

        [Parameter()]
        [System.Boolean]
        $RequireEncryptedSMIMEMessages,

        [Parameter()]
        [System.Boolean]
        $RequireDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $AllowInternetSharing,

        [Parameter()]
        [System.Boolean]
        $PasswordEnabled,

        [Parameter()]
        [System.Object]
        $RequireSignedSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $MaxEmailHTMLBodyTruncationSize,

        [Parameter()]
        [System.Int32]
        $MinPasswordComplexCharacters,

        [Parameter()]
        [System.Boolean]
        $UNCAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowCamera,

        [Parameter()]
        [System.Boolean]
        $IrmEnabled,

        [Parameter()]
        [System.Object]
        $PasswordExpiration,

        [Parameter()]
        [System.Boolean]
        $AllowBrowser,

        [Parameter()]
        [System.Object]
        $MaxEmailAgeFilter,

        [Parameter()]
        [System.Boolean]
        $RequireManualSyncWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $AlphanumericPasswordRequired,

        [Parameter()]
        [System.Object]
        $AllowSMIMEEncryptionAlgorithmNegotiation,

        [Parameter()]
        [System.Boolean]
        $DeviceEncryptionEnabled,

        [Parameter()]
        [System.Object]
        $MaxEmailBodyTruncationSize,

        [Parameter()]
        [System.Object]
        $AllowBluetooth,

        [Parameter()]
        [System.Boolean]
        $WSSAccessEnabled,

        [Parameter()]
        [System.Object]
        $RequireEncryptionSMIMEAlgorithm,

        [Parameter()]
        [System.Object]
        $DevicePolicyRefreshInterval,

        [Parameter()]
        [System.Boolean]
        $AllowGooglePushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowMobileOTAUpdate,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $MaxAttachmentSize,

        [Parameter()]
        [System.Boolean]
        $AllowSimplePassword,

        [Parameter()]
        [System.Boolean]
        $AllowConsumerEmail,

        [Parameter()]
        [System.Boolean]
        $AllowDesktopSync,

        [Parameter()]
        [System.Boolean]
        $PasswordRecoveryEnabled,

        [Parameter()]
        [System.Boolean]
        $RequireStorageCardEncryption,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AllowSMIMESoftCerts,

        [Parameter()]
        [System.Boolean]
        $AllowRemoteDesktop,

        [Parameter()]
        [System.Boolean]
        $AttachmentsEnabled,

        [Parameter()]
        [System.Object]
        $MaxCalendarAgeFilter,

        [Parameter()]
        [System.Boolean]
        $AllowWiFi,

        [Parameter()]
        [System.Boolean]
        $AllowApplePushNotifications,

        [Parameter()]
        [System.Boolean]
        $AllowPOPIMAPEmail,

        [Parameter()]
        [System.Boolean]
        $IsDefault,

        [Parameter()]
        [System.Object]
        $MaxInactivityTimeLock,

        [Parameter()]
        [System.Object]
        $ApprovedApplicationList,

        [Parameter()]
        [System.Boolean]
        $AllowTextMessaging,

        [Parameter()]
        [System.Object]
        $MaxPasswordFailedAttempts,

        [Parameter()]
        [System.Boolean]
        $RequireSignedSMIMEMessages,

        [Parameter()]
        [System.Object]
        $MinPasswordLength,

        [Parameter()]
        [System.Boolean]
        $AllowHTMLEmail,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-OfflineAddressBook
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $Versions,

        [Parameter()]
        [System.Object]
        $Schedule,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ApplyMandatoryProperties,

        [Parameter()]
        [System.Boolean]
        $ZipOabFilesBeforeUploading,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UpgradeFromE14,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Int32]
        $FullOabDownloadPreventionThreshold,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DiffRetentionPeriod,

        [Parameter()]
        [System.Object[]]
        $AddressLists,

        [Parameter()]
        [System.Object]
        $ConfiguredAttributes,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UseDefaultAttributes,

        [Parameter()]
        [System.Boolean]
        $IsDefault
    )
}
function Set-OMEConfiguration
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Double]
        $ExternalMailExpiryInDays,

        [Parameter()]
        [System.String]
        $ReadButtonText,

        [Parameter()]
        [System.String]
        $PortalText,

        [Parameter()]
        [System.Byte[]]
        $Image,

        [Parameter()]
        [System.String]
        $IntroductionText,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $BackgroundColor,

        [Parameter()]
        [System.String]
        $DisclaimerText,

        [Parameter()]
        [System.String]
        $PrivacyStatementUrl,

        [Parameter()]
        [System.Boolean]
        $SocialIdSignIn,

        [Parameter()]
        [System.String]
        $EmailText,

        [Parameter()]
        [System.Boolean]
        $OTPEnabled,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-OnPremisesOrganization
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $InboundConnector,

        [Parameter()]
        [System.Object]
        $OutboundConnector,

        [Parameter()]
        [System.String]
        $OrganizationName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $OrganizationRelationship,

        [Parameter()]
        [System.Object]
        $HybridDomains
    )
}
function Set-Organization
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $UnifiedAuditLogIngestionEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-OrganizationConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $BookingsSearchEngineIndexDisabled,

        [Parameter()]
        [System.Object]
        $EwsAllowMacOutlook,

        [Parameter()]
        [System.Int32]
        $RequiredCharsetCoverage,

        [Parameter()]
        [System.Boolean]
        $PublicComputersDetectionEnabled,

        [Parameter()]
        [System.Boolean]
        $MaskClientIpInReceivedHeadersEnabled,

        [Parameter()]
        [System.Boolean]
        $OAuth2ClientProfileEnabled,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderProhibitPostQuota,

        [Parameter()]
        [System.Boolean]
        $EnableOutlookEvents,

        [Parameter()]
        [System.Boolean]
        $OutlookGifPickerDisabled,

        [Parameter()]
        [System.String]
        $VisibleMeetingUpdateProperties,

        [Parameter()]
        [System.Object]
        $EwsEnabled,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderIssueWarningQuota,

        [Parameter()]
        [System.Boolean]
        $RefreshSessionEnabled,

        [Parameter()]
        [System.Boolean]
        $IsGroupFoldersAndRulesEnabled,

        [Parameter()]
        [System.Boolean]
        $WebSuggestedRepliesDisabled,

        [Parameter()]
        [System.Boolean]
        $ReadTrackingEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsExposureOfStaffDetailsRestricted,

        [Parameter()]
        [System.Object]
        $MessageRecallEnabled,

        [Parameter()]
        [System.Boolean]
        $ExchangeNotificationEnabled,

        [Parameter()]
        [System.Boolean]
        $AutoEnableArchiveMailbox,

        [Parameter()]
        [System.Boolean]
        $WorkspaceTenantEnabled,

        [Parameter()]
        [System.Object]
        $DistributionGroupDefaultOU,

        [Parameter()]
        [System.Boolean]
        $BookingsSocialSharingRestricted,

        [Parameter()]
        [System.Int32]
        $DefaultMinutesToReduceLongEventsBy,

        [Parameter()]
        [System.Boolean]
        $MessageRecallAlertRecipientsEnabled,

        [Parameter()]
        [System.Object]
        $EwsAllowList,

        [Parameter()]
        [System.Boolean]
        $BookingsAuthEnabled,

        [Parameter()]
        [System.Boolean]
        $AcceptedDomainApprovedSendersEnabled,

        [Parameter()]
        [System.Boolean]
        $AutomaticForcedReadReceiptEnabled,

        [Parameter()]
        [System.Object]
        $OnlineMeetingsByDefaultEnabled,

        [Parameter()]
        [System.String]
        $BookingsNamingPolicyPrefix,

        [Parameter()]
        [System.Boolean]
        $FindTimeLockPollForAttendeesEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsNamingPolicyPrefixEnabled,

        [Parameter()]
        [System.Boolean]
        $ConnectorsEnabledForSharepoint,

        [Parameter()]
        [System.Object]
        $EwsBlockList,

        [Parameter()]
        [System.Object]
        $EwsAllowOutlook,

        [Parameter()]
        [System.Boolean]
        $OutlookMobileSingleAccountEnabled,

        [Parameter()]
        [System.Object]
        $ActivityBasedAuthenticationTimeoutInterval,

        [Parameter()]
        [System.Boolean]
        $LinkPreviewEnabled,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderDeletedItemRetention,

        [Parameter()]
        [System.Boolean]
        $MailTipsAllTipsEnabled,

        [Parameter()]
        [System.Object]
        $DistributionGroupNameBlockedWordsList,

        [Parameter()]
        [System.Boolean]
        $ConnectorsEnabledForTeams,

        [Parameter()]
        [System.Boolean]
        $EndUserDLUpgradeFlowsDisabled,

        [Parameter()]
        [System.Object]
        $MessageRecallMaxRecallableAge,

        [Parameter()]
        [System.Object]
        $FocusedInboxOn,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderAgeLimit,

        [Parameter()]
        [System.Boolean]
        $EnableForwardingAddressSyncForMailboxes,

        [Parameter()]
        [System.Object]
        $DefaultGroupAccessType,

        [Parameter()]
        [System.Boolean]
        $BlockMoveMessagesForGroupFolders,

        [Parameter()]
        [System.Boolean]
        $FindTimeAutoScheduleDisabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Uri]
        $SiteMailboxCreationURL,

        [Parameter()]
        [System.Boolean]
        $ConnectorsEnabledForOutlook,

        [Parameter()]
        [System.UInt32]
        $MailTipsLargeAudienceThreshold,

        [Parameter()]
        [System.Boolean]
        $DirectReportsGroupAutoCreationEnabled,

        [Parameter()]
        [System.Boolean]
        $TenantAdminNotificationForDelayedDelicensingEnabled,

        [Parameter()]
        [System.Boolean]
        $MessageRemindersEnabled,

        [Parameter()]
        [System.Boolean]
        $PublicFolderShowClientControl,

        [Parameter()]
        [System.Boolean]
        $AppsForOfficeEnabled,

        [Parameter()]
        [System.Boolean]
        $UnblockUnsafeSenderPromptEnabled,

        [Parameter()]
        [System.Boolean]
        $ConnectorsActionableMessagesEnabled,

        [Parameter()]
        [System.Int32]
        $DefaultMinutesToReduceShortEventsBy,

        [Parameter()]
        [System.Boolean]
        $CalendarVersionStoreEnabled,

        [Parameter()]
        [System.Object]
        $RemotePublicFolderMailboxes,

        [Parameter()]
        [System.Boolean]
        $EndUserMailNotificationForDelayedDelicensingEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsBlockedWordsEnabled,

        [Parameter()]
        [System.Boolean]
        $FindTimeOnlineMeetingOptionDisabled,

        [Parameter()]
        [System.Object]
        $HierarchicalAddressBookRoot,

        [Parameter()]
        [System.Boolean]
        $AsyncSendEnabled,

        [Parameter()]
        [System.Boolean]
        $HybridRSVPEnabled,

        [Parameter()]
        [System.Boolean]
        $ConnectorsEnabled,

        [Parameter()]
        [System.Boolean]
        $PerTenantSwitchToESTSEnabled,

        [Parameter()]
        [System.Int32]
        $PreferredInternetCodePageForShiftJis,

        [Parameter()]
        [System.Boolean]
        $BookingsPhoneNumberEntryRestricted,

        [Parameter()]
        [System.Boolean]
        $MobileAppEducationEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsNamingPolicyEnabled,

        [Parameter()]
        [System.Boolean]
        $ActivityBasedAuthenticationTimeoutEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsAddressEntryRestricted,

        [Parameter()]
        [System.Boolean]
        $RejectDirectSend,

        [Parameter()]
        [System.Boolean]
        $BookingsSmsMicrosoftEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsEnabled,

        [Parameter()]
        [System.Object]
        $ExchangeNotificationRecipients,

        [Parameter()]
        [System.Object]
        $EwsAllowEntourage,

        [Parameter()]
        [System.Boolean]
        $IsAgendaMailEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsMembershipApprovalRequired,

        [Parameter()]
        [System.Boolean]
        $CustomerLockboxEnabled,

        [Parameter()]
        [System.Boolean]
        $OutlookPayEnabled,

        [Parameter()]
        [System.Boolean]
        $MessageRecallAlertRecipientsReadMessagesOnlyEnabled,

        [Parameter()]
        [System.Boolean]
        $MailTipsMailboxSourcedTipsEnabled,

        [Parameter()]
        [System.Boolean]
        $OutlookTextPredictionDisabled,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderMaxItemSize,

        [Parameter()]
        [System.Object]
        $PublicFoldersEnabled,

        [Parameter()]
        [System.Boolean]
        $SendFromAliasEnabled,

        [Parameter()]
        [System.Object]
        $IPListBlocked,

        [Parameter()]
        [System.Boolean]
        $ActivityBasedAuthenticationTimeoutWithSingleSignOnEnabled,

        [Parameter()]
        [System.Boolean]
        $IsGroupMemberAllowedToEditContent,

        [Parameter()]
        [System.Boolean]
        $EwsOperationAccessPolicyEnabled,

        [Parameter()]
        [System.Boolean]
        $DisablePlusAddressInRecipients,

        [Parameter()]
        [System.Boolean]
        $OutlookMobileGCCRestrictionsEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AutoExpandingArchive,

        [Parameter()]
        [System.Object]
        $RecallReadMessagesEnabled,

        [Parameter()]
        [System.Boolean]
        $SharedDomainEmailAddressFlowEnabled,

        [Parameter()]
        [System.Object]
        $ShortenEventScopeDefault,

        [Parameter()]
        [System.Boolean]
        $DelayedDelicensingEnabled,

        [Parameter()]
        [System.Boolean]
        $MailTipsGroupMetricsEnabled,

        [Parameter()]
        [System.Boolean]
        $SmtpActionableMessagesEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsNamingPolicySuffixEnabled,

        [Parameter()]
        [System.Boolean]
        $AutodiscoverPartialDirSync,

        [Parameter()]
        [System.Boolean]
        $BookingsCreationOfCustomQuestionsRestricted,

        [Parameter()]
        [System.Boolean]
        $AuditDisabled,

        [Parameter()]
        [System.Boolean]
        $FindTimeAttendeeAuthenticationEnabled,

        [Parameter()]
        [System.String]
        $BookingsNamingPolicySuffix,

        [Parameter()]
        [System.Object]
        $DistributionGroupNamingPolicy,

        [Parameter()]
        [System.Boolean]
        $ComplianceMLBgdCrawlEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsPaymentsEnabled,

        [Parameter()]
        [System.Boolean]
        $OutlookMobileHelpShiftEnabled,

        [Parameter()]
        [System.Boolean]
        $PostponeRoamingSignaturesUntilLater,

        [Parameter()]
        [System.Boolean]
        $MailTipsExternalRecipientsTipsEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsNotesEntryRestricted,

        [Parameter()]
        [System.Boolean]
        $MatchSenderOrganizerProperties,

        [Parameter()]
        [System.Object]
        $EwsApplicationAccessPolicy,

        [Parameter()]
        [System.Boolean]
        $MessageHighlightsEnabled,

        [Parameter()]
        [System.Boolean]
        $ElcProcessingDisabled,

        [Parameter()]
        [System.Boolean]
        $WebPushNotificationsDisabled,

        [Parameter()]
        [System.Object]
        $DefaultPublicFolderMovedItemRetention,

        [Parameter()]
        [System.Boolean]
        $LeanPopoutEnabled,

        [Parameter()]
        [System.Object]
        $DefaultAuthenticationPolicy,

        [Parameter()]
        [System.String]
        $EwsOperationAccessPolicyAllowList,

        [Parameter()]
        [System.Int32]
        $ByteEncoderTypeFor7BitCharsets,

        [Parameter()]
        [System.Boolean]
        $ConnectorsEnabledForYammer
    )
}
function Set-OrganizationRelationship
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $MailboxMovePublishedScopes,

        [Parameter()]
        [System.Object]
        $MailTipsAccessLevel,

        [Parameter()]
        [System.String]
        $OAuthApplicationId,

        [Parameter()]
        [System.Object]
        $MailTipsAccessScope,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $MailboxMoveCapability,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $DeliveryReportEnabled,

        [Parameter()]
        [System.Boolean]
        $MailTipsAccessEnabled
    )
}
function Set-OutboundConnector
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $RouteAllMessagesViaOnPremises,

        [Parameter()]
        [System.Object]
        $RecipientDomains,

        [Parameter()]
        [System.Boolean]
        $CloudServicesMailEnabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $Enabled,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Boolean]
        $AllAcceptedDomains,

        [Parameter()]
        [System.Boolean]
        $TestMode,

        [Parameter()]
        [System.String]
        $Comment,

        [Parameter()]
        [System.Boolean]
        $IsTransportRuleScoped,

        [Parameter()]
        [System.Boolean]
        $IsValidated,

        [Parameter()]
        [System.Boolean]
        $UseMXRecord,

        [Parameter()]
        [System.Object]
        $LastValidationTimestamp,

        [Parameter()]
        [System.Object]
        $TlsSettings,

        [Parameter()]
        [System.String[]]
        $ValidationRecipients,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ConnectorType,

        [Parameter()]
        [System.Object]
        $SmartHosts,

        [Parameter()]
        [System.Boolean]
        $SenderRewritingEnabled,

        [Parameter()]
        [System.Object]
        $TlsDomain,

        [Parameter()]
        [System.Object]
        $ConnectorSource
    )
}
function Set-OwaMailboxPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $DefaultClientLanguage,

        [Parameter()]
        [System.Boolean]
        $ContactsEnabled,

        [Parameter()]
        [System.Boolean]
        $PersonalAccountCalendarsEnabled,

        [Parameter()]
        [System.Boolean]
        $MessagePreviewsDisabled,

        [Parameter()]
        [System.Boolean]
        $ExplicitLogonEnabled,

        [Parameter()]
        [System.Boolean]
        $ShowOnlineArchiveEnabled,

        [Parameter()]
        [System.Object]
        $BlockedFileTypes,

        [Parameter()]
        [System.Boolean]
        $NpsSurveysEnabled,

        [Parameter()]
        [System.Boolean]
        $LinkedInEnabled,

        [Parameter()]
        [System.Object]
        $ConditionalAccessPolicy,

        [Parameter()]
        [System.String[]]
        $AllowedOrganizationAccountDomains,

        [Parameter()]
        [System.Boolean]
        $ChangePasswordEnabled,

        [Parameter()]
        [System.Boolean]
        $SignaturesEnabled,

        [Parameter()]
        [System.String]
        $BookingsMailboxDomain,

        [Parameter()]
        [System.Boolean]
        $WeatherEnabled,

        [Parameter()]
        [System.Boolean]
        $WacViewingOnPublicComputersEnabled,

        [Parameter()]
        [System.Boolean]
        $OutlookBetaToggleEnabled,

        [Parameter()]
        [System.Boolean]
        $SMimeSuppressNameChecksEnabled,

        [Parameter()]
        [System.Object]
        $ActionForUnknownFileAndMIMETypes,

        [Parameter()]
        [System.String]
        $ExternalSPMySiteHostURL,

        [Parameter()]
        [System.Boolean]
        $OfflineEnabledWeb,

        [Parameter()]
        [System.Object]
        $HideClassicOutlookToggleOut,

        [Parameter()]
        [System.Boolean]
        $JournalEnabled,

        [Parameter()]
        [System.Boolean]
        $CalendarEnabled,

        [Parameter()]
        [System.Boolean]
        $SpellCheckerEnabled,

        [Parameter()]
        [System.Boolean]
        $DisplayPhotosEnabled,

        [Parameter()]
        [System.Boolean]
        $TasksEnabled,

        [Parameter()]
        [System.Boolean]
        $GroupCreationEnabled,

        [Parameter()]
        [System.Object]
        $ForceSaveFileTypes,

        [Parameter()]
        [System.Object]
        $OutlookNewslettersAccessLevel,

        [Parameter()]
        [System.Object]
        $ChangeSettingsAccountEnabled,

        [Parameter()]
        [System.Object]
        $AdditionalAccountsEnabled,

        [Parameter()]
        [System.Boolean]
        $TeamsnapCalendarsEnabled,

        [Parameter()]
        [System.Boolean]
        $WacViewingOnPrivateComputersEnabled,

        [Parameter()]
        [System.Boolean]
        $TextMessagingEnabled,

        [Parameter()]
        [System.Boolean]
        $SearchFoldersEnabled,

        [Parameter()]
        [System.Boolean]
        $UserVoiceEnabled,

        [Parameter()]
        [System.Boolean]
        $ForceWacViewingFirstOnPublicComputers,

        [Parameter()]
        [System.Boolean]
        $GlobalAddressListEnabled,

        [Parameter()]
        [System.Boolean]
        $IRMEnabled,

        [Parameter()]
        [System.Boolean]
        $DirectFileAccessOnPublicComputersEnabled,

        [Parameter()]
        [System.Boolean]
        $WacOMEXEnabled,

        [Parameter()]
        [System.Boolean]
        $DirectFileAccessOnPrivateComputersEnabled,

        [Parameter()]
        [System.Object]
        $OutlookNewslettersReactions,

        [Parameter()]
        [System.Boolean]
        $OfflineEnabledWin,

        [Parameter()]
        [System.Object]
        $ItemsToOtherAccountsEnabled,

        [Parameter()]
        [System.Boolean]
        $WSSAccessOnPublicComputersEnabled,

        [Parameter()]
        [System.Object]
        $ForceSaveMimeTypes,

        [Parameter()]
        [System.Boolean]
        $OnSendAddinsEnabled,

        [Parameter()]
        [System.Boolean]
        $WacExternalServicesEnabled,

        [Parameter()]
        [System.String]
        $InternalSPMySiteHostURL,

        [Parameter()]
        [System.Boolean]
        $RemindersAndNotificationsEnabled,

        [Parameter()]
        [System.Boolean]
        $SatisfactionEnabled,

        [Parameter()]
        [System.Boolean]
        $OWALightEnabled,

        [Parameter()]
        [System.Object]
        $InstantMessagingType,

        [Parameter()]
        [System.Object]
        $OutlookDataFile,

        [Parameter()]
        [System.Boolean]
        $AccountTransferEnabled,

        [Parameter()]
        [System.Object]
        $PersonalAccountsEnabled,

        [Parameter()]
        [System.String]
        $DefaultTheme,

        [Parameter()]
        [System.Boolean]
        $SetPhotoEnabled,

        [Parameter()]
        [System.Boolean]
        $ClassicAttachmentsEnabled,

        [Parameter()]
        [System.Boolean]
        $AllowCopyContactsToDeviceAddressBook,

        [Parameter()]
        [System.Object]
        $AllowedMimeTypes,

        [Parameter()]
        [System.Object]
        $OutlookNewslettersShowMore,

        [Parameter()]
        [System.Object]
        $OutboundCharset,

        [Parameter()]
        [System.Boolean]
        $LocalEventsEnabled,

        [Parameter()]
        [System.Boolean]
        $ReportJunkEmailEnabled,

        [Parameter()]
        [System.Boolean]
        $UseISO885915,

        [Parameter()]
        [System.Boolean]
        $ForceWacViewingFirstOnPrivateComputers,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $UMIntegrationEnabled,

        [Parameter()]
        [System.Boolean]
        $NotesEnabled,

        [Parameter()]
        [System.Boolean]
        $OrganizationEnabled,

        [Parameter()]
        [System.Object]
        $WebPartsFrameOptionsType,

        [Parameter()]
        [System.String]
        $SetPhotoURL,

        [Parameter()]
        [System.Boolean]
        $WacEditingEnabled,

        [Parameter()]
        [System.Boolean]
        $PublicFoldersEnabled,

        [Parameter()]
        [System.Boolean]
        $BookingsMailboxCreationEnabled,

        [Parameter()]
        [System.Boolean]
        $ForceSaveAttachmentFilteringEnabled,

        [Parameter()]
        [System.Int32]
        $LogonAndErrorLanguage,

        [Parameter()]
        [System.Boolean]
        $WSSAccessOnPrivateComputersEnabled,

        [Parameter()]
        [System.Boolean]
        $AllAddressListsEnabled,

        [Parameter()]
        [System.Boolean]
        $EmptyStateEnabled,

        [Parameter()]
        [System.Boolean]
        $ProjectMocaEnabled,

        [Parameter()]
        [System.Boolean]
        $DelegateAccessEnabled,

        [Parameter()]
        [System.Boolean]
        $PremiumClientEnabled,

        [Parameter()]
        [System.Object]
        $BlockedMimeTypes,

        [Parameter()]
        [System.Boolean]
        $PlacesEnabled,

        [Parameter()]
        [System.Boolean]
        $FeedbackEnabled,

        [Parameter()]
        [System.Boolean]
        $SilverlightEnabled,

        [Parameter()]
        [System.Boolean]
        $RecoverDeletedItemsEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault,

        [Parameter()]
        [System.Boolean]
        $UseGB18030,

        [Parameter()]
        [System.Object]
        $AllowOfflineOn,

        [Parameter()]
        [System.Object]
        $AllowedFileTypes,

        [Parameter()]
        [System.Boolean]
        $ExternalImageProxyEnabled,

        [Parameter()]
        [System.Boolean]
        $RulesEnabled,

        [Parameter()]
        [System.Object]
        $OneWinNativeOutlookEnabled,

        [Parameter()]
        [System.Boolean]
        $FreCardsEnabled,

        [Parameter()]
        [System.Boolean]
        $ActiveSyncIntegrationEnabled,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Boolean]
        $ThemeSelectionEnabled,

        [Parameter()]
        [System.Boolean]
        $InstantMessagingEnabled,

        [Parameter()]
        [System.Boolean]
        $AdditionalStorageProvidersAvailable,

        [Parameter()]
        [System.Boolean]
        $InterestingCalendarsEnabled,

        [Parameter()]
        [System.Boolean]
        $BizBarEnabled,

        [Parameter()]
        [System.Boolean]
        $OneDriveAttachmentsEnabled,

        [Parameter()]
        [System.Boolean]
        $PrintWithoutDownloadEnabled,

        [Parameter()]
        [System.Boolean]
        $SaveAttachmentsToCloudEnabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $PhoneticSupportEnabled,

        [Parameter()]
        [System.Boolean]
        $SkipCreateUnifiedGroupCustomSharepointClassification,

        [Parameter()]
        [System.Boolean]
        $ReferenceAttachmentsEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $DisableFacebook
    )
}
function Set-PartnerApplication
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $ApplicationIdentifier,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $LinkedAccount,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $AcceptSecurityIdentifierInformation,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String[]]
        $ActAsPermissions,

        [Parameter()]
        [System.Object]
        $AccountType,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function Set-PerimeterConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $GatewayIPAddresses
    )
}
function Set-Place
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $PostalCode,

        [Parameter()]
        [System.String]
        $Phone,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $CountryOrRegion,

        [Parameter()]
        [System.String]
        $ParentId,

        [Parameter()]
        [System.String]
        $Street,

        [Parameter()]
        [System.Boolean]
        $IsWheelChairAccessible,

        [Parameter()]
        [System.String]
        $AudioDeviceName,

        [Parameter()]
        [System.String]
        $DisplayDeviceName,

        [Parameter()]
        [System.String]
        $Building,

        [Parameter()]
        [System.String]
        $State,

        [Parameter()]
        [System.String]
        $City,

        [Parameter()]
        [System.Object]
        $Floor,

        [Parameter()]
        [System.String]
        $VideoDeviceName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String[]]
        $Tags,

        [Parameter()]
        [System.String]
        $FloorLabel,

        [Parameter()]
        [System.Object]
        $Capacity,

        [Parameter()]
        [System.String]
        $Label,

        [Parameter()]
        [System.Object]
        $GeoCoordinates,

        [Parameter()]
        [System.Boolean]
        $MTREnabled
    )
}
function Set-PolicyTipConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Value,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-ProtectionAlert
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Set-QuarantinePolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $IncludeMessagesFromBlockedSenderAddress,

        [Parameter()]
        [System.Object]
        $MultiLanguageCustomDisclaimer,

        [Parameter()]
        [System.Object]
        $AdminNotificationLanguage,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $EndUserSpamNotificationCustomFromAddress,

        [Parameter()]
        [System.String]
        $CustomDisclaimer,

        [Parameter()]
        [System.Int32]
        $EndUserQuarantinePermissionsValue,

        [Parameter()]
        [System.Boolean]
        $ESNEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IgnoreDehydratedFlag,

        [Parameter()]
        [System.Object]
        $EndUserQuarantinePermissions,

        [Parameter()]
        [System.Boolean]
        $AdminNotificationsEnabled,

        [Parameter()]
        [System.Object]
        $EndUserSpamNotificationLanguage,

        [Parameter()]
        [System.Object]
        $DomainController,

        [Parameter()]
        [System.Object]
        $MultiLanguageSenderName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $AdminQuarantinePermissionsList,

        [Parameter()]
        [System.Object]
        $MultiLanguageSetting,

        [Parameter()]
        [System.TimeSpan]
        $EndUserSpamNotificationFrequency,

        [Parameter()]
        [System.Int32]
        $QuarantineRetentionDays,

        [Parameter()]
        [System.Object]
        $EsnCustomSubject,

        [Parameter()]
        [System.Boolean]
        $OrganizationBrandingEnabled,

        [Parameter()]
        [System.Int32]
        $AdminNotificationFrequencyInDays
    )
}
function Set-RemoteDomain
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $AutoReplyEnabled,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $TNEFEnabled,

        [Parameter()]
        [System.Boolean]
        $DeliveryReportEnabled,

        [Parameter()]
        [System.Object]
        $RequiredCharsetCoverage,

        [Parameter()]
        [System.Boolean]
        $MeetingForwardNotificationEnabled,

        [Parameter()]
        [System.Object]
        $ContentType,

        [Parameter()]
        [System.Object]
        $ByteEncoderTypeFor7BitCharsets,

        [Parameter()]
        [System.Boolean]
        $AutoForwardEnabled,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Boolean]
        $TrustedMailInboundEnabled,

        [Parameter()]
        [System.Object]
        $LineWrapSize,

        [Parameter()]
        [System.String]
        $CharacterSet,

        [Parameter()]
        [System.Object]
        $PreferredInternetCodePageForShiftJis,

        [Parameter()]
        [System.String]
        $NonMimeCharacterSet,

        [Parameter()]
        [System.Boolean]
        $TargetDeliveryDomain,

        [Parameter()]
        [System.Boolean]
        $TrustedMailOutboundEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $DisplaySenderName,

        [Parameter()]
        [System.Object]
        $AllowedOOFType,

        [Parameter()]
        [System.Boolean]
        $NDRDiagnosticInfoEnabled,

        [Parameter()]
        [System.Boolean]
        $NDREnabled,

        [Parameter()]
        [System.Boolean]
        $IsInternal,

        [Parameter()]
        [System.Boolean]
        $UseSimpleDisplayName
    )
}
function Set-ReportSubmissionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $PostSubmitMessage,

        [Parameter()]
        [System.Object]
        $ReportJunkAddresses,

        [Parameter()]
        [System.Boolean]
        $NotificationsForPhishMalwareSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.String]
        $PhishingReviewResultMessage,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitle,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonTextForNotJunk,

        [Parameter()]
        [System.Boolean]
        $EnableCustomizedMsg,

        [Parameter()]
        [System.Object]
        $NotificationSenderAddress,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonTextForJunk,

        [Parameter()]
        [System.Boolean]
        $NotificationsForSpamSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.String]
        $PostSubmitMessageForJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageForPhishing,

        [Parameter()]
        [System.Boolean]
        $EnableThirdPartyAddress,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String]
        $PreSubmitMessageForJunk,

        [Parameter()]
        [System.Int32]
        $UserSubmissionOptions,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonTextForPhishing,

        [Parameter()]
        [System.String]
        $PreSubmitMessageForNotJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageTitleForNotJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonTextForJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageForNotJunk,

        [Parameter()]
        [System.Boolean]
        $ReportJunkToCustomizedAddress,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonLinkForPhishing,

        [Parameter()]
        [System.Boolean]
        $ReportNotJunkToCustomizedAddress,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitleForJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageForPhishing,

        [Parameter()]
        [System.String]
        $NotificationFooterMessage,

        [Parameter()]
        [System.Boolean]
        $EnableOrganizationBranding,

        [Parameter()]
        [System.String]
        $PreSubmitMessageForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonLinkForNotJunk,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonLinkForPhishing,

        [Parameter()]
        [System.Boolean]
        $EnableReportToMicrosoft,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitleForJunk,

        [Parameter()]
        [System.Boolean]
        $ReportChatMessageEnabled,

        [Parameter()]
        [System.Object]
        $ThirdPartyReportAddresses,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonLinkForJunk,

        [Parameter()]
        [System.Boolean]
        $NotificationsForCleanSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.String]
        $PostSubmitMessageForNotJunk,

        [Parameter()]
        [System.Object]
        $MultiLanguageSetting,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageForJunk,

        [Parameter()]
        [System.Boolean]
        $DisableQuarantineReportingOption,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ReportNotJunkAddresses,

        [Parameter()]
        [System.Boolean]
        $EnableUserEmailNotification,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageForJunk,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageTitleForJunk,

        [Parameter()]
        [System.Boolean]
        $DisableUserSubmissionOptions,

        [Parameter()]
        [System.Boolean]
        $OnlyShowPhishingDisclaimer,

        [Parameter()]
        [System.String]
        $PostSubmitMessageTitleForNotJunk,

        [Parameter()]
        [System.String]
        $PreSubmitMessage,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitleForNotJunk,

        [Parameter()]
        [System.String]
        $JunkReviewResultMessage,

        [Parameter()]
        [System.Boolean]
        $EnableCustomNotificationSender,

        [Parameter()]
        [System.Boolean]
        $ReportChatMessageToCustomizedAddressEnabled,

        [Parameter()]
        [System.Object]
        $ReportPhishAddresses,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageTitleForJunk,

        [Parameter()]
        [System.String]
        $NotJunkReviewResultMessage,

        [Parameter()]
        [System.Boolean]
        $NotificationsForSubmissionAirInvestigationsEnabled,

        [Parameter()]
        [System.Boolean]
        $PreSubmitMessageEnabled,

        [Parameter()]
        [System.Boolean]
        $PostSubmitMessageEnabled,

        [Parameter()]
        [System.String]
        $PreSubmitMessageTitle,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageTitleForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePreSubmitMessageButtonTextForPhishing,

        [Parameter()]
        [System.String]
        $UserSubmissionOptionsMessage,

        [Parameter()]
        [System.String]
        $PostSubmitMessageForPhishing,

        [Parameter()]
        [System.String[]]
        $MultiLanguagePostSubmitMessageButtonLinkForJunk,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $ReportPhishToCustomizedAddress
    )
}
function Set-ReportSubmissionRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $ReportSubmissionPolicy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm
    )
}
function Set-ResourceConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $ResourcePropertySchema
    )
}
function Set-RetentionPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $RetentionPolicyTagLinks,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Guid]
        $RetentionId,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefaultArbitrationMailbox,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-RoleAssignmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $IsDefault
    )
}
function Set-RoleGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $WellKnownObject,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck,

        [Parameter()]
        [System.Object]
        $ManagedBy,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force
    )
}
function Set-SafeAttachmentPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $Action,

        [Parameter()]
        [System.Boolean]
        $Redirect,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Boolean]
        $Enable,

        [Parameter()]
        [System.Object]
        $RedirectAddress,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $QuarantineTag
    )
}
function Set-SafeAttachmentRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $SafeAttachmentPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-SafeLinksPolicy
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $EnableOrganizationBranding,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $AdminDisplayName,

        [Parameter()]
        [System.Boolean]
        $UseTranslatedNotificationText,

        [Parameter()]
        [System.Boolean]
        $DisableUrlRewrite,

        [Parameter()]
        [System.Object]
        $DoNotRewriteUrls,

        [Parameter()]
        [System.Boolean]
        $EnableSafeLinksForTeams,

        [Parameter()]
        [System.Boolean]
        $EnableSafeLinksForOffice,

        [Parameter()]
        [System.Boolean]
        $TrackClicks,

        [Parameter()]
        [System.Boolean]
        $AllowClickThrough,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.String]
        $CustomNotificationText,

        [Parameter()]
        [System.Boolean]
        $DeliverMessageAfterScan,

        [Parameter()]
        [System.Boolean]
        $EnableSafeLinksForEmail,

        [Parameter()]
        [System.Boolean]
        $ScanUrls,

        [Parameter()]
        [System.Object]
        $LocalizedNotificationTextList,

        [Parameter()]
        [System.Boolean]
        $EnableForInternalSenders
    )
}
function Set-SafeLinksRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object]
        $SafeLinksPolicy,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf
    )
}
function Set-ServicePrincipal
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity
    )
}
function Set-SweepRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object]
        $Sender,

        [Parameter()]
        [System.String]
        $Provider,

        [Parameter()]
        [System.Object]
        $SystemCategory,

        [Parameter()]
        [System.Object]
        $KeepLatest,

        [Parameter()]
        [System.Object]
        $SourceFolder,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Mailbox,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $DestinationFolder,

        [Parameter()]
        [System.Object]
        $KeepForDays,

        [Parameter()]
        [System.Boolean]
        $Enabled
    )
}
function Set-TenantAllowBlockListItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.DateTime]
        $ExpirationDate,

        [Parameter()]
        [System.Object]
        $ListSubType,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Block,

        [Parameter()]
        [System.String]
        $Notes,

        [Parameter()]
        [System.Int32]
        $RemoveAfter,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $OutputJson,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $NoExpiration,

        [Parameter()]
        [System.String[]]
        $Ids,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Allow,

        [Parameter()]
        [System.String[]]
        $Entries,

        [Parameter()]
        [System.Object]
        $ListType
    )
}
function Set-TenantAllowBlockListSpoofItems
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.String]
        $Action,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String[]]
        $Ids
    )
}
function Set-TransportConfig
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Boolean]
        $InternalDelayDsnEnabled,

        [Parameter()]
        [System.Boolean]
        $InternalDsnSendHtml,

        [Parameter()]
        [System.Boolean]
        $ExternalDelayDsnEnabled,

        [Parameter()]
        [System.Object]
        $DSNConversionMode,

        [Parameter()]
        [System.Boolean]
        $SmtpClientAuthenticationDisabled,

        [Parameter()]
        [System.Object]
        $MessageExpiration,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.Boolean]
        $ReplyAllStormProtectionEnabled,

        [Parameter()]
        [System.Boolean]
        $AddressBookPolicyRoutingEnabled,

        [Parameter()]
        [System.Boolean]
        $ExternalDsnLanguageDetectionEnabled,

        [Parameter()]
        [System.Boolean]
        $ExternalDsnSendHtml,

        [Parameter()]
        [System.Boolean]
        $Rfc2231EncodingEnabled,

        [Parameter()]
        [System.Boolean]
        $InternalDsnLanguageDetectionEnabled,

        [Parameter()]
        [System.Boolean]
        $VoicemailJournalingEnabled,

        [Parameter()]
        [System.Object]
        $HeaderPromotionModeSetting,

        [Parameter()]
        [System.Object]
        $JournalingReportNdrTo,

        [Parameter()]
        [System.Boolean]
        $ConvertDisclaimerWrapperToEml,

        [Parameter()]
        [System.Object]
        $InternalDsnReportingAuthority,

        [Parameter()]
        [System.Int32]
        $JournalMessageExpirationDays,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $MaxRecipientEnvelopeLimit,

        [Parameter()]
        [System.Int32]
        $ReplyAllStormDetectionMinimumReplies,

        [Parameter()]
        [System.Object]
        $ExternalDsnReportingAuthority,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $ExternalDsnDefaultLanguage,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $InternalDsnDefaultLanguage,

        [Parameter()]
        [System.Object]
        $AllowLegacyTLSClients,

        [Parameter()]
        [System.Boolean]
        $ClearCategories,

        [Parameter()]
        [System.Int32]
        $ReplyAllStormBlockDurationHours,

        [Parameter()]
        [System.Object]
        $ExternalPostmasterAddress,

        [Parameter()]
        [System.Int32]
        $ReplyAllStormDetectionMinimumRecipients
    )
}
function Set-TransportRule
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $ActivationDate,

        [Parameter()]
        [System.Object[]]
        $AddToRecipients,

        [Parameter()]
        [System.Object]
        $ApplyHtmlDisclaimerFallbackAction,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientADAttributeContainsWords,

        [Parameter()]
        [System.Object]
        $AttachmentSizeOver,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderADAttributeContainsWords,

        [Parameter()]
        [System.Object]
        $SetSCL,

        [Parameter()]
        [System.Object[]]
        $AnyOfToHeaderMemberOf,

        [Parameter()]
        [System.Boolean]
        $Disconnect,

        [Parameter()]
        [System.Int32]
        $Priority,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentToMemberOf,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfCcHeader,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $RecipientDomainIs,

        [Parameter()]
        [System.Object]
        $ManagerForEvaluatedUser,

        [Parameter()]
        [System.Object[]]
        $ExceptIfHeaderMatchesPatterns,

        [Parameter()]
        [System.Object]
        $ExceptIfFromScope,

        [Parameter()]
        [System.Object]
        $AdComparisonAttribute,

        [Parameter()]
        [System.Object[]]
        $ExceptIfHeaderContainsWords,

        [Parameter()]
        [System.Object[]]
        $HeaderMatchesPatterns,

        [Parameter()]
        [System.Object]
        $AddManagerAsRecipientType,

        [Parameter()]
        [System.Boolean]
        $DeleteMessage,

        [Parameter()]
        [System.Boolean]
        $HasSenderOverride,

        [Parameter()]
        [System.Object]
        $SmtpRejectMessageRejectStatusCode,

        [Parameter()]
        [System.String]
        $ExceptIfHasClassification,

        [Parameter()]
        [System.Boolean]
        $Quarantine,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfRecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientInSenderList,

        [Parameter()]
        [System.Object]
        $RecipientAddressType,

        [Parameter()]
        [System.Object[]]
        $ExceptIfContentCharacterSetContainsWords,

        [Parameter()]
        [System.Object[]]
        $BlindCopyTo,

        [Parameter()]
        [System.Object]
        $ApplyHtmlDisclaimerLocation,

        [Parameter()]
        [System.Object]
        $ExceptIfMessageTypeMatches,

        [Parameter()]
        [System.Object]
        $SenderIpRanges,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $ExceptIfMessageContainsDataClassifications,

        [Parameter()]
        [System.Object[]]
        $ModerateMessageByUser,

        [Parameter()]
        [System.Boolean]
        $HasNoClassification,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderInRecipientList,

        [Parameter()]
        [System.Object]
        $HeaderContainsMessageHeader,

        [Parameter()]
        [System.Object]
        $RemoveHeader,

        [Parameter()]
        [System.String]
        $HasClassification,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $MessageContainsDataClassifications,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromMemberOf,

        [Parameter()]
        [System.Object]
        $RuleSubType,

        [Parameter()]
        [System.Object[]]
        $AnyOfRecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Object]
        $SentToScope,

        [Parameter()]
        [System.Object[]]
        $AnyOfToCcHeaderMemberOf,

        [Parameter()]
        [System.Object[]]
        $From,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfRecipientAddressContainsWords,

        [Parameter()]
        [System.Object]
        $ExceptIfWithImportance,

        [Parameter()]
        [System.Object[]]
        $ContentCharacterSetContainsWords,

        [Parameter()]
        [System.Object[]]
        $SubjectContainsWords,

        [Parameter()]
        [System.Object]
        $RejectMessageEnhancedStatusCode,

        [Parameter()]
        [System.Object[]]
        $SenderADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $IncidentReportContent,

        [Parameter()]
        [System.Object[]]
        $FromMemberOf,

        [Parameter()]
        [System.Object[]]
        $AttachmentContainsWords,

        [Parameter()]
        [System.Object]
        $ExceptIfSCLOver,

        [Parameter()]
        [System.Object[]]
        $ExceptIfBetweenMemberOf1,

        [Parameter()]
        [System.Object]
        $GenerateNotification,

        [Parameter()]
        [System.Object]
        $NotifySender,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentIsPasswordProtected,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentNameMatchesPatterns,

        [Parameter()]
        [System.Object]
        $ExceptIfSenderManagementRelationship,

        [Parameter()]
        [System.String]
        $SetAuditSeverity,

        [Parameter()]
        [System.Object[]]
        $AttachmentPropertyContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToHeader,

        [Parameter()]
        [System.Object]
        $ApplyRightsProtectionCustomizationTemplate,

        [Parameter()]
        [System.Object]
        $SetHeaderName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Boolean]
        $RouteMessageOutboundRequireTls,

        [Parameter()]
        [System.Object]
        $WithImportance,

        [Parameter()]
        [System.Object]
        $RuleErrorAction,

        [Parameter()]
        [System.Object]
        $FromScope,

        [Parameter()]
        [System.Object[]]
        $AttachmentNameMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $SentTo,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromAddressMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $AnyOfCcHeaderMemberOf,

        [Parameter()]
        [System.Object]
        $ExceptIfAttachmentSizeOver,

        [Parameter()]
        [System.Object]
        $ExceptIfManagerForEvaluatedUser,

        [Parameter()]
        [System.Boolean]
        $RemoveOMEv2,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFromAddressContainsWords,

        [Parameter()]
        [System.Boolean]
        $AttachmentHasExecutableContent,

        [Parameter()]
        [System.Object]
        $RouteMessageOutboundConnector,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientDomainIs,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSenderDomainIs,

        [Parameter()]
        [System.Object]
        $SenderManagementRelationship,

        [Parameter()]
        [System.Object[]]
        $ExceptIfBetweenMemberOf2,

        [Parameter()]
        [System.Object[]]
        $RedirectMessageTo,

        [Parameter()]
        [System.Boolean]
        $ApplyOME,

        [Parameter()]
        [System.Object[]]
        $SenderDomainIs,

        [Parameter()]
        [System.Object[]]
        $SenderADAttributeContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfCcHeaderMemberOf,

        [Parameter()]
        [System.Object]
        $ApplyHtmlDisclaimerText,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentHasExecutableContent,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentIsUnsupported,

        [Parameter()]
        [System.Boolean]
        $RemoveOME,

        [Parameter()]
        [System.Object]
        $RejectMessageReasonText,

        [Parameter()]
        [System.Object[]]
        $RecipientAddressContainsWords,

        [Parameter()]
        [System.Object]
        $GenerateIncidentReport,

        [Parameter()]
        [System.Object[]]
        $FromAddressContainsWords,

        [Parameter()]
        [System.Boolean]
        $RemoveRMSAttachmentEncryption,

        [Parameter()]
        [System.Object[]]
        $RecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectContainsWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfFrom,

        [Parameter()]
        [System.Object[]]
        $AnyOfToCcHeader,

        [Parameter()]
        [System.Object]
        $ExceptIfSentToScope,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToCcHeaderMemberOf,

        [Parameter()]
        [System.Boolean]
        $ModerateMessageByManager,

        [Parameter()]
        [System.Object]
        $AdComparisonOperator,

        [Parameter()]
        [System.Object]
        $MessageSizeOver,

        [Parameter()]
        [System.Object[]]
        $BetweenMemberOf2,

        [Parameter()]
        [System.Object[]]
        $SubjectMatchesPatterns,

        [Parameter()]
        [System.Boolean]
        $AttachmentProcessingLimitExceeded,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectMatchesPatterns,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientAddressContainsWords,

        [Parameter()]
        [System.Object]
        $HeaderMatchesMessageHeader,

        [Parameter()]
        [System.Object[]]
        $AnyOfRecipientAddressContainsWords,

        [Parameter()]
        [System.Object[]]
        $HeaderContainsWords,

        [Parameter()]
        [System.String]
        $Comments,

        [Parameter()]
        [System.Object[]]
        $SentToMemberOf,

        [Parameter()]
        [System.Object]
        $ExceptIfAdComparisonAttribute,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSentTo,

        [Parameter()]
        [System.Object]
        $ExceptIfAdComparisonOperator,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToHeaderMemberOf,

        [Parameter()]
        [System.Object]
        $Mode,

        [Parameter()]
        [System.Object[]]
        $RecipientInSenderList,

        [Parameter()]
        [System.Object[]]
        $SubjectOrBodyMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentExtensionMatchesWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectOrBodyMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientAddressMatchesPatterns,

        [Parameter()]
        [System.Boolean]
        $ExceptIfHasNoClassification,

        [Parameter()]
        [System.Object]
        $ExceptIfSenderIpRanges,

        [Parameter()]
        [System.Object[]]
        $ExceptIfRecipientADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object[]]
        $RecipientADAttributeContainsWords,

        [Parameter()]
        [System.Boolean]
        $AttachmentIsUnsupported,

        [Parameter()]
        [System.Object]
        $ExpiryDate,

        [Parameter()]
        [System.Object[]]
        $AttachmentExtensionMatchesWords,

        [Parameter()]
        [System.Object[]]
        $ExceptIfSubjectOrBodyContainsWords,

        [Parameter()]
        [System.Object]
        $LogEventText,

        [Parameter()]
        [System.Object[]]
        $ExceptIfManagerAddresses,

        [Parameter()]
        [System.Object[]]
        $SenderInRecipientList,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAnyOfToCcHeader,

        [Parameter()]
        [System.Object[]]
        $AttachmentMatchesPatterns,

        [Parameter()]
        [System.String]
        $DlpPolicy,

        [Parameter()]
        [System.Object[]]
        $ManagerAddresses,

        [Parameter()]
        [System.Object]
        $SenderAddressLocation,

        [Parameter()]
        [System.Object[]]
        $CopyTo,

        [Parameter()]
        [System.Object[]]
        $SubjectOrBodyContainsWords,

        [Parameter()]
        [System.String]
        $ApplyClassification,

        [Parameter()]
        [System.Object[]]
        $RecipientADAttributeMatchesPatterns,

        [Parameter()]
        [System.Object]
        $SetHeaderValue,

        [Parameter()]
        [System.Boolean]
        $AttachmentIsPasswordProtected,

        [Parameter()]
        [System.Object[]]
        $BetweenMemberOf1,

        [Parameter()]
        [System.Object]
        $ExceptIfMessageSizeOver,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $ExceptIfMessageContainsAllDataClassifications,

        [Parameter()]
        [System.Object[]]
        $AnyOfCcHeader,

        [Parameter()]
        [System.Boolean]
        $ExceptIfAttachmentProcessingLimitExceeded,

        [Parameter()]
        [System.Object[]]
        $FromAddressMatchesPatterns,

        [Parameter()]
        [System.Object]
        $ExceptIfHeaderMatchesMessageHeader,

        [Parameter()]
        [System.Object]
        $SmtpRejectMessageRejectText,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentContainsWords,

        [Parameter()]
        [System.Object[]]
        $AnyOfToHeader,

        [Parameter()]
        [System.Boolean]
        $ExceptIfHasSenderOverride,

        [Parameter()]
        [System.Object]
        $SCLOver,

        [Parameter()]
        [System.Object]
        $PrependSubject,

        [Parameter()]
        [System.Object]
        $ApplyRightsProtectionTemplate,

        [Parameter()]
        [System.Object]
        $MessageTypeMatches,

        [Parameter()]
        [System.Object[]]
        $ExceptIfAttachmentPropertyContainsWords,

        [Parameter()]
        [System.Boolean]
        $StopRuleProcessing,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $MessageContainsAllDataClassifications,

        [Parameter()]
        [System.Object]
        $ExceptIfHeaderContainsMessageHeader
    )
}
function Set-UnifiedGroup
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $EmailAddresses,

        [Parameter()]
        [System.Object]
        $AcceptMessagesOnlyFromSendersOrMembers,

        [Parameter()]
        [System.String]
        $CustomAttribute12,

        [Parameter()]
        [System.String]
        $CustomAttribute10,

        [Parameter()]
        [System.Globalization.CultureInfo]
        $Language,

        [Parameter()]
        [System.Object]
        $IsMemberAllowedToEditContent,

        [Parameter()]
        [System.String]
        $CustomAttribute8,

        [Parameter()]
        [System.String]
        $CustomAttribute5,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $UnifiedGroupWelcomeMessageEnabled,

        [Parameter()]
        [System.String]
        $MailTip,

        [Parameter()]
        [System.Object]
        $ModeratedBy,

        [Parameter()]
        [System.Object]
        $PrimarySmtpAddress,

        [Parameter()]
        [System.String]
        $Classification,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AutoSubscribeNewMembers,

        [Parameter()]
        [System.Object]
        $AuditLogAgeLimit,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $HiddenFromExchangeClientsEnabled,

        [Parameter()]
        [System.Object]
        $MaxReceiveSize,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute5,

        [Parameter()]
        [System.String]
        $CustomAttribute15,

        [Parameter()]
        [System.Object]
        $RejectMessagesFromSendersOrMembers,

        [Parameter()]
        [System.String]
        $Alias,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $CustomAttribute1,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $SubscriptionEnabled,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ForceUpgrade,

        [Parameter()]
        [System.Object]
        $AccessType,

        [Parameter()]
        [System.String]
        $MailboxRegion,

        [Parameter()]
        [System.Object]
        $GrantSendOnBehalfTo,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute1,

        [Parameter()]
        [System.String]
        $Notes,

        [Parameter()]
        [System.String]
        $CustomAttribute14,

        [Parameter()]
        [System.Boolean]
        $RequireSenderAuthenticationEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute9,

        [Parameter()]
        [System.String]
        $CustomAttribute6,

        [Parameter()]
        [System.Object]
        $DataEncryptionPolicy,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute4,

        [Parameter()]
        [System.Object]
        $SensitivityLabelId,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $AlwaysSubscribeMembersToCalendarEvents,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute2,

        [Parameter()]
        [System.String]
        $CustomAttribute13,

        [Parameter()]
        [System.String]
        $CustomAttribute2,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $CalendarMemberReadOnly,

        [Parameter()]
        [System.Object]
        $InformationBarrierMode,

        [Parameter()]
        [System.Object]
        $MaxSendSize,

        [Parameter()]
        [System.Object]
        $MailTipTranslations,

        [Parameter()]
        [System.String]
        $CustomAttribute7,

        [Parameter()]
        [System.String]
        $CustomAttribute4,

        [Parameter()]
        [System.Object]
        $ExtensionCustomAttribute3,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ConnectorsEnabled,

        [Parameter()]
        [System.Boolean]
        $ModerationEnabled,

        [Parameter()]
        [System.String]
        $CustomAttribute3,

        [Parameter()]
        [System.String]
        $CustomAttribute11,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Boolean]
        $HiddenFromAddressListsEnabled
    )
}
function Set-User
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Object]
        $WindowsEmailAddress,

        [Parameter()]
        [System.Boolean]
        $IsShadowMailbox,

        [Parameter()]
        [System.String]
        $LastName,

        [Parameter()]
        [System.String]
        $Phone,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.String]
        $Office,

        [Parameter()]
        [System.Object]
        $CountryOrRegion,

        [Parameter()]
        [System.Object]
        $AuthenticationPolicy,

        [Parameter()]
        [System.Object]
        $OtherTelephone,

        [Parameter()]
        [System.String]
        $Pager,

        [Parameter()]
        [System.String]
        $PhoneticDisplayName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $ClearDataEncryptionPolicy,

        [Parameter()]
        [System.String]
        $Fax,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Force,

        [Parameter()]
        [System.Object]
        $ManagedOnboardingType,

        [Parameter()]
        [System.Object]
        $StsRefreshTokensValidFrom,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $RemoveMailboxProvisioningConstraint,

        [Parameter()]
        [System.Boolean]
        $ResetPasswordOnNextLogon,

        [Parameter()]
        [System.Boolean]
        $BlockCloudCache,

        [Parameter()]
        [System.Object]
        $SeniorityIndex,

        [Parameter()]
        [System.String]
        $City,

        [Parameter()]
        [System.Boolean]
        $VIP,

        [Parameter()]
        [System.String]
        $Title,

        [Parameter()]
        [System.String]
        $MobilePhone,

        [Parameter()]
        [System.String]
        $AssistantName,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PublicFolder,

        [Parameter()]
        [System.String]
        $FirstName,

        [Parameter()]
        [System.String]
        $Company,

        [Parameter()]
        [System.String]
        $StateOrProvince,

        [Parameter()]
        [System.String]
        $SimpleDisplayName,

        [Parameter()]
        [System.String]
        $Initials,

        [Parameter()]
        [System.String]
        $WebPage,

        [Parameter()]
        [System.String]
        $Notes,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $PermanentlyClearPreviousMailboxInfo,

        [Parameter()]
        [System.Object]
        $Manager,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $OtherFax,

        [Parameter()]
        [System.String]
        $StreetAddress,

        [Parameter()]
        [System.Object]
        $MailboxRegionSuffix,

        [Parameter()]
        [System.String]
        $HomePhone,

        [Parameter()]
        [System.String]
        $Department,

        [Parameter()]
        [System.Object]
        $OtherHomePhone,

        [Parameter()]
        [System.String]
        $MailboxRegion,

        [Parameter()]
        [System.Boolean]
        $EXOModuleEnabled,

        [Parameter()]
        [System.Boolean]
        $RemotePowerShellEnabled,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $PostalCode,

        [Parameter()]
        [System.Object]
        $GeoCoordinates,

        [Parameter()]
        [System.Object]
        $PostOfficeBox,

        [Parameter()]
        [System.Object]
        $DesiredWorkloads,

        [Parameter()]
        [System.Boolean]
        $CanHaveCloudCache
    )
}
function Start-MigrationBatch
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Partition
    )
}
function Stop-MigrationBatch
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Object]
        $Partition
    )
}
function Update-RoleGroupMember
{
    [CmdletBinding()]
    param(
        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $Confirm,

        [Parameter()]
        [System.Object]
        $Identity,

        [Parameter()]
        [System.Management.Automation.SwitchParameter]
        $BypassSecurityGroupManagerCheck,

        [Parameter()]
        [System.Object]
        $Members
    )
}
#endregion

