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
        SCLabelPolicy 'SCLabelPolicy-Example'
        {
            Name                         = "Contoso Label Policy"
            Comment                      = "Publishes the Personal and General labels to all users"
            Labels                       = @("Personal", "General")
            ExchangeLocation             = @("All")
            ExchangeLocationException    = @("shared.reception@contoso.com")
            ModernGroupLocation          = @("All")
            ModernGroupLocationException = @("boardroom@contoso.com")
            AdvancedSettings             = @(
                MSFT_SCLabelSetting{
                    Key   = "RequireDowngradeJustification"
                    Value = "True"
                }
                MSFT_SCLabelSetting{
                    Key   = "AttachmentAction"
                    Value = "Automatic"
                }
            )
            Ensure                       = "Present"
            ApplicationId                = $ApplicationId
            TenantId                     = $TenantId
            CertificateThumbprint        = $CertificateThumbprint
        }
    }
}
