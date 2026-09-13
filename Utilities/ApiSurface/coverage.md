# Graph coverage

1470 Graph cmdlet nouns offer a create, a read, an update and a delete, and no resource covers them.

Ranked, never filtered on a guess. Only a claim by name and an entry in `coverage-ignore.json` remove a candidate. Everything else moves its score, and every component that fired is listed beside it.

Inventory: Microsoft.Graph.Authentication 2.35.1 (pinned).

## Highest ranked  (40)

### DirectoryDeviceLocalCredential  (score 45)

`/directory/deviceLocalCredentials`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgDirectoryDeviceLocalCredential -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### DirectoryOnPremiseSynchronization  (score 45)

`/directory/onPremisesSynchronization`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgDirectoryOnPremiseSynchronization -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### DirectorySubscription  (score 45)

`/directory/subscriptions`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgDirectorySubscription -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementAssignment  (score 45)

`/identityGovernance/entitlementManagement/assignments`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementAssignment -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementAssignmentRequest  (score 45)

`/identityGovernance/entitlementManagement/assignmentRequests`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementAssignmentRequest -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementResourceEnvironment  (score 45)

`/identityGovernance/entitlementManagement/resourceEnvironments`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementResourceEnvironment -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### IdentityAuthenticationEventFlow  (score 45)

`/identity/authenticationEventsFlows`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityAuthenticationEventFlow -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### IdentityAuthenticationEventListener  (score 45)

`/identity/authenticationEventListeners`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityAuthenticationEventListener -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### IdentityGovernanceAccessReviewHistoryDefinition  (score 45)

`/identityGovernance/accessReviews/historyDefinitions`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityGovernanceAccessReviewHistoryDefinition -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### IdentityGovernancePrivilegedAccessGroupAssignmentScheduleRequest  (score 45)

`/identityGovernance/privilegedAccess/group/assignmentScheduleRequests`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityGovernancePrivilegedAccessGroupAssignmentScheduleRequest -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### RoleManagementDirectoryResourceNamespace  (score 45)

`/roleManagement/directory/resourceNamespaces`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRoleManagementDirectoryResourceNamespace -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### RoleManagementEntitlementManagementResourceNamespace  (score 45)

`/roleManagement/entitlementManagement/resourceNamespaces`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRoleManagementEntitlementManagementResourceNamespace -APIVersion v1.0
```

Score: module already used +20; sibling under the same route claimed +15; has a Count companion +5; v1.0 as well as beta +5.

### AdminEdgeInternetExplorerModeSiteList  (score 30)

`/admin/edge/internetExplorerMode/siteLists`, Beta.DeviceManagement, DeviceManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgAdminEdgeInternetExplorerModeSiteList -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### AdminPeopleProfileCardProperty  (score 30)

`/admin/people/profileCardProperties`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgAdminPeopleProfileCardProperty -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### AppCatalogTeamApp  (score 30)

`/appCatalogs/teamsApps`, Beta.Teams, Teams

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgAppCatalogTeamApp -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### AppCatalogTeamAppDefinition  (score 30)

`/appCatalogs/teamsApps/{teamsApp-id}/appDefinitions`, Beta.Teams, Teams

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgAppCatalogTeamAppDefinition -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### Contract  (score 30)

`/contracts`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgContract -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### DataPolicyOperation  (score 30)

`/dataPolicyOperations`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgDataPolicyOperation -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### DirectoryPublicKeyInfrastructureCertificateBasedAuthConfiguration  (score 30)

`/directory/publicKeyInfrastructure/certificateBasedAuthConfigurations`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgDirectoryPublicKeyInfrastructureCertificateBasedAuthConfiguration -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### DirectoryPublicKeyInfrastructureCertificateBasedAuthConfigurationCertificateAuthority  (score 30)

`/directory/publicKeyInfrastructure/certificateBasedAuthConfigurations/{certificateBasedAuthPki-id}/certificateAuthorities`, Beta.Identity.DirectoryManagement, Identity.DirectoryManagement

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgDirectoryPublicKeyInfrastructureCertificateBasedAuthConfigurationCertificateAuthority -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementAssignmentPolicyCustomExtensionStageSetting  (score 30)

`/identityGovernance/entitlementManagement/assignmentPolicies/{accessPackageAssignmentPolicy-id}/customExtensionStageSettings`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementAssignmentPolicyCustomExtensionStageSetting -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementAssignmentPolicyQuestion  (score 30)

`/identityGovernance/entitlementManagement/assignmentPolicies/{accessPackageAssignmentPolicy-id}/questions`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementAssignmentPolicyQuestion -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementCatalogCustomWorkflowExtension  (score 30)

`/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/customWorkflowExtensions`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementCatalogCustomWorkflowExtension -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementCatalogResourceScope  (score 30)

`/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resourceScopes`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementCatalogResourceScope -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### EntitlementManagementResourceScope  (score 30)

`/identityGovernance/entitlementManagement/resources/{accessPackageResource-id}/scopes`, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgEntitlementManagementResourceScope -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityGovernanceAppConsentRequest  (score 30)

`/identityGovernance/appConsent/appConsentRequests`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityGovernanceAppConsentRequest -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityGovernanceAppConsentRequestUserConsentRequest  (score 30)

`/identityGovernance/appConsent/appConsentRequests/{appConsentRequest-id}/userConsentRequests`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityGovernanceAppConsentRequestUserConsentRequest -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityGovernanceTermsOfUseAgreementAcceptance  (score 30)

`/identityGovernance/termsOfUse/agreementAcceptances`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityGovernanceTermsOfUseAgreementAcceptance -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityGovernanceTermsOfUseAgreementFile  (score 30)

`/identityGovernance/termsOfUse/agreements/{agreement-id}/file`, Beta.Identity.Governance, Identity.Governance

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityGovernanceTermsOfUseAgreementFile -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityRiskPreventionFraudProtectionProvider  (score 30)

`/identity/riskPrevention/fraudProtectionProviders`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityRiskPreventionFraudProtectionProvider -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityRiskPreventionWebApplicationFirewallProvider  (score 30)

`/identity/riskPrevention/webApplicationFirewallProviders`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityRiskPreventionWebApplicationFirewallProvider -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### IdentityRiskPreventionWebApplicationFirewallVerification  (score 30)

`/identity/riskPrevention/webApplicationFirewallVerifications`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgIdentityRiskPreventionWebApplicationFirewallVerification -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### InformationProtectionThreatAssessmentRequest  (score 30)

`/informationProtection/threatAssessmentRequests`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgInformationProtectionThreatAssessmentRequest -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### InformationProtectionThreatAssessmentRequestResult  (score 30)

`/informationProtection/threatAssessmentRequests/{threatAssessmentRequest-id}/results`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgInformationProtectionThreatAssessmentRequestResult -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### Oauth2PermissionGrant  (score 30)

`/oauth2PermissionGrants`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgOauth2PermissionGrant -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### RiskDetection  (score 30)

`/identityProtection/riskDetections`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRiskDetection -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### RiskyServicePrincipal  (score 30)

`/identityProtection/riskyServicePrincipals`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRiskyServicePrincipal -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### RiskyServicePrincipalHistory  (score 30)

`/identityProtection/riskyServicePrincipals/{riskyServicePrincipal-id}/history`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRiskyServicePrincipalHistory -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### RiskyUser  (score 30)

`/identityProtection/riskyUsers`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRiskyUser -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

### RiskyUserHistory  (score 30)

`/identityProtection/riskyUsers/{riskyUser-id}/history`, Beta.Identity.SignIns, Identity.SignIns

```powershell
New-M365DSCResource -ResourceName <Suggested> -Workload MicrosoftGraph `
    -CmdLetNoun MgRiskyUserHistory -APIVersion v1.0
```

Score: module already used +20; has a Count companion +5; v1.0 as well as beta +5.

## The rest  (1430)

