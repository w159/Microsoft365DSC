<#
This example creates a new Device Comliance Policy for MacOS.
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
        IntuneDeviceCompliancePolicyMacOS 'IntuneDeviceCompliancePolicyMacOS-Example'
        {
            DisplayName                                 = 'macOS Device Compliance'
            Description                                 = 'Baseline compliance requirements for corporate Macs'
            PasswordRequired                            = $False
            PasswordBlockSimple                         = $False
            PasswordExpirationDays                      = 365
            PasswordMinimumLength                       = 6
            PasswordMinutesOfInactivityBeforeLock       = 5
            PasswordPreviousPasswordBlockCount          = 13
            PasswordMinimumCharacterSetCount            = 1
            PasswordRequiredType                        = 'DeviceDefault'
            OsMinimumVersion                            = 10
            OsMaximumVersion                            = 13
            SystemIntegrityProtectionEnabled            = $False
            DeviceThreatProtectionEnabled               = $False
            DeviceThreatProtectionRequiredSecurityLevel = 'Unavailable'
            StorageRequireEncryption                    = $False
            FirewallEnabled                             = $False
            FirewallBlockAllIncoming                    = $False
            FirewallEnableStealthMode                   = $False
            DeviceCompliancePolicyScript                = MSFT_MicrosoftGraphDeviceCompliancePolicyScript{
                DisplayName  = 'macOS Intune Agent Version Check'
                RulesContent = '{"Rules":[{"SettingName":"IntuneAgentVersion","Operator":"IsEquals","DataType":"String","Operand":"2.24","MoreInfoUrl":"https://contoso.com/compliance","RemediationStrings":[{"Language":"en_US","Title":"Intune Agent must be up to date","Description":"Update the Microsoft Intune Agent app."}]}]}'
            };
            Ensure                                      = 'Present'
            ApplicationId                               = $ApplicationId;
            TenantId                                    = $TenantId;
            CertificateThumbprint                       = $CertificateThumbprint;
        }
    }
}
