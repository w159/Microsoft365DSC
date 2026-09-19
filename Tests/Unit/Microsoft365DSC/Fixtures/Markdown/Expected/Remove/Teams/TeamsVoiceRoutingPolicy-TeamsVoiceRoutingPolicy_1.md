# TeamsVoiceRoutingPolicy-TeamsVoiceRoutingPolicy_1

## Parameters

| Parameter | Attribute | DataType | Description | Allowed Values | Value |
| --- | --- | --- | --- | --- | --- |
| **Identity** | Key | String | Identity of the Teams Voice Routing Policy. | | TeamsVoiceRoutingPolicy_1 |
| **OnlinePstnUsages** | Write | String[] | A list of online PSTN usages (such as Local or Long Distance) that can be applied to this online voice routing policy. The online PSTN usage must be an existing usage (PSTN usages can be retrieved by calling the Get-CsOnlinePstnUsage cmdlet). | | Local,Long Distance |
| **Ensure** | Write | String | Present ensures the policy exists, absent ensures it is removed. | `Present`, `Absent` | Absent |

## Description

This resource configures a Teams Voice Routing Policy.

More information: <https://docs.microsoft.com/en-us/microsoftteams/manage-voice-routing-policies/>

## Permissions
