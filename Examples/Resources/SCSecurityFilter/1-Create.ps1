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
        SCSecurityFilter 'SCSecurityFilter-Example'
        {
            FilterName            = "My Filter Name"
            Action                = "All"
            Users                 = @("jonh.doe@1234.onmicrosoft.com")
            Description           = "Limits eDiscovery searches to Australian mailboxes"
            Filters               = @("Mailbox_CountryCode -eq '124'")
            Region                = "AUS"
            Ensure                = "Present"
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
