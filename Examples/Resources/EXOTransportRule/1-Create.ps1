<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

configuration Example
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
        EXOTransportRule 'EXOTransportRule-Example'
        {
            Name                                         = 'Ethical Wall - Sales and Executives Departments'
            ADComparisonAttribute                        = "Department"
            ADComparisonOperator                         = "NotEqual"
            ActivationDate                               = "2026-01-01T00:00:00.0000000Z"
            AddManagerAsRecipientType                    = "Cc"
            AddToRecipients                              = @("AlexW@$TenantId")
            AnyOfCcHeader                                = @("AlexW@$TenantId")
            AnyOfCcHeaderMemberOf                        = @("Executives@$TenantId")
            AnyOfRecipientAddressContainsWords           = @("sales", "executive")
            AnyOfRecipientAddressMatchesPatterns         = @("^exec")
            AnyOfToCcHeader                              = @("Executives@$TenantId")
            AnyOfToCcHeaderMemberOf                      = @("Executives@$TenantId")
            AnyOfToHeader                                = @("Executives@$TenantId")
            AnyOfToHeaderMemberOf                        = @("Executives@$TenantId")
            ApplyHtmlDisclaimerFallbackAction            = "Ignore"
            ApplyHtmlDisclaimerLocation                  = "Append"
            ApplyHtmlDisclaimerText                      = "<p>This message crossed the information barrier between the Sales and the Executives departments and has been recorded for compliance review.</p>"
            AttachmentContainsWords                      = @("Confidential", "Deal Sheet")
            AttachmentExtensionMatchesWords              = @("docx", "xlsx", "pptx")
            AttachmentHasExecutableContent               = $false
            AttachmentIsPasswordProtected                = $false
            AttachmentIsUnsupported                      = $false
            AttachmentMatchesPatterns                    = @("Project Aurora")
            AttachmentNameMatchesPatterns                = @("Board-", "Deal-")
            AttachmentProcessingLimitExceeded            = $false
            AttachmentPropertyContainsWords              = @("Classification:Confidential")
            AttachmentSizeOver                           = "2MB"
            BetweenMemberOf1                             = @("SalesTeam@$TenantId")
            BetweenMemberOf2                             = @("Executives@$TenantId")
            BlindCopyTo                                  = @("admin@$TenantId")
            Comments                                     = "Records mail crossing the information barrier between the Sales and the Executives departments while the barrier is being piloted."
            ContentCharacterSetContainsWords             = @("iso-8859-1", "windows-1252")
            CopyTo                                       = @("LegalTeam@$TenantId")
            Enabled                                      = $true
            ExceptIfADComparisonAttribute                = "Company"
            ExceptIfADComparisonOperator                 = "Equal"
            ExceptIfAnyOfCcHeader                        = @("LegalTeam@$TenantId")
            ExceptIfAnyOfCcHeaderMemberOf                = @("LegalTeam@$TenantId")
            ExceptIfAnyOfRecipientAddressContainsWords   = @("legal", "compliance")
            ExceptIfAnyOfRecipientAddressMatchesPatterns = @("^legal")
            ExceptIfAnyOfToCcHeader                      = @("LegalTeam@$TenantId")
            ExceptIfAnyOfToCcHeaderMemberOf              = @("LegalTeam@$TenantId")
            ExceptIfAnyOfToHeader                        = @("LegalTeam@$TenantId")
            ExceptIfAnyOfToHeaderMemberOf                = @("LegalTeam@$TenantId")
            ExceptIfAttachmentContainsWords              = @("Approved by Legal")
            ExceptIfAttachmentExtensionMatchesWords      = @("txt", "csv")
            ExceptIfAttachmentHasExecutableContent       = $true
            ExceptIfAttachmentIsPasswordProtected        = $true
            ExceptIfAttachmentIsUnsupported              = $true
            ExceptIfAttachmentMatchesPatterns            = @("Approved by Legal")
            ExceptIfAttachmentNameMatchesPatterns        = @("Public-")
            ExceptIfAttachmentPropertyContainsWords      = @("Classification:Public")
            ExceptIfAttachmentProcessingLimitExceeded    = $true
            ExceptIfAttachmentSizeOver                   = "20MB"
            ExceptIfBetweenMemberOf1                     = @("LegalTeam@$TenantId")
            ExceptIfBetweenMemberOf2                     = @("Executives@$TenantId")
            ExceptIfContentCharacterSetContainsWords     = @("utf-8")
            ExceptIfFrom                                 = @("AdeleV@$TenantId")
            ExceptIfFromAddressContainsWords             = @("legal")
            ExceptIfFromAddressMatchesPatterns           = @("^legal")
            ExceptIfFromMemberOf                         = @("LegalTeam@$TenantId")
            ExceptIfFromScope                            = "NotInOrganization"
            ExceptIfHasNoClassification                  = $true
            ExceptIfHeaderContainsMessageHeader          = "X-Legal-Review"
            ExceptIfHeaderContainsWords                  = @("Approved", "Cleared")
            ExceptIfHeaderMatchesMessageHeader           = "X-Legal-Exemption"
            ExceptIfHeaderMatchesPatterns                = @("Legal-Hold")
            ExceptIfManagerAddresses                     = @("AlexW@$TenantId")
            ExceptIfManagerForEvaluatedUser              = "Recipient"
            ExceptIfMessageTypeMatches                   = "AutoForward"
            ExceptIfMessageSizeOver                      = "25MB"
            ExceptIfRecipientADAttributeContainsWords    = @("Department:Legal")
            ExceptIfRecipientADAttributeMatchesPatterns  = @("Title:^General Counsel")
            ExceptIfRecipientAddressContainsWords        = @("legal")
            ExceptIfRecipientAddressMatchesPatterns      = @("^legal")
            ExceptIfRecipientDomainIs                    = @("fabrikam.com")
            ExceptIfSCLOver                              = "8"
            ExceptIfSenderADAttributeContainsWords       = @("Department:Legal")
            ExceptIfSenderADAttributeMatchesPatterns     = @("Title:^General Counsel")
            ExceptIfSenderDomainIs                       = @("fabrikam.com")
            ExceptIfSenderIpRanges                       = @("192.168.20.0/24")
            ExceptIfSenderManagementRelationship         = "DirectReport"
            ExceptIfSentTo                               = @("AlexW@$TenantId")
            ExceptIfSentToMemberOf                       = @("LegalTeam@$TenantId")
            ExceptIfSentToScope                          = "ExternalPartner"
            ExceptIfSubjectContainsWords                 = @("Press Release", "Corporate Communication")
            ExceptIfSubjectMatchesPatterns               = @("^Approved")
            ExceptIfSubjectOrBodyContainsWords           = @("Approved by Legal")
            ExceptIfSubjectOrBodyMatchesPatterns         = @("Legal Review Complete")
            ExceptIfWithImportance                       = "Low"
            ExpiryDate                                   = "2027-01-01T00:00:00.0000000Z"
            From                                         = @("AlexW@$TenantId")
            FromAddressContainsWords                     = @("sales")
            FromAddressMatchesPatterns                   = @("^sales")
            FromMemberOf                                 = @("SalesTeam@$TenantId")
            FromScope                                    = "InOrganization"
            GenerateIncidentReport                       = "admin@$TenantId"
            GenerateNotification                         = "<p>Your message crossed the information barrier between the Sales and the Executives departments and has been recorded for compliance review.</p>"
            HasNoClassification                          = $false
            HeaderContainsMessageHeader                  = "X-Message-Classification"
            HeaderContainsWords                          = @("Confidential", "Restricted")
            HeaderMatchesMessageHeader                   = "X-Project-Code"
            HeaderMatchesPatterns                        = @("Aurora", "Northwind")
            IncidentReportContent                        = @("Sender", "Recipients", "Subject", "CreatedTime", "Severity")
            ManagerAddresses                             = @("AdeleV@$TenantId")
            ManagerForEvaluatedUser                      = "Sender"
            MessageSizeOver                              = "10MB"
            MessageTypeMatches                           = "Encrypted"
            Mode                                         = "Audit"
            PrependSubject                               = "[Ethical Wall]"
            Priority                                     = 0
            RecipientADAttributeContainsWords            = @("Department:Executives")
            RecipientADAttributeMatchesPatterns          = @("Title:^Chief")
            RecipientAddressContainsWords                = @("exec")
            RecipientAddressMatchesPatterns              = @("^exec")
            RecipientAddressType                         = "Resolved"
            RecipientDomainIs                            = @("$TenantId")
            RemoveHeader                                 = "X-Information-Barrier-Reviewed"
            RouteMessageOutboundRequireTls               = $true
            RuleErrorAction                              = "Ignore"
            RuleSubType                                  = "None"
            SCLOver                                      = "5"
            SenderADAttributeContainsWords               = @("Department:Sales")
            SenderADAttributeMatchesPatterns             = @("Title:^Account")
            SenderAddressLocation                        = "HeaderOrEnvelope"
            SenderDomainIs                               = @("$TenantId")
            SenderIpRanges                               = @("192.168.10.0/24")
            SenderManagementRelationship                 = "Manager"
            SentTo                                       = @("AdeleV@$TenantId")
            SentToMemberOf                               = @("Executives@$TenantId")
            SentToScope                                  = "InOrganization"
            SetAuditSeverity                             = "Medium"
            SetHeaderName                                = "X-Information-Barrier"
            SetHeaderValue                               = "Sales-Executives"
            SetSCL                                       = "0"
            StopRuleProcessing                           = $false
            SubjectContainsWords                         = @("Confidential", "Board Deck")
            SubjectMatchesPatterns                       = @("Project Aurora")
            SubjectOrBodyContainsWords                   = @("Deal Sheet", "Term Sheet")
            SubjectOrBodyMatchesPatterns                 = @("Project (Aurora|Northwind)")
            WithImportance                               = "High"
            Ensure                                       = 'Present'
            ApplicationId                                = $ApplicationId
            TenantId                                     = $TenantId
            CertificateThumbprint                        = $CertificateThumbprint
        }
    }
}
