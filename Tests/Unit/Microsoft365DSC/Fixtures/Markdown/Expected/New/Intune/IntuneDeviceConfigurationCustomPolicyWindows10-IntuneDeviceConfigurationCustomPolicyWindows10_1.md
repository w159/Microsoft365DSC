# IntuneDeviceConfigurationCustomPolicyWindows10-IntuneDeviceConfigurationCustomPolicyWindows10_1

## Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **DisplayName** | Key | String | Admin provided name of the device configuration. | | IntuneDeviceConfigurationCustomPolicyWindows10_1 |
| **OmaSettings** | Write | MSFT_MicrosoftGraphomaSetting[] | OMA settings. This collection can contain a maximum of 1000 elements. | | MSFT_MicrosoftGraphomaSetting_1,MSFT_MicrosoftGraphomaSetting_2,MSFT_MicrosoftGraphomaSetting_3 |
| **Description** | Write | String | Admin provided description of the Device Configuration. | | IntuneDeviceConfigurationCustomPolicyWindows10_1 |
| **Id** | Write | String | The unique identifier for an entity. Read-only. | | ea99430e-6cec-4ee8-855c-fb7a67f0df1e |
| **Assignments** | Write | MSFT_DeviceManagementConfigurationPolicyAssignments[] | Represents the assignment to the Intune policy. | | MSFT_DeviceManagementConfigurationPolicyAssignments_1,MSFT_DeviceManagementConfigurationPolicyAssignments_2 |
| **Ensure** | Write | String | Present ensures the policy exists, absent ensures it is removed. | `Present`, `Absent` | Present |

### MSFT_DeviceManagementConfigurationPolicyAssignments_1

#### Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **dataType** | Required | String | The type of the target assignment. | `#microsoft.graph.cloudPcManagementGroupAssignmentTarget`, `#microsoft.graph.groupAssignmentTarget`, `#microsoft.graph.allLicensedUsersAssignmentTarget`, `#microsoft.graph.allDevicesAssignmentTarget`, `#microsoft.graph.exclusionGroupAssignmentTarget`, `#microsoft.graph.configurationManagerCollectionAssignmentTarget` | #microsoft.graph.exclusionGroupAssignmentTarget |
| **deviceAndAppManagementAssignmentFilterType** | Write | String | The type of filter of the target assignment i.e. Exclude or Include. Possible values are:none, include, exclude. | `none`, `include`, `exclude` | none |
| **groupId** | Write | String | The group Id that is the target of the assignment. | | 053dc89a-be83-411a-bad3-909904b7239e |
| **groupDisplayName** | Write | String | The group Display Name that is the target of the assignment. | | DummyGroupExclude |

### MSFT_DeviceManagementConfigurationPolicyAssignments_2

#### Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **dataType** | Required | String | The type of the target assignment. | `#microsoft.graph.cloudPcManagementGroupAssignmentTarget`, `#microsoft.graph.groupAssignmentTarget`, `#microsoft.graph.allLicensedUsersAssignmentTarget`, `#microsoft.graph.allDevicesAssignmentTarget`, `#microsoft.graph.exclusionGroupAssignmentTarget`, `#microsoft.graph.configurationManagerCollectionAssignmentTarget` | #microsoft.graph.groupAssignmentTarget |
| **deviceAndAppManagementAssignmentFilterType** | Write | String | The type of filter of the target assignment i.e. Exclude or Include. Possible values are:none, include, exclude. | `none`, `include`, `exclude` | none |
| **groupId** | Write | String | The group Id that is the target of the assignment. | | b0b8fd3f-af2a-453b-be57-80182d599f02 |
| **groupDisplayName** | Write | String | The group Display Name that is the target of the assignment. | | DummyGroupInclude |

### MSFT_MicrosoftGraphomaSetting_1

#### Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **Description** | Write | String | Description. | | Block Duplicated Edge Shortcuts - Custom ADMX |
| **DisplayName** | Write | String | Display Name. | | Block Duplicated Edge Shortcuts - “Custom ADMX” |
| **OmaUri** | Write | String | OMA. | | ./Device/Vendor/MSFT/Policy/ConfigOperations/ADMXInstall/Windows/Policy/WindowsCustomizationsAdmx |
| **Value** | Write | String | Value. (Base64 encoded string) | | 1 |
| **odataType** | Write | String | The type of the entity. | `#microsoft.graph.omaSettingBase64`, `#microsoft.graph.omaSettingBoolean`, `#microsoft.graph.omaSettingDateTime`, `#microsoft.graph.omaSettingFloatingPoint`, `#microsoft.graph.omaSettingInteger`, `#microsoft.graph.omaSettingString`, `#microsoft.graph.omaSettingStringXml` | #microsoft.graph.omaSettingString |

### MSFT_MicrosoftGraphomaSetting_2

#### Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **Description** | Write | String | Description. | | Disable Edge Desktop Shortcut Creation |
| **DisplayName** | Write | String | Display Name. | | Disable Edge Desktop Shortcut Creation |
| **OmaUri** | Write | String | OMA. | | ./Device/Vendor/MSFT/Policy/Config/Windows~Policy~C_Edge/DisableEdgeDesktopShortcutCreation |
| **Value** | Write | String | Value. (Base64 encoded string) | | 1 |
| **odataType** | Write | String | The type of the entity. | `#microsoft.graph.omaSettingBase64`, `#microsoft.graph.omaSettingBoolean`, `#microsoft.graph.omaSettingDateTime`, `#microsoft.graph.omaSettingFloatingPoint`, `#microsoft.graph.omaSettingInteger`, `#microsoft.graph.omaSettingString`, `#microsoft.graph.omaSettingStringXml` | #microsoft.graph.omaSettingString |

### MSFT_MicrosoftGraphomaSetting_3

#### Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **DisplayName** | Write | String | Display Name. | | Store’s Config |
| **IsEncrypted** | Write | Boolean | Indicates whether the value field is encrypted. This property is read-only. | | False |
| **OmaUri** | Write | String | OMA. | | ./Device/Vendor/MSFT/Policy/Config/Citrix~Policy~ICAClient~Storefront/Storefronts |
| **Value** | Write | String | Value. (Base64 encoded string) | | <enabled/>
<data id="Storefronts_Part" value="STORE1&#xF000;%DOMAINSHORTNAME%-TEST;
https://citrix.%DOMAINSHORTNAME%.com/Citrix/%DOMAINSHORTNAME%-TEST/discovery;On;%DOMAINSHORTNAME%"/>
<data id="DefaultStore" value="%DOMAINSHORTNAME%-TEST"/> |
| **odataType** | Write | String | The type of the entity. | `#microsoft.graph.omaSettingBase64`, `#microsoft.graph.omaSettingBoolean`, `#microsoft.graph.omaSettingDateTime`, `#microsoft.graph.omaSettingFloatingPoint`, `#microsoft.graph.omaSettingInteger`, `#microsoft.graph.omaSettingString`, `#microsoft.graph.omaSettingStringXml` | #microsoft.graph.omaSettingString |

## Description

Intune Device Configuration Custom Policy for Windows10

## Permissions

### Graph

To authenticate with the Graph API, this resource requires the following permissions:

#### Delegated permissions

* **Read**
  * GroupMember.Read.All, DeviceManagementConfiguration.ReadWrite.All, DeviceManagementRBAC.Read.All

* **Update**
  * GroupMember.Read.All, DeviceManagementConfiguration.ReadWrite.All, DeviceManagementRBAC.Read.All

#### Application permissions

* **Read**
  * GroupMember.Read.All, DeviceManagementConfiguration.ReadWrite.All, DeviceManagementRBAC.Read.All

* **Update**
  * GroupMember.Read.All, DeviceManagementConfiguration.ReadWrite.All, DeviceManagementRBAC.Read.All
