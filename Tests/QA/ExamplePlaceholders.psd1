@{
    Placeholders = @(
        @{
            Name       = '<api-password>'
            Meaning    = 'Password of the account the API connector authenticates with.'
            Sample     = 'S3cur3P@ssw0rd!'
            Properties = @('Password')
        }
        @{
            Name       = '<apple-push-certificate>'
            Meaning    = 'Base64 Apple MDM push notification certificate.'
            Sample     = 'MIIFdjCCBF6gAwIBAgIIMVIk4qQ3QnQwDQYJKoZIhvcNAQELBQAwgYwxQDA+BgNVBAMMN0FwcGxlIEFwcGxpY2F0aW9u...'
            Properties = @('Certificate')
        }
        @{
            Name       = '<apple-push-certificate-updated>'
            Meaning    = 'Renewed Apple MDM push notification certificate.'
            Sample     = 'MIIFdjCCBF6gAwIBAgIIRnE2p1TgVkYwDQYJKoZIhvcNAQELBQAwgYwxQDA+BgNVBAMMN0FwcGxlIEFwcGxpY2F0aW9u...'
            Properties = @('Certificate')
        }
        @{
            Name       = '<application-id>'
            Meaning    = 'Application (client) ID of an Entra application registration.'
            Sample     = 'e35c54ff-bd24-4c52-921a-4b90a35808eb'
            Properties = @('AppId', 'ExternalCloudAuthorizedApplicationId', 'ManagementServiceAppId')
        }
        @{
            Name       = '<application-id-updated>'
            Meaning    = 'Application (client) ID the update example switches to.'
            Sample     = 'c1a3d8f2-5b47-4e19-9f0a-2d6b8e4c7a35'
            Properties = @('AppId')
        }
        @{
            Name       = '<audio-file-id>'
            Meaning    = 'ID returned by Import-CsOnlineAudioFile for a file uploaded to the tenant.'
            Sample     = '3c1e1b0a-9f47-4b8a-bb2c-6d0e5a7c9142'
            Properties = @('AudioFileId')
        }
        @{
            Name       = '<billing-account-id>'
            Meaning    = 'ID of the Azure billing account, as it appears in the billingAccounts segment of a resource ID.'
            Sample     = '1e5b9e50-a1ea-581e-fb3a-778b93a06854:6487d5cf-0a7b-42e6-9549-23ca1b2c3d4e_2019-05-31'
            Properties = @('BillingAccount', 'View')
        }
        @{
            Name       = '<base64-encoded-app-icon>'
            Meaning    = 'Base64 icon shown for an app in Company Portal.'
            Sample     = 'iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwY...'
            Properties = @('LargeIcon')
        }
        @{
            Name       = '<base64-encoded-certificate>'
            Meaning    = 'Base64 public certificate.'
            Sample     = 'MIIDPzCCAiegAwIBAgIQPbcHnHzTkKtCj4d0eOR7QDANBgkqhkiG9w0BAQsFADAg...'
            Properties = @('Certificate', 'CertificateFile')
        }
        @{
            Name       = '<base64-encoded-certificate-2>'
            Meaning    = 'Second base64 public certificate, where a property takes more than one.'
            Sample     = 'MIIDQzCCAiugAwIBAgIRAJkLmW2sVqT8Xh1FbN4pRc0wDQYJKoZIhvcNAQELBQAw...'
            Properties = @('Certificate')
        }
        @{
            Name       = '<base64-encoded-signing-certificate>'
            Meaning    = 'Base64 token-signing certificate of the federated identity provider.'
            Sample     = 'MIIDdzCCAl+gAwIBAgIQXWWjEQHsCgAAAABBAgAAYDANBgkqhkiG9w0BAQsFADA3...'
            Properties = @('SigningCertificate')
        }
        @{
            Name       = '<base64-encoded-next-signing-certificate>'
            Meaning    = 'Base64 signing certificate staged for the next rollover.'
            Sample     = 'MIIDdzCCAl+gAwIBAgIQYZZkFRHsCgAAAABBAgAAYDANBgkqhkiG9w0BAQsFADA3...'
            Properties = @('NextSigningCertificate')
        }
        @{
            Name       = '<base64-encoded-default-associations>'
            Meaning    = 'Base64 of the Windows default application associations XML a policy deploys.'
            Sample     = 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48RGVmYXVsdEFzc29jaWF0aW9ucz4...'
            Properties = @('Settings')
        }
        @{
            Name       = '<base64-encoded-landing-page-image>'
            Meaning    = 'Base64 hero image shown on the Company Portal apps landing page.'
            Sample     = '/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBk...'
            Properties = @('LandingPageCustomizedImage')
        }
        @{
            Name       = '<base64-encoded-light-background-logo>'
            Meaning    = 'Base64 logo shown in Company Portal on a light background.'
            Sample     = 'iVBORw0KGgoAAAANSUhEUgAAAZAAAABkCAYAAACaeFuKAAAACXBIWXMAAAsTAAALEwE...'
            Properties = @('LightBackgroundLogo')
        }
        @{
            Name       = '<base64-encoded-mobileconfig>'
            Meaning    = 'Base64 of the .mobileconfig or .xml payload file a custom policy deploys.'
            Sample     = 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48IURPQ1RZUEUgcGxpc3Q...'
            Properties = @('Payload')
        }
        @{
            Name       = '<base64-encoded-wallpaper-image>'
            Meaning    = 'Base64 wallpaper image pushed to supervised devices.'
            Sample     = 'iVBORw0KGgoAAAANSUhEUgAABAAAAAcACAYAAAD3JBRuAAAACXBIWXMAAAsTAAALEwEAmpwY...'
            Properties = @('WallpaperImage')
        }
        @{
            Name       = '<base64-encoded-theme-color-logo>'
            Meaning    = 'Base64 logo shown in Company Portal on the theme-colour background.'
            Sample     = 'iVBORw0KGgoAAAANSUhEUgAAAZAAAABkCAYAAACaeFuKAAAACXBIWXMAAAsTAAALEwG...'
            Properties = @('ThemeColorLogo')
        }
        @{
            Name       = '<base64-encoded-root-certificate>'
            Meaning    = 'Base64 trusted root certificate.'
            Sample     = 'MIIEEjCCAvqgAwIBAgIPAMEAizw8iBHRPvZj7N9AMA0GCSqGSIb3DQEBBAUAMHAx...'
            Properties = @('TrustedRootCertificate', 'trustedRootCertificate')
        }
        @{
            Name       = '<base64-encoded-root-certificate-updated>'
            Meaning    = 'Renewed trusted root certificate, so the update example differs from the create example.'
            Sample     = 'MIIEEjCCAvqgAwIBAgIPAJ2rQmT4XkNbLc8Vd1HpMA0GCSqGSIb3DQEBBAUAMHAx...'
            Properties = @('trustedRootCertificate')
        }
        @{
            Name       = '<certificate-thumbprint>'
            Meaning    = 'Thumbprint of a certificate installed on the machine running the configuration.'
            Sample     = 'ABCDEF1234567890ABCDEF1234567890ABCDEF12'
            Properties = @('CertificateThumbprint', 'CertificateThumbprints')
        }
        @{
            Name       = '<client-id>'
            Meaning    = 'Client ID issued by an external identity provider.'
            Sample     = '7698a352-4939-486e-9974-4ea5aff93f74'
            Properties = @('clientId')
        }
        @{
            Name       = '<client-secret>'
            Meaning    = 'Client secret issued by an external identity provider.'
            Sample     = 'aBc8Q~vR2pLmXaHt9_ZyXwVu1TsRqPoN3MlKjIhG'
            Properties = @('ClientSecret')
        }
        @{
            Name       = '<client-secret-updated>'
            Meaning    = 'Rotated client secret, so the update example differs from the create example.'
            Sample     = 'dEf4W~kTn7QbYcRz2_XvUtSrQpOnMlKjIhGfEdCb'
            Properties = @('ClientSecret')
        }
        @{
            Name       = '<defender-machine-id>'
            Meaning    = 'Defender for Endpoint device ID of a machine already onboarded in the tenant.'
            Sample     = '55c636a37ff1a21a3241437eb6ce158812a4f9c1'
            Properties = @('machineId')
        }
        @{
            Name       = '<defender-scan-agent-id>'
            Meaning    = 'ID of a registered Defender authenticated-scan agent.'
            Sample     = 'c819dc6d-f9fe-4d05-8022-88a34766442d_55c636a37ff1a21a3241437eb6ce158812a4f9c1'
            Properties = @('id')
        }
        @{
            Name       = '<domain-join-password>'
            Meaning    = 'Password of the account used to join devices to the on-premises domain.'
            Sample     = 'J0inD0m@in!2026'
            Properties = @('AdDomainPassword')
        }
        @{
            Name       = '<event-hub-authorization-rule-id>'
            Meaning    = 'Resource ID of the Event Hub authorization rule that receives the diagnostic stream.'
            Sample     = '/subscriptions/63e62ab2-fd92-46ce-a393-2cb338039cc7/resourceGroups/monitoring/providers/Microsoft.EventHub/namespaces/contoso-hub/authorizationRules/RootManageSharedAccessKey'
            Properties = @('EventHubAuthorizationRuleId')
        }
        @{
            Name       = '<invoice-section-id>'
            Meaning    = 'Resource ID of the billing invoice section a subscription is created under.'
            Sample     = '/providers/Microsoft.Billing/billingAccounts/0b32abd9-f0e6-4fc9-8b2f-404350313179:0b32abd9-f0e6-4fc9-8b2f-404350313179_2019-05-31/billingProfiles/OHZY-JSSA-BG7-M77W-XXX/invoiceSections/E6RO-KYS7-P2D-MAOR-SGB'
            Properties = @('InvoiceSectionId')
        }
        @{
            Name       = '<issuing-ca-certificate-hash>'
            Meaning    = 'Thumbprint of the certification authority certificate that issues the single sign-on certificates.'
            Sample     = '9F2B4C7D1E8A0356BD4F71C29A6E3D80B5471FEC'
            Properties = @('SingleSignOnIssuerHash')
        }
        @{
            Name       = '<key-vault-key-uri>'
            Meaning    = 'Full URI of a key in Azure Key Vault, including the key version.'
            Sample     = 'https://contoso-eastus-kv.vault.azure.net/keys/MailboxKey01/4a1e9c8b7d6f4a2b9c3d5e7f1a2b3c4d'
            Properties = @('AzureKeyIDs')
        }
        @{
            Name       = '<kiosk-mode-exit-code>'
            Meaning    = 'PIN an administrator enters to pause kiosk mode on a dedicated device.'
            Sample     = '135791'
            Properties = @('KioskModeExitCode')
        }
        @{
            Name       = '<key-vault-uri>'
            Meaning    = 'Base URI of an Azure Key Vault.'
            Sample     = 'https://contoso-eastus-kv.vault.azure.net/'
            Properties = @('ResourceUrl')
        }
        @{
            Name       = '<log-analytics-workspace-id>'
            Meaning    = 'ID of the Log Analytics workspace a device reports to.'
            Sample     = '4d7f2a91-6c38-4b5e-9f10-2ab8c7d6e504'
            Properties = @('AzureOperationalInsightsWorkspaceId')
        }
        @{
            Name       = '<log-analytics-workspace-key>'
            Meaning    = 'Primary key of that Log Analytics workspace.'
            Sample     = 'k9Ql3ZzR7mXpT2vNbF8sJd1WqYhC6uAoE4gK0iLxRt5cP7nMwB3eS2yUvHj9Fa=='
            Properties = @('AzureOperationalInsightsWorkspaceKey')
        }
        @{
            Name       = '<log-analytics-workspace-name>'
            Meaning    = 'Name of the Log Analytics workspace Microsoft Sentinel is enabled on.'
            Sample     = 'contoso-sentinel-eastus'
            Properties = @('WorkspaceName')
        }
        @{
            Name       = '<log-analytics-workspace-resource-id>'
            Meaning    = 'Resource ID of the Log Analytics workspace that receives the diagnostic stream.'
            Sample     = '/subscriptions/63e62ab2-fd92-46ce-a393-2cb338039cc7/resourceGroups/monitoring/providers/Microsoft.OperationalInsights/workspaces/contoso-logs'
            Properties = @('WorkspaceId')
        }
        @{
            Name       = '<mobile-app-id>'
            Meaning    = 'ID of a mobile app already published in the tenant.'
            Sample     = '2f8b6f0a-1c3d-4e5f-9a8b-7c6d5e4f3a2b'
            Properties = @('TargetedMobileApps')
        }
        @{
            Name       = '<onboarding-blob>'
            Meaning    = 'Defender for Endpoint onboarding blob, taken from the Defender portal.'
            Sample     = '<EncryptedMessage xmlns="http://schemas.datacontract.org/2004/07/Microsoft.Management.Services.Common.Cryptography">...</EncryptedMessage>'
            Properties = @('AdvancedThreatProtectionOnboardingBlob', 'ConfigurationBlob')
        }
        @{
            Name       = '<offboarding-blob>'
            Meaning    = 'Defender for Endpoint offboarding blob, taken from the Defender portal.'
            Sample     = '<EncryptedMessage xmlns="http://schemas.datacontract.org/2004/07/Microsoft.Management.Services.Common.Cryptography">...</EncryptedMessage>'
            Properties = @('AdvancedThreatProtectionOffboardingBlob')
        }
        @{
            Name       = '<planner-plan-id>'
            Meaning    = 'Graph ID of a Planner plan; buckets and tasks can only address a plan by this ID.'
            Sample     = 'xqQg5FS2LkCp935s-FIFm2QAFkHM'
            Properties = @('PlanId')
        }
        @{
            Name       = '<power-platform-environment-name>'
            Meaning    = 'Internal name of a Power Platform environment, not its display name.'
            Sample     = 'Default-e91d4e0e-d5a5-4e3a-be14-2192592a59af'
            Properties = @('Environments')
        }
        @{
            Name       = '<power-platform-environment-name-2>'
            Meaning    = 'Second Power Platform environment name, where an example scopes to more than one.'
            Sample     = '8a6f3c21-47bd-4e0f-9a12-5c7d3b8e1f04'
            Properties = @('Environments')
        }
        @{
            Name       = '<resource-group-name>'
            Meaning    = 'Name of the Azure resource group holding the resource the example targets.'
            Sample     = 'rg-security-eastus'
            Properties = @('ResourceGroupName')
        }
        @{
            Name       = '<rms-template-id>'
            Meaning    = 'ID of the Azure Rights Management template used to encrypt protected files, which exists only in the tenant that created it.'
            Sample     = 'f7a2c1d4-9b83-4e56-a0cf-3d81b26e4f90'
            Properties = @('RightsManagementServicesTemplateId')
        }
        @{
            Name       = '<rule-package-xml>'
            Meaning    = 'XML rule-package definition for a custom sensitive information type, authored by the administrator.'
            Sample     = '<RulePackage xmlns="http://schemas.microsoft.com/office/2011/mce"><RulePack id="a8b9c0d1-4e2f-4a51-9c83-7b6d5e4f3a21"><Version major="1" minor="0" build="0" revision="0"/>...</RulePack></RulePackage>'
            Properties = @('XmlFileData')
        }
        @{
            Name       = '<rule-package-xml-updated>'
            Meaning    = 'Revised rule-package XML, so the update example differs from the create example.'
            Sample     = '<RulePackage xmlns="http://schemas.microsoft.com/office/2011/mce"><RulePack id="a8b9c0d1-4e2f-4a51-9c83-7b6d5e4f3a21"><Version major="1" minor="1" build="0" revision="0"/>...</RulePack></RulePackage>'
            Properties = @('XmlFileData')
        }
        @{
            Name       = '<root-certificate-thumbprint>'
            Meaning    = 'Thumbprint of a root certificate present on the managed device, not on the machine running the configuration.'
            Sample     = 'a5f3c1d97b26e480f5c3a1b98d7e6f04c2b3a591'
            Properties = @('ApplicationGuardCertificateThumbprints')
        }
        @{
            Name       = '<service-bus-rule-id>'
            Meaning    = 'Resource ID of the Service Bus authorization rule that receives the diagnostic stream.'
            Sample     = '/subscriptions/63e62ab2-fd92-46ce-a393-2cb338039cc7/resourceGroups/monitoring/providers/Microsoft.ServiceBus/namespaces/contoso-bus/authorizationRules/RootManageSharedAccessKey'
            Properties = @('ServiceBusRuleId')
        }
        @{
            Name       = '<snmp-auth-password>'
            Meaning    = 'SNMPv3 authentication password used by a network scanner.'
            Sample     = 'Sn0mpAuth!2026'
            Properties = @('AuthPassword')
        }
        @{
            Name       = '<snmp-priv-password>'
            Meaning    = 'SNMPv3 privacy password used by a network scanner.'
            Sample     = 'Sn0mpPriv!2026'
            Properties = @('PrivPassword')
        }
        @{
            Name       = '<storage-account-resource-id>'
            Meaning    = 'Resource ID of the storage account that receives the diagnostic stream.'
            Sample     = '/subscriptions/63e62ab2-fd92-46ce-a393-2cb338039cc7/resourceGroups/monitoring/providers/Microsoft.Storage/storageAccounts/contosodiagnostics'
            Properties = @('StorageAccountId')
        }
        @{
            Name       = '<teams-app-id>'
            Meaning    = 'ID of a third-party Teams app, which exists only in the tenant that published it.'
            Sample     = 'd9f4c1b7-3a26-4e58-b0d3-6e91f2a75c48'
            Properties = @('DefaultFileUploadAppId')
        }
        @{
            Name       = '<token-encryption-key-id>'
            Meaning    = 'Key id of a certificate already present on the service principal, used to encrypt issued tokens.'
            Sample     = 'a7f3c9d1-6e42-4b58-90ac-5d2e1b874f36'
            Properties = @('TokenEncryptionKeyId')
        }
        @{
            Name       = '<wifi-pre-shared-key>'
            Meaning    = 'Pre-shared key of a WPA-Personal Wi-Fi network.'
            Sample     = 'Contoso!Corp2026Wifi'
            Properties = @('PreSharedKey')
        }
        @{
            Name       = '<subscription-id>'
            Meaning    = 'ID of the Azure subscription the resource lives in.'
            Sample     = '63e62ab2-fd92-46ce-a393-2cb338039cc7'
            Properties = @('SubscriptionId')
        }
        @{
            Name       = '<subscription-scope>'
            Meaning    = 'Scope a role definition is assignable at.'
            Sample     = '/subscriptions/63e62ab2-fd92-46ce-a393-2cb338039cc7'
            Properties = @('AssignableScopes')
        }
    )
}
