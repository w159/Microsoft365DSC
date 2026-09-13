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
        SCAutoSensitivityLabelRule 'SCAutoSensitivityLabelRule-Example'
        {
            AccessScope                                  = 'InOrganization'
            AnyOfRecipientAddressContainsWords           = 'accounts.payable'
            AnyOfRecipientAddressMatchesPatterns         = '^[a-z]+\.[a-z]+@contoso\.com'
            Comment                                      = 'Detects when 1 to 9 credit card numbers are contained in Exchange items'
            ContentContainsSensitiveInformation          = MSFT_SCDLPContainsSensitiveInformation{
                operator = 'And'
                Groups   = @(
                    MSFT_SCDLPContainsSensitiveInformationGroup{
                        operator             = 'And'
                        name                 = 'Default'
                        SensitiveInformation = @(
                            MSFT_SCDLPSensitiveInformation{
                                name           = 'Credit Card Number'
                                id             = '50842eb7-edc8-4019-85dd-5a5c1f2bb085'
                                maxconfidence  = '100'
                                minconfidence  = '85'
                                classifiertype = 'Content'
                                mincount       = '1'
                                maxcount       = '9'
                            }
                        )
                    }
                )
            }
            ContentExtensionMatchesWords                 = 'xlsx'
            Disabled                                     = $False
            DocumentIsPasswordProtected                  = $False
            DocumentIsUnsupported                        = $False
            Ensure                                       = 'Present'
            ExceptIfAccessScope                          = 'NotInOrganization'
            ExceptIfAnyOfRecipientAddressContainsWords   = 'archive'
            ExceptIfAnyOfRecipientAddressMatchesPatterns = '^no-reply@contoso\.com'
            ExceptIfContentContainsSensitiveInformation  = MSFT_SCDLPContainsSensitiveInformation{
                operator             = 'And'
                SensitiveInformation = @(
                    MSFT_SCDLPSensitiveInformation{
                        name           = 'U.S. Social Security Number (SSN)'
                        maxconfidence  = '100'
                        minconfidence  = '75'
                        classifiertype = 'Content'
                        mincount       = '1'
                        maxcount       = '9'
                    }
                )
            }
            ExceptIfContentExtensionMatchesWords         = @('pdf', 'png')
            ExceptIfDocumentIsPasswordProtected          = $False
            ExceptIfDocumentIsUnsupported                = $False
            ExceptIfFrom                                 = @('treasury.reports@contoso.com')
            ExceptIfFromAddressContainsWords             = 'no-reply'
            ExceptIfFromAddressMatchesPatterns           = '^billing[0-9]+@contoso\.com'
            ExceptIfFromMemberOf                         = @('internal-audit@contoso.com')
            ExceptIfHeaderMatchesPatterns                = @('Approved by the payments team')
            ExceptIfProcessingLimitExceeded              = $False
            ExceptIfRecipientDomainIs                    = @('fabrikam.com')
            ExceptIfSenderDomainIs                       = @('fabrikam.com')
            ExceptIfSenderIPRanges                       = @('192.168.40.0/24')
            ExceptIfSentTo                               = @('servicedesk@contoso.com')
            ExceptIfSentToMemberOf                       = @('internal-audit@contoso.com')
            ExceptIfSubjectMatchesPatterns               = 'Approved expense claim'
            FromAddressContainsWords                     = 'finance'
            FromAddressMatchesPatterns                   = '^finance\.[a-z]+@contoso\.com'
            HeaderMatchesPatterns                        = MSFT_SCHeaderPattern{
                Name   = 'X-Contoso-Classification'
                Values = @('Restricted', 'Payment-Data')
            }
            Name                                         = 'Credit Card Numbers in Exchange'
            Policy                                       = 'Top Secret Auto-labeling'
            ProcessingLimitExceeded                      = $False
            RecipientDomainIs                            = @('contoso.com')
            ReportSeverityLevel                          = 'Low'
            RuleErrorAction                              = 'Ignore'
            SenderDomainIs                               = @('contoso.com')
            SenderIPRanges                               = @('10.20.30.0/24')
            SentTo                                       = @('accounts.payable@contoso.com')
            SentToMemberOf                               = @('finance-team@contoso.com')
            SubjectMatchesPatterns                       = 'Invoice'
            Workload                                     = 'Exchange'
            ApplicationId                                = $ApplicationId
            TenantId                                     = $TenantId
            CertificateThumbprint                        = $CertificateThumbprint
        }
    }
}
