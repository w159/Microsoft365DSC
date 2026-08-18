[CmdletBinding()]
param(
)
$M365DSCTestFolder = Join-Path -Path $PSScriptRoot `
    -ChildPath '..\..\Unit' `
    -Resolve
$CmdletModule = (Join-Path -Path $M365DSCTestFolder `
        -ChildPath '\Stubs\Microsoft365.psm1' `
        -Resolve)
$GenericStubPath = (Join-Path -Path $M365DSCTestFolder `
        -ChildPath '\Stubs\Generic.psm1' `
        -Resolve)
Import-Module -Name (Join-Path -Path $M365DSCTestFolder `
        -ChildPath '\UnitTestHelper.psm1' `
        -Resolve)

$Global:DscHelper = New-M365DscUnitTestHelper -StubModule $CmdletModule `
    -DscResource 'AADConditionalAccessPolicy' -GenericStubModule $GenericStubPath

Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope

        BeforeAll {
            $secpasswd = ConvertTo-SecureString ((New-Guid).ToString()) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@mydomain.com', $secpasswd)

            Mock -ModuleName M365DSCUtil -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName Get-MSCloudLoginConnectionProfile -MockWith {
            }

            Mock -CommandName New-M365DSCConnection -MockWith {
                return 'Credentials'
            }

            Mock -CommandName Get-MgUser -MockWith {
                return @{
                    Id                = '76d3c3f6-8269-462b-9385-37435cb33f1e'
                    UserPrincipalName = 'alexw@contoso.com'
                }
            }
            Mock -CommandName Get-MgGroup -ParameterFilter { $GroupId -eq 'f1eb1a09-c0c2-4df4-9e69-fee01f00db31' } -MockWith {
                return @{
                    Id          = 'f1eb1a09-c0c2-4df4-9e69-fee01f00db31'
                    DisplayName = 'Group 01'
                }
            }
            Mock -CommandName Get-MgGroup -ParameterFilter { $Filter -eq "DisplayName eq 'Group 01'" } -MockWith {
                return @(@{
                    Id          = 'f1eb1a09-c0c2-4df4-9e69-fee01f00db31'
                    DisplayName = 'Group 01'
                })
            }
            Mock -CommandName Get-MgDirectoryRoleTemplate -MockWith {
                return @{
                    Id          = '17315797-102d-40b4-93e0-432062caca18'
                    DisplayName = 'Compliance Administrator'
                }
            }
            Mock -CommandName Get-MgBetaIdentityConditionalAccessNamedLocation -MockWith {
                return @{
                    Id          = '9e4ca5f3-0ba9-4257-b906-74d3038ac970'
                    DisplayName = 'Contoso LAN'
                }
            }
            Mock -CommandName Get-MgBetaPolicyAuthenticationStrengthPolicy -MockWith {
                return @{
                    Id          = "00000000-0000-0000-0000-000000000004"
                    DisplayName = "Phishing-resistant MFA"
                }
            }
            Mock -CommandName Get-MgServicePrincipal -ParameterFilter { $Filter -eq "AppId eq '00000012-0000-0000-c000-000000000000'" } -MockWith {
                return @{
                    Id          = '00000012-0000-0000-c000-000000000000'
                    DisplayName = 'Microsoft Rights Management Services'
                }
            }
            Mock -CommandName Get-MgServicePrincipal -ParameterFilter { $Filter -eq "DisplayName eq 'Microsoft Rights Management Services'" } -MockWith {
                return @{
                    Id          = '00000012-0000-0000-c000-000000000000'
                    DisplayName = 'Microsoft Rights Management Services'
                }
            }

            Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                return @{
                    Id              = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                    DisplayName     = 'Allin'
                    State           = 'disabled'
                    Conditions      = @{
                        Applications     = @{
                            IncludeApplications = @('All')
                            ExcludeApplications = @('00000012-0000-0000-c000-000000000000', 'Office365')
                            IncludeUserActions  = @('urn:user:registersecurityinfo')
                        }
                        Users            = @{
                            IncludeUsers  = 'All'
                            ExcludeUsers  = '76d3c3f6-8269-462b-9385-37435cb33f1e'
                            IncludeGroups = @('f1eb1a09-c0c2-4df4-9e69-fee01f00db31')
                            ExcludeGroups = @('f1eb1a09-c0c2-4df4-9e69-fee01f00db31')
                            IncludeRoles  = @('17315797-102d-40b4-93e0-432062caca18')
                            ExcludeRoles  = @('17315797-102d-40b4-93e0-432062caca18')
                            IncludeGuestsOrExternalUsers = @{
                                guestOrExternalUserTypes = 'b2bCollaborationGuest'
                                externalTenants          = @{
                                    membershipKind       = 'enumerated'
                                    members = @('11111111-1111-1111-1111-111111111111')
                                }
                            }
                            ExcludeGuestsOrExternalUsers = @{
                                guestOrExternalUserTypes = 'internalGuest,b2bCollaborationMember'
                                externalTenants          = @{
                                    membershipKind       = 'all'
                                }
                            }
                        }
                        Platforms        = @{
                            IncludePlatforms = @('Android', 'IOS')
                            ExcludePlatforms = @('Windows', 'WindowsPhone', 'MacOS')
                        }
                        Locations        = @{
                            IncludeLocations = 'AllTrusted'
                            ExcludeLocations = '9e4ca5f3-0ba9-4257-b906-74d3038ac970'
                        }
                        Devices          = @{
                            IncludeDevices = @('All')
                            ExcludeDevices = @('Compliant', 'DomainJoined')
                            DeviceFilter   = @{
                                Mode = @('exclude')
                                Rule = @('device.isCompliant -eq True -or device.trustType -eq "ServerAD"')
                            }
                        }
                        ClientAppTypes   = @('Browser', 'MobileAppsAndDesktopClients')
                        SignInRiskLevels = @('High')
                        UserRiskLevels   = @('High')
                        ServicePrincipalRiskLevels = @('High')
                    }
                    GrantControls   = @{
                        Operator       = 'AND'
                        BuiltInControls = @('Mfa', 'CompliantDevice', 'DomainJoinedDevice', 'ApprovedApplication', 'CompliantApplication')
                        AuthenticationStrength = @{
                            Id = "00000000-0000-0000-0000-000000000004"
                        }
                    }
                    SessionControls = @{
                        ApplicationEnforcedRestrictions = @{
                            IsEnabled = $True
                        }
                        CloudAppSecurity                = @{
                            IsEnabled            = $True
                            CloudAppSecurityType = 'MonitorOnly'
                        }
                        ContinuousAccessEvaluation = @{
                            mode = 'strictLocation'
                        }
                        SecureSignInSession            = @{
                            IsEnabled = $True
                        }
                        SignInFrequency                 = @{
                            IsEnabled = $True
                            Type      = 'Days'
                            Value     = 5
                        }
                        PersistentBrowser               = @{
                            IsEnabled = $True
                            Mode      = 'Always'
                        }
                        disableResilienceDefaults       = $true
                    }
                }
            }

            Mock -CommandName Invoke-MgGraphRequest -MockWith {
            }

            Mock -CommandName Remove-MgBetaIdentityConditionalAccessPolicy -MockWith {
            }

            # Mock Write-M365DSCHost to hide output during the tests
            Mock -CommandName Write-M365DSCHost -MockWith {
            }
            $Script:exportedInstance =$null
            $Script:ExportMode = $false
        }

        # Test contexts
        Context -Name "When Conditional Access Policy doesn't exist but should" -Fixture {
            BeforeAll {
                $testParams = @{
                    AuthenticationStrength               = "Phishing-resistant MFA"
                    BuiltInControls                      = @('Mfa', 'CompliantDevice', 'DomainJoinedDevice', 'ApprovedApplication', 'CompliantApplication')
                    ClientAppTypes                       = @('Browser', 'MobileAppsAndDesktopClients')
                    CloudAppSecurityIsEnabled            = $True
                    CloudAppSecurityType                 = 'MonitorOnly'
                    ContinuousAccessEvaluationMode       = 'strictLocation'
                    DisplayName                          = 'Allin'
                    Ensure                               = 'Present'
                    ExcludeApplications                  = @('Microsoft Rights Management Services', 'Office365')
                    ExcludeGroups                        = @('Group 01')
                    ExcludeLocations                     = 'Contoso LAN'
                    ExcludePlatforms                     = @('Windows', 'WindowsPhone', 'MacOS')
                    ExcludeRoles                         = @('Compliance Administrator')
                    ExcludeUsers                         = 'alexw@contoso.com'
                    ExcludeExternalTenantsMembers        = @()
                    ExcludeExternalTenantsMembershipKind = 'all'
                    ExcludeGuestOrExternalUserTypes      = @('internalGuest', 'b2bCollaborationMember')
                    Credential                           = $Credscredential
                    GrantControlOperator                 = 'AND'
                    Id                                   = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                    IncludeApplications                  = @('All')
                    IncludeGroups                        = @('Group 01')
                    IncludeLocations                     = 'AllTrusted'
                    IncludePlatforms                     = @('Android', 'IOS')
                    IncludeRoles                         = @('Compliance Administrator')
                    IncludeUserActions                   = @('urn:user:registersecurityinfo')
                    IncludeUsers                         = 'All'
                    IncludeExternalTenantsMembers        = @('11111111-1111-1111-1111-111111111111')
                    IncludeExternalTenantsMembershipKind = 'enumerated'
                    IncludeGuestOrExternalUserTypes      = @('b2bCollaborationGuest')
                    PersistentBrowserIsEnabled           = $True
                    PersistentBrowserMode                = 'Always'
                    DisableResilienceDefaultsIsEnabled   = $True
                    SecureSignInSessionIsEnabled         = $True
                    SignInFrequencyIsEnabled             = $True
                    SignInFrequencyType                  = 'Days'
                    SignInFrequencyValue                 = 5
                    SignInRiskLevels                     = @('High')
                    State                                = 'disabled'
                    UserRiskLevels                       = @('High')
                    DeviceFilterMode                     = 'exclude'
                    DeviceFilterRule                     = 'device.isCompliant -eq True -or device.trustType -eq "ServerAD"'
                }

                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                    return $null
                }
            }

            It 'Should return absent from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Absent'
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should create the policy in the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1
            }
        }

        Context -Name 'Policy exists but is not in the Desired State' -Fixture {
            BeforeAll {
                $testParams = @{
                    ApplicationEnforcedRestrictionsIsEnabled = $True
                    AuthenticationStrength                   = "Phishing-resistant MFA"
                    BuiltInControls                          = @('Mfa', 'CompliantDevice', 'DomainJoinedDevice', 'ApprovedApplication', 'CompliantApplication')
                    ClientAppTypes                           = @('Browser', 'MobileAppsAndDesktopClients')
                    CloudAppSecurityIsEnabled                = $True
                    CloudAppSecurityType                     = 'MonitorOnly'
                    ContinuousAccessEvaluationMode           = 'strictLocation'
                    DisplayName                              = 'Allin'
                    Ensure                                   = 'Present'
                    ExcludeApplications                      = @('Microsoft Rights Management Services', 'Office365')
                    ExcludeGroups                            = @('Group 01')
                    ExcludeLocations                         = 'Contoso LAN'
                    ExcludePlatforms                         = @('Windows', 'WindowsPhone', 'MacOS')
                    ExcludeRoles                             = @('Compliance Administrator')
                    ExcludeUsers                             = 'alexw@contoso.com'
                    ExcludeExternalTenantsMembers            = @()
                    ExcludeExternalTenantsMembershipKind     = 'all'
                    ExcludeGuestOrExternalUserTypes          = @('internalGuest', 'b2bCollaborationMember')
                    Credential                               = $Credscredential
                    GrantControlOperator                     = 'AND'
                    Id                                       = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                    IncludeApplications                      = @('All')
                    IncludeGroups                            = @('Group 01')
                    IncludeLocations                         = 'AllTrusted'
                    IncludePlatforms                         = @('Android', 'IOS')
                    IncludeRoles                             = @('Compliance Administrator')
                    IncludeUserActions                       = @('urn:user:registersecurityinfo')
                    IncludeUsers                             = 'All'
                    IncludeExternalTenantsMembers            = @('11111111-1111-1111-1111-111111111111')
                    IncludeExternalTenantsMembershipKind     = 'enumerated'
                    IncludeGuestOrExternalUserTypes          = @('b2bCollaborationGuest')
                    PersistentBrowserIsEnabled               = $True
                    PersistentBrowserMode                    = 'Always'
                    DisableResilienceDefaultsIsEnabled       = $True
                    ServicePrincipalRiskLevels               = @('High')
                    SecureSignInSessionIsEnabled             = $True
                    SignInFrequencyIsEnabled                 = $True
                    SignInFrequencyType                      = 'Days'
                    SignInFrequencyValue                     = 5
                    SignInRiskLevels                         = @('High')
                    State                                    = 'enabled' # Drift
                    UserRiskLevels                           = @('High')
                    DeviceFilterMode                         = 'exclude'
                    DeviceFilterRule                         = 'device.isCompliant -eq True -or device.trustType -eq "ServerAD"'
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should update the settings from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1
            }
        }

        Context -Name 'Policy exists but is not in the Desired State. Not all params specified' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                              = 'Allin'
                    Ensure                                   = 'Present'
                    Credential                               = $Credscredential
                    State                                    = 'enabled' # Drift
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should update the settings from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1
            }
        }

        Context -Name 'Policy exists and is already in the Desired State' -Fixture {
            BeforeAll {
                $testParams = @{
                    ApplicationEnforcedRestrictionsIsEnabled = $True
                    AuthenticationStrength                   = "Phishing-resistant MFA"
                    BuiltInControls                          = @('Mfa', 'CompliantDevice', 'DomainJoinedDevice', 'ApprovedApplication', 'CompliantApplication')
                    ClientAppTypes                           = @('Browser', 'MobileAppsAndDesktopClients')
                    CloudAppSecurityIsEnabled                = $True
                    CloudAppSecurityType                     = 'MonitorOnly'
                    ContinuousAccessEvaluationMode           = 'strictLocation'
                    DisplayName                              = 'Allin'
                    Ensure                                   = 'Present'
                    ExcludeApplications                      = @('Microsoft Rights Management Services', 'Office365')
                    ExcludeGroups                            = @('Group 01')
                    ExcludeLocations                         = 'Contoso LAN'
                    ExcludePlatforms                         = @('Windows', 'WindowsPhone', 'MacOS')
                    ExcludeRoles                             = @('Compliance Administrator')
                    ExcludeUsers                             = 'alexw@contoso.com'
                    ExcludeExternalTenantsMembers            = @()
                    ExcludeExternalTenantsMembershipKind     = 'all'
                    ExcludeGuestOrExternalUserTypes          = @('internalGuest', 'b2bCollaborationMember')
                    Credential                               = $Credscredential
                    GrantControlOperator                     = 'AND'
                    Id                                       = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                    IncludeApplications                      = @('All')
                    IncludeGroups                            = @('Group 01')
                    IncludeLocations                         = 'AllTrusted'
                    IncludePlatforms                         = @('Android', 'IOS')
                    IncludeRoles                             = @('Compliance Administrator')
                    IncludeUserActions                       = @('urn:user:registersecurityinfo')
                    IncludeUsers                             = 'All'
                    IncludeExternalTenantsMembers            = @('11111111-1111-1111-1111-111111111111')
                    IncludeExternalTenantsMembershipKind     = 'enumerated'
                    IncludeGuestOrExternalUserTypes          = @('b2bCollaborationGuest')
                    PersistentBrowserIsEnabled               = $True
                    PersistentBrowserMode                    = 'Always'
                    DisableResilienceDefaultsIsEnabled       = $True
                    SecureSignInSessionIsEnabled             = $True
                    SignInFrequencyIsEnabled                 = $True
                    SignInFrequencyType                      = 'Days'
                    SignInFrequencyValue                     = 5
                    SignInRiskLevels                         = @('High')
                    State                                    = 'disabled'
                    UserRiskLevels                           = @('High')
                    DeviceFilterMode                         = 'exclude'
                    DeviceFilterRule                         = 'device.isCompliant -eq True -or device.trustType -eq "ServerAD"'
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return true from the Test method' {
                Test-TargetResource @testParams | Should -Be $true
            }
        }

        Context -Name 'Policy exists but it should not' -Fixture {
            BeforeAll {
                $testParams = @{
                    ApplicationEnforcedRestrictionsIsEnabled = $True
                    AuthenticationStrength                   = "Phishing-resistant MFA"
                    BuiltInControls                          = @('Mfa', 'CompliantDevice', 'DomainJoinedDevice', 'ApprovedApplication', 'CompliantApplication')
                    ClientAppTypes                           = @('Browser', 'MobileAppsAndDesktopClients')
                    CloudAppSecurityIsEnabled                = $True
                    CloudAppSecurityType                     = 'MonitorOnly'
                    ContinuousAccessEvaluationMode           = 'strictLocation'
                    DisplayName                              = 'Allin'
                    Ensure                                   = 'Absent'
                    ExcludeApplications                      = @('Microsoft Rights Management Services', 'Office365')
                    ExcludeGroups                            = @('Group 01')
                    ExcludeLocations                         = 'Contoso LAN'
                    ExcludePlatforms                         = @('Windows', 'WindowsPhone', 'MacOS')
                    ExcludeRoles                             = @('Compliance Administrator')
                    ExcludeUsers                             = 'alexw@contoso.com'
                    Credential                               = $Credscredential
                    GrantControlOperator                     = 'AND'
                    Id                                       = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                    IncludeApplications                      = @('All')
                    IncludeGroups                            = @('Group 01')
                    IncludeLocations                         = 'AllTrusted'
                    IncludePlatforms                         = @('Android', 'IOS')
                    IncludeRoles                             = @('Compliance Administrator')
                    IncludeUserActions                       = @('urn:user:registersecurityinfo')
                    IncludeUsers                             = 'All'
                    PersistentBrowserIsEnabled               = $True
                    PersistentBrowserMode                    = 'Always'
                    DisableResilienceDefaultsIsEnabled       = $True
                    SecureSignInSessionIsEnabled             = $True
                    SignInFrequencyIsEnabled                 = $True
                    SignInFrequencyType                      = 'Days'
                    SignInFrequencyValue                     = 5
                    SignInRiskLevels                         = @('High')
                    State                                    = 'disabled'
                    UserRiskLevels                           = @('High')
                    DeviceFilterMode                         = 'exclude'
                    DeviceFilterRule                         = 'device.isCompliant -eq True -or device.trustType -eq "ServerAD"'
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should remove the policy from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Remove-MgBetaIdentityConditionalAccessPolicy -Exactly 1
            }
        }

        Context -Name 'ServicePrincipal filter with a single custom security attribute that exists in the tenant' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                  = 'Allin'
                    Ensure                       = 'Present'
                    Credential                   = $Credscredential
                    State                        = 'disabled'
                    IncludeApplications          = @('All')
                    IncludeUsers                 = 'All'
                    ServicePrincipalFilterMode   = 'include'
                    ServicePrincipalFilterRule   = "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'Value1'"
                }

                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                    return @{
                        Id          = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                        DisplayName = 'Allin'
                        State       = 'disabled'
                        Conditions  = @{
                            Applications        = @{
                                IncludeApplications = @('All')
                            }
                            Users               = @{
                                IncludeUsers = 'All'
                            }
                            ClientApplications  = @{
                                IncludeServicePrincipals = @()
                                ExcludeServicePrincipals = @()
                                ServicePrincipalFilter   = @{
                                    Mode = 'include'
                                    Rule = "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'Value1'"
                                }
                            }
                        }
                        GrantControls   = $null
                        SessionControls = $null
                    }
                }

                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    return @{
                        value = @(
                            @{ id = 'AttributeSet_MyAttribute' }
                        )
                    }
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return the correct ServicePrincipalFilterMode from Get' {
                (Get-TargetResource @testParams).ServicePrincipalFilterMode | Should -Be 'include'
            }

            It 'Should return the correct ServicePrincipalFilterRule from Get' {
                (Get-TargetResource @testParams).ServicePrincipalFilterRule | Should -Be "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'Value1'"
            }

            It 'Should return true from the Test method when in desired state' {
                Test-TargetResource @testParams | Should -Be $true
            }

            It 'Should call Invoke-MgGraphRequest for validation and update when applying the filter' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'GET' }
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'PATCH' }
            }
        }

        Context -Name 'ServicePrincipal filter with multiple custom security attributes that all exist in the tenant' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                  = 'Allin'
                    Ensure                       = 'Present'
                    Credential                   = $Credscredential
                    State                        = 'disabled'
                    IncludeApplications          = @('All')
                    IncludeUsers                 = 'All'
                    ServicePrincipalFilterMode   = 'exclude'
                    ServicePrincipalFilterRule   = "CustomSecurityAttribute.Set1_AttrA -eq 'Foo' -or CustomSecurityAttribute.Set2_AttrB -eq 'Bar'"
                }

                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                    return @{
                        Id          = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                        DisplayName = 'Allin'
                        State       = 'disabled'
                        Conditions  = @{
                            Applications        = @{
                                IncludeApplications = @('All')
                            }
                            Users               = @{
                                IncludeUsers = 'All'
                            }
                            ClientApplications  = @{
                                IncludeServicePrincipals = @()
                                ExcludeServicePrincipals = @()
                                ServicePrincipalFilter   = @{
                                    Mode = 'exclude'
                                    Rule = "CustomSecurityAttribute.Set1_AttrA -eq 'Foo' -or CustomSecurityAttribute.Set2_AttrB -eq 'Bar'"
                                }
                            }
                        }
                        GrantControls   = $null
                        SessionControls = $null
                    }
                }

                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    return @{
                        value = @(
                            @{ id = 'Set1_AttrA' }
                            @{ id = 'Set2_AttrB' }
                        )
                    }
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return the correct ServicePrincipalFilterMode from Get' {
                (Get-TargetResource @testParams).ServicePrincipalFilterMode | Should -Be 'exclude'
            }

            It 'Should return the correct ServicePrincipalFilterRule from Get' {
                (Get-TargetResource @testParams).ServicePrincipalFilterRule | Should -Be "CustomSecurityAttribute.Set1_AttrA -eq 'Foo' -or CustomSecurityAttribute.Set2_AttrB -eq 'Bar'"
            }

            It 'Should return true from the Test method when in desired state' {
                Test-TargetResource @testParams | Should -Be $true
            }

            It 'Should call Invoke-MgGraphRequest for validation and update when applying the filter' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'GET' }
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'PATCH' }
            }
        }

        Context -Name 'ServicePrincipal filter with a custom security attribute that does not exist in the tenant' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                  = 'Allin'
                    Ensure                       = 'Present'
                    Credential                   = $Credscredential
                    State                        = 'disabled'
                    IncludeApplications          = @('All')
                    IncludeUsers                 = 'All'
                    ServicePrincipalFilterMode   = 'include'
                    ServicePrincipalFilterRule   = "CustomSecurityAttribute.AttributeSet_NonExistent -eq 'Value1'"
                }

                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                    return $null
                }

                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    return @{
                        value = @()
                    }
                }
            }

            It 'Should return absent from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Absent'
            }

            It 'Should throw when applying a filter that references a missing custom attribute' {
                { Set-TargetResource @testParams } | Should -Throw
            }
        }

        Context -Name 'ServicePrincipal filter drift - mode changed' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                  = 'Allin'
                    Ensure                       = 'Present'
                    Credential                   = $Credscredential
                    State                        = 'disabled'
                    IncludeApplications          = @('All')
                    IncludeUsers                 = 'All'
                    ServicePrincipalFilterMode   = 'exclude'
                    ServicePrincipalFilterRule   = "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'Value1'"
                }

                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                    return @{
                        Id          = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                        DisplayName = 'Allin'
                        State       = 'disabled'
                        Conditions  = @{
                            Applications        = @{
                                IncludeApplications = @('All')
                            }
                            Users               = @{
                                IncludeUsers = 'All'
                            }
                            ClientApplications  = @{
                                IncludeServicePrincipals = @()
                                ExcludeServicePrincipals = @()
                                ServicePrincipalFilter   = @{
                                    Mode = 'include'  # drifted - policy has 'include', desired is 'exclude'
                                    Rule = "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'Value1'"
                                }
                            }
                        }
                        GrantControls   = $null
                        SessionControls = $null
                    }
                }

                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    return @{
                        value = @(
                            @{ id = 'AttributeSet_MyAttribute' }
                        )
                    }
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method when ServicePrincipalFilterMode has drifted' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should validate attributes and update the policy from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'GET' }
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'PATCH' }
            }
        }

        Context -Name 'ServicePrincipal filter drift - rule changed' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                  = 'Allin'
                    Ensure                       = 'Present'
                    Credential                   = $Credscredential
                    State                        = 'disabled'
                    IncludeApplications          = @('All')
                    IncludeUsers                 = 'All'
                    ServicePrincipalFilterMode   = 'include'
                    ServicePrincipalFilterRule   = "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'NewValue'"
                }

                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -MockWith {
                    return @{
                        Id          = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                        DisplayName = 'Allin'
                        State       = 'disabled'
                        Conditions  = @{
                            Applications        = @{
                                IncludeApplications = @('All')
                            }
                            Users               = @{
                                IncludeUsers = 'All'
                            }
                            ClientApplications  = @{
                                IncludeServicePrincipals = @()
                                ExcludeServicePrincipals = @()
                                ServicePrincipalFilter   = @{
                                    Mode = 'include'
                                    Rule = "CustomSecurityAttribute.AttributeSet_MyAttribute -eq 'OldValue'"  # drifted
                                }
                            }
                        }
                        GrantControls   = $null
                        SessionControls = $null
                    }
                }

                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    return @{
                        value = @(
                            @{ id = 'AttributeSet_MyAttribute' }
                        )
                    }
                }
            }

            It 'Should return Present from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method when ServicePrincipalFilterRule has drifted' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should validate attributes and update the policy from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'GET' }
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'PATCH' }
            }
        }

        Context -Name 'Tenant has a large number of Conditional Access Policies (paging)' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName = 'Allin'
                    Ensure      = 'Present'
                    Credential  = $Credscredential
                    State       = 'enabled' # Drift
                }

                # Build the fully populated policy that Get-TargetResource must locate and process.
                $existingPolicy = @{
                    Id              = 'bcc0cf19-ee89-46f0-8e12-4b89123ee6f9'
                    DisplayName     = 'Allin'
                    State           = 'disabled'
                    Conditions      = @{
                        Applications     = @{
                            IncludeApplications = @('All')
                        }
                        Users            = @{
                            IncludeUsers = 'All'
                        }
                    }
                    GrantControls   = $null
                    SessionControls = $null
                }

                # Simulate a tenant with many policies where the target policy lives well beyond
                # the first service-side page. The resource must ask the service to do the
                # filtering (-Filter) AND page through every result (-All); this mock behaves like
                # Graph does, honouring the OData filter server-side rather than returning
                # everything, so a regression back to an unfiltered scan is caught.
                $manyPolicies = @()
                for ($p = 0; $p -lt 500; $p++)
                {
                    $manyPolicies += @{
                        Id          = "00000000-0000-0000-0000-$('{0:D12}' -f $p)"
                        DisplayName = "Filler Policy $p"
                        State       = 'disabled'
                        Conditions  = @{}
                    }
                }
                # Place the real policy near the end so it is only reachable when all pages are read.
                $manyPolicies += $existingPolicy

                # Applies the OData "DisplayName eq '<name>'" filter the way the service would,
                # including unescaping the doubled single quotes the resource emits.
                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -ParameterFilter { $All -eq $true } -MockWith {
                    if ([System.String]::IsNullOrEmpty($Filter))
                    {
                        return $manyPolicies
                    }

                    if ($Filter -notmatch "^DisplayName eq '(.*)'$")
                    {
                        throw "Unexpected filter passed to Get-MgBetaIdentityConditionalAccessPolicy: $Filter"
                    }

                    $wanted = $Matches[1] -replace "''", "'"
                    return @($manyPolicies | Where-Object -FilterScript { $_.DisplayName -eq $wanted })
                }

                # If the code ever falls back to a non-paged lookup, return nothing so the
                # regression (Absent -> duplicate create) would surface as a failing assertion.
                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -ParameterFilter { $All -ne $true } -MockWith {
                    return $null
                }
            }

            It 'Should retrieve the policy using server-side filtering and paging (-All -Filter)' {
                $null = Get-TargetResource @testParams
                Should -Invoke -CommandName Get-MgBetaIdentityConditionalAccessPolicy -Exactly 1 `
                    -ParameterFilter { $All -eq $true -and $Filter -eq "DisplayName eq 'Allin'" }
            }

            It 'Should find the existing policy and return Present even when it is beyond the first page' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method due to drift' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should update the existing policy (PATCH) rather than create a duplicate (POST)' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 1 -ParameterFilter { $Method -eq 'PATCH' }
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 0 -ParameterFilter { $Method -eq 'POST' }
            }
        }

        Context -Name 'Multiple Conditional Access Policies share the same DisplayName across pages' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName = 'Allin'
                    Ensure      = 'Present'
                    Credential  = $Credscredential
                    State       = 'enabled'
                }

                $duplicatePolicies = @()
                for ($p = 0; $p -lt 300; $p++)
                {
                    $duplicatePolicies += @{
                        Id          = "00000000-0000-0000-0000-$('{0:D12}' -f $p)"
                        DisplayName = "Filler Policy $p"
                        State       = 'disabled'
                        Conditions  = @{}
                    }
                }
                # Two policies with the same DisplayName on different pages.
                $duplicatePolicies += @{
                    Id          = 'aaaaaaaa-0000-0000-0000-000000000001'
                    DisplayName = 'Allin'
                    State       = 'disabled'
                    Conditions  = @{}
                }
                $duplicatePolicies += @{
                    Id          = 'bbbbbbbb-0000-0000-0000-000000000002'
                    DisplayName = 'Allin'
                    State       = 'disabled'
                    Conditions  = @{}
                }

                # Honour the OData filter server-side, as Graph does, so the throw below proves
                # genuine duplicate detection rather than merely counting the whole tenant.
                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -ParameterFilter { $All -eq $true } -MockWith {
                    if ([System.String]::IsNullOrEmpty($Filter))
                    {
                        return $duplicatePolicies
                    }

                    if ($Filter -notmatch "^DisplayName eq '(.*)'$")
                    {
                        throw "Unexpected filter passed to Get-MgBetaIdentityConditionalAccessPolicy: $Filter"
                    }

                    $wanted = $Matches[1] -replace "''", "'"
                    return @($duplicatePolicies | Where-Object -FilterScript { $_.DisplayName -eq $wanted })
                }
            }

            It 'Should throw when duplicate policies with the same DisplayName exist in the tenant' {
                { Get-TargetResource @testParams } | Should -Throw "*Duplicate CA Policies named Allin exist in tenant*"
            }
        }

        Context -Name "DisplayName containing a single quote is escaped for the OData filter" -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName = "O'Brien's Policy"
                    Ensure      = 'Present'
                    Credential  = $Credscredential
                    State       = 'disabled'
                }

                $quotedPolicy = @{
                    Id              = 'cccccccc-0000-0000-0000-000000000003'
                    DisplayName     = "O'Brien's Policy"
                    State           = 'disabled'
                    Conditions      = @{
                        Applications = @{
                            IncludeApplications = @('All')
                        }
                        Users        = @{
                            IncludeUsers = 'All'
                        }
                    }
                    GrantControls   = $null
                    SessionControls = $null
                }

                # Reject a filter whose quotes are not doubled - an unescaped name would produce
                # a malformed OData filter and a 400 from Graph at runtime.
                Mock -CommandName Get-MgBetaIdentityConditionalAccessPolicy -ParameterFilter { $All -eq $true } -MockWith {
                    if ($Filter -notmatch "^DisplayName eq '(.*)'$")
                    {
                        throw "Malformed OData filter: $Filter"
                    }

                    $inner = $Matches[1]
                    if ($inner -match "(?<!')'(?!')")
                    {
                        throw "Unescaped single quote in OData filter: $Filter"
                    }

                    $wanted = $inner -replace "''", "'"
                    if ($wanted -eq $quotedPolicy.DisplayName)
                    {
                        return @($quotedPolicy)
                    }

                    return @()
                }
            }

            It 'Should escape the single quotes and locate the policy' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should send a correctly escaped OData filter' {
                $null = Get-TargetResource @testParams
                Should -Invoke -CommandName Get-MgBetaIdentityConditionalAccessPolicy -Exactly 1 `
                    -ParameterFilter { $Filter -eq "DisplayName eq 'O''Brien''s Policy'" }
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                $Global:CurrentModeIsExport = $true
                $Global:PartialExportFileName = "$(New-Guid).partial.ps1"
                $testParams = @{
                    Credential = $Credential
                }
            }

            It 'Should Reverse Engineer resource from the Export method' {
                $result = Export-TargetResource @testParams
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}

Invoke-Command -ScriptBlock $Global:DscHelper.CleanupScript -NoNewScope
