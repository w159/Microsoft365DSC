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
        TeamsCallQueue "TeamsCallQueue-Example"
        {
            Name                                                 = "Contoso Support Queue"
            AgentAlertTime                                       = 30
            AllowOptOut                                          = $true
            DistributionLists                                    = @("36c88f29-faba-4f4a-89a7-e5af29e7095e")
            UseDefaultMusicOnHold                                = $true
            WelcomeTextToSpeechPrompt                            = "Thank you for calling Contoso Support. Your call is important to us."
            OverflowAction                                       = "Forward"
            OverflowActionTarget                                 = "9abce74d-d108-475f-a2cb-bbb82f484982"
            OverflowThreshold                                    = 50
            OverflowActionCallPriority                           = 3
            OverflowDisconnectTextToSpeechPrompt                 = "We are unable to take your call right now. Please try again later."
            OverflowRedirectPersonTextToSpeechPrompt             = "Please hold while we transfer you to the next available supervisor."
            OverflowRedirectVoiceAppTextToSpeechPrompt           = "Transferring you to the Contoso main menu."
            OverflowRedirectPhoneNumberTextToSpeechPrompt        = "Transferring you to our after-hours answering service."
            OverflowRedirectVoicemailTextToSpeechPrompt          = "Please leave a message and a support agent will call you back."
            OverflowSharedVoicemailTextToSpeechPrompt            = "All of our agents are busy. Please leave a message after the tone."
            EnableOverflowSharedVoicemailTranscription           = $true
            EnableOverflowSharedVoicemailSystemPromptSuppression = $false
            TimeoutAction                                        = "Forward"
            TimeoutActionTarget                                  = "9abce74d-d108-475f-a2cb-bbb82f484982"
            TimeoutThreshold                                     = 1200
            TimeoutActionCallPriority                            = 2
            TimeoutDisconnectTextToSpeechPrompt                  = "We were unable to connect you to an agent. Please call back later."
            TimeoutRedirectPersonTextToSpeechPrompt              = "Transferring you to the support supervisor."
            TimeoutRedirectVoiceAppTextToSpeechPrompt            = "Returning you to the Contoso main menu."
            TimeoutRedirectPhoneNumberTextToSpeechPrompt         = "Transferring you to our answering service."
            TimeoutRedirectVoicemailTextToSpeechPrompt           = "Please leave a message and we will return your call."
            TimeoutSharedVoicemailTextToSpeechPrompt             = "Wait times are longer than usual. Please leave a message after the tone."
            EnableTimeoutSharedVoicemailTranscription            = $true
            EnableTimeoutSharedVoicemailSystemPromptSuppression  = $false
            NoAgentAction                                        = "Forward"
            NoAgentActionTarget                                  = "3f7c1b62-9d84-4a5e-8c21-6b0d5e9a4f17"
            NoAgentActionCallPriority                            = 1
            NoAgentApplyTo                                       = "NewCalls"
            NoAgentDisconnectTextToSpeechPrompt                  = "Our support desk is closed. Please call back during business hours."
            NoAgentRedirectPersonTextToSpeechPrompt              = "Transferring you to the duty manager."
            NoAgentRedirectVoiceAppTextToSpeechPrompt            = "Transferring you to the Contoso main menu."
            NoAgentRedirectPhoneNumberTextToSpeechPrompt         = "Transferring you to our answering service."
            NoAgentRedirectVoicemailTextToSpeechPrompt           = "Please leave a message and we will return your call."
            NoAgentSharedVoicemailTextToSpeechPrompt             = "No agents are signed in right now. Please leave a message after the tone."
            EnableNoAgentSharedVoicemailTranscription            = $true
            EnableNoAgentSharedVoicemailSystemPromptSuppression  = $false
            RoutingMethod                                        = "RoundRobin"
            PresenceBasedRouting                                 = $true
            ConferenceMode                                       = $true
            LanguageId                                           = "en-US"
            Users                                                = @("9abce74d-d108-475f-a2cb-bbb82f484982", "3f7c1b62-9d84-4a5e-8c21-6b0d5e9a4f17")
            AuthorizedUsers                                      = @("9abce74d-d108-475f-a2cb-bbb82f484982")
            HideAuthorizedUsers                                  = @("3f7c1b62-9d84-4a5e-8c21-6b0d5e9a4f17")
            OboResourceAccountIds                                = @("8c2e5d41-7b93-4f60-a1d8-2e6c4b9f3057")
            TextAnnouncementForCR                                = "This call may be recorded for quality and compliance purposes."
            TextAnnouncementForCRFailure                         = "Recording is unavailable, so this call will continue unrecorded."
            ComplianceRecordingForCallQueueTemplateId            = @("a7d3f912-4c68-4e05-9b71-3f8a2d6c1e59")
            SharedCallQueueHistoryTemplateId                     = "6e1b8c04-2f75-4a93-8d20-5c7e9a3b1f46"
            AutoRecordingTemplateId                              = "2d5a9f31-8b47-4e62-a0c9-1e7d3b6f4085"
            IsCallbackEnabled                                    = $true
            CallbackRequestDtmf                                  = "Tone1"
            WaitTimeBeforeOfferingCallbackInSecond               = 180
            NumberOfCallsInQueueBeforeOfferingCallback           = 10
            CallToAgentRatioThresholdBeforeOfferingCallback      = 5
            CallbackOfferTextToSpeechPrompt                      = "Press 1 to keep your place in the queue and receive a call back."
            CallbackEmailNotificationTarget                      = "3f7c1b62-9d84-4a5e-8c21-6b0d5e9a4f17"
            ServiceLevelThresholdResponseTimeInSecond            = 30
            ShouldOverwriteCallableChannelProperty               = $true
            ShiftsTeamId                                         = "1c9f4e58-6a2d-4b73-8e05-9d3a7c1f6b24"
            ShiftsSchedulingGroupId                              = "4b8d2a37-5e19-4c86-b30f-7a2c9e5d1f48"
            ChannelId                                            = "19:Y6MG7XdME2Cf9IRmU8PUXNfA1OtqmjyBgCmCGBN2tzY1@thread.tacv2"
            ChannelUserObjectId                                  = "9abce74d-d108-475f-a2cb-bbb82f484982"
            Ensure                                               = "Present"
            ApplicationId                                        = $ApplicationId
            TenantId                                             = $TenantId
            CertificateThumbprint                                = $CertificateThumbprint
        }
    }
}
