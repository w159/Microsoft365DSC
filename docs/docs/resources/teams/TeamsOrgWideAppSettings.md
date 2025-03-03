﻿# TeamsOrgWideAppSettings

## Parameters

| Parameter | Attribute | DataType | Description | Allowed Values |
| --- | --- | --- | --- | --- |
| **IsSingleInstance** | Key | String | Specifies the resource is a single instance, the value must be 'Yes' | `Yes` |
| **IsSideloadedAppsInteractionEnabled** | Write | Boolean | Determines whether or not to allow interaction with custom apps. | |
| **Credential** | Write | PSCredential | Credentials of the Teams Admin | |
| **ManagedIdentity** | Write | Boolean | Managed ID being used for authentication. | |
| **AccessTokens** | Write | StringArray[] | Access token used for authentication. | |


# TeamsOgWideAppSettings

## Description

This resource configures Org-Wide App Settings for Teams.

**This resource currently only supports Credential authentication. Please refer to [Teams PowerShell Application Authentication](https://learn.microsoft.com/en-us/microsoftteams/teams-powershell-application-authentication) for further information.**
## Permissions

### Microsoft Graph

To authenticate with the Microsoft Graph API, this resource required the following permissions:

#### Delegated permissions

- **Read**

    - None

- **Update**

    - None

#### Application permissions

- **Read**

    - Organization.Read.All

- **Update**

    - Organization.Read.All

## Examples

### Example 1

This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.

```powershell
Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $credsCredential
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        TeamsOrgWideAppSettings "TeamsOrgWideAppSettings"
        {
            Credential                         = $credsCredential;
            IsSideloadedAppsInteractionEnabled = $False;
            IsSingleInstance                   = "Yes";
        }
    }
}
```

