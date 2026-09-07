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
        AADServicePrincipal 'AADServicePrincipal-Example'
        {
            AppId                     = "<application-id>"
            DisplayName               = "AppDisplayName"
            AlternativeNames          = "AlternativeName1","AlternativeName2"
            AccountEnabled            = $true
            AppRoleAssignmentRequired = $false
            Homepage                  = "https://$TenantId"
            LoginUrl                  = "https://$TenantId/login"
            LogoutUrl                 = "https://$TenantId/logout"
            ReplyURLs                 = "https://$TenantId"
            ServicePrincipalType      = "Application"
            Tags                      = "{WindowsAzureActiveDirectoryIntegratedApp}"
            ErrorUrl                  = "https://$TenantId/error"
            Notes                     = "Service principal used by the expense reporting application."
            PublisherName             = "Contoso"
            Owners                    = @("admin@$TenantId")
            PreferredSingleSignOnMode = "notSupported"
            SamlMetadataUrl           = "https://$TenantId/saml/metadata"
            PasswordCredentials       = @(
                MSFT_MicrosoftGraphpasswordCredential{
                    DisplayName   = "Expense Reporting Secret"
                    StartDateTime = "2026-01-01T00:00:00.0000000Z"
                    EndDateTime   = "2027-01-01T00:00:00.0000000Z"
                }
            )
            Ensure                    = "Present"
            ApplicationId             = $ApplicationId
            TenantId                  = $TenantId
            CertificateThumbprint     = $CertificateThumbprint
        }
    }
}
