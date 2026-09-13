<#
This example adds a new Teams Voice Route.
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
        TeamsVoiceRoute 'TeamsVoiceRoute-Example'
        {
            Identity              = 'NewVoiceRoute'
            Description           = 'Routes North American numbers to the primary SBC pair'
            NumberPattern         = '^\+1(425|206)(\d{7})'
            OnlinePstnGatewayList = @('sbc1.litwareinc.com', 'sbc2.litwareinc.com')
            OnlinePstnUsages      = @('Long Distance', 'Local', 'Internal')
            Priority              = 10
            Ensure                = 'Present'
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
