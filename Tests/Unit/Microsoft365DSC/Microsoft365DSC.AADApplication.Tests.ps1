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
    -DscResource 'AADApplication' -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope
        BeforeAll {
            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@onmicrosoft.com', $secpasswd)

            Mock -ModuleName M365DSCUtil -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName Get-MSCloudLoginConnectionProfile -MockWith {
            }

            Mock -CommandName Get-PSSession -MockWith {
            }

            Mock -CommandName Remove-PSSession -MockWith {
            }

            Mock -CommandName Update-MgBetaApplication -MockWith {
            }

            Mock -CommandName Update-MgBetaApplication -MockWith {
            }

            Mock -CommandName Remove-MgBetaApplication -MockWith {
            }

            Mock -CommandName Get-MgBetaDirectoryDeletedItemAsApplication -MockWith {
            }

            Mock -CommandName Invoke-M365DSCGraphRequest -MockWith {
            }

            Mock -CommandName Get-MgBetaPolicyTokenLifetimePolicy -MockWith {
            }

            Mock -CommandName New-MgApplicationTokenLifetimePolicyByRef -MockWith {
            }

            Mock -CommandName Remove-MgApplicationTokenLifetimePolicyTokenLifetimePolicyByRef -MockWith {
            }

            Mock -CommandName New-MgBetaApplication -MockWith {
                return @{
                    ID    = '12345-12345-12345-12345-12345'
                    AppId = '12345-12345-12345-12345-12345'
                }
            }

            Mock -CommandName Get-MgServicePrincipal -MockWith {
                return @{
                    DisplayName = 'Microsoft Graph'
                    ObjectID = '12345-12345-12345-12345-12345'
                    AppRoles = @(@{Value = "User.Read.All";Id="123"})
                }
            }

            Mock -CommandName New-M365DSCConnection -ModuleName '_Shared' -MockWith {
                return 'Credentials'
            }

            Mock -CommandName Start-Sleep -MockWith {
            }

            # Mock Write-M365DSCHost to hide output during the tests
            Mock -CommandName Write-M365DSCHost -MockWith {
            }
            $Script:exportedInstance =$null
            $Script:ExportMode = $false
        }

        # Test contexts
        Context -Name 'The application should exist but it does not' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName               = 'App1'
                    Description               = 'App description'
                    GroupMembershipClaims     = '0'
                    Homepage                  = 'https://app.contoso.com'
                    IdentifierUris            = 'https://app.contoso.com'
                    KnownClientApplications   = ''
                    LogoutURL                 = 'https://app.contoso.com/logout'
                    PublicClient              = $false
                    ReplyURLs                 = @('https://app.contoso.com')
                    Ensure                    = 'Present'
                    Credential                = $Credential
                }

                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return $null
                }
            }

            It 'Should return values from the get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Absent'
                Should -Invoke -CommandName 'Get-MgBetaApplication' -Exactly 1
            }
            It 'Should return false from the test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Test() | Should -Be $false
            }
            It 'Should create the application from the set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Set()
                Should -Invoke -CommandName 'New-MgBetaApplication' -Exactly 1
            }
        }

        Context -Name 'The application exists but it should not' -Fixture {
            BeforeAll {
                $testParams = @{
                    ObjectId                  = '5dcb2237-c61b-4258-9c85-eae2aaeba9d6'
                    DisplayName               = 'App1'
                    Description               = 'App description'
                    GroupMembershipClaims     = '0'
                    Homepage                  = 'https://app.contoso.com'
                    IdentifierUris            = 'https://app.contoso.com'
                    KnownClientApplications   = ''
                    LogoutURL                 = 'https://app.contoso.com/logout'
                    PublicClient              = $false
                    ReplyURLs                 = 'https://app.contoso.com'
                    Ensure                    = 'Absent'
                    Credential                = $Credential
                }

                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return @{
                        DisplayName = 'App1'
                        Id = '5dcb2237-c61b-4258-9c85-eae2aaeba9d6'
                        AvailableToOtherTenants = $false
                        Description = 'App description'
                        GroupMembershipClaims = 0
                        Homepage = 'https://app.contoso.com'
                        IdentifierUris = 'https://app.contoso.com'
                        KnownClientApplications = ''
                        LogoutURL = 'https://app.contoso.com/logout'
                        Oauth2RequirePostResponse = $false
                        PublicClient = $false
                        ReplyURLs = 'https://app.contoso.com'
                        SamlMetadataUrl = ''
                    }
                }
            }

            It 'Should return values from the get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Present'
                Should -Invoke -CommandName 'Get-MgBetaApplication' -Exactly 1
            }

            It 'Should return false from the test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should remove the app from the set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Set()
                Should -Invoke -CommandName 'Remove-MgBetaApplication' -Exactly 1
            }
        }

        Context -Name 'The app exists and values are already in the desired state' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName               = 'App1'
                    Description               = 'App description'
                    GroupMembershipClaims     = '0'
                    Homepage                  = 'https://app.contoso.com'
                    IdentifierUris            = 'https://app.contoso.com'
                    KnownClientApplications   = ''
                    LogoutURL                 = 'https://app.contoso.com/logout'
                    PublicClient              = $false
                    ReplyURLs                 = 'https://app.contoso.com'
                    AppRoles                  = @(
                        [MSFT_MicrosoftGraphappRole] @{
                            AllowedMemberTypes = @('Application')
                            Id = 'Task Reader'
                            IsEnabled = $True
                            Origin = 'Application'
                            Description = 'Readers have ability to read task'
                            Value = 'Task.Read'
                            DisplayName = 'Readers'
                        }
                        [MSFT_MicrosoftGraphappRole] @{
                            AllowedMemberTypes = @('Application')
                            Id = 'Task Writer'
                            IsEnabled = $True
                            Origin = 'Application'
                            Description = 'Writers have ability to write task'
                            Value = 'Task.Write'
                            DisplayName = 'Writers'
                        }
                    )
                    PasswordCredentials       = @(
                        [MSFT_MicrosoftGraphpasswordCredential] @{
                            KeyId = 'keyid'
                            EndDateTime = '2025-03-15T19:50:29.0310000+00:00'
                            Hint = 'VsO'
                            DisplayName = 'Super Secret'
                            StartDateTime = '2024-09-16T19:50:29.0310000+00:00'
                        }
                    )
                    KeyCredentials = @(
                        [MSFT_MicrosoftGraphkeyCredential] @{
                            Usage = 'Verify'
                            StartDateTime = '2024-09-25T09:13:11.0000000+00:00'
                            Type = 'AsymmetricX509Cert'
                            KeyId = 'Key ID'
                            EndDateTime = '2025-09-25T09:33:11.0000000+00:00'
                            DisplayName = 'anexas_test_2'
                        }
                    )
                    OptionalClaims = [MSFT_MicrosoftGraphoptionalClaims] @{
                        Saml2Token = @(
                            [MSFT_MicrosoftGraphOptionalClaim] @{
                                Name = 'groups'
                                Essential = $False
                            }
                        )
                        AccessToken = @(
                            [MSFT_MicrosoftGraphOptionalClaim] @{
                                Name = 'groups'
                                Essential = $False
                            }
                        )
                        IdToken = @(
                            [MSFT_MicrosoftGraphOptionalClaim] @{
                                Name = 'acrs'
                                Essential = $False
                            }
                            [MSFT_MicrosoftGraphOptionalClaim] @{
                                Name = 'groups'
                                Essential = $False
                            }
                        )
                    }
                    AuthenticationBehaviors   = [MSFT_MicrosoftGraphauthenticationBehaviors] @{
                             blockAzureADGraphAccess       = 'false'
                             removeUnverifiedEmailClaim    = 'true'
                     }
                    Api = [MSFT_MicrosoftGraphapiApplication] @{
                        PreAuthorizedApplications = @(
                            [MSFT_MicrosoftGraphPreAuthorizedApplication] @{
                                AppId = 'Microsoft Graph'
                                PermissionIds = @('12345-12345-12345-12345-12345')
                            }
                        )
                    }
                    Ensure                    = 'Present'
                    Credential                = $Credential
                }
                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return @{
                        DisplayName = 'App1'
                        Id = '5dcb2237-c61b-4258-9c85-eae2aaeba9d6'
                        Description = 'App description'
                        GroupMembershipClaims = 0
                        SignInAudience = 'AzureADMyOrg'
                        OptionalClaims = @{
                            Saml2Token = @(
                                @{
                                    Name = 'groups'
                                    Essential = $False
                                }
                            )
                            AccessToken = @(
                                @{
                                    Name = 'groups'
                                    Essential = $False
                                }
                            )
                            IdToken = @(
                                @{
                                    Name = 'acrs'
                                    Essential = $False
                                }
                                @{
                                    Name = 'groups'
                                    Essential = $False
                                }
                            )
                        }
                        Web = @{
                            HomepageUrl  = 'https://app.contoso.com'
                            LogoutURL    = 'https://app.contoso.com/logout'
                            RedirectUris = @('https://app.contoso.com')
                        }
                        AppRoles = @(
                            @{
                                AllowedMemberTypes = @('Application')
                                Id = 'Task Reader'
                                IsEnabled = $True
                                Origin = 'Application'
                                Description = 'Readers have ability to read task'
                                Value = 'Task.Read'
                                DisplayName = 'Readers'
                            }
                            @{
                                AllowedMemberTypes = @('Application')
                                Id = 'Task Writer'
                                IsEnabled = $True
                                Origin = 'Application'
                                Description = 'Writers have ability to write task'
                                Value = 'Task.Write'
                                DisplayName = 'Writers'
                            }
                        )
                        KeyCredentials = @(
                            @{
                                Usage = 'Verify'
                                StartDateTime = '2024-09-25T09:13:11.0000000+00:00'
                                Type = 'AsymmetricX509Cert'
                                KeyId = 'Key ID'
                                EndDateTime = '2025-09-25T09:33:11.0000000+00:00'
                                DisplayName = 'anexas_test_2'
                            }
                        )
                        PasswordCredentials = @(
                            @{
                                KeyId = 'keyid'
                                EndDateTime = '2025-03-15T19:50:29.0310000+00:00'
                                Hint = 'VsO'
                                DisplayName = 'Super Secret'
                                StartDateTime = '2024-09-16T19:50:29.0310000+00:00'
                            }
                        )
                        API = @{
                            KnownClientApplications = ''
                            PreAuthorizedApplications = @(
                                @{
                                    AppId = '12345-12345-12345-12345-12345'
                                    PermissionIds = @('12345-12345-12345-12345-12345')
                                }
                            )
                            OAuth2PermissionScopes = @(
                                @{
                                    Id = '12345-12345-12345-12345-12345'
                                    Value = '12345-12345-12345-12345-12345'
                                }
                            )
                        }
                        IdentifierUris = @('https://app.contoso.com')
                        Oauth2RequirePostResponse = $false
                        PublicClient = $false
                        AuthenticationBehaviors = @{
                            blockAzureADGraphAccess       = 'false'
                            removeUnverifiedEmailClaim    = 'true'
                        }
                    }
                }
            }

            It 'Should return Values from the get method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Get().ToHashtable()
                Should -Invoke -CommandName 'Get-MgBetaApplication' -Exactly 1
            }

            It 'Should return true from the test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Test() | Should -Be $true
            }
        }

        Context -Name 'Values are not in the desired state' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName               = 'App1'
                    Description               = 'App description'
                    GroupMembershipClaims     = '0'
                    Homepage                  = 'https://app1.contoso.com' #drift
                    IdentifierUris            = 'https://app.contoso.com'
                    KnownClientApplications   = ''
                    LogoutURL                 = 'https://app.contoso.com/logout'
                    PublicClient              = $false
                    ReplyURLs                 = 'https://app.contoso.com'
                    Ensure                    = 'Present'
                    Credential                = $Credential
                }

                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return @{
                        DisplayName = 'App1'
                        Id = '5dcb2237-c61b-4258-9c85-eae2aaeba9d6'
                        AvailableToOtherTenants = $false
                        Description = 'App description'
                        GroupMembershipClaims = 0
                        Homepage = 'https://app.contoso.com'
                        IdentifierUris = 'https://app.contoso.com'
                        KnownClientApplications = ''
                        LogoutURL = 'https://app.contoso.com/logout'
                        Oauth2RequirePostResponse = $false
                        PublicClient = $false
                        ReplyURLs = 'https://app.contoso.com'
                    }
                }
            }

            It 'Should return values from the get method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Get().ToHashtable()
                Should -Invoke -CommandName 'Get-MgBetaApplication' -Exactly 1
            }

            It 'Should return false from the test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should call the set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Set()
                Should -Invoke -CommandName 'Update-MgBetaApplication' -Exactly 1
            }
        }

        Context -Name 'Assigning Authentication Behaviors to a new Application' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName               = 'App1'
                    Description               = 'App description'
                    GroupMembershipClaims     = '0'
                    IdentifierUris            = 'https://app.contoso.com'
                    KnownClientApplications   = ''
                    LogoutURL                 = 'https://app.contoso.com/logout'
                    PublicClient              = $false
                    ReplyURLs                 = 'https://app.contoso.com'
                    AuthenticationBehaviors   = [MSFT_MicrosoftGraphauthenticationBehaviors] @{
                            blockAzureADGraphAccess       = 'false'
                            removeUnverifiedEmailClaim    = 'true'
                    }
                    Ensure                  = 'Present'
                    Credential              = $Credential
                }

                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return @(
                        @{
                            id = '12345-12345-12345-12345-12345'
                            appId = '12345-12345-12345-12345-12345'
                            DisplayName               = 'App1'
                        }
                    )
                }
            }

            It 'Should return values from the get method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Get().ToHashtable()
                Should -Invoke -CommandName 'Get-MgBetaApplication' -Exactly 1
            }

            It 'Should return false from the test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should call the new method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Set()
                Should -Invoke -CommandName 'Update-MgBetaApplication' -Exactly 2
            }
        }

        Context -Name 'Assigning RequiredResourceAccess to a new Application' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName               = 'App1'
                    Description               = 'App description'
                    GroupMembershipClaims     = '0'
                    IdentifierUris            = 'https://app.contoso.com'
                    KnownClientApplications   = ''
                    LogoutURL                 = 'https://app.contoso.com/logout'
                    PublicClient              = $false
                    ReplyURLs                 = 'https://app.contoso.com'
                    RequiredResourceAccess    = @([MSFT_AADApplicationPermission] @{
                            Name                = 'User.Read'
                            Type                = 'Delegated'
                            SourceAPI           = 'Microsoft Graph'
                            AdminConsentGranted = $false
                        }
                        [MSFT_AADApplicationPermission] @{
                            Name                = 'User.ReadWrite.All'
                            type                = 'Delegated'
                            SourceAPI           = 'Microsoft Graph'
                            AdminConsentGranted = $True
                        }
                        [MSFT_AADApplicationPermission] @{
                            Name                = 'User.Read.All'
                            type                = 'AppOnly'
                            SourceAPI           = 'Microsoft Graph'
                            AdminConsentGranted = $True
                        }
                    )
                    Ensure                  = 'Present'
                    Credential              = $Credential
                }

                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return $null
                }
            }

            It 'Should return values from the get method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Get().ToHashtable()
                Should -Invoke -CommandName 'Get-MgBetaApplication' -Exactly 1
            }

            It 'Should return false from the test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should call the new method' {
                (New-M365DSCResourceInstance -ResourceName 'AADApplication' -Property $testParams).Set()
                Should -Invoke -CommandName 'New-MgBetaApplication' -Exactly 1
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                $Global:CurrentModeIsExport = $true
                $Global:PartialExportFileName = "$(New-Guid).partial.ps1"
                $testParams = @{
                    Credential = $Credential
                }

                Mock -CommandName Get-MgBetaApplication -MockWith {
                    return @{
                        DisplayName = 'App1'
                        Id = '5dcb2237-c61b-4258-9c85-eae2aaeba9d6'
                        AvailableToOtherTenants = $false
                        Description = 'App description'
                        GroupMembershipClaims = 0
                        Homepage = 'https://app.contoso.com'
                        IdentifierUris = 'https://app.contoso.com'
                        KnownClientApplications = ''
                        LogoutURL = 'https://app.contoso.com/logout'
                        Oauth2RequirePostResponse = $false
                        PublicClient = $false
                        ReplyURLs = 'https://app.contoso.com'
                    }
                }
            }

            It 'Should reverse engineer resource from the export method' {
                $result = Invoke-M365DSCResourceMethod -ResourceName 'AADApplication' -MethodName 'Export' -Parameters $testParams
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}

Invoke-Command -ScriptBlock $Global:DscHelper.CleanupScript -NoNewScope