| Noun | Score | Modules | Route |
| --- | --- | --- | --- |
| RoleManagementDirectoryResourceNamespaceResourceAction | 30 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/directory/resourceNamespaces/{unifiedRbacResourceNamespace-id}/resourceActions` |
| RoleManagementEntitlementManagementResourceNamespaceResourceAction | 30 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/resourceNamespaces/{unifiedRbacResourceNamespace-id}/resourceActions` |
| SiteAnalyticItemActivityStat | 30 | Beta.Sites, Sites | `/sites/{site-id}/analytics/itemActivityStats` |
| SiteColumn | 30 | Beta.Sites, Sites | `/sites/{site-id}/columns` |
| SiteContentType | 30 | Beta.Sites, Sites | `/sites/{site-id}/contentTypes` |
| SiteContentTypeColumn | 30 | Beta.Sites, Sites | `/sites/{site-id}/contentTypes/{contentType-id}/columns` |
| SiteContentTypeColumnLink | 30 | Beta.Sites, Sites | `/sites/{site-id}/contentTypes/{contentType-id}/columnLinks` |
| SiteList | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists` |
| SiteListColumn | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/columns` |
| SiteListContentType | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/contentTypes` |
| SiteListContentTypeColumn | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/contentTypes/{contentType-id}/columns` |
| SiteListContentTypeColumnLink | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/contentTypes/{contentType-id}/columnLinks` |
| SiteListItemDocumentSetVersion | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/items/{listItem-id}/documentSetVersions` |
| SiteListItemVersion | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/items/{listItem-id}/versions` |
| SiteListOperation | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/operations` |
| SiteListSubscription | 30 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/subscriptions` |
| SiteOperation | 30 | Beta.Sites, Sites | `/sites/{site-id}/operations` |
| SitePage | 30 | Beta.Sites, Sites | `/sites/{site-id}/pages` |
| SitePageAsSitePageWebPart | 30 | Beta.Sites, Sites | `/sites/{site-id}/pages/{baseSitePage-id}/sitePage/webParts` |
| SitePermission | 30 | Beta.Sites, Sites | `/sites/{site-id}/permissions` |
| SiteTermStore | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore` |
| SiteTermStoreGroup | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups` |
| SiteTermStoreGroupSet | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets` |
| SiteTermStoreSet | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets` |
| SiteTermStoreSetChild | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/children` |
| SiteTermStoreSetRelation | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/relations` |
| SiteTermStoreSetTerm | 30 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/terms` |
| TenantRelationshipMultiTenantOrganizationTenant | 30 | Beta.Identity.SignIns, Identity.SignIns | `/tenantRelationships/multiTenantOrganization/tenants` |
| ApplicationExtensionProperty | 25 | Applications, Beta.Applications | `/applications/{application-id}/extensionProperties` |
| DeviceAppManagementDefaultManagedAppProtection | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/defaultManagedAppProtections` |
| DeviceAppManagementManagedAppRegistration | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedAppRegistrations` |
| DeviceAppManagementManagedEBook | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedEBooks` |
| DeviceAppManagementMobileAppConfigurationDeviceStatus | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileAppConfigurations/{managedDeviceMobileAppConfiguration-id}/deviceStatuses` |
| DeviceAppManagementMobileAppConfigurationUserStatus | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileAppConfigurations/{managedDeviceMobileAppConfiguration-id}/userStatuses` |
| DeviceAppManagementVppToken | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/vppTokens` |
| DeviceAppManagementWindowsInformationProtectionPolicy | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/windowsInformationProtectionPolicies` |
| DeviceManagementAuditEvent | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/auditEvents` |
| DeviceManagementComplianceManagementPartner | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/complianceManagementPartners` |
| DeviceManagementDetectedApp | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/detectedApps` |
| DeviceManagementDeviceCompliancePolicyDeviceSettingStateSummary | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicies/{deviceCompliancePolicy-id}/deviceSettingStateSummaries` |
| DeviceManagementDeviceCompliancePolicyDeviceStatus | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicies/{deviceCompliancePolicy-id}/deviceStatuses` |
| DeviceManagementDeviceCompliancePolicyScheduledActionForRule | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicies/{deviceCompliancePolicy-id}/scheduledActionsForRule` |
| DeviceManagementDeviceCompliancePolicySettingStateSummary | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicySettingStateSummaries` |
| DeviceManagementDeviceCompliancePolicyUserStatus | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicies/{deviceCompliancePolicy-id}/userStatuses` |
| DeviceManagementDeviceConfigurationDeviceSettingStateSummary | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceConfigurations/{deviceConfiguration-id}/deviceSettingStateSummaries` |
| DeviceManagementDeviceConfigurationDeviceStatus | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceConfigurations/{deviceConfiguration-id}/deviceStatuses` |
| DeviceManagementDeviceConfigurationUserStatus | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceConfigurations/{deviceConfiguration-id}/userStatuses` |
| DeviceManagementExchangeConnector | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/exchangeConnectors` |
| DeviceManagementImportedWindowsAutopilotDeviceIdentity | 25 | Beta.DeviceManagement.Enrollment, DeviceManagement.Enrollment | `/deviceManagement/importedWindowsAutopilotDeviceIdentities` |
| DeviceManagementIoUpdateStatus | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/iosUpdateStatuses` |
| DeviceManagementManagedDevice | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/managedDevices` |
| DeviceManagementMobileAppTroubleshootingEvent | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/mobileAppTroubleshootingEvents` |
| DeviceManagementPartner | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/deviceManagementPartners` |
| DeviceManagementRemoteAssistancePartner | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/remoteAssistancePartners` |
| DeviceManagementResourceOperation | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/resourceOperations` |
| DeviceManagementTermAndConditionAcceptanceStatus | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/termsAndConditions/{termsAndConditions-id}/acceptanceStatuses` |
| DeviceManagementTroubleshootingEvent | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/troubleshootingEvents` |
| DeviceManagementVirtualEndpointDeviceImage | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/deviceImages` |
| DeviceManagementVirtualEndpointGalleryImage | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/galleryImages` |
| DeviceManagementVirtualEndpointProvisioningPolicyAssignment | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/provisioningPolicies/{cloudPcProvisioningPolicy-id}/assignments` |
| DeviceManagementVirtualEndpointUserSettingAssignment | 25 | Beta.DeviceManagement.Administration, DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/userSettings/{cloudPcUserSetting-id}/assignments` |
| DeviceManagementWindowsInformationProtectionAppLearningSummary | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/windowsInformationProtectionAppLearningSummaries` |
| DeviceManagementWindowsInformationProtectionNetworkLearningSummary | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/windowsInformationProtectionNetworkLearningSummaries` |
| DeviceManagementWindowsMalwareInformation | 25 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/windowsMalwareInformation` |
| DirectoryAdministrativeUnitExtension | 25 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/directory/administrativeUnits/{administrativeUnit-id}/extensions` |
| DomainServiceConfigurationRecord | 25 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/domains/{domain-id}/serviceConfigurationRecords` |
| DomainVerificationDnsRecord | 25 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/domains/{domain-id}/verificationDnsRecords` |
| GroupExtension | 25 | Beta.Groups, Groups | `/groups/{group-id}/extensions` |
| GroupPermissionGrant | 25 | Beta.Groups, Groups | `/groups/{group-id}/permissionGrants` |
| GroupThread | 25 | Beta.Groups, Groups | `/groups/{group-id}/threads` |
| IdentityB2XUserFlowLanguage | 25 | Beta.Identity.SignIns, Identity.SignIns | `/identity/b2xUserFlows/{b2xIdentityUserFlow-id}/languages` |
| OrganizationExtension | 25 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/organization/{organization-id}/extensions` |
| PolicyAuthenticationStrengthPolicyCombinationConfiguration | 25 | Beta.Identity.SignIns, Identity.SignIns | `/policies/authenticationStrengthPolicies/{authenticationStrengthPolicy-id}/combinationConfigurations` |
| ServicePrincipalEndpoint | 25 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/endpoints` |
| SiteGetByPathTermStore | 25 | Beta.Sites, Sites | `/sites/{site-id}/getByPath(path='{path}')/termStore` |
| SiteListItem | 25 | Beta.Sites, Sites | `/sites/{site-id}/lists/{list-id}/items` |
| TeamChannelMember | 25 | Beta.Teams, Teams | `/teams/{team-id}/channels/{channel-id}/allMembers` |
| TeamChannelSharedWithTeam | 25 | Beta.Teams, Teams | `/teams/{team-id}/channels/{channel-id}/sharedWithTeams` |
| TeamInstalledApp | 25 | Beta.Teams, Teams | `/teams/{team-id}/installedApps` |
| TeamMember | 25 | Beta.Teams, Teams | `/teams/{team-id}/members` |
| TeamOperation | 25 | Beta.Teams, Teams | `/teams/{team-id}/operations` |
| TeamPermissionGrant | 25 | Beta.Teams, Teams | `/teams/{team-id}/permissionGrants` |
| TeamTag | 25 | Beta.Teams, Teams | `/teams/{team-id}/tags` |
| UserAuthenticationEmailMethod | 25 | Beta.Identity.SignIns, Identity.SignIns | `/users/{user-id}/authentication/emailMethods` |
| UserAuthenticationOperation | 25 | Beta.Identity.SignIns, Identity.SignIns | `/users/{user-id}/authentication/operations` |
| UserAuthenticationPhoneMethod | 25 | Beta.Identity.SignIns, Identity.SignIns | `/users/{user-id}/authentication/phoneMethods` |
| UserChat | 25 | Beta.Teams, Teams | `/users/{user-id}/chats` |
| UserDeviceManagementTroubleshootingEvent | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/users/{user-id}/deviceManagementTroubleshootingEvents` |
| UserExtension | 25 | Beta.Users, Users | `/users/{user-id}/extensions` |
| UserManagedDevice | 25 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/users/{user-id}/managedDevices` |
| DirectoryCertificateAuthorityMutualTlOauthConfiguration | 20 | Beta.Identity.DirectoryManagement | `/directory/certificateAuthorities/mutualTlsOauthConfigurations` |
| DirectoryExternalUserProfile | 20 | Beta.Identity.DirectoryManagement | `/directory/externalUserProfiles` |
| DirectoryFederationConfiguration | 20 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/directory/federationConfigurations` |
| DirectoryImpactedResource | 20 | Beta.Identity.DirectoryManagement | `/directory/impactedResources` |
| DirectoryInboundSharedUserProfile | 20 | Beta.Identity.DirectoryManagement | `/directory/inboundSharedUserProfiles` |
| DirectoryOutboundSharedUserProfile | 20 | Beta.Identity.DirectoryManagement | `/directory/outboundSharedUserProfiles` |
| DirectoryPendingExternalUserProfile | 20 | Beta.Identity.DirectoryManagement | `/directory/pendingExternalUserProfiles` |
| DirectoryRecommendation | 20 | Beta.Identity.DirectoryManagement | `/directory/recommendations` |
| DirectorySharedEmailDomain | 20 | Beta.Identity.DirectoryManagement | `/directory/sharedEmailDomains` |
| EntitlementManagementAssignmentPolicy | 20 | Identity.Governance | `/identityGovernance/entitlementManagement/assignmentPolicies` |
| EntitlementManagementAvailableAccessPackage | 20 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/availableAccessPackages` |
| EntitlementManagementCatalog | 20 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs` |
| EntitlementManagementControlConfiguration | 20 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/controlConfigurations` |
| EntitlementManagementResource | 20 | Identity.Governance | `/identityGovernance/entitlementManagement/resources` |
| EntitlementManagementResourceRequest | 20 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests` |
| EntitlementManagementResourceRoleScope | 20 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes` |
| EntitlementManagementSubject | 20 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/subjects` |
| ExternalAuthorizationSystem | 20 | Beta.Search | `/external/authorizationSystems` |
| IdentityB2CUserFlow | 20 | Beta.Identity.SignIns | `/identity/b2cUserFlows` |
| IdentityGovernanceAccessReviewDecision | 20 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions` |
| IdentityGovernancePrivilegedAccessGroupResource | 20 | Beta.Identity.Governance | `/identityGovernance/privilegedAccess/group/resources` |
| IdentitySignInIdentifier | 20 | Beta.Identity.SignIns | `/identity/signInIdentifiers` |
| IdentityUserFlow | 20 | Beta.Identity.SignIns | `/identity/userFlows` |
| NetworkAccessAlert | 20 | Beta.NetworkAccess | `/networkAccess/alerts` |
| NetworkAccessConnectivityBranch | 20 | Beta.NetworkAccess | `/networkAccess/connectivity/branches` |
| NetworkAccessThreatIntelligencePolicy | 20 | Beta.NetworkAccess | `/networkAccess/threatIntelligencePolicies` |
| NetworkAccessTlInspectionPolicy | 20 | Beta.NetworkAccess | `/networkAccess/tlsInspectionPolicies` |
| OnPremisePublishingProfileAgent | 20 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/agents` |
| OnPremisePublishingProfileAgentGroup | 20 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/agentGroups` |
| OnPremisePublishingProfileConnector | 20 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/connectors` |
| OnPremisePublishingProfilePublishedResource | 20 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/publishedResources` |
| OnPremisePublishingProfileSensor | 20 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/sensors` |
| PlannerRoster | 20 | Beta.Planner | `/planner/rosters` |
| PolicyOnPremAuthenticationPolicy | 20 | Beta.Identity.SignIns | `/policies/onPremAuthenticationPolicies` |
| PolicyPermissionGrantPreApprovalPolicy | 20 | Beta.Identity.SignIns | `/policies/permissionGrantPreApprovalPolicies` |
| PolicyServicePrincipalCreationPolicy | 20 | Beta.Identity.SignIns | `/policies/servicePrincipalCreationPolicies` |
| RoleManagementCloudPcResourceNamespace | 20 | Beta.DeviceManagement.Enrollment | `/roleManagement/cloudPC/resourceNamespaces` |
| RoleManagementEntitlementManagementRoleEligibilityScheduleRequest | 20 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleEligibilityScheduleRequests` |
| IdentityGovernancePrivilegedAccessGroupAssignmentApproval | 15 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/privilegedAccess/group/assignmentApprovals` |
| IdentityGovernancePrivilegedAccessGroupAssignmentSchedule | 15 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/privilegedAccess/group/assignmentSchedules` |
| IdentityGovernancePrivilegedAccessGroupAssignmentScheduleInstance | 15 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/privilegedAccess/group/assignmentScheduleInstances` |
| RoleManagementEntitlementManagementRoleEligibilityScheduleInstance | 15 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleEligibilityScheduleInstances` |
| AdminEdgeInternetExplorerModeSiteListSharedCookie | 10 | Beta.DeviceManagement, DeviceManagement | `/admin/edge/internetExplorerMode/siteLists/{browserSiteList-id}/sharedCookies` |
| AdminEdgeInternetExplorerModeSiteListSite | 10 | Beta.DeviceManagement, DeviceManagement | `/admin/edge/internetExplorerMode/siteLists/{browserSiteList-id}/sites` |
| AgreementAcceptance | 10 | Beta.Identity.Governance, Identity.Governance | `/agreements/{agreement-id}/acceptances` |
| AgreementFile | 10 | Beta.Identity.Governance, Identity.Governance | `/agreements/{agreement-id}/file` |
| AgreementFileLocalization | 10 | Beta.Identity.Governance, Identity.Governance | `/agreements/{agreement-id}/file/localizations` |
| AgreementFileLocalizationVersion | 10 | Beta.Identity.Governance, Identity.Governance | `/agreements/{agreement-id}/file/localizations/{agreementFileLocalization-id}/versions` |
| AgreementFileVersion | 10 | Beta.Identity.Governance, Identity.Governance | `/agreements/{agreement-id}/files/{agreementFileLocalization-id}/versions` |
| ApplicationSynchronizationJob | 10 | Applications, Beta.Applications | `/applications/{application-id}/synchronization/jobs` |
| ApplicationSynchronizationTemplate | 10 | Applications, Beta.Applications | `/applications/{application-id}/synchronization/templates` |
| BookingBusiness | 10 | Beta.Bookings, Bookings | `/bookingBusinesses` |
| BookingBusinessCustomQuestion | 10 | Beta.Bookings, Bookings | `/bookingBusinesses/{bookingBusiness-id}/customQuestions` |
| BookingBusinessService | 10 | Beta.Bookings, Bookings | `/bookingBusinesses/{bookingBusiness-id}/services` |
| BookingBusinessStaffMember | 10 | Beta.Bookings, Bookings | `/bookingBusinesses/{bookingBusiness-id}/staffMembers` |
| BookingCurrency | 10 | Beta.Bookings, Bookings | `/bookingCurrencies` |
| DeviceAppManagementManagedAppRegistrationOperation | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedAppRegistrations/{managedAppRegistration-id}/operations` |
| DeviceAppManagementManagedEBookAssignment | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedEBooks/{managedEBook-id}/assignments` |
| DeviceAppManagementManagedEBookDeviceState | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedEBooks/{managedEBook-id}/deviceStates` |
| DeviceAppManagementManagedEBookUserStateSummaryDeviceState | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedEBooks/{managedEBook-id}/userStateSummary/{userInstallStateSummary-id}/deviceStates` |
| DeviceAppManagementMdmWindowsInformationProtectionPolicyExemptAppLockerFile | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mdmWindowsInformationProtectionPolicies/{mdmWindowsInformationProtectionPolicy-id}/exemptAppLockerFiles` |
| DeviceAppManagementMdmWindowsInformationProtectionPolicyProtectedAppLockerFile | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mdmWindowsInformationProtectionPolicies/{mdmWindowsInformationProtectionPolicy-id}/protectedAppLockerFiles` |
| DeviceAppManagementMobileAppAsAndroidLobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidLobApp/contentVersions` |
| DeviceAppManagementMobileAppAsiOSLobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosLobApp/contentVersions` |
| DeviceAppManagementMobileAppAsMacOSDmgAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSDmgApp/contentVersions` |
| DeviceAppManagementMobileAppAsMacOSLobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSLobApp/contentVersions` |
| DeviceAppManagementMobileAppAsManagedAndroidLobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedAndroidLobApp/contentVersions` |
| DeviceAppManagementMobileAppAsManagediOSLobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedIOSLobApp/contentVersions` |
| DeviceAppManagementMobileAppAsManagedMobileLobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedMobileLobApp/contentVersions` |
| DeviceAppManagementMobileAppAsWin32LobAppContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/win32LobApp/contentVersions` |
| DeviceAppManagementMobileAppAsWindowsAppXContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsAppX/contentVersions` |
| DeviceAppManagementMobileAppAsWindowsMobileMsiContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsMobileMSI/contentVersions` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXCommittedContainedApp | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/committedContainedApps` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXContentVersion | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/contentVersions` |
| DeviceAppManagementWindowsInformationProtectionPolicyExemptAppLockerFile | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/windowsInformationProtectionPolicies/{windowsInformationProtectionPolicy-id}/exemptAppLockerFiles` |
| DeviceAppManagementWindowsInformationProtectionPolicyProtectedAppLockerFile | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/windowsInformationProtectionPolicies/{windowsInformationProtectionPolicy-id}/protectedAppLockerFiles` |
| DeviceExtension | 10 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/devices/{device-id}/extensions` |
| DeviceManagementDeviceCompliancePolicyScheduledActionForRuleScheduledActionConfiguration | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicies/{deviceCompliancePolicy-id}/scheduledActionsForRule/{deviceComplianceScheduledActionForRule-id}/scheduledActionConfigurations` |
| DeviceManagementDeviceCompliancePolicySettingStateSummaryDeviceComplianceSettingState | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/deviceCompliancePolicySettingStateSummaries/{deviceCompliancePolicySettingStateSummary-id}/deviceComplianceSettingStates` |
| DeviceManagementManagedDeviceCompliancePolicyState | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/deviceCompliancePolicyStates` |
| DeviceManagementManagedDeviceConfigurationState | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/deviceConfigurationStates` |
| DeviceManagementManagedDeviceWindowsProtectionStateDetectedMalwareState | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/windowsProtectionState/detectedMalwareState` |
| DeviceManagementMobileAppTroubleshootingEventAppLogCollectionRequest | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/mobileAppTroubleshootingEvents/{mobileAppTroubleshootingEvent-id}/appLogCollectionRequests` |
| DeviceManagementWindowsMalwareInformationDeviceMalwareState | 10 | Beta.DeviceManagement, DeviceManagement | `/deviceManagement/windowsMalwareInformation/{windowsMalwareInformation-id}/deviceMalwareStates` |
| DriveItem | 10 | Beta.Files, Files | `/drives/{drive-id}/items` |
| DriveItemAnalyticItemActivityStat | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/analytics/itemActivityStats` |
| DriveItemListItemDocumentSetVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/listItem/documentSetVersions` |
| DriveItemListItemVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/listItem/versions` |
| DriveItemPermission | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/permissions` |
| DriveItemSubscription | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/subscriptions` |
| DriveItemThumbnail | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/thumbnails` |
| DriveItemVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/items/{driveItem-id}/versions` |
| DriveListColumn | 10 | Beta.Files, Files | `/drives/{drive-id}/list/columns` |
| DriveListContentType | 10 | Beta.Files, Files | `/drives/{drive-id}/list/contentTypes` |
| DriveListContentTypeColumn | 10 | Beta.Files, Files | `/drives/{drive-id}/list/contentTypes/{contentType-id}/columns` |
| DriveListContentTypeColumnLink | 10 | Beta.Files, Files | `/drives/{drive-id}/list/contentTypes/{contentType-id}/columnLinks` |
| DriveListItem | 10 | Beta.Files, Files | `/drives/{drive-id}/list/items` |
| DriveListItemDocumentSetVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/list/items/{listItem-id}/documentSetVersions` |
| DriveListItemVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/list/items/{listItem-id}/versions` |
| DriveListOperation | 10 | Beta.Files, Files | `/drives/{drive-id}/list/operations` |
| DriveListSubscription | 10 | Beta.Files, Files | `/drives/{drive-id}/list/subscriptions` |
| DriveRootAnalyticItemActivityStat | 10 | Beta.Files, Files | `/drives/{drive-id}/root/analytics/itemActivityStats` |
| DriveRootListItemDocumentSetVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/root/listItem/documentSetVersions` |
| DriveRootListItemVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/root/listItem/versions` |
| DriveRootPermission | 10 | Beta.Files, Files | `/drives/{drive-id}/root/permissions` |
| DriveRootSubscription | 10 | Beta.Files, Files | `/drives/{drive-id}/root/subscriptions` |
| DriveRootThumbnail | 10 | Beta.Files, Files | `/drives/{drive-id}/root/thumbnails` |
| DriveRootVersion | 10 | Beta.Files, Files | `/drives/{drive-id}/root/versions` |
| EducationClass | 10 | Beta.Education, Education | `/education/classes` |
| EducationClassAssignment | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments` |
| EducationClassAssignmentCategory | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignmentCategories` |
| EducationClassAssignmentResource | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/resources` |
| EducationClassAssignmentSettingGradingCategory | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignmentSettings/gradingCategories` |
| EducationClassAssignmentSettingGradingScheme | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignmentSettings/gradingSchemes` |
| EducationClassAssignmentSubmission | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/submissions` |
| EducationClassModule | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/modules` |
| EducationClassModuleResource | 10 | Beta.Education, Education | `/education/classes/{educationClass-id}/modules/{educationModule-id}/resources` |
| EducationMeAssignment | 10 | Beta.Education, Education | `/education/me/assignments` |
| EducationMeAssignmentResource | 10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/resources` |
| EducationMeAssignmentSubmission | 10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/submissions` |
| EducationMeRubric | 10 | Beta.Education, Education | `/education/me/rubrics` |
| EducationReportReadingAssignmentSubmission | 10 | Beta.Education, Education | `/education/reports/readingAssignmentSubmissions` |
| EducationReportReadingCoachPassage | 10 | Beta.Education, Education | `/education/reports/readingCoachPassages` |
| EducationReportSpeakerAssignmentSubmission | 10 | Beta.Education, Education | `/education/reports/speakerAssignmentSubmissions` |
| EducationSchool | 10 | Beta.Education, Education | `/education/schools` |
| EducationUser | 10 | Beta.Education, Education | `/education/users` |
| EducationUserAssignment | 10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments` |
| EducationUserAssignmentResource | 10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/resources` |
| EducationUserAssignmentSubmission | 10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/submissions` |
| EducationUserRubric | 10 | Beta.Education, Education | `/education/users/{educationUser-id}/rubrics` |
| EntitlementManagementAccessPackageAssignmentApprovalStage | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageAssignmentApprovals/{approval-id}/stages` |
| EntitlementManagementCatalogResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resourceRoles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementCatalogResourceScopeResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resourceScopes/{accessPackageResourceScope-id}/resource/roles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceEnvironmentResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceEnvironments/{accessPackageResourceEnvironment-id}/resources/{accessPackageResource-id}/roles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceEnvironmentResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceEnvironments/{accessPackageResourceEnvironment-id}/resources/{accessPackageResource-id}/scopes` |
| EntitlementManagementResourceRequestCatalogCustomWorkflowExtension | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/customWorkflowExtensions` |
| EntitlementManagementResourceRequestCatalogResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resourceRoles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceRequestCatalogResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resourceScopes` |
| EntitlementManagementResourceRequestCatalogResourceScopeResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resourceScopes/{accessPackageResourceScope-id}/resource/roles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceRequestResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/resource/roles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceRequestResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/resource/scopes` |
| EntitlementManagementResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resources/{accessPackageResource-id}/roles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceRoleScopeResourceRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes/{accessPackageResourceRoleScope-id}/scope/resource/roles/{accessPackageResourceRole-id}/resource/scopes` |
| EntitlementManagementResourceRoleScopeResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes/{accessPackageResourceRoleScope-id}/scope/resource/scopes` |
| EntitlementManagementResourceRoleScopeRoleResourceScope | 10 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes/{accessPackageResourceRoleScope-id}/role/resource/scopes` |
| GroupConversationThread | 10 | Beta.Groups, Groups | `/groups/{group-id}/conversations/{conversation-id}/threads` |
| GroupSiteAnalyticItemActivityStat | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/analytics/itemActivityStats` |
| GroupSiteColumn | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/columns` |
| GroupSiteContentType | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/contentTypes` |
| GroupSiteContentTypeColumn | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/contentTypes/{contentType-id}/columns` |
| GroupSiteContentTypeColumnLink | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/contentTypes/{contentType-id}/columnLinks` |
| GroupSiteList | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists` |
| GroupSiteListColumn | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/columns` |
| GroupSiteListContentType | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/contentTypes` |
| GroupSiteListOperation | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/operations` |
| GroupSiteListSubscription | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/subscriptions` |
| GroupSiteOnenoteNotebook | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/notebooks` |
| GroupSiteOnenoteOperation | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/operations` |
| GroupSiteOnenotePage | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/pages` |
| GroupSiteOnenoteResource | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/resources` |
| GroupSiteOnenoteSection | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/sections` |
| GroupSiteOnenoteSectionGroup | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/sectionGroups` |
| GroupSiteOperation | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/operations` |
| GroupSitePage | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/pages` |
| GroupSitePermission | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/permissions` |
| GroupSiteTermStore | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore` |
| GroupSiteTermStoreGroup | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups` |
| GroupSiteTermStoreSet | 10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets` |
| GroupTeamChannelMember | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/allMembers` |
| GroupTeamChannelMessage | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/messages` |
| GroupTeamChannelSharedWithTeam | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/sharedWithTeams` |
| GroupTeamInstalledApp | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/installedApps` |
| GroupTeamMember | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/members` |
| GroupTeamOperation | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/operations` |
| GroupTeamPermissionGrant | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/permissionGrants` |
| GroupTeamPrimaryChannelMember | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/allMembers` |
| GroupTeamPrimaryChannelMessage | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/messages` |
| GroupTeamPrimaryChannelSharedWithTeam | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/sharedWithTeams` |
| GroupTeamScheduleDayNote | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/dayNotes` |
| GroupTeamScheduleOfferShiftRequest | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/offerShiftRequests` |
| GroupTeamScheduleOpenShift | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/openShifts` |
| GroupTeamScheduleOpenShiftChangeRequest | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/openShiftChangeRequests` |
| GroupTeamScheduleSchedulingGroup | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/schedulingGroups` |
| GroupTeamScheduleShift | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/shifts` |
| GroupTeamScheduleSwapShiftChangeRequest | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/swapShiftsChangeRequests` |
| GroupTeamScheduleTimeCard | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/timeCards` |
| GroupTeamScheduleTimeOff | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/timesOff` |
| GroupTeamScheduleTimeOffReason | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/timeOffReasons` |
| GroupTeamScheduleTimeOffRequest | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/schedule/timeOffRequests` |
| GroupTeamTag | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/tags` |
| GroupTeamTagMember | 10 | Beta.Teams, Teams | `/groups/{group-id}/team/tags/{teamworkTag-id}/members` |
| GroupThreadPostExtension | 10 | Beta.Groups, Groups | `/groups/{group-id}/threads/{conversationThread-id}/posts/{post-id}/extensions` |
| IdentityAuthenticationEventFlowAsExternalUserSelfServiceSignUpEventFlowIncludeApplication | 10 | Beta.Identity.SignIns, Identity.SignIns | `/identity/authenticationEventsFlows/{authenticationEventsFlow-id}/externalUsersSelfServiceSignUpEventsFlow/conditions/applications/includeApplications` |
| IdentityAuthenticationEventFlowIncludeApplication | 10 | Beta.Identity.SignIns, Identity.SignIns | `/identity/authenticationEventsFlows/{authenticationEventsFlow-id}/conditions/applications/includeApplications` |
| IdentityB2XUserFlowLanguageDefaultPage | 10 | Beta.Identity.SignIns, Identity.SignIns | `/identity/b2xUserFlows/{b2xIdentityUserFlow-id}/languages/{userFlowLanguageConfiguration-id}/defaultPages` |
| IdentityB2XUserFlowLanguageOverridePage | 10 | Beta.Identity.SignIns, Identity.SignIns | `/identity/b2xUserFlows/{b2xIdentityUserFlow-id}/languages/{userFlowLanguageConfiguration-id}/overridesPages` |
| IdentityConditionalAccessAuthenticationStrengthPolicyCombinationConfiguration | 10 | Beta.Identity.SignIns, Identity.SignIns | `/identity/conditionalAccess/authenticationStrength/policies/{authenticationStrengthPolicy-id}/combinationConfigurations` |
| IdentityGovernanceAppConsentRequestUserConsentRequestApprovalStage | 10 | Identity.Governance | `/identityGovernance/appConsent/appConsentRequests/{appConsentRequest-id}/userConsentRequests/{userConsentRequest-id}/approval/stages` |
| IdentityGovernancePrivilegedAccessGroupAssignmentApprovalStage | 10 | Identity.Governance | `/identityGovernance/privilegedAccess/group/assignmentApprovals/{approval-id}/stages` |
| IdentityGovernanceTermsOfUseAgreementFileLocalization | 10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/termsOfUse/agreements/{agreement-id}/file/localizations` |
| IdentityGovernanceTermsOfUseAgreementFileLocalizationVersion | 10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/termsOfUse/agreements/{agreement-id}/file/localizations/{agreementFileLocalization-id}/versions` |
| IdentityGovernanceTermsOfUseAgreementFileVersion | 10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/termsOfUse/agreements/{agreement-id}/files/{agreementFileLocalization-id}/versions` |
| OrganizationBrandingLocalization | 10 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/organization/{organization-id}/branding/localizations` |
| PlaceAsBuildingMapFootprint | 10 | Beta.Calendar, Calendar | `/places/{place-id}/building/map/footprints` |
| PlaceAsBuildingMapLevel | 10 | Beta.Calendar, Calendar | `/places/{place-id}/building/map/levels` |
| PlaceAsRoomListRoom | 10 | Beta.Calendar, Calendar | `/places/{place-id}/roomList/rooms` |
| PlaceAsRoomListWorkspace | 10 | Beta.Calendar, Calendar | `/places/{place-id}/roomList/workspaces` |
| PrintConnector | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/connectors` |
| PrintOperation | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/operations` |
| PrintService | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/services` |
| PrintServiceEndpoint | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/services/{printService-id}/endpoints` |
| PrintShare | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/shares` |
| PrintShareJob | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/shares/{printerShare-id}/jobs` |
| PrintShareJobDocument | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/shares/{printerShare-id}/jobs/{printJob-id}/documents` |
| PrintShareJobTask | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/shares/{printerShare-id}/jobs/{printJob-id}/tasks` |
| PrintTaskDefinition | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/taskDefinitions` |
| PrintTaskDefinitionTask | 10 | Beta.Devices.CloudPrint, Devices.CloudPrint | `/print/taskDefinitions/{printTaskDefinition-id}/tasks` |
| PrivacySubjectRightsRequest | 10 | Beta.Compliance, Compliance | `/privacy/subjectRightsRequests` |
| PrivacySubjectRightsRequestNote | 10 | Beta.Compliance, Compliance | `/privacy/subjectRightsRequests/{subjectRightsRequest-id}/notes` |
| SchemaExtension | 10 | Beta.SchemaExtensions, SchemaExtensions | `/schemaExtensions` |
| SecurityAlertV2 | 10 | Beta.Security, Security | `/security/alerts_v2` |
| SecurityAttackSimulationAutomation | 10 | Beta.Security, Security | `/security/attackSimulation/simulationAutomations` |
| SecurityAttackSimulationAutomationRun | 10 | Beta.Security, Security | `/security/attackSimulation/simulationAutomations/{simulationAutomation-id}/runs` |
| SecurityAttackSimulationEndUserNotification | 10 | Beta.Security, Security | `/security/attackSimulation/endUserNotifications` |
| SecurityAttackSimulationEndUserNotificationDetail | 10 | Beta.Security, Security | `/security/attackSimulation/endUserNotifications/{endUserNotification-id}/details` |
| SecurityAttackSimulationLandingPage | 10 | Beta.Security, Security | `/security/attackSimulation/landingPages` |
| SecurityAttackSimulationLandingPageDetail | 10 | Beta.Security, Security | `/security/attackSimulation/landingPages/{landingPage-id}/details` |
| SecurityAttackSimulationLoginPage | 10 | Beta.Security, Security | `/security/attackSimulation/loginPages` |
| SecurityAttackSimulationOperation | 10 | Beta.Security, Security | `/security/attackSimulation/operations` |
| SecurityAttackSimulationPayload | 10 | Beta.Security, Security | `/security/attackSimulation/payloads` |
| SecurityAttackSimulationTraining | 10 | Beta.Security, Security | `/security/attackSimulation/trainings` |
| SecurityAttackSimulationTrainingLanguageDetail | 10 | Beta.Security, Security | `/security/attackSimulation/trainings/{training-id}/languageDetails` |
| SecurityCaseEdiscoveryCase | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases` |
| SecurityCaseEdiscoveryCaseCustodian | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/custodians` |
| SecurityCaseEdiscoveryCaseMember | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/caseMembers` |
| SecurityCaseEdiscoveryCaseNoncustodialDataSource | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/noncustodialDataSources` |
| SecurityCaseEdiscoveryCaseOperation | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/operations` |
| SecurityCaseEdiscoveryCaseReviewSet | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/reviewSets` |
| SecurityCaseEdiscoveryCaseSearch | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/searches` |
| SecurityCaseEdiscoveryCaseTag | 10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/tags` |
| SecurityDataSecurityAndGovernanceSensitivityLabel | 10 | Beta.Security, Security | `/security/dataSecurityAndGovernance/sensitivityLabels` |
| SecurityDataSecurityAndGovernanceSensitivityLabelSublabel | 10 | Beta.Security, Security | `/security/dataSecurityAndGovernance/sensitivityLabels/{sensitivityLabel-id}/sublabels` |
| SecurityIdentityAccount | 10 | Beta.Security, Security | `/security/identities/identityAccounts` |
| SecurityIdentityHealthIssue | 10 | Beta.Security, Security | `/security/identities/healthIssues` |
| SecurityIdentitySensor | 10 | Beta.Security, Security | `/security/identities/sensors` |
| SecurityIdentitySensorCandidate | 10 | Security | `/security/identities/sensorCandidates` |
| SecurityIncident | 10 | Beta.Security, Security | `/security/incidents` |
| SecurityLabelAuthority | 10 | Beta.Security, Security | `/security/labels/authorities` |
| SecurityLabelCategory | 10 | Beta.Security, Security | `/security/labels/categories` |
| SecurityLabelCategorySubcategory | 10 | Beta.Security, Security | `/security/labels/categories/{categoryTemplate-id}/subcategories` |
| SecurityLabelCitation | 10 | Beta.Security, Security | `/security/labels/citations` |
| SecurityLabelDepartment | 10 | Beta.Security, Security | `/security/labels/departments` |
| SecurityLabelFilePlanReference | 10 | Beta.Security, Security | `/security/labels/filePlanReferences` |
| SecurityLabelRetentionLabel | 10 | Beta.Security, Security | `/security/labels/retentionLabels` |
| SecurityLabelRetentionLabelDispositionReviewStage | 10 | Beta.Security, Security | `/security/labels/retentionLabels/{retentionLabel-id}/dispositionReviewStages` |
| SecuritySecureScore | 10 | Beta.Security, Security | `/security/secureScores` |
| SecuritySecureScoreControlProfile | 10 | Beta.Security, Security | `/security/secureScoreControlProfiles` |
| SecuritySubjectRightsRequest | 10 | Beta.Security, Security | `/security/subjectRightsRequests` |
| SecuritySubjectRightsRequestNote | 10 | Beta.Security, Security | `/security/subjectRightsRequests/{subjectRightsRequest-id}/notes` |
| SecurityThreatIntelligenceArticle | 10 | Beta.Security, Security | `/security/threatIntelligence/articles` |
| SecurityThreatIntelligenceArticleIndicator | 10 | Beta.Security, Security | `/security/threatIntelligence/articleIndicators` |
| SecurityThreatIntelligenceHost | 10 | Beta.Security, Security | `/security/threatIntelligence/hosts` |
| SecurityThreatIntelligenceHostComponent | 10 | Beta.Security, Security | `/security/threatIntelligence/hostComponents` |
| SecurityThreatIntelligenceHostCookie | 10 | Beta.Security, Security | `/security/threatIntelligence/hostCookies` |
| SecurityThreatIntelligenceHostPair | 10 | Beta.Security, Security | `/security/threatIntelligence/hostPairs` |
| SecurityThreatIntelligenceHostPort | 10 | Beta.Security, Security | `/security/threatIntelligence/hostPorts` |
| SecurityThreatIntelligenceHostSslCertificate | 10 | Beta.Security, Security | `/security/threatIntelligence/hostSslCertificates` |
| SecurityThreatIntelligenceHostTracker | 10 | Beta.Security, Security | `/security/threatIntelligence/hostTrackers` |
| SecurityThreatIntelligenceIntelProfile | 10 | Beta.Security, Security | `/security/threatIntelligence/intelProfiles` |
| SecurityThreatIntelligencePassiveDnsRecord | 10 | Beta.Security, Security | `/security/threatIntelligence/passiveDnsRecords` |
| SecurityThreatIntelligenceProfileIndicator | 10 | Beta.Security, Security | `/security/threatIntelligence/intelligenceProfileIndicators` |
| SecurityThreatIntelligenceSslCertificate | 10 | Beta.Security, Security | `/security/threatIntelligence/sslCertificates` |
| SecurityThreatIntelligenceSubdomain | 10 | Beta.Security, Security | `/security/threatIntelligence/subdomains` |
| SecurityThreatIntelligenceVulnerability | 10 | Beta.Security, Security | `/security/threatIntelligence/vulnerabilities` |
| SecurityThreatIntelligenceVulnerabilityComponent | 10 | Beta.Security, Security | `/security/threatIntelligence/vulnerabilities/{vulnerability-id}/components` |
| SecurityThreatIntelligenceWhoisHistoryRecord | 10 | Beta.Security, Security | `/security/threatIntelligence/whoisHistoryRecords` |
| SecurityThreatIntelligenceWhoisRecord | 10 | Beta.Security, Security | `/security/threatIntelligence/whoisRecords` |
| SecurityTriggerRetentionEvent | 10 | Beta.Security, Security | `/security/triggers/retentionEvents` |
| SecurityTriggerTypeRetentionEventType | 10 | Beta.Security, Security | `/security/triggerTypes/retentionEventTypes` |
| ServicePrincipalRemoteDesktopSecurityConfigurationTargetDeviceGroup | 10 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/remoteDesktopSecurityConfiguration/targetDeviceGroups` |
| ServicePrincipalRiskDetection | 10 | Beta.Identity.SignIns, Identity.SignIns | `/identityProtection/servicePrincipalRiskDetections` |
| ServicePrincipalSynchronizationJob | 10 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/synchronization/jobs` |
| ServicePrincipalSynchronizationTemplate | 10 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/synchronization/templates` |
| ShareListColumn | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/columns` |
| ShareListContentType | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/contentTypes` |
| ShareListContentTypeColumn | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/contentTypes/{contentType-id}/columns` |
| ShareListContentTypeColumnLink | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/contentTypes/{contentType-id}/columnLinks` |
| ShareListItemDocumentSetVersion | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/items/{listItem-id}/documentSetVersions` |
| ShareListItemVersion | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/items/{listItem-id}/versions` |
| ShareListOperation | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/operations` |
| ShareListSubscription | 10 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/list/subscriptions` |
| SitePageAsSitePageCanvaLayoutHorizontalSection | 10 | Beta.Sites, Sites | `/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/horizontalSections` |
| SitePageAsSitePageCanvaLayoutHorizontalSectionColumn | 10 | Beta.Sites, Sites | `/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/horizontalSections/{horizontalSection-id}/columns` |
| SitePageAsSitePageCanvaLayoutHorizontalSectionColumnWebpart | 10 | Beta.Sites, Sites | `/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/horizontalSections/{horizontalSection-id}/columns/{horizontalSectionColumn-id}/webparts` |
| SitePageAsSitePageCanvaLayoutVerticalSectionWebpart | 10 | Beta.Sites, Sites | `/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/verticalSection/webparts` |
| SiteTermStoreGroupSetChild | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/children` |
| SiteTermStoreGroupSetChildRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/children/{term-id}/children/{term-id1}/relations` |
| SiteTermStoreGroupSetRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/relations` |
| SiteTermStoreGroupSetTerm | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/terms` |
| SiteTermStoreGroupSetTermChild | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/terms/{term-id}/children` |
| SiteTermStoreGroupSetTermChildRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/terms/{term-id}/children/{term-id1}/relations` |
| SiteTermStoreGroupSetTermRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/groups/{group-id}/sets/{set-id}/terms/{term-id}/relations` |
| SiteTermStoreSetChildRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/children/{term-id}/children/{term-id1}/relations` |
| SiteTermStoreSetParentGroupSet | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets` |
| SiteTermStoreSetParentGroupSetChild | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/children` |
| SiteTermStoreSetParentGroupSetChildRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/children/{term-id}/children/{term-id1}/relations` |
| SiteTermStoreSetParentGroupSetRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/relations` |
| SiteTermStoreSetParentGroupSetTerm | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms` |
| SiteTermStoreSetParentGroupSetTermChild | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms/{term-id}/children` |
| SiteTermStoreSetParentGroupSetTermChildRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms/{term-id}/children/{term-id1}/relations` |
| SiteTermStoreSetParentGroupSetTermRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms/{term-id}/relations` |
| SiteTermStoreSetTermChild | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/terms/{term-id}/children` |
| SiteTermStoreSetTermChildRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/terms/{term-id}/children/{term-id1}/relations` |
| SiteTermStoreSetTermRelation | 10 | Beta.Sites, Sites | `/sites/{site-id}/termStore/sets/{set-id}/terms/{term-id}/relations` |
| SolutionBackupRestoreDriveInclusionRule | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/driveInclusionRules` |
| SolutionBackupRestoreDriveProtectionUnit | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/driveProtectionUnits` |
| SolutionBackupRestoreDriveProtectionUnitBulkAdditionJob | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/driveProtectionUnitsBulkAdditionJobs` |
| SolutionBackupRestoreExchangeProtectionPolicy | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/exchangeProtectionPolicies` |
| SolutionBackupRestoreExchangeRestoreSession | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/exchangeRestoreSessions` |
| SolutionBackupRestoreExchangeRestoreSessionGranularMailboxRestoreArtifact | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/exchangeRestoreSessions/{exchangeRestoreSession-id}/granularMailboxRestoreArtifacts` |
| SolutionBackupRestoreExchangeRestoreSessionMailboxRestoreArtifact | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/exchangeRestoreSessions/{exchangeRestoreSession-id}/mailboxRestoreArtifacts` |
| SolutionBackupRestoreExchangeRestoreSessionMailboxRestoreArtifactBulkAdditionRequest | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/exchangeRestoreSessions/{exchangeRestoreSession-id}/mailboxRestoreArtifactsBulkAdditionRequests` |
| SolutionBackupRestoreMailboxInclusionRule | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/mailboxInclusionRules` |
| SolutionBackupRestoreMailboxProtectionUnit | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/mailboxProtectionUnits` |
| SolutionBackupRestoreMailboxProtectionUnitBulkAdditionJob | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/mailboxProtectionUnitsBulkAdditionJobs` |
| SolutionBackupRestoreOneDriveForBusinessProtectionPolicy | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/oneDriveForBusinessProtectionPolicies` |
| SolutionBackupRestoreOneDriveForBusinessRestoreSession | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/oneDriveForBusinessRestoreSessions` |
| SolutionBackupRestoreOneDriveForBusinessRestoreSessionDriveRestoreArtifact | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/oneDriveForBusinessRestoreSessions/{oneDriveForBusinessRestoreSession-id}/driveRestoreArtifacts` |
| SolutionBackupRestoreOneDriveForBusinessRestoreSessionDriveRestoreArtifactBulkAdditionRequest | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/oneDriveForBusinessRestoreSessions/{oneDriveForBusinessRestoreSession-id}/driveRestoreArtifactsBulkAdditionRequests` |
| SolutionBackupRestorePoint | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/restorePoints` |
| SolutionBackupRestoreProtectionPolicy | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/protectionPolicies` |
| SolutionBackupRestoreServiceApp | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/serviceApps` |
| SolutionBackupRestoreSession | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/restoreSessions` |
| SolutionBackupRestoreSharePointProtectionPolicy | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/sharePointProtectionPolicies` |
| SolutionBackupRestoreSharePointRestoreSession | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/sharePointRestoreSessions` |
| SolutionBackupRestoreSharePointRestoreSessionSiteRestoreArtifact | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/sharePointRestoreSessions/{sharePointRestoreSession-id}/siteRestoreArtifacts` |
| SolutionBackupRestoreSharePointRestoreSessionSiteRestoreArtifactBulkAdditionRequest | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/sharePointRestoreSessions/{sharePointRestoreSession-id}/siteRestoreArtifactsBulkAdditionRequests` |
| SolutionBackupRestoreSiteInclusionRule | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/siteInclusionRules` |
| SolutionBackupRestoreSiteProtectionUnit | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/siteProtectionUnits` |
| SolutionBackupRestoreSiteProtectionUnitBulkAdditionJob | 10 | BackupRestore, Beta.BackupRestore | `/solutions/backupRestore/siteProtectionUnitsBulkAdditionJobs` |
| TeamPrimaryChannelMember | 10 | Beta.Teams, Teams | `/teams/{team-id}/primaryChannel/allMembers` |
| TeamPrimaryChannelSharedWithTeam | 10 | Beta.Teams, Teams | `/teams/{team-id}/primaryChannel/sharedWithTeams` |
| TeamScheduleDayNote | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/dayNotes` |
| TeamScheduleOfferShiftRequest | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/offerShiftRequests` |
| TeamScheduleOpenShift | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/openShifts` |
| TeamScheduleOpenShiftChangeRequest | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/openShiftChangeRequests` |
| TeamScheduleSchedulingGroup | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/schedulingGroups` |
| TeamScheduleShift | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/shifts` |
| TeamScheduleSwapShiftChangeRequest | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/swapShiftsChangeRequests` |
| TeamScheduleTimeCard | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/timeCards` |
| TeamScheduleTimeOff | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/timesOff` |
| TeamScheduleTimeOffReason | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/timeOffReasons` |
| TeamScheduleTimeOffRequest | 10 | Beta.Teams, Teams | `/teams/{team-id}/schedule/timeOffRequests` |
| TeamTagMember | 10 | Beta.Teams, Teams | `/teams/{team-id}/tags/{teamworkTag-id}/members` |
| TeamworkDeletedChat | 10 | Beta.Teams, Teams | `/teamwork/deletedChats` |
| TeamworkDeletedTeam | 10 | Beta.Teams, Teams | `/teamwork/deletedTeams` |
| TeamworkDeletedTeamChannelMember | 10 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/allMembers` |
| TeamworkDeletedTeamChannelMessage | 10 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/messages` |
| TeamworkDeletedTeamChannelSharedWithTeam | 10 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/sharedWithTeams` |
| TeamworkWorkforceIntegration | 10 | Beta.Teams, Teams | `/teamwork/workforceIntegrations` |
| TenantRelationshipDelegatedAdminCustomer | 10 | Beta.Identity.Partner, Identity.Partner | `/tenantRelationships/delegatedAdminCustomers` |
| TenantRelationshipDelegatedAdminCustomerServiceManagementDetail | 10 | Beta.Identity.Partner, Identity.Partner | `/tenantRelationships/delegatedAdminCustomers/{delegatedAdminCustomer-id}/serviceManagementDetails` |
| TenantRelationshipDelegatedAdminRelationship | 10 | Beta.Identity.Partner, Identity.Partner | `/tenantRelationships/delegatedAdminRelationships` |
| TenantRelationshipDelegatedAdminRelationshipAccessAssignment | 10 | Beta.Identity.Partner, Identity.Partner | `/tenantRelationships/delegatedAdminRelationships/{delegatedAdminRelationship-id}/accessAssignments` |
| TenantRelationshipDelegatedAdminRelationshipOperation | 10 | Beta.Identity.Partner, Identity.Partner | `/tenantRelationships/delegatedAdminRelationships/{delegatedAdminRelationship-id}/operations` |
| TenantRelationshipDelegatedAdminRelationshipRequest | 10 | Beta.Identity.Partner, Identity.Partner | `/tenantRelationships/delegatedAdminRelationships/{delegatedAdminRelationship-id}/requests` |
| UserChatInstalledApp | 10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/installedApps` |
| UserChatMember | 10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/members` |
| UserChatMessageHostedContent | 10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/messages/{chatMessage-id}/hostedContents` |
| UserChatMessageReply | 10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/messages/{chatMessage-id}/replies` |
| UserChatPermissionGrant | 10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/permissionGrants` |
| UserChatPinnedMessage | 10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/pinnedMessages` |
| UserInsightShared | 10 | Beta.Users, Users | `/users/{user-id}/insights/shared` |
| UserInsightTrending | 10 | Beta.Users, Users | `/users/{user-id}/insights/trending` |
| UserInsightUsed | 10 | Beta.Users, Users | `/users/{user-id}/insights/used` |
| UserManagedDeviceCompliancePolicyState | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/deviceCompliancePolicyStates` |
| UserManagedDeviceConfigurationState | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/deviceConfigurationStates` |
| UserManagedDeviceWindowsProtectionStateDetectedMalwareState | 10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/windowsProtectionState/detectedMalwareState` |
| UserOutlookMasterCategory | 10 | Beta.Users, Users | `/users/{user-id}/outlook/masterCategories` |
| UserSettingWindows | 10 | Beta.Users, Users | `/users/{user-id}/settings/windows` |
| UserSettingWorkHourAndLocationOccurrence | 10 | Beta.Users, Users | `/users/{user-id}/settings/workHoursAndLocations/occurrences` |
| UserSettingWorkHourAndLocationRecurrence | 10 | Beta.Users, Users | `/users/{user-id}/settings/workHoursAndLocations/recurrences` |
| UserTeamworkAssociatedTeam | 10 | Beta.Teams, Teams | `/users/{user-id}/teamwork/associatedTeams` |
| UserTodoList | 10 | Beta.Users, Users | `/users/{user-id}/todo/lists` |
| UserTodoListExtension | 10 | Beta.Users, Users | `/users/{user-id}/todo/lists/{todoTaskList-id}/extensions` |
| AccessReview | 5 | Beta.Identity.Governance | `/accessReviews` |
| AccessReviewDecision | 5 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/decisions` |
| AccessReviewInstanceDecision | 5 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/instances/{accessReview-id1}/decisions` |
| AccessReviewInstanceMyDecision | 5 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/instances/{accessReview-id1}/myDecisions` |
| AccessReviewInstanceReviewer | 5 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/instances/{accessReview-id1}/reviewers` |
| AccessReviewMyDecision | 5 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/myDecisions` |
| AccessReviewReviewer | 5 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/reviewers` |
| AdministrativeUnitExtension | 5 | Beta.Identity.DirectoryManagement | `/administrativeUnits/{administrativeUnit-id}/extensions` |
| AdminPeopleProfilePropertySetting | 5 | Beta.Identity.DirectoryManagement | `/admin/people/profilePropertySettings` |
| AdminPeopleProfileSource | 5 | Beta.Identity.DirectoryManagement | `/admin/people/profileSources` |
| AgentRiskDetection | 5 | Beta.Identity.SignIns | `/identityProtection/agentRiskDetections` |
| AppCatalogTeamAppDefinitionDashboardCard | 5 | Beta.Teams | `/appCatalogs/teamsApps/{teamsApp-id}/appDefinitions/{teamsAppDefinition-id}/dashboardCards` |
| BusinessFlowTemplate | 5 | Beta.Identity.Governance | `/businessFlowTemplates` |
| ComplianceEdiscoveryCase | 5 | Beta.Compliance | `/compliance/ediscovery/cases` |
| ComplianceEdiscoveryCaseCustodian | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/custodians` |
| ComplianceEdiscoveryCaseLegalHold | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/legalHolds` |
| ComplianceEdiscoveryCaseNoncustodialDataSource | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/noncustodialDataSources` |
| ComplianceEdiscoveryCaseOperation | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/operations` |
| ComplianceEdiscoveryCaseReviewSet | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/reviewSets` |
| ComplianceEdiscoveryCaseSourceCollection | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/sourceCollections` |
| ComplianceEdiscoveryCaseTag | 5 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/tags` |
| DirectoryAuthenticationMethodDeviceHardwareOathDevice | 5 | Beta.Identity.DirectoryManagement | `/directory/authenticationMethodDevices/hardwareOathDevices` |
| DirectoryOutboundSharedUserProfileTenant | 5 | Beta.Identity.DirectoryManagement | `/directory/outboundSharedUserProfiles/{outboundSharedUserProfile-userId}/tenants` |
| DirectoryRecommendationImpactedResource | 5 | Beta.Identity.DirectoryManagement | `/directory/recommendations/{recommendation-id}/impactedResources` |
| DirectoryTemplateDeviceTemplate | 5 | Beta.Identity.DirectoryManagement | `/directory/templates/deviceTemplates` |
| Drive | 5 | Beta.Files, Files | `/drives` |
| DriveItemExtension | 5 | Beta.Files | `/drives/{drive-id}/items/{driveItem-id}/extensions` |
| DriveItemListItemPermission | 5 | Beta.Files | `/drives/{drive-id}/items/{driveItem-id}/listItem/permissions` |
| DriveListItemPermission | 5 | Beta.Files | `/drives/{drive-id}/list/items/{listItem-id}/permissions` |
| DriveListPermission | 5 | Beta.Files | `/drives/{drive-id}/list/permissions` |
| DriveRootExtension | 5 | Beta.Files | `/drives/{drive-id}/root/extensions` |
| DriveRootListItemPermission | 5 | Beta.Files | `/drives/{drive-id}/root/listItem/permissions` |
| EducationReportReflectCheck | 5 | Beta.Education, Education | `/education/reports/reflectCheckInResponses` |
| EntitlementManagementCatalogResource | 5 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resources` |
| EntitlementManagementCatalogResourceRole | 5 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resourceRoles` |
| EntitlementManagementResourceEnvironmentResource | 5 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceEnvironments/{accessPackageResourceEnvironment-id}/resources` |
| EntitlementManagementResourceRole | 5 | Identity.Governance | `/identityGovernance/entitlementManagement/resources/{accessPackageResource-id}/roles` |
| ExternalIndustryDataConnector | 5 | Beta.Search | `/external/industryData/dataConnectors` |
| ExternalIndustryDataInboundFlow | 5 | Beta.Search | `/external/industryData/inboundFlows` |
| ExternalIndustryDataOperation | 5 | Beta.Search | `/external/industryData/operations` |
| ExternalIndustryDataOutboundProvisioningFlowSet | 5 | Beta.Search | `/external/industryData/outboundProvisioningFlowSets` |
| ExternalIndustryDataOutboundProvisioningFlowSetProvisioningFlow | 5 | Beta.Search | `/external/industryData/outboundProvisioningFlowSets/{outboundProvisioningFlowSet-id}/provisioningFlows` |
| ExternalIndustryDataReferenceDefinition | 5 | Beta.Search | `/external/industryData/referenceDefinitions` |
| ExternalIndustryDataRoleGroup | 5 | Beta.Search | `/external/industryData/roleGroups` |
| ExternalIndustryDataSourceSystem | 5 | Beta.Search | `/external/industryData/sourceSystems` |
| ExternalIndustryDataYear | 5 | Beta.Search | `/external/industryData/years` |
| FinancialCompanyCountryRegion | 5 | Beta.Financials | `/financials/companies/{company-id}/countriesRegions` |
| FinancialCompanyCurrency | 5 | Beta.Financials | `/financials/companies/{company-id}/currencies` |
| FinancialCompanyCustomer | 5 | Beta.Financials | `/financials/companies/{company-id}/customers` |
| FinancialCompanyCustomerPayment | 5 | Beta.Financials | `/financials/companies/{company-id}/customerPayments` |
| FinancialCompanyCustomerPaymentJournal | 5 | Beta.Financials | `/financials/companies/{company-id}/customerPaymentJournals` |
| FinancialCompanyCustomerPaymentJournalCustomerPayment | 5 | Beta.Financials | `/financials/companies/{company-id}/customerPaymentJournals/{customerPaymentJournal-id}/customerPayments` |
| FinancialCompanyCustomerPicture | 5 | Beta.Financials | `/financials/companies/{company-id}/customers/{customer-id}/picture` |
| FinancialCompanyEmployee | 5 | Beta.Financials | `/financials/companies/{company-id}/employees` |
| FinancialCompanyEmployeePicture | 5 | Beta.Financials | `/financials/companies/{company-id}/employees/{employee-id}/picture` |
| FinancialCompanyItem | 5 | Beta.Financials | `/financials/companies/{company-id}/items` |
| FinancialCompanyItemCategory | 5 | Beta.Financials | `/financials/companies/{company-id}/itemCategories` |
| FinancialCompanyItemPicture | 5 | Beta.Financials | `/financials/companies/{company-id}/items/{item-id}/picture` |
| FinancialCompanyJournal | 5 | Beta.Financials | `/financials/companies/{company-id}/journals` |
| FinancialCompanyJournalLine | 5 | Beta.Financials | `/financials/companies/{company-id}/journalLines` |
| FinancialCompanyPaymentMethod | 5 | Beta.Financials | `/financials/companies/{company-id}/paymentMethods` |
| FinancialCompanyPaymentTerm | 5 | Beta.Financials | `/financials/companies/{company-id}/paymentTerms` |
| FinancialCompanyPicture | 5 | Beta.Financials | `/financials/companies/{company-id}/picture` |
| FinancialCompanyShipmentMethod | 5 | Beta.Financials | `/financials/companies/{company-id}/shipmentMethods` |
| FinancialCompanyTaxArea | 5 | Beta.Financials | `/financials/companies/{company-id}/taxAreas` |
| FinancialCompanyTaxGroup | 5 | Beta.Financials | `/financials/companies/{company-id}/taxGroups` |
| FinancialCompanyUnitOfMeasure | 5 | Beta.Financials | `/financials/companies/{company-id}/unitsOfMeasure` |
| FinancialCompanyVendor | 5 | Beta.Financials | `/financials/companies/{company-id}/vendors` |
| FinancialCompanyVendorPicture | 5 | Beta.Financials | `/financials/companies/{company-id}/vendors/{vendor-id}/picture` |
| GroupDrive | 5 | Beta.Files, Files | `/groups/{group-id}/drives` |
| GroupEvent | 5 | Beta.Calendar, Calendar | `/groups/{group-id}/events` |
| GroupSettingTemplateGroupSettingTemplate | 5 | Groups | `/groupSettingTemplates` |
| GroupSiteGetByPathTermStore | 5 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/getByPath(path='{path}')/termStore` |
| GroupSiteListItem | 5 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/items` |
| IdentityB2CUserFlowLanguage | 5 | Beta.Identity.SignIns | `/identity/b2cUserFlows/{b2cIdentityUserFlow-id}/languages` |
| IdentityB2CUserFlowLanguageDefaultPage | 5 | Beta.Identity.SignIns | `/identity/b2cUserFlows/{b2cIdentityUserFlow-id}/languages/{userFlowLanguageConfiguration-id}/defaultPages` |
| IdentityB2CUserFlowLanguageOverridePage | 5 | Beta.Identity.SignIns | `/identity/b2cUserFlows/{b2cIdentityUserFlow-id}/languages/{userFlowLanguageConfiguration-id}/overridesPages` |
| IdentityConditionalAccessAuthenticationStrengthAuthenticationMethodMode | 5 | Beta.Identity.SignIns | `/identity/conditionalAccess/authenticationStrengths/authenticationMethodModes` |
| IdentityGovernanceAccessReviewInstanceContactedReviewer | 5 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/contactedReviewers` |
| IdentityGovernanceAccessReviewInstanceDecision | 5 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/decisions` |
| IdentityGovernanceAccessReviewInstanceStage | 5 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/stages` |
| IdentityGovernanceCatalogAccessPackageCustomWorkflowExtension | 5 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageCustomWorkflowExtensions` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceScope | 5 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceScopes` |
| IdentityGovernanceCatalogAccessPackageResourceScope | 5 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceScopes` |
| IdentityGovernanceCatalogAccessPackageResourceUploadSession | 5 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/uploadSessions` |
| IdentityGovernanceCatalogCustomAccessPackageWorkflowExtension | 5 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/customAccessPackageWorkflowExtensions` |
| IdentityGovernancePermissionAnalyticAwFinding | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsAnalytics/aws/findings` |
| IdentityGovernancePermissionAnalyticAwPermissionCreepIndexDistribution | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsAnalytics/aws/permissionsCreepIndexDistributions` |
| IdentityGovernancePermissionAnalyticAzureFinding | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsAnalytics/azure/findings` |
| IdentityGovernancePermissionAnalyticAzurePermissionCreepIndexDistribution | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsAnalytics/azure/permissionsCreepIndexDistributions` |
| IdentityGovernancePermissionAnalyticGcpFinding | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsAnalytics/gcp/findings` |
| IdentityGovernancePermissionAnalyticGcpPermissionCreepIndexDistribution | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsAnalytics/gcp/permissionsCreepIndexDistributions` |
| IdentityGovernancePermissionManagementPermissionRequestChange | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsManagement/permissionsRequestChanges` |
| IdentityGovernancePermissionManagementScheduledPermissionApprovalStep | 5 | Beta.Identity.Governance | `/identityGovernance/permissionsManagement/scheduledPermissionsApprovals/{approval-id}/steps` |
| IdentityGovernanceRoleManagementAlert | 5 | Beta.Identity.Governance | `/identityGovernance/roleManagementAlerts/alerts` |
| IdentityGovernanceRoleManagementAlertConfiguration | 5 | Beta.Identity.Governance | `/identityGovernance/roleManagementAlerts/alertConfigurations` |
| IdentityGovernanceRoleManagementAlertDefinition | 5 | Beta.Identity.Governance | `/identityGovernance/roleManagementAlerts/alertDefinitions` |
| IdentityGovernanceRoleManagementAlertIncident | 5 | Beta.Identity.Governance | `/identityGovernance/roleManagementAlerts/alerts/{unifiedRoleManagementAlert-id}/alertIncidents` |
| IdentityGovernanceRoleManagementAlertOperation | 5 | Beta.Identity.Governance | `/identityGovernance/roleManagementAlerts/operations` |
| IdentityGovernanceTermsOfUseAgreement | 5 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/termsOfUse/agreements` |
| IdentityVerifiedIdProfile | 5 | Beta.Identity.SignIns | `/identity/verifiedId/profiles` |
| InformationProtectionDataLossPreventionPolicy | 5 | Beta.Identity.SignIns | `/informationProtection/dataLossPreventionPolicies` |
| InformationProtectionPolicyLabel | 5 | Beta.Identity.SignIns | `/informationProtection/policy/labels` |
| NetworkAccessLogConnection | 5 | Beta.NetworkAccess | `/networkAccess/logs/connections` |
| NetworkAccessLogRemoteNetwork | 5 | Beta.NetworkAccess | `/networkAccess/logs/remoteNetworks` |
| NetworkAccessLogTraffic | 5 | Beta.NetworkAccess | `/networkAccess/logs/traffic` |
| NetworkAccessTlExternalCertificateAuthorityCertificate | 5 | Beta.NetworkAccess | `/networkAccess/tls/externalCertificateAuthorityCertificates` |
| OnPremisePublishingProfile | 5 | Beta.Applications | `/onPremisesPublishingProfiles` |
| OnPremisePublishingProfileAgentGroupAgent | 5 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/agentGroups/{onPremisesAgentGroup-id}/agents` |
| OnPremisePublishingProfileAgentGroupPublishedResource | 5 | Beta.Applications | `/onPremisesPublishingProfiles/{onPremisesPublishingProfile-id}/agentGroups/{onPremisesAgentGroup-id}/publishedResources` |
| PlaceAsBuildingCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/building/checkIns` |
| PlaceAsDeskCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/desk/checkIns` |
| PlaceAsFloorCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/floor/checkIns` |
| PlaceAsRoomCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/room/checkIns` |
| PlaceAsRoomListCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/roomList/checkIns` |
| PlaceAsRoomListRoomCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/roomList/rooms/{room-id}/checkIns` |
| PlaceAsRoomListWorkspaceCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/roomList/workspaces/{workspace-id}/checkIns` |
| PlaceAsSectionCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/section/checkIns` |
| PlaceAsWorkspaceCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/workspace/checkIns` |
| PlaceCheck | 5 | Beta.Calendar, Calendar | `/places/{place-id}/checkIns` |
| PlannerRosterMember | 5 | Beta.Planner | `/planner/rosters/{plannerRoster-id}/members` |
| PolicyServicePrincipalCreationPolicyExclude | 5 | Beta.Identity.SignIns | `/policies/servicePrincipalCreationPolicies/{servicePrincipalCreationPolicy-id}/excludes` |
| PolicyServicePrincipalCreationPolicyInclude | 5 | Beta.Identity.SignIns | `/policies/servicePrincipalCreationPolicies/{servicePrincipalCreationPolicy-id}/includes` |
| PrivilegedAccess | 5 | Beta.Identity.Governance | `/privilegedAccess` |
| PrivilegedAccessResource | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/resources` |
| PrivilegedAccessResourceRoleAssignment | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/resources/{governanceResource-id}/roleAssignments` |
| PrivilegedAccessResourceRoleAssignmentRequest | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/resources/{governanceResource-id}/roleAssignmentRequests` |
| PrivilegedAccessResourceRoleDefinition | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/resources/{governanceResource-id}/roleDefinitions` |
| PrivilegedAccessResourceRoleSetting | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/resources/{governanceResource-id}/roleSettings` |
| PrivilegedAccessRoleAssignment | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/roleAssignments` |
| PrivilegedAccessRoleAssignmentRequest | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/roleAssignmentRequests` |
| PrivilegedAccessRoleDefinition | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/roleDefinitions` |
| PrivilegedAccessRoleSetting | 5 | Beta.Identity.Governance | `/privilegedAccess/{privilegedAccess-id}/roleSettings` |
| PrivilegedOperationEvent | 5 | Beta.Identity.Governance | `/privilegedOperationEvents` |
| PrivilegedRole | 5 | Beta.Identity.Governance | `/privilegedRoles` |
| PrivilegedRoleAssignmentRequest | 5 | Beta.Identity.Governance | `/privilegedRoleAssignmentRequests` |
| Program | 5 | Beta.Identity.Governance | `/programs` |
| ProgramControl | 5 | Beta.Identity.Governance | `/programControls` |
| ProgramControlType | 5 | Beta.Identity.Governance | `/programControlTypes` |
| ReportHealthMonitoringAlert | 5 | Beta.Reports | `/reports/healthMonitoring/alerts` |
| ReportHealthMonitoringAlertConfiguration | 5 | Beta.Reports | `/reports/healthMonitoring/alertConfigurations` |
| ReportUserInsightDailyMfaTelecomFraud | 5 | Beta.Reports | `/reports/userInsights/daily/mfaTelecomFraud` |
| ReportUserInsightMonthlyMfaRegisteredUser | 5 | Beta.Reports | `/reports/userInsights/monthly/mfaRegisteredUsers` |
| RiskyAgent | 5 | Beta.Identity.SignIns | `/identityProtection/riskyAgents` |
| RoleManagementCloudPcResourceNamespaceResourceAction | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/cloudPC/resourceNamespaces/{unifiedRbacResourceNamespace-id}/resourceActions` |
| RoleManagementDeviceManagementResourceNamespace | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/deviceManagement/resourceNamespaces` |
| RoleManagementDeviceManagementResourceNamespaceResourceAction | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/deviceManagement/resourceNamespaces/{unifiedRbacResourceNamespace-id}/resourceActions` |
| RoleManagementDeviceManagementRoleAssignmentAppScope | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/deviceManagement/roleAssignments/{unifiedRoleAssignmentMultiple-id}/appScopes` |
| RoleManagementEnterpriseApp | 5 | Beta.Identity.Governance | `/roleManagement/enterpriseApps` |
| RoleManagementEnterpriseAppResourceNamespace | 5 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/resourceNamespaces` |
| RoleManagementEnterpriseAppResourceNamespaceResourceAction | 5 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/resourceNamespaces/{unifiedRbacResourceNamespace-id}/resourceActions` |
| RoleManagementEnterpriseAppRoleAssignmentApprovalStep | 5 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleAssignmentApprovals/{approval-id}/steps` |
| RoleManagementExchangeCustomAppScope | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/customAppScopes` |
| RoleManagementExchangeResourceNamespace | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/resourceNamespaces` |
| RoleManagementExchangeResourceNamespaceResourceAction | 5 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/resourceNamespaces/{unifiedRbacResourceNamespace-id}/resourceActions` |
| SecurityAction | 5 | Beta.Security | `/security/securityActions` |
| SecurityAttackSimulationTrainingCampaign | 5 | Beta.Security | `/security/attackSimulation/trainingCampaigns` |
| SecurityAuditLogQuery | 5 | Beta.Security | `/security/auditLog/queries` |
| SecurityAuditLogQueryRecord | 5 | Beta.Security | `/security/auditLog/queries/{auditLogQuery-id}/records` |
| SecurityCaseEdiscoveryCaseLegalHold | 5 | Beta.Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/legalHolds` |
| SecurityCloudAppSecurityProfile | 5 | Beta.Security | `/security/cloudAppSecurityProfiles` |
| SecurityCollaborationAnalyzedEmail | 5 | Beta.Security | `/security/collaboration/analyzedEmails` |
| SecurityDataDiscoveryCloudAppDiscoveryUploadedStream | 5 | Beta.Security | `/security/dataDiscovery/cloudAppDiscovery/uploadedStreams` |
| SecurityDataSecurityAndGovernancePolicyFile | 5 | Beta.Security | `/security/dataSecurityAndGovernance/policyFiles` |
| SecurityDomainSecurityProfile | 5 | Beta.Security | `/security/domainSecurityProfiles` |
| SecurityFileSecurityProfile | 5 | Beta.Security | `/security/fileSecurityProfiles` |
| SecurityHostSecurityProfile | 5 | Beta.Security | `/security/hostSecurityProfiles` |
| SecurityIncidentTask | 5 | Beta.Security | `/security/incidentTasks` |
| SecurityInformationProtectionSensitivityLabel | 5 | Beta.Security | `/security/informationProtection/sensitivityLabels` |
| SecurityIPSecurityProfile | 5 | Beta.Security | `/security/ipSecurityProfiles` |
| SecurityPartnerSecurityAlert | 5 | Beta.Security | `/security/partner/securityAlerts` |
| SecurityPartnerSecurityScoreHistory | 5 | Beta.Security | `/security/partner/securityScore/history` |
| SecurityPartnerSecurityScoreRequirement | 5 | Beta.Security | `/security/partner/securityScore/requirements` |
| SecurityProviderTenantSetting | 5 | Beta.Security | `/security/providerTenantSettings` |
| SecurityRuleDetectionRule | 5 | Beta.Security | `/security/rules/detectionRules` |
| SecurityThreatSubmissionEmailThreat | 5 | Beta.Security | `/security/threatSubmission/emailThreats` |
| SecurityThreatSubmissionEmailThreatSubmissionPolicy | 5 | Beta.Security | `/security/threatSubmission/emailThreatSubmissionPolicies` |
| SecurityThreatSubmissionFileThreat | 5 | Beta.Security | `/security/threatSubmission/fileThreats` |
| SecurityThreatSubmissionUrlThreat | 5 | Beta.Security | `/security/threatSubmission/urlThreats` |
| SecurityTiIndicator | 5 | Beta.Security | `/security/tiIndicators` |
| SecurityUserSecurityProfile | 5 | Beta.Security | `/security/userSecurityProfiles` |
| ShareListItem | 5 | Beta.Files, Files | `/shares/{sharedDriveItem-id}/listItem` |
| ShareListItemPermission | 5 | Beta.Files | `/shares/{sharedDriveItem-id}/list/items/{listItem-id}/permissions` |
| ShareListPermission | 5 | Beta.Files | `/shares/{sharedDriveItem-id}/list/permissions` |
| ShareSharedDriveItemSharedDriveItem | 5 | Beta.Files, Files | `/shares` |
| SiteListItemPermission | 5 | Beta.Sites | `/sites/{site-id}/lists/{list-id}/items/{listItem-id}/permissions` |
| SiteListPermission | 5 | Beta.Sites | `/sites/{site-id}/lists/{list-id}/permissions` |
| SolutionBackupRestoreBrowseSession | 5 | Beta.BackupRestore | `/solutions/backupRestore/browseSessions` |
| SolutionBackupRestoreOneDriveForBusinessBrowseSession | 5 | Beta.BackupRestore | `/solutions/backupRestore/oneDriveForBusinessBrowseSessions` |
| SolutionBackupRestoreOneDriveForBusinessRestoreSessionGranularDriveRestoreArtifact | 5 | Beta.BackupRestore | `/solutions/backupRestore/oneDriveForBusinessRestoreSessions/{oneDriveForBusinessRestoreSession-id}/granularDriveRestoreArtifacts` |
| SolutionBackupRestoreSharePointBrowseSession | 5 | Beta.BackupRestore | `/solutions/backupRestore/sharePointBrowseSessions` |
| SolutionBackupRestoreSharePointRestoreSessionGranularSiteRestoreArtifact | 5 | Beta.BackupRestore | `/solutions/backupRestore/sharePointRestoreSessions/{sharePointRestoreSession-id}/granularSiteRestoreArtifacts` |
| SolutionBusinessScenario | 5 | Beta.BusinessScenario | `/solutions/businessScenarios` |
| SolutionBusinessScenarioPlannerTask | 5 | Beta.BusinessScenario | `/solutions/businessScenarios/{businessScenario-id}/planner/tasks` |
| Subscription | 5 | Beta.ChangeNotifications, ChangeNotifications | `/subscriptions` |
| TenantRelationshipManagedTenant | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/tenants` |
| TenantRelationshipManagedTenantAggregatedPolicyCompliance | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/aggregatedPolicyCompliances` |
| TenantRelationshipManagedTenantAlert | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantAlerts` |
| TenantRelationshipManagedTenantAlertLog | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantAlertLogs` |
| TenantRelationshipManagedTenantAlertRule | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantAlertRules` |
| TenantRelationshipManagedTenantAlertRuleDefinition | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantAlertRuleDefinitions` |
| TenantRelationshipManagedTenantApiNotification | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantApiNotifications` |
| TenantRelationshipManagedTenantAppPerformance | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/appPerformances` |
| TenantRelationshipManagedTenantAuditEvent | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/auditEvents` |
| TenantRelationshipManagedTenantCloudPcConnection | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/cloudPcConnections` |
| TenantRelationshipManagedTenantCloudPcDevice | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/cloudPcDevices` |
| TenantRelationshipManagedTenantCloudPcOverview | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/cloudPcsOverview` |
| TenantRelationshipManagedTenantConditionalAccessPolicyCoverage | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/conditionalAccessPolicyCoverages` |
| TenantRelationshipManagedTenantCredentialUserRegistrationSummary | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/credentialUserRegistrationsSummaries` |
| TenantRelationshipManagedTenantCustomizedInformation | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/tenantsCustomizedInformation` |
| TenantRelationshipManagedTenantDetailedInformation | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/tenantsDetailedInformation` |
| TenantRelationshipManagedTenantDeviceAppPerformance | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/deviceAppPerformances` |
| TenantRelationshipManagedTenantDeviceCompliancePolicySettingStateSummary | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/deviceCompliancePolicySettingStateSummaries` |
| TenantRelationshipManagedTenantDeviceHealthStatus | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/deviceHealthStatuses` |
| TenantRelationshipManagedTenantEmailNotification | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantEmailNotifications` |
| TenantRelationshipManagedTenantGroup | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/tenantGroups` |
| TenantRelationshipManagedTenantManagedDeviceCompliance | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedDeviceCompliances` |
| TenantRelationshipManagedTenantManagedDeviceComplianceTrend | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedDeviceComplianceTrends` |
| TenantRelationshipManagedTenantManagementAction | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementActions` |
| TenantRelationshipManagedTenantManagementActionTenantDeploymentStatus | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementActionTenantDeploymentStatuses` |
| TenantRelationshipManagedTenantManagementIntent | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementIntents` |
| TenantRelationshipManagedTenantManagementTemplate | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplates` |
| TenantRelationshipManagedTenantManagementTemplateCollection | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplateCollections` |
| TenantRelationshipManagedTenantManagementTemplateCollectionTenantSummary | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplateCollectionTenantSummaries` |
| TenantRelationshipManagedTenantManagementTemplateStep | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplateSteps` |
| TenantRelationshipManagedTenantManagementTemplateStepTenantSummary | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplateStepTenantSummaries` |
| TenantRelationshipManagedTenantManagementTemplateStepVersion | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplateStepVersions` |
| TenantRelationshipManagedTenantManagementTemplateStepVersionDeployment | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managementTemplateStepVersions/{managementTemplateStepVersion-id}/deployments` |
| TenantRelationshipManagedTenantMyRole | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/myRoles` |
| TenantRelationshipManagedTenantTag | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/tenantTags` |
| TenantRelationshipManagedTenantTicketingEndpoint | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/managedTenantTicketingEndpoints` |
| TenantRelationshipManagedTenantWindowsDeviceMalwareState | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/windowsDeviceMalwareStates` |
| TenantRelationshipManagedTenantWindowsProtectionState | 5 | Beta.ManagedTenants | `/tenantRelationships/managedTenants/windowsProtectionStates` |
| TrustFrameworkKeySet | 5 | Beta.Identity.SignIns | `/trustFramework/keySets` |
| TrustFrameworkPolicy | 5 | Beta.Identity.SignIns | `/trustFramework/policies` |
| UserCalendarGroup | 5 | Beta.Calendar, Calendar | `/users/{user-id}/calendarGroups` |
| UserContact | 5 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contacts` |
| UserContactFolder | 5 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contactFolders` |
| UserDrive | 5 | Beta.Files, Files | `/users/{user-id}/drives` |
| UserEvent | 5 | Beta.Calendar, Calendar | `/users/{user-id}/events` |
| UserMailFolder | 5 | Beta.Mail, Mail | `/users/{user-id}/mailFolders` |
| UserManagedDeviceLogCollectionResponse | 5 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/logCollectionRequests` |
| UserMessage | 5 | Beta.Mail, Mail | `/users/{user-id}/messages` |
| UserOnlineMeeting | 5 | Beta.CloudCommunications, CloudCommunications | `/users/{user-id}/onlineMeetings` |
| WindowsUpdatesDeployment | 5 | Beta.WindowsUpdates | `/admin/windows/updates/deployments` |
| WindowsUpdatesPolicy | 5 | Beta.WindowsUpdates | `/admin/windows/updates/updatePolicies` |
| WindowsUpdatesProduct | 5 | Beta.WindowsUpdates | `/admin/windows/updates/products` |
| WindowsUpdatesResourceConnection | 5 | Beta.WindowsUpdates | `/admin/windows/updates/resourceConnections` |
| WindowsUpdatesUpdatableAsset | 5 | Beta.WindowsUpdates | `/admin/windows/updates/updatableAssets` |
| CrossTenantMigrationJob | 0 | Beta.Migrations | `/solutions/migrations/crossTenantMigrationJobs` |
| DeviceAppManagementEnterpriseCodeSigningCertificate | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/enterpriseCodeSigningCertificates` |
| DeviceAppManagementiOSLobAppProvisioningConfiguration | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/iosLobAppProvisioningConfigurations` |
| DeviceAppManagementManagedEBookCategory | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/managedEBookCategories` |
| DeviceAppManagementMobileAppCatalogPackage | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileAppCatalogPackages` |
| DeviceAppManagementPolicySetAssignment | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/policySets/{policySet-id}/assignments` |
| DeviceAppManagementPolicySetItem | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/policySets/{policySet-id}/items` |
| DeviceAppManagementTask | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/deviceAppManagementTasks` |
| DeviceAppManagementWdacSupplementalPolicy | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/wdacSupplementalPolicies` |
| DeviceAppManagementWindowsInformationProtectionDeviceRegistration | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/windowsInformationProtectionDeviceRegistrations` |
| DeviceAppManagementWindowsInformationProtectionWipeAction | 0 | Beta.Devices.CorporateManagement | `/deviceAppManagement/windowsInformationProtectionWipeActions` |
| DeviceManagementAndroidForWorkAppConfigurationSchema | 0 | Beta.DeviceManagement | `/deviceManagement/androidForWorkAppConfigurationSchemas` |
| DeviceManagementAndroidForWorkEnrollmentProfile | 0 | Beta.DeviceManagement.Enrollment | `/deviceManagement/androidForWorkEnrollmentProfiles` |
| DeviceManagementAndroidManagedStoreAppConfigurationSchema | 0 | Beta.DeviceManagement | `/deviceManagement/androidManagedStoreAppConfigurationSchemas` |
| DeviceManagementAppleUserInitiatedEnrollmentProfile | 0 | Beta.DeviceManagement.Enrollment | `/deviceManagement/appleUserInitiatedEnrollmentProfiles` |
| DeviceManagementAutopilotEvent | 0 | Beta.DeviceManagement.Enrollment | `/deviceManagement/autopilotEvents` |
| DeviceManagementCartToClassAssociation | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/cartToClassAssociations` |
| DeviceManagementCategory | 0 | Beta.DeviceManagement | `/deviceManagement/categories` |
| DeviceManagementComanagementEligibleDevice | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/comanagementEligibleDevices` |
| DeviceManagementComplianceSetting | 0 | Beta.DeviceManagement | `/deviceManagement/complianceSettings` |
| DeviceManagementConfigurationPolicyTemplate | 0 | Beta.DeviceManagement | `/deviceManagement/configurationPolicyTemplates` |
| DeviceManagementConfigurationSetting | 0 | Beta.DeviceManagement | `/deviceManagement/configurationSettings` |
| DeviceManagementDepOnboardingSetting | 0 | Beta.DeviceManagement.Enrollment | `/deviceManagement/depOnboardingSettings` |
| DeviceManagementDeviceConfigurationGroupAssignment | 0 | Beta.DeviceManagement | `/deviceManagement/deviceConfigurations/{deviceConfiguration-id}/groupAssignments` |
| DeviceManagementDeviceConfigurationRestrictedAppViolation | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/deviceConfigurationRestrictedAppsViolations` |
| DeviceManagementDeviceHealthScriptDeviceRunState | 0 | Beta.DeviceManagement | `/deviceManagement/deviceHealthScripts/{deviceHealthScript-id}/deviceRunStates` |
| DeviceManagementDeviceShellScriptDeviceRunState | 0 | Beta.DeviceManagement | `/deviceManagement/deviceShellScripts/{deviceShellScript-id}/deviceRunStates` |
| DeviceManagementDeviceShellScriptGroupAssignment | 0 | Beta.DeviceManagement | `/deviceManagement/deviceShellScripts/{deviceShellScript-id}/groupAssignments` |
| DeviceManagementDeviceShellScriptUserRunState | 0 | Beta.DeviceManagement | `/deviceManagement/deviceShellScripts/{deviceShellScript-id}/userRunStates` |
| DeviceManagementDomainJoinConnector | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/domainJoinConnectors` |
| DeviceManagementEmbeddedSimActivationCodePool | 0 | Beta.DeviceManagement | `/deviceManagement/embeddedSIMActivationCodePools` |
| DeviceManagementExchangeOnPremisePolicy | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/exchangeOnPremisesPolicies` |
| DeviceManagementGroupPolicyCategory | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyCategories` |
| DeviceManagementGroupPolicyDefinitionFile | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitionFiles` |
| DeviceManagementGroupPolicyObjectFile | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyObjectFiles` |
| DeviceManagementIntent | 0 | Beta.DeviceManagement | `/deviceManagement/intents` |
| DeviceManagementMacOSSoftwareUpdateAccountSummary | 0 | Beta.DeviceManagement | `/deviceManagement/macOSSoftwareUpdateAccountSummaries` |
| DeviceManagementManagedDeviceEncryptionState | 0 | Beta.DeviceManagement | `/deviceManagement/managedDeviceEncryptionStates` |
| DeviceManagementManagedDeviceWindowsOSImage | 0 | Beta.DeviceManagement | `/deviceManagement/managedDeviceWindowsOSImages` |
| DeviceManagementMicrosoftTunnelConfiguration | 0 | Beta.DeviceManagement | `/deviceManagement/microsoftTunnelConfigurations` |
| DeviceManagementMicrosoftTunnelHealthThreshold | 0 | Beta.DeviceManagement | `/deviceManagement/microsoftTunnelHealthThresholds` |
| DeviceManagementMicrosoftTunnelServerLogCollectionResponse | 0 | Beta.DeviceManagement | `/deviceManagement/microsoftTunnelServerLogCollectionResponses` |
| DeviceManagementMicrosoftTunnelSite | 0 | Beta.DeviceManagement | `/deviceManagement/microsoftTunnelSites` |
| DeviceManagementMonitoringAlertRecord | 0 | Beta.DeviceManagement | `/deviceManagement/monitoring/alertRecords` |
| DeviceManagementNdeConnector | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/ndesConnectors` |
| DeviceManagementRemoteActionAudit | 0 | Beta.DeviceManagement | `/deviceManagement/remoteActionAudits` |
| DeviceManagementResourceAccessProfile | 0 | Beta.DeviceManagement | `/deviceManagement/resourceAccessProfiles` |
| DeviceManagementReusableSetting | 0 | Beta.DeviceManagement | `/deviceManagement/reusableSettings` |
| DeviceManagementScriptDeviceRunState | 0 | Beta.DeviceManagement | `/deviceManagement/deviceManagementScripts/{deviceManagementScript-id}/deviceRunStates` |
| DeviceManagementScriptGroupAssignment | 0 | Beta.DeviceManagement | `/deviceManagement/deviceManagementScripts/{deviceManagementScript-id}/groupAssignments` |
| DeviceManagementScriptUserRunState | 0 | Beta.DeviceManagement | `/deviceManagement/deviceManagementScripts/{deviceManagementScript-id}/userRunStates` |
| DeviceManagementSettingDefinition | 0 | Beta.DeviceManagement | `/deviceManagement/settingDefinitions` |
| DeviceManagementTelecomExpenseManagementPartner | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/telecomExpenseManagementPartners` |
| DeviceManagementTemplate | 0 | Beta.DeviceManagement | `/deviceManagement/templates` |
| DeviceManagementTermAndConditionGroupAssignment | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/termsAndConditions/{termsAndConditions-id}/groupAssignments` |
| DeviceManagementUserPfxCertificate | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/userPfxCertificates` |
| DeviceManagementVirtualEndpointBulkAction | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/bulkActions` |
| DeviceManagementVirtualEndpointExternalPartnerSetting | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/externalPartnerSettings` |
| DeviceManagementVirtualEndpointFrontLineServicePlan | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/frontLineServicePlans` |
| DeviceManagementVirtualEndpointServicePlan | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/servicePlans` |
| DeviceManagementVirtualEndpointSnapshot | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/snapshots` |
| DeviceManagementVirtualEndpointSupportedRegion | 0 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/supportedRegions` |
| DeviceManagementWindowsAutopilotDeploymentProfileAssignedDevice | 0 | Beta.DeviceManagement.Enrollment | `/deviceManagement/windowsAutopilotDeploymentProfiles/{windowsAutopilotDeploymentProfile-id}/assignedDevices` |
| DomainSharedEmailDomainInvitation | 0 | Beta.Identity.DirectoryManagement | `/domains/{domain-id}/sharedEmailDomainInvitations` |
| EntitlementManagementAccessPackageAssignmentRequest | 0 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageAssignmentRequests` |
| EntitlementManagementAccessPackageSuggestion | 0 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageSuggestions` |
| GroupAppRoleAssignment | 0 | Applications, Beta.Applications | `/groups/{group-id}/appRoleAssignments` |
| GroupEndpoint | 0 | Beta.Groups | `/groups/{group-id}/endpoints` |
| GroupSetting | 0 | Beta.Groups, Groups | `/groups/{group-id}/settings` |
| IdentityGovernanceAccessReviewHistoryDefinitionInstance | 0 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/historyDefinitions/{accessReviewHistoryDefinition-id}/instances` |
| PolicyRoleManagementPolicyEffectiveRule | 0 | Beta.Identity.SignIns, Identity.SignIns | `/policies/roleManagementPolicies/{unifiedRoleManagementPolicy-id}/effectiveRules` |
| RoleManagementEntitlementManagementRoleAssignmentScheduleRequest | 0 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleAssignmentScheduleRequests` |
| ServicePrincipalAppRoleAssignment | 0 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/appRoleAssignments` |
| ServicePrincipalLicenseDetail | 0 | Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/licenseDetails` |
| SiteAnalyticItemActivityStatActivity | 0 | Beta.Sites, Sites | `/sites/{site-id}/analytics/itemActivityStats/{itemActivityStat-id}/activities` |
| UserAppRoleAssignment | 0 | Applications, Beta.Applications | `/users/{user-id}/appRoleAssignments` |
| UserAuthenticationExternalAuthenticationMethod | 0 | Beta.Identity.SignIns | `/users/{user-id}/authentication/externalAuthenticationMethods` |
| UserMobileAppIntentAndState | 0 | Beta.Devices.CorporateManagement | `/users/{user-id}/mobileAppIntentAndStates` |
| UserMobileAppTroubleshootingEvent | 0 | Beta.Devices.CorporateManagement | `/users/{user-id}/mobileAppTroubleshootingEvents` |
| UserNotification | 0 | Beta.Users | `/users/{user-id}/notifications` |
| UserScopedRoleMemberOf | 0 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/users/{user-id}/scopedRoleMemberOf` |
| DeviceManagementDeviceConfigurationManagedDeviceCertificateState | -5 | Beta.DeviceManagement.Administration | `/deviceManagement/deviceConfigurationsAllManagedDeviceCertificateStates` |
| DirectoryFeatureRolloutPolicy | -5 | Beta.Identity.DirectoryManagement | `/directory/featureRolloutPolicies` |
| EntitlementManagementAccessPackageCatalogAccessPackageCustomWorkflowExtension | -5 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageCatalogs/{accessPackageCatalog-id}/accessPackageCustomWorkflowExtensions` |
| EntitlementManagementAccessPackageCatalogCustomAccessPackageWorkflowExtension | -5 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageCatalogs/{accessPackageCatalog-id}/customAccessPackageWorkflowExtensions` |
| IdentityGovernanceAccessReviewDefinitionInstance | -5 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances` |
| IdentityGovernancePrivilegedAccessGroupEligibilityScheduleInstance | -5 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/privilegedAccess/group/eligibilityScheduleInstances` |
| RoleManagementDirectoryRoleAssignmentScheduleInstance | -5 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/directory/roleAssignmentScheduleInstances` |
| RoleManagementDirectoryRoleEligibilityScheduleInstance | -5 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/directory/roleEligibilityScheduleInstances` |
| RoleManagementDirectoryTransitiveRoleAssignment | -5 | Beta.Identity.Governance | `/roleManagement/directory/transitiveRoleAssignments` |
| RoleManagementEntitlementManagementRoleAssignmentScheduleInstance | -5 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleAssignmentScheduleInstances` |
| RoleManagementEntitlementManagementTransitiveRoleAssignment | -5 | Beta.Identity.Governance | `/roleManagement/entitlementManagement/transitiveRoleAssignments` |
| ServicePrincipalPasswordSingleSignOnCredential | -5 | Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/getPasswordSingleSignOnCredentials` |
| ApplicationSynchronizationJobSchemaDirectory | -10 | Applications, Beta.Applications | `/applications/{application-id}/synchronization/jobs/{synchronizationJob-id}/schema/directories` |
| ApplicationSynchronizationTemplateSchemaDirectory | -10 | Applications, Beta.Applications | `/applications/{application-id}/synchronization/templates/{synchronizationTemplate-id}/schema/directories` |
| DeviceAppManagementMobileAppAsAndroidLobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidLobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsAndroidLobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidLobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsiOSLobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosLobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsiOSLobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosLobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsMacOSDmgAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSDmgApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsMacOSDmgAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSDmgApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsMacOSLobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSLobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsMacOSLobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSLobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsManagedAndroidLobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedAndroidLobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsManagedAndroidLobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedAndroidLobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsManagediOSLobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedIOSLobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsManagediOSLobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedIOSLobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsManagedMobileLobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedMobileLobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsManagedMobileLobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedMobileLobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsWin32LobAppContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/win32LobApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsWin32LobAppContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/win32LobApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsWindowsAppXContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsAppX/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsWindowsAppXContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsAppX/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsWindowsMobileMsiContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsMobileMSI/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsWindowsMobileMsiContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsMobileMSI/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXContentVersionContainedApp | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXContentVersionFile | -10 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/contentVersions/{mobileAppContent-id}/files` |
| EducationClassAssignmentResourceDependentResource | -10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/resources/{educationAssignmentResource-id}/dependentResources` |
| EducationClassAssignmentSubmissionOutcome | -10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/outcomes` |
| EducationClassAssignmentSubmissionResource | -10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/resources` |
| EducationClassAssignmentSubmissionResourceDependentResource | -10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/resources/{educationSubmissionResource-id}/dependentResources` |
| EducationClassAssignmentSubmissionSubmittedResource | -10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/submittedResources` |
| EducationClassAssignmentSubmissionSubmittedResourceDependentResource | -10 | Beta.Education, Education | `/education/classes/{educationClass-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/submittedResources/{educationSubmissionResource-id}/dependentResources` |
| EducationMeAssignmentResourceDependentResource | -10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/resources/{educationAssignmentResource-id}/dependentResources` |
| EducationMeAssignmentSubmissionOutcome | -10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/outcomes` |
| EducationMeAssignmentSubmissionResource | -10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/resources` |
| EducationMeAssignmentSubmissionResourceDependentResource | -10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/resources/{educationSubmissionResource-id}/dependentResources` |
| EducationMeAssignmentSubmissionSubmittedResource | -10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/submittedResources` |
| EducationMeAssignmentSubmissionSubmittedResourceDependentResource | -10 | Beta.Education, Education | `/education/me/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/submittedResources/{educationSubmissionResource-id}/dependentResources` |
| EducationUserAssignmentResourceDependentResource | -10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/resources/{educationAssignmentResource-id}/dependentResources` |
| EducationUserAssignmentSubmissionOutcome | -10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/outcomes` |
| EducationUserAssignmentSubmissionResource | -10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/resources` |
| EducationUserAssignmentSubmissionResourceDependentResource | -10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/resources/{educationSubmissionResource-id}/dependentResources` |
| EducationUserAssignmentSubmissionSubmittedResource | -10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/submittedResources` |
| EducationUserAssignmentSubmissionSubmittedResourceDependentResource | -10 | Beta.Education, Education | `/education/users/{educationUser-id}/assignments/{educationAssignment-id}/submissions/{educationSubmission-id}/submittedResources/{educationSubmissionResource-id}/dependentResources` |
| GroupCalendarPermission | -10 | Beta.Calendar, Calendar | `/groups/{group-id}/calendar/calendarPermissions` |
| GroupConversationThreadPostExtension | -10 | Beta.Groups, Groups | `/groups/{group-id}/conversations/{conversation-id}/threads/{conversationThread-id}/posts/{post-id}/extensions` |
| GroupConversationThreadPostInReplyToExtension | -10 | Beta.Groups, Groups | `/groups/{group-id}/conversations/{conversation-id}/threads/{conversationThread-id}/posts/{post-id}/inReplyTo/extensions` |
| GroupDriveItem | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items` |
| GroupDriveItemPermission | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/permissions` |
| GroupDriveItemSubscription | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/subscriptions` |
| GroupDriveItemThumbnail | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/thumbnails` |
| GroupDriveItemVersion | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/versions` |
| GroupDriveListColumn | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/columns` |
| GroupDriveListContentType | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/contentTypes` |
| GroupDriveListOperation | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/operations` |
| GroupDriveListSubscription | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/subscriptions` |
| GroupDriveRootPermission | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/permissions` |
| GroupDriveRootSubscription | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/subscriptions` |
| GroupDriveRootThumbnail | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/thumbnails` |
| GroupDriveRootVersion | -10 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/versions` |
| GroupEventExtension | -10 | Beta.Calendar, Calendar | `/groups/{group-id}/events/{event-id}/extensions` |
| GroupOnenoteNotebook | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/notebooks` |
| GroupOnenoteNotebookSection | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/notebooks/{notebook-id}/sections` |
| GroupOnenoteNotebookSectionGroup | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/notebooks/{notebook-id}/sectionGroups` |
| GroupOnenoteOperation | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/operations` |
| GroupOnenoteResource | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/resources` |
| GroupOnenoteSection | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/sections` |
| GroupOnenoteSectionGroup | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/sectionGroups` |
| GroupOnenoteSectionGroupSection | -10 | Beta.Notes, Notes | `/groups/{group-id}/onenote/sectionGroups/{sectionGroup-id}/sections` |
| GroupSiteListContentTypeColumn | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/contentTypes/{contentType-id}/columns` |
| GroupSiteListContentTypeColumnLink | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/contentTypes/{contentType-id}/columnLinks` |
| GroupSiteListItemDocumentSetVersion | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/items/{listItem-id}/documentSetVersions` |
| GroupSiteListItemVersion | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/items/{listItem-id}/versions` |
| GroupSiteOnenoteNotebookSection | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/notebooks/{notebook-id}/sections` |
| GroupSiteOnenoteNotebookSectionGroup | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/notebooks/{notebook-id}/sectionGroups` |
| GroupSiteOnenoteNotebookSectionGroupSection | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/notebooks/{notebook-id}/sectionGroups/{sectionGroup-id}/sections` |
| GroupSiteOnenoteNotebookSectionGroupSectionPage | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/notebooks/{notebook-id}/sectionGroups/{sectionGroup-id}/sections/{onenoteSection-id}/pages` |
| GroupSiteOnenoteNotebookSectionPage | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/notebooks/{notebook-id}/sections/{onenoteSection-id}/pages` |
| GroupSiteOnenoteSectionGroupSection | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/sectionGroups/{sectionGroup-id}/sections` |
| GroupSiteOnenoteSectionGroupSectionPage | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/sectionGroups/{sectionGroup-id}/sections/{onenoteSection-id}/pages` |
| GroupSiteOnenoteSectionPage | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/onenote/sections/{onenoteSection-id}/pages` |
| GroupSitePageAsSitePageCanvaLayoutHorizontalSection | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/horizontalSections` |
| GroupSitePageAsSitePageCanvaLayoutHorizontalSectionColumn | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/horizontalSections/{horizontalSection-id}/columns` |
| GroupSitePageAsSitePageCanvaLayoutHorizontalSectionColumnWebpart | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/horizontalSections/{horizontalSection-id}/columns/{horizontalSectionColumn-id}/webparts` |
| GroupSitePageAsSitePageCanvaLayoutVerticalSectionWebpart | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/pages/{baseSitePage-id}/sitePage/canvasLayout/verticalSection/webparts` |
| GroupSitePageAsSitePageWebPart | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/pages/{baseSitePage-id}/sitePage/webParts` |
| GroupSiteTermStoreGroupSet | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets` |
| GroupSiteTermStoreGroupSetChild | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/children` |
| GroupSiteTermStoreGroupSetChildRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/children/{term-id}/children/{term-id1}/relations` |
| GroupSiteTermStoreGroupSetRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/relations` |
| GroupSiteTermStoreGroupSetTerm | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/terms` |
| GroupSiteTermStoreGroupSetTermChild | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/terms/{term-id}/children` |
| GroupSiteTermStoreGroupSetTermChildRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/terms/{term-id}/children/{term-id1}/relations` |
| GroupSiteTermStoreGroupSetTermRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/groups/{group-id1}/sets/{set-id}/terms/{term-id}/relations` |
| GroupSiteTermStoreSetChild | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/children` |
| GroupSiteTermStoreSetChildRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/children/{term-id}/children/{term-id1}/relations` |
| GroupSiteTermStoreSetParentGroupSet | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets` |
| GroupSiteTermStoreSetParentGroupSetChild | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/children` |
| GroupSiteTermStoreSetParentGroupSetChildRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/children/{term-id}/children/{term-id1}/relations` |
| GroupSiteTermStoreSetParentGroupSetRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/relations` |
| GroupSiteTermStoreSetParentGroupSetTerm | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms` |
| GroupSiteTermStoreSetParentGroupSetTermChild | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms/{term-id}/children` |
| GroupSiteTermStoreSetParentGroupSetTermChildRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms/{term-id}/children/{term-id1}/relations` |
| GroupSiteTermStoreSetParentGroupSetTermRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/parentGroup/sets/{set-id1}/terms/{term-id}/relations` |
| GroupSiteTermStoreSetRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/relations` |
| GroupSiteTermStoreSetTerm | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/terms` |
| GroupSiteTermStoreSetTermChild | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/terms/{term-id}/children` |
| GroupSiteTermStoreSetTermChildRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/terms/{term-id}/children/{term-id1}/relations` |
| GroupSiteTermStoreSetTermRelation | -10 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/termStore/sets/{set-id}/terms/{term-id}/relations` |
| GroupTeamChannelMessageHostedContent | -10 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/messages/{chatMessage-id}/hostedContents` |
| GroupTeamChannelMessageReply | -10 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/messages/{chatMessage-id}/replies` |
| GroupTeamChannelMessageReplyHostedContent | -10 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/messages/{chatMessage-id}/replies/{chatMessage-id1}/hostedContents` |
| GroupTeamPrimaryChannelMessageHostedContent | -10 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/messages/{chatMessage-id}/hostedContents` |
| GroupTeamPrimaryChannelMessageReply | -10 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/messages/{chatMessage-id}/replies` |
| GroupTeamPrimaryChannelMessageReplyHostedContent | -10 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/messages/{chatMessage-id}/replies/{chatMessage-id1}/hostedContents` |
| GroupThreadPostInReplyToExtension | -10 | Beta.Groups, Groups | `/groups/{group-id}/threads/{conversationThread-id}/posts/{post-id}/inReplyTo/extensions` |
| IdentityGovernanceAccessReviewDefinitionInstanceContactedReviewer | -10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances/{accessReviewInstance-id}/contactedReviewers` |
| IdentityGovernanceAccessReviewDefinitionInstanceDecision | -10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances/{accessReviewInstance-id}/decisions` |
| IdentityGovernanceAccessReviewDefinitionInstanceStage | -10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances/{accessReviewInstance-id}/stages` |
| IdentityGovernanceAccessReviewDefinitionInstanceStageDecision | -10 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions` |
| IdentityGovernanceAccessReviewInstance | -10 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances` |
| PlaceAsBuildingMapLevelFixture | -10 | Beta.Calendar, Calendar | `/places/{place-id}/building/map/levels/{levelMap-id}/fixtures` |
| PlaceAsBuildingMapLevelSection | -10 | Beta.Calendar, Calendar | `/places/{place-id}/building/map/levels/{levelMap-id}/sections` |
| PlaceAsBuildingMapLevelUnit | -10 | Beta.Calendar, Calendar | `/places/{place-id}/building/map/levels/{levelMap-id}/units` |
| RoleManagementEntitlementManagementRoleEligibilitySchedule | -10 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleEligibilitySchedules` |
| SecurityCaseEdiscoveryCaseCustodianSiteSource | -10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/custodians/{ediscoveryCustodian-id}/siteSources` |
| SecurityCaseEdiscoveryCaseCustodianUnifiedGroupSource | -10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/custodians/{ediscoveryCustodian-id}/unifiedGroupSources` |
| SecurityCaseEdiscoveryCaseCustodianUserSource | -10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/custodians/{ediscoveryCustodian-id}/userSources` |
| SecurityCaseEdiscoveryCaseReviewSetQuery | -10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/reviewSets/{ediscoveryReviewSet-id}/queries` |
| SecurityCaseEdiscoveryCaseSearchAdditionalSource | -10 | Beta.Security, Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/searches/{ediscoverySearch-id}/additionalSources` |
| ServicePrincipalSynchronizationJobSchemaDirectory | -10 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/synchronization/jobs/{synchronizationJob-id}/schema/directories` |
| ServicePrincipalSynchronizationTemplateSchemaDirectory | -10 | Applications, Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/synchronization/templates/{synchronizationTemplate-id}/schema/directories` |
| TeamChannelMessageReplyHostedContent | -10 | Beta.Teams, Teams | `/teams/{team-id}/channels/{channel-id}/messages/{chatMessage-id}/replies/{chatMessage-id1}/hostedContents` |
| TeamPrimaryChannelMessageReplyHostedContent | -10 | Beta.Teams, Teams | `/teams/{team-id}/primaryChannel/messages/{chatMessage-id}/replies/{chatMessage-id1}/hostedContents` |
| TeamworkDeletedTeamChannelMessageHostedContent | -10 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/messages/{chatMessage-id}/hostedContents` |
| TeamworkDeletedTeamChannelMessageReply | -10 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/messages/{chatMessage-id}/replies` |
| TeamworkDeletedTeamChannelMessageReplyHostedContent | -10 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/messages/{chatMessage-id}/replies/{chatMessage-id1}/hostedContents` |
| UserActivityHistoryItem | -10 | Beta.CrossDeviceExperiences, CrossDeviceExperiences | `/users/{user-id}/activities/{userActivity-id}/historyItems` |
| UserCalendarPermission | -10 | Beta.Calendar, Calendar | `/users/{user-id}/calendar/calendarPermissions` |
| UserChatMessageReplyHostedContent | -10 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/messages/{chatMessage-id}/replies/{chatMessage-id1}/hostedContents` |
| UserContactExtension | -10 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contacts/{contact-id}/extensions` |
| UserContactFolderChildFolder | -10 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contactFolders/{contactFolder-id}/childFolders` |
| UserContactFolderChildFolderContact | -10 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contactFolders/{contactFolder-id}/childFolders/{contactFolder-id1}/contacts` |
| UserContactFolderContact | -10 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contactFolders/{contactFolder-id}/contacts` |
| UserContactFolderContactExtension | -10 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contactFolders/{contactFolder-id}/contacts/{contact-id}/extensions` |
| UserDriveItem | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items` |
| UserDriveItemPermission | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/permissions` |
| UserDriveItemSubscription | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/subscriptions` |
| UserDriveItemThumbnail | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/thumbnails` |
| UserDriveItemVersion | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/versions` |
| UserDriveListColumn | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/columns` |
| UserDriveListContentType | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/contentTypes` |
| UserDriveListOperation | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/operations` |
| UserDriveListSubscription | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/subscriptions` |
| UserDriveRootPermission | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/permissions` |
| UserDriveRootSubscription | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/subscriptions` |
| UserDriveRootThumbnail | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/thumbnails` |
| UserDriveRootVersion | -10 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/versions` |
| UserEventExtension | -10 | Beta.Calendar, Calendar | `/users/{user-id}/events/{event-id}/extensions` |
| UserInferenceClassificationOverride | -10 | Beta.Mail, Mail | `/users/{user-id}/inferenceClassification/overrides` |
| UserMailFolderChildFolder | -10 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/childFolders` |
| UserMailFolderChildFolderMessage | -10 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/childFolders/{mailFolder-id1}/messages` |
| UserMailFolderChildFolderMessageRule | -10 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/childFolders/{mailFolder-id1}/messageRules` |
| UserMailFolderMessage | -10 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/messages` |
| UserMailFolderMessageExtension | -10 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/messages/{message-id}/extensions` |
| UserMailFolderMessageRule | -10 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/messageRules` |
| UserMessageExtension | -10 | Beta.Mail, Mail | `/users/{user-id}/messages/{message-id}/extensions` |
| UserOnenoteNotebook | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/notebooks` |
| UserOnenoteNotebookSection | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/notebooks/{notebook-id}/sections` |
| UserOnenoteNotebookSectionGroup | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/notebooks/{notebook-id}/sectionGroups` |
| UserOnenoteOperation | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/operations` |
| UserOnenotePage | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/pages` |
| UserOnenoteResource | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/resources` |
| UserOnenoteSection | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/sections` |
| UserOnenoteSectionGroup | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/sectionGroups` |
| UserOnenoteSectionGroupSection | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/sectionGroups/{sectionGroup-id}/sections` |
| UserOnenoteSectionPage | -10 | Beta.Notes, Notes | `/users/{user-id}/onenote/sections/{onenoteSection-id}/pages` |
| UserOnlineMeetingAttendanceReportAttendanceRecord | -10 | Beta.CloudCommunications, CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/attendanceReports/{meetingAttendanceReport-id}/attendanceRecords` |
| UserOnlineMeetingRecording | -10 | Beta.CloudCommunications, CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/recording` |
| UserOnlineMeetingTranscript | -10 | Beta.CloudCommunications, CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/transcripts` |
| UserSettingStorageQuotaService | -10 | Beta.Users, Users | `/users/{user-id}/settings/storage/quota/services` |
| ComplianceEdiscoveryCaseCustodianSiteSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/custodians/{custodian-id}/siteSources` |
| ComplianceEdiscoveryCaseCustodianUnifiedGroupSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/custodians/{custodian-id}/unifiedGroupSources` |
| ComplianceEdiscoveryCaseCustodianUserSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/custodians/{custodian-id}/userSources` |
| ComplianceEdiscoveryCaseLegalHoldSiteSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/legalHolds/{legalHold-id}/siteSources` |
| ComplianceEdiscoveryCaseLegalHoldUnifiedGroupSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/legalHolds/{legalHold-id}/unifiedGroupSources` |
| ComplianceEdiscoveryCaseLegalHoldUserSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/legalHolds/{legalHold-id}/userSources` |
| ComplianceEdiscoveryCaseReviewSetQuery | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/reviewSets/{reviewSet-id}/queries` |
| ComplianceEdiscoveryCaseSourceCollectionAdditionalSource | -15 | Beta.Compliance | `/compliance/ediscovery/cases/{case-id}/sourceCollections/{sourceCollection-id}/additionalSources` |
| DeviceAppManagementDefaultManagedAppProtectionApp | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/defaultManagedAppProtections/{defaultManagedAppProtection-id}/apps` |
| DeviceAppManagementiOSLobAppProvisioningConfigurationAssignment | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/iosLobAppProvisioningConfigurations/{iosLobAppProvisioningConfiguration-id}/assignments` |
| DeviceAppManagementiOSLobAppProvisioningConfigurationDeviceStatus | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/iosLobAppProvisioningConfigurations/{iosLobAppProvisioningConfiguration-id}/deviceStatuses` |
| DeviceAppManagementiOSLobAppProvisioningConfigurationGroupAssignment | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/iosLobAppProvisioningConfigurations/{iosLobAppProvisioningConfiguration-id}/groupAssignments` |
| DeviceAppManagementiOSLobAppProvisioningConfigurationUserStatus | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/iosLobAppProvisioningConfigurations/{iosLobAppProvisioningConfiguration-id}/userStatuses` |
| DeviceAppManagementManagedAppRegistrationAppliedPolicy | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedAppRegistrations/{managedAppRegistration-id}/appliedPolicies` |
| DeviceAppManagementManagedAppRegistrationIntendedPolicy | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedAppRegistrations/{managedAppRegistration-id}/intendedPolicies` |
| DeviceAppManagementManagedAppRegistrationManagedAppLogCollectionRequest | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/managedAppRegistrations/{managedAppRegistration-id}/managedAppLogCollectionRequests` |
| DeviceAppManagementMdmWindowsInformationProtectionPolicyAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mdmWindowsInformationProtectionPolicies/{mdmWindowsInformationProtectionPolicy-id}/assignments` |
| DeviceAppManagementMobileAppAsAndroidForWorkAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidForWorkApp/relationships` |
| DeviceAppManagementMobileAppAsAndroidLobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidLobApp/assignments` |
| DeviceAppManagementMobileAppAsAndroidLobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidLobApp/relationships` |
| DeviceAppManagementMobileAppAsAndroidManagedStoreAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidManagedStoreApp/relationships` |
| DeviceAppManagementMobileAppAsAndroidStoreAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidStoreApp/assignments` |
| DeviceAppManagementMobileAppAsAndroidStoreAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidStoreApp/relationships` |
| DeviceAppManagementMobileAppAsiOSLobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosLobApp/assignments` |
| DeviceAppManagementMobileAppAsiOSLobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosLobApp/relationships` |
| DeviceAppManagementMobileAppAsIoStoreAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosStoreApp/assignments` |
| DeviceAppManagementMobileAppAsIoStoreAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosStoreApp/relationships` |
| DeviceAppManagementMobileAppAsIoVppAppAssignedLicense | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosVppApp/assignedLicenses` |
| DeviceAppManagementMobileAppAsIoVppAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosVppApp/assignments` |
| DeviceAppManagementMobileAppAsIoVppAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosVppApp/relationships` |
| DeviceAppManagementMobileAppAsMacOSDmgAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSDmgApp/assignments` |
| DeviceAppManagementMobileAppAsMacOSDmgAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSDmgApp/relationships` |
| DeviceAppManagementMobileAppAsMacOSLobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSLobApp/assignments` |
| DeviceAppManagementMobileAppAsMacOSLobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSLobApp/relationships` |
| DeviceAppManagementMobileAppAsMacOSPkgAppContentVersion | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSPkgApp/contentVersions` |
| DeviceAppManagementMobileAppAsMacOSPkgAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSPkgApp/relationships` |
| DeviceAppManagementMobileAppAsManagedAndroidLobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedAndroidLobApp/assignments` |
| DeviceAppManagementMobileAppAsManagedAndroidLobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedAndroidLobApp/relationships` |
| DeviceAppManagementMobileAppAsManagediOSLobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedIOSLobApp/assignments` |
| DeviceAppManagementMobileAppAsManagediOSLobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedIOSLobApp/relationships` |
| DeviceAppManagementMobileAppAsManagedMobileLobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedMobileLobApp/assignments` |
| DeviceAppManagementMobileAppAsManagedMobileLobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedMobileLobApp/relationships` |
| DeviceAppManagementMobileAppAsMicrosoftStoreForBusinessAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/microsoftStoreForBusinessApp/assignments` |
| DeviceAppManagementMobileAppAsMicrosoftStoreForBusinessAppContainedApp | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/microsoftStoreForBusinessApp/containedApps` |
| DeviceAppManagementMobileAppAsMicrosoftStoreForBusinessAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/microsoftStoreForBusinessApp/relationships` |
| DeviceAppManagementMobileAppAsWin32LobAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/win32LobApp/assignments` |
| DeviceAppManagementMobileAppAsWin32LobAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/win32LobApp/relationships` |
| DeviceAppManagementMobileAppAsWindowsAppXAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsAppX/assignments` |
| DeviceAppManagementMobileAppAsWindowsAppXRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsAppX/relationships` |
| DeviceAppManagementMobileAppAsWindowsMobileMsiAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsMobileMSI/assignments` |
| DeviceAppManagementMobileAppAsWindowsMobileMsiRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsMobileMSI/relationships` |
| DeviceAppManagementMobileAppAsWindowStoreAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsStoreApp/relationships` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/assignments` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/relationships` |
| DeviceAppManagementMobileAppAsWindowsWebAppAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsWebApp/assignments` |
| DeviceAppManagementMobileAppAsWindowsWebAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsWebApp/relationships` |
| DeviceAppManagementMobileAppAsWinGetAppRelationship | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/winGetApp/relationships` |
| DeviceAppManagementWdacSupplementalPolicyAssignment | -15 | Beta.Devices.CorporateManagement | `/deviceAppManagement/wdacSupplementalPolicies/{windowsDefenderApplicationControlSupplementalPolicy-id}/assignments` |
| DeviceAppManagementWindowsInformationProtectionPolicyAssignment | -15 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/windowsInformationProtectionPolicies/{windowsInformationProtectionPolicy-id}/assignments` |
| DeviceCommand | -15 | Beta.Identity.DirectoryManagement | `/devices/{device-id}/commands` |
| DeviceManagementAdvancedThreatProtectionOnboardingStateSummaryAdvancedThreatProtectionOnboardingDeviceSettingState | -15 | Beta.DeviceManagement | `/deviceManagement/advancedThreatProtectionOnboardingStateSummary/advancedThreatProtectionOnboardingDeviceSettingStates` |
| DeviceManagementAppleUserInitiatedEnrollmentProfileAssignment | -15 | Beta.DeviceManagement.Enrollment | `/deviceManagement/appleUserInitiatedEnrollmentProfiles/{appleUserInitiatedEnrollmentProfile-id}/assignments` |
| DeviceManagementCategorySettingDefinition | -15 | Beta.DeviceManagement | `/deviceManagement/categories/{deviceManagementSettingCategory-id}/settingDefinitions` |
| DeviceManagementComanagedDeviceAssignmentFilterEvaluationStatusDetail | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/assignmentFilterEvaluationStatusDetails` |
| DeviceManagementComanagedDeviceCompliancePolicyState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/deviceCompliancePolicyStates` |
| DeviceManagementComanagedDeviceConfigurationState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/deviceConfigurationStates` |
| DeviceManagementComanagedDeviceHealthScriptState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/deviceHealthScriptStates` |
| DeviceManagementComanagedDeviceManagedDeviceMobileAppConfigurationState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/managedDeviceMobileAppConfigurationStates` |
| DeviceManagementComanagedDeviceSecurityBaselineState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/securityBaselineStates` |
| DeviceManagementComanagedDeviceSecurityBaselineStateSettingState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/securityBaselineStates/{securityBaselineState-id}/settingStates` |
| DeviceManagementComanagedDeviceWindowsProtectionStateDetectedMalwareState | -15 | Beta.DeviceManagement | `/deviceManagement/comanagedDevices/{managedDevice-id}/windowsProtectionState/detectedMalwareState` |
| DeviceManagementCompliancePolicyScheduledActionForRule | -15 | Beta.DeviceManagement | `/deviceManagement/compliancePolicies/{deviceManagementCompliancePolicy-id}/scheduledActionsForRule` |
| DeviceManagementCompliancePolicyScheduledActionForRuleScheduledActionConfiguration | -15 | Beta.DeviceManagement | `/deviceManagement/compliancePolicies/{deviceManagementCompliancePolicy-id}/scheduledActionsForRule/{deviceManagementComplianceScheduledActionForRule-id}/scheduledActionConfigurations` |
| DeviceManagementConfigurationPolicyTemplateSettingDefinition | -15 | Beta.DeviceManagement | `/deviceManagement/configurationPolicyTemplates/{deviceManagementConfigurationPolicyTemplate-id}/settingTemplates/{deviceManagementConfigurationSettingTemplate-id}/settingDefinitions` |
| DeviceManagementDepOnboardingSettingEnrollmentProfile | -15 | Beta.DeviceManagement.Enrollment | `/deviceManagement/depOnboardingSettings/{depOnboardingSetting-id}/enrollmentProfiles` |
| DeviceManagementDepOnboardingSettingImportedAppleDeviceIdentity | -15 | Beta.DeviceManagement.Enrollment | `/deviceManagement/depOnboardingSettings/{depOnboardingSetting-id}/importedAppleDeviceIdentities` |
| DeviceManagementEmbeddedSimActivationCodePoolAssignment | -15 | Beta.DeviceManagement | `/deviceManagement/embeddedSIMActivationCodePools/{embeddedSIMActivationCodePool-id}/assignments` |
| DeviceManagementEmbeddedSimActivationCodePoolDeviceState | -15 | Beta.DeviceManagement | `/deviceManagement/embeddedSIMActivationCodePools/{embeddedSIMActivationCodePool-id}/deviceStates` |
| DeviceManagementGroupPolicyDefinitionNextVersionDefinitionPresentation | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitions/{groupPolicyDefinition-id}/nextVersionDefinition/presentations` |
| DeviceManagementGroupPolicyDefinitionPresentation | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitions/{groupPolicyDefinition-id}/presentations` |
| DeviceManagementGroupPolicyDefinitionPreviouVersionDefinitionPresentation | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitions/{groupPolicyDefinition-id}/previousVersionDefinition/presentations` |
| DeviceManagementGroupPolicyMigrationReportGroupPolicySettingMapping | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyMigrationReports/{groupPolicyMigrationReport-id}/groupPolicySettingMappings` |
| DeviceManagementGroupPolicyMigrationReportUnsupportedGroupPolicyExtension | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyMigrationReports/{groupPolicyMigrationReport-id}/unsupportedGroupPolicyExtensions` |
| DeviceManagementGroupPolicyUploadedDefinitionFileGroupPolicyOperation | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyUploadedDefinitionFiles/{groupPolicyUploadedDefinitionFile-id}/groupPolicyOperations` |
| DeviceManagementIntentAssignment | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/assignments` |
| DeviceManagementIntentCategory | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/categories` |
| DeviceManagementIntentCategorySetting | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/categories/{deviceManagementIntentSettingCategory-id}/settings` |
| DeviceManagementIntentCategorySettingDefinition | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/categories/{deviceManagementIntentSettingCategory-id}/settingDefinitions` |
| DeviceManagementIntentDeviceSettingStateSummary | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/deviceSettingStateSummaries` |
| DeviceManagementIntentDeviceState | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/deviceStates` |
| DeviceManagementIntentUserState | -15 | Beta.DeviceManagement | `/deviceManagement/intents/{deviceManagementIntent-id}/userStates` |
| DeviceManagementMacOSSoftwareUpdateAccountSummaryCategorySummary | -15 | Beta.DeviceManagement | `/deviceManagement/macOSSoftwareUpdateAccountSummaries/{macOSSoftwareUpdateAccountSummary-id}/categorySummaries` |
| DeviceManagementManagedDeviceAssignmentFilterEvaluationStatusDetail | -15 | Beta.DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/assignmentFilterEvaluationStatusDetails` |
| DeviceManagementManagedDeviceHealthScriptState | -15 | Beta.DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/deviceHealthScriptStates` |
| DeviceManagementManagedDeviceMobileAppConfigurationState | -15 | Beta.DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/managedDeviceMobileAppConfigurationStates` |
| DeviceManagementManagedDeviceSecurityBaselineState | -15 | Beta.DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/securityBaselineStates` |
| DeviceManagementManagedDeviceSecurityBaselineStateSettingState | -15 | Beta.DeviceManagement | `/deviceManagement/managedDevices/{managedDevice-id}/securityBaselineStates/{securityBaselineState-id}/settingStates` |
| DeviceManagementMicrosoftTunnelSiteMicrosoftTunnelServer | -15 | Beta.DeviceManagement | `/deviceManagement/microsoftTunnelSites/{microsoftTunnelSite-id}/microsoftTunnelServers` |
| DeviceManagementResourceAccessProfileAssignment | -15 | Beta.DeviceManagement | `/deviceManagement/resourceAccessProfiles/{deviceManagementResourceAccessProfileBase-id}/assignments` |
| DeviceManagementTemplateCategory | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/categories` |
| DeviceManagementTemplateCategoryRecommendedSetting | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/categories/{deviceManagementTemplateSettingCategory-id}/recommendedSettings` |
| DeviceManagementTemplateCategorySettingDefinition | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/categories/{deviceManagementTemplateSettingCategory-id}/settingDefinitions` |
| DeviceManagementTemplateMigratableTo | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/migratableTo` |
| DeviceManagementTemplateMigratableToCategory | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/migratableTo/{deviceManagementTemplate-id1}/categories` |
| DeviceManagementTemplateMigratableToSetting | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/migratableTo/{deviceManagementTemplate-id1}/settings` |
| DeviceManagementTemplateSetting | -15 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/settings` |
| DeviceManagementVirtualEndpointReportExportJob | -15 | Beta.DeviceManagement.Administration | `/deviceManagement/virtualEndpoint/reports/exportJobs` |
| DeviceUsageRights | -15 | Beta.Identity.DirectoryManagement | `/devices/{device-id}/usageRights` |
| DirectoryRoleScopedMember | -15 | Beta.Identity.DirectoryManagement, Identity.DirectoryManagement | `/directoryRoles/{directoryRole-id}/scopedMembers` |
| EntitlementManagementCatalogResourceRoleResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resourceRoles/{accessPackageResourceRole-id}/resource/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementCatalogResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/catalogs/{accessPackageCatalog-id}/resources/{accessPackageResource-id}/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementResourceEnvironmentResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceEnvironments/{accessPackageResourceEnvironment-id}/resources/{accessPackageResource-id}/roles` |
| EntitlementManagementResourceEnvironmentResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceEnvironments/{accessPackageResourceEnvironment-id}/resources/{accessPackageResource-id}/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementResourceRequestCatalogResource | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resources` |
| EntitlementManagementResourceRequestCatalogResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resourceRoles` |
| EntitlementManagementResourceRequestCatalogResourceRoleResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resourceRoles/{accessPackageResourceRole-id}/resource/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementResourceRequestCatalogResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/catalog/resources/{accessPackageResource-id}/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementResourceRequestResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/resource/roles` |
| EntitlementManagementResourceRequestResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRequests/{accessPackageResourceRequest-id}/resource/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementResourceRoleScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes/{accessPackageResourceRoleScope-id}/scope/resource/roles` |
| EntitlementManagementResourceRoleScopeRoleResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes/{accessPackageResourceRoleScope-id}/role/resource/roles` |
| EntitlementManagementResourceRoleScopeRoleResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resourceRoleScopes/{accessPackageResourceRoleScope-id}/role/resource/scopes/{accessPackageResourceScope-id}/resource/roles` |
| EntitlementManagementResourceScopeResourceRole | -15 | Identity.Governance | `/identityGovernance/entitlementManagement/resources/{accessPackageResource-id}/scopes/{accessPackageResourceScope-id}/resource/roles` |
| FinancialCompanyCustomerPaymentCustomerPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/customerPayments/{customerPayment-id}/customer/picture` |
| FinancialCompanyCustomerPaymentJournalCustomerPaymentCustomerPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/customerPaymentJournals/{customerPaymentJournal-id}/customerPayments/{customerPayment-id}/customer/picture` |
| FinancialCompanyPurchaseInvoiceLineItemPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/purchaseInvoiceLines/{purchaseInvoiceLine-id}/item/picture` |
| FinancialCompanyPurchaseInvoiceVendorPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/purchaseInvoices/{purchaseInvoice-id}/vendor/picture` |
| FinancialCompanySaleCreditMemoCustomerPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesCreditMemos/{salesCreditMemo-id}/customer/picture` |
| FinancialCompanySaleCreditMemoLineItemPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesCreditMemoLines/{salesCreditMemoLine-id}/item/picture` |
| FinancialCompanySaleCreditMemoSaleCreditMemoLineItemPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesCreditMemos/{salesCreditMemo-id}/salesCreditMemoLines/{salesCreditMemoLine-id}/item/picture` |
| FinancialCompanySaleInvoiceCustomerPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesInvoices/{salesInvoice-id}/customer/picture` |
| FinancialCompanySaleInvoiceLineItemPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesInvoiceLines/{salesInvoiceLine-id}/item/picture` |
| FinancialCompanySaleOrderCustomerPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesOrders/{salesOrder-id}/customer/picture` |
| FinancialCompanySaleOrderLineItemPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesOrderLines/{salesOrderLine-id}/item/picture` |
| FinancialCompanySaleQuoteCustomerPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesQuotes/{salesQuote-id}/customer/picture` |
| FinancialCompanySaleQuoteLineItemPicture | -15 | Beta.Financials | `/financials/companies/{company-id}/salesQuoteLines/{salesQuoteLine-id}/item/picture` |
| GroupCalendarEvent | -15 | Beta.Calendar, Calendar | `/groups/{group-id}/calendar/events` |
| GroupDriveItemExtension | -15 | Beta.Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/extensions` |
| GroupDriveListItem | -15 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/items` |
| GroupDriveListPermission | -15 | Beta.Files | `/groups/{group-id}/drives/{drive-id}/list/permissions` |
| GroupDriveRootExtension | -15 | Beta.Files | `/groups/{group-id}/drives/{drive-id}/root/extensions` |
| GroupSiteContentModel | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/contentModels` |
| GroupSiteDocumentProcessingJob | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/documentProcessingJobs` |
| GroupSiteExtension | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/extensions` |
| GroupSiteInformationProtectionDataLossPreventionPolicy | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/informationProtection/dataLossPreventionPolicies` |
| GroupSiteInformationProtectionSensitivityLabel | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/informationProtection/sensitivityLabels` |
| GroupSiteInformationProtectionThreatAssessmentRequest | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/informationProtection/threatAssessmentRequests` |
| GroupSiteListPermission | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/permissions` |
| GroupSitePageTemplate | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/pageTemplates` |
| GroupSitePageTemplateWebPart | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/pageTemplates/{pageTemplate-id}/webParts` |
| GroupSiteRecycleBinItem | -15 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/recycleBin/items` |
| GroupTeamChannel | -15 | Beta.Teams, Teams | `/groups/{group-id}/team/channels` |
| GroupTeamChannelTab | -15 | Beta.Teams, Teams | `/groups/{group-id}/team/channels/{channel-id}/tabs` |
| GroupTeamPrimaryChannelTab | -15 | Beta.Teams, Teams | `/groups/{group-id}/team/primaryChannel/tabs` |
| GroupTeamScheduleShiftRoleDefinition | -15 | Beta.Teams | `/groups/{group-id}/team/schedule/shiftsRoleDefinitions` |
| IdentityGovernanceAccessReviewDecisionInstanceContactedReviewer | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/instance/contactedReviewers` |
| IdentityGovernanceAccessReviewDecisionInstanceDecision | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/instance/decisions` |
| IdentityGovernanceAccessReviewDecisionInstanceStage | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/instance/stages` |
| IdentityGovernanceAccessReviewDecisionInstanceStageDecision | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/instance/stages/{accessReviewStage-id}/decisions` |
| IdentityGovernanceAccessReviewInstanceDecisionInstanceContactedReviewer | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/contactedReviewers` |
| IdentityGovernanceAccessReviewInstanceDecisionInstanceStage | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/stages` |
| IdentityGovernanceAccessReviewInstanceDecisionInstanceStageDecision | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/stages/{accessReviewStage-id}/decisions` |
| IdentityGovernanceAccessReviewInstanceStageDecision | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions` |
| IdentityGovernanceAccessReviewInstanceStageDecisionInstanceContactedReviewer | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/contactedReviewers` |
| IdentityGovernanceAccessReviewInstanceStageDecisionInstanceDecision | -15 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/decisions` |
| IdentityGovernanceAppConsentRequestUserConsentRequestApprovalStep | -15 | Beta.Identity.Governance | `/identityGovernance/appConsent/appConsentRequests/{appConsentRequest-id}/userConsentRequests/{userConsentRequest-id}/approval/steps` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceScope | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceScopes` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceScopeAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceRoleAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceRoleAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceScopeAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceScope | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceScopes` |
| IdentityGovernanceCatalogAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceScopeAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceRoleAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceScope | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceScopes` |
| IdentityGovernanceCatalogAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceRoleAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/uploadSessions` |
| IdentityGovernanceCatalogAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceScope | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceScopes` |
| IdentityGovernanceCatalogAccessPackageResourceScopeAccessPackageResourceUploadSession | -15 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/uploadSessions` |
| IdentityGovernancePrivilegedAccessGroupAssignmentApprovalStep | -15 | Beta.Identity.Governance | `/identityGovernance/privilegedAccess/group/assignmentApprovals/{approval-id}/steps` |
| NetworkAccessConnectivityBranchConnectivityConfigurationLink | -15 | Beta.NetworkAccess | `/networkAccess/connectivity/branches/{branchSite-id}/connectivityConfiguration/links` |
| OrganizationBrandingTheme | -15 | Beta.Identity.DirectoryManagement | `/organization/{organization-id}/branding/themes` |
| OrganizationBrandingThemeLocalization | -15 | Beta.Identity.DirectoryManagement | `/organization/{organization-id}/branding/themes/{organizationalBrandingTheme-id}/localizations` |
| PolicyAuthorizationPolicyDefaultUserRoleOverride | -15 | Beta.Identity.SignIns | `/policies/authorizationPolicy/{authorizationPolicy-id}/defaultUserRoleOverrides` |
| RoleManagementCloudPcRoleAssignmentAppScope | -15 | Beta.DeviceManagement.Enrollment | `/roleManagement/cloudPC/roleAssignments/{unifiedRoleAssignmentMultiple-id}/appScopes` |
| RoleManagementDirectoryRoleAssignmentApprovalStep | -15 | Beta.Identity.Governance | `/roleManagement/directory/roleAssignmentApprovals/{approval-id}/steps` |
| RoleManagementDirectoryRoleDefinitionInheritPermissionFrom | -15 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/directory/roleDefinitions/{unifiedRoleDefinition-id}/inheritsPermissionsFrom` |
| RoleManagementEntitlementManagementRoleAssignmentApprovalStep | -15 | Beta.Identity.Governance | `/roleManagement/entitlementManagement/roleAssignmentApprovals/{approval-id}/steps` |
| RoleManagementEntitlementManagementRoleDefinitionInheritPermissionFrom | -15 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleDefinitions/{unifiedRoleDefinition-id}/inheritsPermissionsFrom` |
| SecurityCaseEdiscoveryCaseLegalHoldSiteSource | -15 | Beta.Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/legalHolds/{ediscoveryHoldPolicy-id}/siteSources` |
| SecurityCaseEdiscoveryCaseLegalHoldUserSource | -15 | Beta.Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/legalHolds/{ediscoveryHoldPolicy-id}/userSources` |
| SecurityCaseEdiscoveryCaseReviewSetFile | -15 | Beta.Security | `/security/cases/ediscoveryCases/{ediscoveryCase-id}/reviewSets/{ediscoveryReviewSet-id}/files` |
| ServicePrincipalRemoteDesktopSecurityConfigurationApprovedClientApp | -15 | Beta.Applications | `/servicePrincipals/{servicePrincipal-id}/remoteDesktopSecurityConfiguration/approvedClientApps` |
| SolutionBusinessScenarioPlannerPlanConfigurationLocalization | -15 | Beta.BusinessScenario | `/solutions/businessScenarios/{businessScenario-id}/planner/planConfiguration/localizations` |
| TeamPrimaryChannelTab | -15 | Beta.Teams, Teams | `/teams/{team-id}/primaryChannel/tabs` |
| TeamScheduleShiftRoleDefinition | -15 | Beta.Teams | `/teams/{team-id}/schedule/shiftsRoleDefinitions` |
| TeamworkDeletedTeamChannel | -15 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels` |
| TeamworkDeletedTeamChannelTab | -15 | Beta.Teams, Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/tabs` |
| TeamworkDevice | -15 | Beta.Teams | `/teamwork/devices` |
| TeamworkDeviceOperation | -15 | Beta.Teams | `/teamwork/devices/{teamworkDevice-id}/operations` |
| TeamworkTeamTemplate | -15 | Beta.Teams | `/teamwork/teamTemplates` |
| TeamworkTeamTemplateDefinition | -15 | Beta.Teams | `/teamwork/teamTemplates/{teamTemplate-id}/definitions` |
| UserChatOperation | -15 | Beta.Teams | `/users/{user-id}/chats/{chat-id}/operations` |
| UserChatTab | -15 | Beta.Teams, Teams | `/users/{user-id}/chats/{chat-id}/tabs` |
| UserDeviceCommand | -15 | Beta.CrossDeviceExperiences | `/users/{user-id}/devices/{device-id}/commands` |
| UserDeviceExtension | -15 | Beta.CrossDeviceExperiences | `/users/{user-id}/devices/{device-id}/extensions` |
| UserDeviceUsageRights | -15 | Beta.CrossDeviceExperiences | `/users/{user-id}/devices/{device-id}/usageRights` |
| UserDriveItemExtension | -15 | Beta.Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/extensions` |
| UserDriveListItem | -15 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/items` |
| UserDriveListPermission | -15 | Beta.Files | `/users/{user-id}/drives/{drive-id}/list/permissions` |
| UserDriveRootExtension | -15 | Beta.Files | `/users/{user-id}/drives/{drive-id}/root/extensions` |
| UserInformationProtectionDataLossPreventionPolicy | -15 | Beta.Identity.SignIns | `/users/{user-id}/informationProtection/dataLossPreventionPolicies` |
| UserInformationProtectionPolicyLabel | -15 | Beta.Identity.SignIns | `/users/{user-id}/informationProtection/policy/labels` |
| UserInformationProtectionSensitivityLabel | -15 | Beta.Identity.SignIns | `/users/{user-id}/informationProtection/sensitivityLabels` |
| UserInformationProtectionSensitivityLabelSublabel | -15 | Beta.Identity.SignIns | `/users/{user-id}/informationProtection/sensitivityLabels/{sensitivityLabel-id}/sublabels` |
| UserInformationProtectionThreatAssessmentRequest | -15 | Beta.Identity.SignIns | `/users/{user-id}/informationProtection/threatAssessmentRequests` |
| UserInformationProtectionThreatAssessmentRequestResult | -15 | Beta.Identity.SignIns | `/users/{user-id}/informationProtection/threatAssessmentRequests/{threatAssessmentRequest-id}/results` |
| UserManagedDeviceAssignmentFilterEvaluationStatusDetail | -15 | Beta.Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/assignmentFilterEvaluationStatusDetails` |
| UserManagedDeviceHealthScriptState | -15 | Beta.Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/deviceHealthScriptStates` |
| UserManagedDeviceMobileAppConfigurationState | -15 | Beta.Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/managedDeviceMobileAppConfigurationStates` |
| UserManagedDeviceSecurityBaselineState | -15 | Beta.Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/securityBaselineStates` |
| UserManagedDeviceSecurityBaselineStateSettingState | -15 | Beta.Devices.CorporateManagement | `/users/{user-id}/managedDevices/{managedDevice-id}/securityBaselineStates/{securityBaselineState-id}/settingStates` |
| UserMobileAppTroubleshootingEventAppLogCollectionRequest | -15 | Beta.Devices.CorporateManagement | `/users/{user-id}/mobileAppTroubleshootingEvents/{mobileAppTroubleshootingEvent-id}/appLogCollectionRequests` |
| UserOnlineMeetingRegistrationCustomQuestion | -15 | Beta.CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/registration/customQuestions` |
| UserOnlineMeetingRegistrationRegistrant | -15 | Beta.CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/registration/registrants` |
| UserOutlookTask | -15 | Beta.Users | `/users/{user-id}/outlook/tasks` |
| UserOutlookTaskFolder | -15 | Beta.Users | `/users/{user-id}/outlook/taskFolders` |
| UserOutlookTaskFolderTask | -15 | Beta.Users | `/users/{user-id}/outlook/taskFolders/{outlookTaskFolder-id}/tasks` |
| UserOutlookTaskGroup | -15 | Beta.Users | `/users/{user-id}/outlook/taskGroups` |
| UserOutlookTaskGroupTaskFolder | -15 | Beta.Users | `/users/{user-id}/outlook/taskGroups/{outlookTaskGroup-id}/taskFolders` |
| UserProfileAccount | -15 | Beta.People | `/users/{user-id}/profile/account` |
| UserProfileAddress | -15 | Beta.People | `/users/{user-id}/profile/addresses` |
| UserProfileAnniversary | -15 | Beta.People | `/users/{user-id}/profile/anniversaries` |
| UserProfileAward | -15 | Beta.People | `/users/{user-id}/profile/awards` |
| UserProfileCertification | -15 | Beta.People | `/users/{user-id}/profile/certifications` |
| UserProfileEmail | -15 | Beta.People | `/users/{user-id}/profile/emails` |
| UserProfileInterest | -15 | Beta.People | `/users/{user-id}/profile/interests` |
| UserProfileLanguage | -15 | Beta.People | `/users/{user-id}/profile/languages` |
| UserProfileName | -15 | Beta.People | `/users/{user-id}/profile/names` |
| UserProfileNote | -15 | Beta.People | `/users/{user-id}/profile/notes` |
| UserProfilePatent | -15 | Beta.People | `/users/{user-id}/profile/patents` |
| UserProfilePhone | -15 | Beta.People | `/users/{user-id}/profile/phones` |
| UserProfilePosition | -15 | Beta.People | `/users/{user-id}/profile/positions` |
| UserProfileProject | -15 | Beta.People | `/users/{user-id}/profile/projects` |
| UserProfilePublication | -15 | Beta.People | `/users/{user-id}/profile/publications` |
| UserProfileSkill | -15 | Beta.People | `/users/{user-id}/profile/skills` |
| UserProfileWebAccount | -15 | Beta.People | `/users/{user-id}/profile/webAccounts` |
| UserProfileWebsite | -15 | Beta.People | `/users/{user-id}/profile/websites` |
| UserSecurityInformationProtectionSensitivityLabel | -15 | Beta.Security | `/users/{user-id}/security/informationProtection/sensitivityLabels` |
| WindowsUpdatesDeploymentAudienceApplicableContent | -15 | Beta.WindowsUpdates | `/admin/windows/updates/deployments/{deployment-id}/audience/applicableContent` |
| WindowsUpdatesDeploymentAudienceApplicableContentMatchedDevice | -15 | Beta.WindowsUpdates | `/admin/windows/updates/deployments/{deployment-id}/audience/applicableContent/{applicableContent-catalogEntryId}/matchedDevices` |
| WindowsUpdatesPolicyAudienceApplicableContent | -15 | Beta.WindowsUpdates | `/admin/windows/updates/updatePolicies/{updatePolicy-id}/audience/applicableContent` |
| WindowsUpdatesPolicyAudienceApplicableContentMatchedDevice | -15 | Beta.WindowsUpdates | `/admin/windows/updates/updatePolicies/{updatePolicy-id}/audience/applicableContent/{applicableContent-catalogEntryId}/matchedDevices` |
| WindowsUpdatesPolicyAudienceExclusion | -15 | Beta.WindowsUpdates | `/admin/windows/updates/updatePolicies/{updatePolicy-id}/audience/exclusions` |
| WindowsUpdatesPolicyAudienceMember | -15 | Beta.WindowsUpdates | `/admin/windows/updates/updatePolicies/{updatePolicy-id}/audience/members` |
| WindowsUpdatesPolicyComplianceChange | -15 | Beta.WindowsUpdates | `/admin/windows/updates/updatePolicies/{updatePolicy-id}/complianceChanges` |
| WindowsUpdatesProductEdition | -15 | Beta.WindowsUpdates | `/admin/windows/updates/products/{product-id}/editions` |
| WindowsUpdatesProductKnownIssue | -15 | Beta.WindowsUpdates | `/admin/windows/updates/products/{product-id}/knownIssues` |
| WindowsUpdatesProductRevision | -15 | Beta.WindowsUpdates | `/admin/windows/updates/products/{product-id}/revisions` |
| AdministrativeUnit | -20 | Beta.Identity.DirectoryManagement | `/administrativeUnits` |
| AdministrativeUnitScopedRoleMember | -20 | Beta.Identity.DirectoryManagement | `/administrativeUnits/{administrativeUnit-id}/scopedRoleMembers` |
| DeviceAppManagementManagedEBookUserStateSummary | -20 | Beta.Devices.CorporateManagement, Devices.CorporateManagement | `/deviceAppManagement/managedEBooks/{managedEBook-id}/userStateSummary` |
| DeviceAppManagementWdacSupplementalPolicyDeviceStatus | -20 | Beta.Devices.CorporateManagement | `/deviceAppManagement/wdacSupplementalPolicies/{windowsDefenderApplicationControlSupplementalPolicy-id}/deviceStatuses` |
| DeviceManagementDeviceShellScriptUserRunStateDeviceRunState | -20 | Beta.DeviceManagement | `/deviceManagement/deviceShellScripts/{deviceShellScript-id}/userRunStates/{deviceManagementScriptUserState-id}/deviceRunStates` |
| DeviceManagementScriptUserRunStateDeviceRunState | -20 | Beta.DeviceManagement | `/deviceManagement/deviceManagementScripts/{deviceManagementScript-id}/userRunStates/{deviceManagementScriptUserState-id}/deviceRunStates` |
| EntitlementManagementAccessPackageAssignmentPolicyCustomExtensionHandler | -20 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageAssignmentPolicies/{accessPackageAssignmentPolicy-id}/customExtensionHandlers` |
| EntitlementManagementAccessPackageAssignmentPolicyCustomExtensionStageSetting | -20 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageAssignmentPolicies/{accessPackageAssignmentPolicy-id}/customExtensionStageSettings` |
| EntitlementManagementAccessPackageResourceUploadSession | -20 | Beta.Identity.Governance | `/identityGovernance/entitlementManagement/accessPackageResources/{accessPackageResource-id}/uploadSessions` |
| IdentityB2CUserFlowUserAttributeAssignment | -20 | Beta.Identity.SignIns | `/identity/b2cUserFlows/{b2cIdentityUserFlow-id}/userAttributeAssignments` |
| IdentityConditionalAccessAuthenticationStrengthPolicy | -20 | Beta.Identity.SignIns | `/identity/conditionalAccess/authenticationStrengths/policies` |
| IdentityConditionalAccessDeletedItemNamedLocation | -20 | Beta.Identity.SignIns | `/identity/conditionalAccess/deletedItems/namedLocations` |
| IdentityConditionalAccessDeletedItemPolicy | -20 | Beta.Identity.SignIns | `/identity/conditionalAccess/deletedItems/policies` |
| IdentityGovernanceCatalog | -20 | Beta.Identity.Governance | `/identityGovernance/catalogs` |
| IdentityGovernanceCatalogAccessPackageResource | -20 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceRole | -20 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceRoles` |
| IdentityGovernanceCatalogAccessPackageResourceRole | -20 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceRoles` |
| NetworkAccessConnectivityBranchDeviceLink | -20 | Beta.NetworkAccess | `/networkAccess/connectivity/branches/{branchSite-id}/deviceLinks` |
| NetworkAccessConnectivityBranchForwardingProfile | -20 | Beta.NetworkAccess | `/networkAccess/connectivity/branches/{branchSite-id}/forwardingProfiles` |
| NetworkAccessThreatIntelligencePolicyRule | -20 | Beta.NetworkAccess | `/networkAccess/threatIntelligencePolicies/{threatIntelligencePolicy-id}/policyRules` |
| NetworkAccessTlInspectionPolicyRule | -20 | Beta.NetworkAccess | `/networkAccess/tlsInspectionPolicies/{tlsInspectionPolicy-id}/policyRules` |
| PolicyDeletedItemCrossTenantPartner | -20 | Beta.Identity.SignIns | `/policies/deletedItems/crossTenantPartners` |
| PolicyDeletedItemCrossTenantSyncPolicyPartner | -20 | Beta.Identity.SignIns | `/policies/deletedItems/crossTenantSyncPolicyPartners` |
| RoleManagementDeviceManagementRoleAssignment | -20 | Beta.DeviceManagement.Enrollment | `/roleManagement/deviceManagement/roleAssignments` |
| RoleManagementDeviceManagementRoleDefinition | -20 | Beta.DeviceManagement.Enrollment | `/roleManagement/deviceManagement/roleDefinitions` |
| RoleManagementEnterpriseAppRoleAssignment | -20 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleAssignments` |
| RoleManagementEnterpriseAppRoleAssignmentScheduleRequest | -20 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleAssignmentScheduleRequests` |
| RoleManagementEnterpriseAppRoleDefinition | -20 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleDefinitions` |
| RoleManagementEnterpriseAppRoleDefinitionInheritPermissionFrom | -20 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleDefinitions/{unifiedRoleDefinition-id}/inheritsPermissionsFrom` |
| RoleManagementEnterpriseAppRoleEligibilityScheduleRequest | -20 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleEligibilityScheduleRequests` |
| RoleManagementEnterpriseAppTransitiveRoleAssignment | -20 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/transitiveRoleAssignments` |
| RoleManagementExchangeRoleAssignment | -20 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/roleAssignments` |
| RoleManagementExchangeRoleDefinition | -20 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/roleDefinitions` |
| RoleManagementExchangeTransitiveRoleAssignment | -20 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/transitiveRoleAssignments` |
| UserSettingWindowsInstance | -20 | Beta.Users, Users | `/users/{user-id}/settings/windows/{windowsSetting-id}/instances` |
| AccessReviewInstance | -25 | Beta.Identity.Governance | `/accessReviews/{accessReview-id}/instances` |
| DeviceAppManagementTargetedManagedAppConfigurationSetting | -25 | Beta.Devices.CorporateManagement | `/deviceAppManagement/targetedManagedAppConfigurations/{targetedManagedAppConfiguration-id}/settings` |
| DeviceManagementCompliancePolicy | -25 | Beta.DeviceManagement | `/deviceManagement/compliancePolicies` |
| DeviceManagementDeviceShellScriptAssignment | -25 | Beta.DeviceManagement | `/deviceManagement/deviceShellScripts/{deviceShellScript-id}/assignments` |
| DeviceManagementGroupPolicyDefinition | -25 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitions` |
| IdentityGovernanceAccessReviewDecisionInsight | -25 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/insights` |
| IdentityGovernancePermissionManagementScheduledPermissionApproval | -25 | Beta.Identity.Governance | `/identityGovernance/permissionsManagement/scheduledPermissionsApprovals` |
| NetworkAccessConnectivityRemoteNetworkForwardingProfile | -25 | Beta.NetworkAccess | `/networkAccess/connectivity/remoteNetworks/{remoteNetwork-id}/forwardingProfiles` |
| PrivilegedApproval | -25 | Beta.Identity.Governance | `/privilegedApproval` |
| ReportAuthenticationMethodUserEventSummary | -25 | Beta.Reports | `/reports/authenticationMethods/userEventsSummary` |
| ReportAuthenticationMethodUserMfaSignInSummary | -25 | Beta.Reports | `/reports/authenticationMethods/userMfaSignInSummary` |
| ReportAuthenticationMethodUserPasswordResetAndChangeSummary | -25 | Beta.Reports | `/reports/authenticationMethods/userPasswordResetsAndChangesSummary` |
| RoleManagementDeviceManagementRoleDefinitionInheritPermissionFrom | -25 | Beta.DeviceManagement.Enrollment | `/roleManagement/deviceManagement/roleDefinitions/{unifiedRoleDefinition-id}/inheritsPermissionsFrom` |
| RoleManagementEnterpriseAppRoleAssignmentApproval | -25 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleAssignmentApprovals` |
| RoleManagementEnterpriseAppRoleAssignmentScheduleInstance | -25 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleAssignmentScheduleInstances` |
| RoleManagementEnterpriseAppRoleEligibilityScheduleInstance | -25 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleEligibilityScheduleInstances` |
| RoleManagementExchangeRoleDefinitionInheritPermissionFrom | -25 | Beta.DeviceManagement.Enrollment | `/roleManagement/exchange/roleDefinitions/{unifiedRoleDefinition-id}/inheritsPermissionsFrom` |
| SecurityPartnerSecurityScoreCustomerInsight | -25 | Beta.Security | `/security/partner/securityScore/customerInsights` |
| SiteListItemActivity | -25 | Beta.Sites | `/sites/{site-id}/lists/{list-id}/items/{listItem-id}/activities` |
| UserActivity | -25 | Beta.CrossDeviceExperiences, CrossDeviceExperiences | `/users/{user-id}/activities` |
| UserDevice | -25 | Beta.CrossDeviceExperiences | `/users/{user-id}/devices` |
| UserDeviceEnrollmentConfiguration | -25 | Beta.Devices.CorporateManagement | `/users/{user-id}/deviceEnrollmentConfigurations` |
| DeviceManagementDeviceConfigurationConflictSummary | -30 | Beta.DeviceManagement | `/deviceManagement/deviceConfigurationConflictSummary` |
| GroupDriveItemAnalyticItemActivityStat | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/analytics/itemActivityStats` |
| GroupDriveItemListItemDocumentSetVersion | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/listItem/documentSetVersions` |
| GroupDriveItemListItemVersion | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/listItem/versions` |
| GroupDriveListContentTypeColumn | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/contentTypes/{contentType-id}/columns` |
| GroupDriveListContentTypeColumnLink | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/contentTypes/{contentType-id}/columnLinks` |
| GroupDriveListItemDocumentSetVersion | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/items/{listItem-id}/documentSetVersions` |
| GroupDriveListItemVersion | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/list/items/{listItem-id}/versions` |
| GroupDriveRootAnalyticItemActivityStat | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/analytics/itemActivityStats` |
| GroupDriveRootListItemDocumentSetVersion | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/listItem/documentSetVersions` |
| GroupDriveRootListItemVersion | -30 | Beta.Files, Files | `/groups/{group-id}/drives/{drive-id}/root/listItem/versions` |
| GroupOnenoteNotebookSectionGroupSection | -30 | Beta.Notes, Notes | `/groups/{group-id}/onenote/notebooks/{notebook-id}/sectionGroups/{sectionGroup-id}/sections` |
| RoleManagementDirectoryRoleAssignmentApproval | -30 | Beta.Identity.Governance | `/roleManagement/directory/roleAssignmentApprovals` |
| RoleManagementEntitlementManagementRoleAssignmentApproval | -30 | Beta.Identity.Governance | `/roleManagement/entitlementManagement/roleAssignmentApprovals` |
| RoleManagementEntitlementManagementRoleAssignmentSchedule | -30 | Beta.Identity.Governance, Identity.Governance | `/roleManagement/entitlementManagement/roleAssignmentSchedules` |
| UserContactFolderChildFolderContactExtension | -30 | Beta.PersonalContacts, PersonalContacts | `/users/{user-id}/contactFolders/{contactFolder-id}/childFolders/{contactFolder-id1}/contacts/{contact-id}/extensions` |
| UserDriveItemAnalyticItemActivityStat | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/analytics/itemActivityStats` |
| UserDriveItemListItemDocumentSetVersion | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/listItem/documentSetVersions` |
| UserDriveItemListItemVersion | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/listItem/versions` |
| UserDriveListContentTypeColumn | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/contentTypes/{contentType-id}/columns` |
| UserDriveListContentTypeColumnLink | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/contentTypes/{contentType-id}/columnLinks` |
| UserDriveListItemDocumentSetVersion | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/items/{listItem-id}/documentSetVersions` |
| UserDriveListItemVersion | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/list/items/{listItem-id}/versions` |
| UserDriveRootAnalyticItemActivityStat | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/analytics/itemActivityStats` |
| UserDriveRootListItemDocumentSetVersion | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/listItem/documentSetVersions` |
| UserDriveRootListItemVersion | -30 | Beta.Files, Files | `/users/{user-id}/drives/{drive-id}/root/listItem/versions` |
| UserMailFolderChildFolderMessageExtension | -30 | Beta.Mail, Mail | `/users/{user-id}/mailFolders/{mailFolder-id}/childFolders/{mailFolder-id1}/messages/{message-id}/extensions` |
| UserOnenoteNotebookSectionGroupSection | -30 | Beta.Notes, Notes | `/users/{user-id}/onenote/notebooks/{notebook-id}/sectionGroups/{sectionGroup-id}/sections` |
| UserOnenoteNotebookSectionGroupSectionPage | -30 | Beta.Notes, Notes | `/users/{user-id}/onenote/notebooks/{notebook-id}/sectionGroups/{sectionGroup-id}/sections/{onenoteSection-id}/pages` |
| UserOnenoteNotebookSectionPage | -30 | Beta.Notes, Notes | `/users/{user-id}/onenote/notebooks/{notebook-id}/sections/{onenoteSection-id}/pages` |
| UserOnenoteSectionGroupSectionPage | -30 | Beta.Notes, Notes | `/users/{user-id}/onenote/sectionGroups/{sectionGroup-id}/sections/{onenoteSection-id}/pages` |
| DeviceAppManagementMobileAppAsAndroidLobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidLobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsiOSLobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/iosLobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsMacOSDmgAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSDmgApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsMacOSLobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSLobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsMacOSPkgAppContentVersionContainedApp | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSPkgApp/contentVersions/{mobileAppContent-id}/containedApps` |
| DeviceAppManagementMobileAppAsMacOSPkgAppContentVersionFile | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSPkgApp/contentVersions/{mobileAppContent-id}/files` |
| DeviceAppManagementMobileAppAsMacOSPkgAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSPkgApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsManagedAndroidLobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedAndroidLobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsManagediOSLobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedIOSLobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsManagedMobileLobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/managedMobileLobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsWin32LobAppContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/win32LobApp/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsWindowsAppXContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsAppX/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsWindowsMobileMsiContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsMobileMSI/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceAppManagementMobileAppAsWindowsUniversalAppXContentVersionScript | -35 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsUniversalAppX/contentVersions/{mobileAppContent-id}/scripts` |
| DeviceManagementGroupPolicyDefinitionNextVersionDefinitionPreviouVersionDefinitionPresentation | -35 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitions/{groupPolicyDefinition-id}/nextVersionDefinition/previousVersionDefinition/presentations` |
| DeviceManagementGroupPolicyDefinitionPreviouVersionDefinitionNextVersionDefinitionPresentation | -35 | Beta.DeviceManagement.Administration | `/deviceManagement/groupPolicyDefinitions/{groupPolicyDefinition-id}/previousVersionDefinition/nextVersionDefinition/presentations` |
| DeviceManagementTemplateMigratableToCategoryRecommendedSetting | -35 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/migratableTo/{deviceManagementTemplate-id1}/categories/{deviceManagementTemplateSettingCategory-id}/recommendedSettings` |
| DeviceManagementTemplateMigratableToCategorySettingDefinition | -35 | Beta.DeviceManagement | `/deviceManagement/templates/{deviceManagementTemplate-id}/migratableTo/{deviceManagementTemplate-id1}/categories/{deviceManagementTemplateSettingCategory-id}/settingDefinitions` |
| GroupDriveItemListItemPermission | -35 | Beta.Files | `/groups/{group-id}/drives/{drive-id}/items/{driveItem-id}/listItem/permissions` |
| GroupDriveListItemPermission | -35 | Beta.Files | `/groups/{group-id}/drives/{drive-id}/list/items/{listItem-id}/permissions` |
| GroupDriveRootListItemPermission | -35 | Beta.Files | `/groups/{group-id}/drives/{drive-id}/root/listItem/permissions` |
| GroupSiteInformationProtectionPolicyLabel | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/informationProtection/policy/labels` |
| GroupSiteInformationProtectionSensitivityLabelSublabel | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/informationProtection/sensitivityLabels/{sensitivityLabel-id}/sublabels` |
| GroupSiteInformationProtectionThreatAssessmentRequestResult | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/informationProtection/threatAssessmentRequests/{threatAssessmentRequest-id}/results` |
| GroupSiteListItemPermission | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/items/{listItem-id}/permissions` |
| GroupSitePageTemplateCanvaLayoutHorizontalSection | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/pageTemplates/{pageTemplate-id}/canvasLayout/horizontalSections` |
| GroupSitePageTemplateCanvaLayoutHorizontalSectionColumn | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/pageTemplates/{pageTemplate-id}/canvasLayout/horizontalSections/{horizontalSection-id}/columns` |
| GroupSitePageTemplateCanvaLayoutHorizontalSectionColumnWebpart | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/pageTemplates/{pageTemplate-id}/canvasLayout/horizontalSections/{horizontalSection-id}/columns/{horizontalSectionColumn-id}/webparts` |
| GroupSitePageTemplateCanvaLayoutVerticalSectionWebpart | -35 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/pageTemplates/{pageTemplate-id}/canvasLayout/verticalSection/webparts` |
| IdentityGovernanceLifecycleWorkflowVersionTask | -35 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/lifecycleWorkflows/workflows/{workflow-id}/versions/{workflowVersion-versionNumber}/tasks` |
| NetworkAccessConnectivityRemoteNetworkConnectivityConfigurationLink | -35 | Beta.NetworkAccess | `/networkAccess/connectivity/remoteNetworks/{remoteNetwork-id}/connectivityConfiguration/links` |
| UserAuthenticationHardwareOathMethodDeviceHardwareOathDevice | -35 | Beta.Identity.SignIns | `/users/{user-id}/authentication/hardwareOathMethods/{hardwareOathAuthenticationMethod-id}/device/hardwareOathDevices` |
| UserDriveItemListItemPermission | -35 | Beta.Files | `/users/{user-id}/drives/{drive-id}/items/{driveItem-id}/listItem/permissions` |
| UserDriveListItemPermission | -35 | Beta.Files | `/users/{user-id}/drives/{drive-id}/list/items/{listItem-id}/permissions` |
| UserDriveRootListItemPermission | -35 | Beta.Files | `/users/{user-id}/drives/{drive-id}/root/listItem/permissions` |
| UserOutlookTaskGroupTaskFolderTask | -35 | Beta.Users | `/users/{user-id}/outlook/taskGroups/{outlookTaskGroup-id}/taskFolders/{outlookTaskFolder-id}/tasks` |
| DeviceAppManagementMobileAppAsAndroidForWorkAppAssignment | -40 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidForWorkApp/assignments` |
| DeviceAppManagementMobileAppAsAndroidManagedStoreAppAssignment | -40 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/androidManagedStoreApp/assignments` |
| DeviceAppManagementMobileAppAsMacOSPkgAppAssignment | -40 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/macOSPkgApp/assignments` |
| DeviceAppManagementMobileAppAsWindowStoreAppAssignment | -40 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/windowsStoreApp/assignments` |
| DeviceAppManagementMobileAppAsWinGetAppAssignment | -40 | Beta.Devices.CorporateManagement | `/deviceAppManagement/mobileApps/{mobileApp-id}/winGetApp/assignments` |
| DeviceManagementCompliancePolicyAssignment | -40 | Beta.DeviceManagement | `/deviceManagement/compliancePolicies/{deviceManagementCompliancePolicy-id}/assignments` |
| DeviceManagementCompliancePolicySetting | -40 | Beta.DeviceManagement | `/deviceManagement/compliancePolicies/{deviceManagementCompliancePolicy-id}/settings` |
| GroupSiteAnalyticItemActivityStatActivity | -40 | Beta.Sites, Sites | `/groups/{group-id}/sites/{site-id}/analytics/itemActivityStats/{itemActivityStat-id}/activities` |
| IdentityGovernanceAccessReviewDefinitionInstanceDecisionInsight | -40 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances/{accessReviewInstance-id}/decisions/{accessReviewInstanceDecisionItem-id}/insights` |
| IdentityGovernanceCatalogAccessPackageResourceAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceRole | -40 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResources/{accessPackageResource-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceRoles` |
| IdentityGovernanceCatalogAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceRole | -40 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceRoles` |
| IdentityGovernanceCatalogAccessPackageResourceRoleAccessPackageResourceAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceRole | -40 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceRoles/{accessPackageResourceRole-id}/accessPackageResource/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceRoles` |
| IdentityGovernanceCatalogAccessPackageResourceScopeAccessPackageResourceAccessPackageResourceRole | -40 | Beta.Identity.Governance | `/identityGovernance/catalogs/{accessPackageCatalog-id}/accessPackageResourceScopes/{accessPackageResourceScope-id}/accessPackageResource/accessPackageResourceRoles` |
| IdentityGovernanceLifecycleWorkflowDeletedItemWorkflowTask | -40 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/lifecycleWorkflows/deletedItems/workflows/{workflow-id}/tasks` |
| NetworkAccessConnectivityBranchForwardingProfilePolicy | -40 | Beta.NetworkAccess | `/networkAccess/connectivity/branches/{branchSite-id}/forwardingProfiles/{forwardingProfile-id}/policies` |
| TeamChannelPlannerPlan | -40 | Beta.Teams | `/teams/{team-id}/channels/{channel-id}/planner/plans` |
| TeamPrimaryChannelPlannerPlan | -40 | Beta.Teams | `/teams/{team-id}/primaryChannel/planner/plans` |
| UserDeviceEnrollmentConfigurationAssignment | -40 | Beta.Devices.CorporateManagement | `/users/{user-id}/deviceEnrollmentConfigurations/{deviceEnrollmentConfiguration-id}/assignments` |
| UserOnlineMeetingAttendanceReport | -40 | Beta.CloudCommunications, CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/attendanceReports` |
| IdentityGovernanceAccessReviewDecisionInstanceDecisionInsight | -45 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/instance/decisions/{accessReviewInstanceDecisionItem-id1}/insights` |
| IdentityGovernanceAccessReviewDecisionInstanceStageDecisionInsight | -45 | Beta.Identity.Governance | `/identityGovernance/accessReviews/decisions/{accessReviewInstanceDecisionItem-id}/instance/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id1}/insights` |
| IdentityGovernanceAccessReviewDefinitionInstanceStageDecisionInsight | -45 | Beta.Identity.Governance, Identity.Governance | `/identityGovernance/accessReviews/definitions/{accessReviewScheduleDefinition-id}/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id}/insights` |
| IdentityGovernanceAccessReviewInstanceDecisionInsight | -45 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/decisions/{accessReviewInstanceDecisionItem-id}/insights` |
| IdentityGovernanceAccessReviewInstanceDecisionInstanceStageDecisionInsight | -45 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id1}/insights` |
| IdentityGovernanceAccessReviewInstanceStageDecisionInsight | -45 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id}/insights` |
| IdentityGovernanceAccessReviewInstanceStageDecisionInstanceDecisionInsight | -45 | Beta.Identity.Governance | `/identityGovernance/accessReviews/instances/{accessReviewInstance-id}/stages/{accessReviewStage-id}/decisions/{accessReviewInstanceDecisionItem-id}/instance/decisions/{accessReviewInstanceDecisionItem-id1}/insights` |
| RoleManagementCloudPcRoleDefinitionInheritPermissionFrom | -45 | Beta.DeviceManagement.Enrollment | `/roleManagement/cloudPC/roleDefinitions/{unifiedRoleDefinition-id}/inheritsPermissionsFrom` |
| UserOnlineMeetingAiInsight | -45 | Beta.CloudCommunications | `/users/{user-id}/onlineMeetings/{onlineMeeting-id}/aiInsights` |
| UserProfileEducationalActivity | -45 | Beta.People | `/users/{user-id}/profile/educationalActivities` |
| RoleManagementEnterpriseAppRoleAssignmentSchedule | -50 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleAssignmentSchedules` |
| RoleManagementEnterpriseAppRoleEligibilitySchedule | -50 | Beta.Identity.Governance | `/roleManagement/enterpriseApps/{rbacApplication-id}/roleEligibilitySchedules` |
| UserActivityStatistics | -50 | Beta.People | `/users/{user-id}/analytics/activityStatistics` |
| GroupTeamChannelPlannerPlan | -60 | Beta.Teams | `/groups/{group-id}/team/channels/{channel-id}/planner/plans` |
| GroupTeamChannelPlannerPlanBucket | -60 | Beta.Teams | `/groups/{group-id}/team/channels/{channel-id}/planner/plans/{plannerPlan-id}/buckets` |
| GroupTeamChannelPlannerPlanBucketTask | -60 | Beta.Teams | `/groups/{group-id}/team/channels/{channel-id}/planner/plans/{plannerPlan-id}/buckets/{plannerBucket-id}/tasks` |
| GroupTeamChannelPlannerPlanTask | -60 | Beta.Teams | `/groups/{group-id}/team/channels/{channel-id}/planner/plans/{plannerPlan-id}/tasks` |
| GroupTeamPrimaryChannelPlannerPlan | -60 | Beta.Teams | `/groups/{group-id}/team/primaryChannel/planner/plans` |
| GroupTeamPrimaryChannelPlannerPlanBucket | -60 | Beta.Teams | `/groups/{group-id}/team/primaryChannel/planner/plans/{plannerPlan-id}/buckets` |
| GroupTeamPrimaryChannelPlannerPlanBucketTask | -60 | Beta.Teams | `/groups/{group-id}/team/primaryChannel/planner/plans/{plannerPlan-id}/buckets/{plannerBucket-id}/tasks` |
| GroupTeamPrimaryChannelPlannerPlanTask | -60 | Beta.Teams | `/groups/{group-id}/team/primaryChannel/planner/plans/{plannerPlan-id}/tasks` |
| NetworkAccessConnectivityRemoteNetworkForwardingProfilePolicy | -60 | Beta.NetworkAccess | `/networkAccess/connectivity/remoteNetworks/{remoteNetwork-id}/forwardingProfiles/{forwardingProfile-id}/policies` |
| TeamChannelPlannerPlanBucket | -60 | Beta.Teams | `/teams/{team-id}/channels/{channel-id}/planner/plans/{plannerPlan-id}/buckets` |
| TeamChannelPlannerPlanBucketTask | -60 | Beta.Teams | `/teams/{team-id}/channels/{channel-id}/planner/plans/{plannerPlan-id}/buckets/{plannerBucket-id}/tasks` |
| TeamChannelPlannerPlanTask | -60 | Beta.Teams | `/teams/{team-id}/channels/{channel-id}/planner/plans/{plannerPlan-id}/tasks` |
| TeamPrimaryChannelPlannerPlanBucket | -60 | Beta.Teams | `/teams/{team-id}/primaryChannel/planner/plans/{plannerPlan-id}/buckets` |
| TeamPrimaryChannelPlannerPlanBucketTask | -60 | Beta.Teams | `/teams/{team-id}/primaryChannel/planner/plans/{plannerPlan-id}/buckets/{plannerBucket-id}/tasks` |
| TeamPrimaryChannelPlannerPlanTask | -60 | Beta.Teams | `/teams/{team-id}/primaryChannel/planner/plans/{plannerPlan-id}/tasks` |
| TeamworkDeletedTeamChannelPlannerPlan | -60 | Beta.Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/planner/plans` |
| TeamworkDeletedTeamChannelPlannerPlanBucket | -60 | Beta.Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/planner/plans/{plannerPlan-id}/buckets` |
| TeamworkDeletedTeamChannelPlannerPlanBucketTask | -60 | Beta.Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/planner/plans/{plannerPlan-id}/buckets/{plannerBucket-id}/tasks` |
| TeamworkDeletedTeamChannelPlannerPlanTask | -60 | Beta.Teams | `/teamwork/deletedTeams/{deletedTeam-id}/channels/{channel-id}/planner/plans/{plannerPlan-id}/tasks` |
| GroupSiteListItemActivity | -65 | Beta.Sites | `/groups/{group-id}/sites/{site-id}/lists/{list-id}/items/{listItem-id}/activities` |
