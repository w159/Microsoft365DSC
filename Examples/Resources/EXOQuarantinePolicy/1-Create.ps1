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
        EXOQuarantinePolicy 'EXOQuarantinePolicy-Example'
        {
            EndUserQuarantinePermissionsValue        = 87;
            ESNEnabled                               = $False;
            Identity                                 = "$TenantId\CorporateQuarantinePolicy";
            CustomDisclaimer                         = "Contact the service desk if you believe a message was quarantined in error.";
            EndUserSpamNotificationCustomFromAddress = "quarantine@$TenantId";
            EndUserSpamNotificationFrequency         = "1.00:00:00";
            EndUserSpamNotificationFrequencyInDays   = "1";
            MultiLanguageCustomDisclaimer            = @("Contact the service desk if you believe a message was quarantined in error.");
            MultiLanguageSenderName                  = @("Contoso Quarantine");
            MultiLanguageSetting                     = @("English");
            OrganizationBrandingEnabled              = $False;
            QuarantinePolicyType                     = "QuarantinePolicy";
            Ensure                                   = "Present"
            ApplicationId                            = $ApplicationId
            TenantId                                 = $TenantId
            CertificateThumbprint                    = $CertificateThumbprint
        }
    }
}
