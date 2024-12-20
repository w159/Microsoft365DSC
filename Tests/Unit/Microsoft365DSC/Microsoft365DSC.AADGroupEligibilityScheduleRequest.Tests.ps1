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
    -DscResource "AADGroupEligibilityScheduleRequest" -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope
        BeforeAll {

            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@mydomain.com', $secpasswd)

            Mock -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName Get-MSCloudLoginConnectionProfile -MockWith {
            }

            Mock -CommandName Reset-MSCloudLoginConnectionProfileContext -MockWith {
            }

            Mock -CommandName Get-PSSession -MockWith {
            }

            Mock -CommandName Remove-PSSession -MockWith {
            }

            Mock -CommandName Update-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
            }

            Mock -CommandName New-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
            }

            Mock -CommandName Remove-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
            }

            Mock -CommandName New-M365DSCConnection -MockWith {
                return "Credentials"
            }

            # Mock Write-Host to hide output during the tests
            Mock -CommandName Write-Host -MockWith {
            }
            $Script:exportedInstances =$null
            $Script:ExportMode = $false
        }

        # Test contexts
        Context -Name "The AADGroupEligibilityScheduleRequest should exist but it DOES NOT" -Fixture {
            BeforeAll {
                $testParams = @{
                    AccessId = "owner"
                    Action = "adminAssign"
                    approvalId = "FakeStringValue"
                    completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    CreatedBy = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentitySet -Property @{
                        EndpointType = "default"
                        Group = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        OnPremises = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        User = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        ApplicationInstance = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Phone = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Conversation = (New-CimInstance -ClassName MSFT_MicrosoftGraphteamworkConversationIdentity -Property @{
                            Id = "FakeStringValue"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            ApplicationType = "FakeStringValue"
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            IpAddress = "FakeStringValue"
                            AppId = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Application = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteGroup = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Encrypted = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AssertedIdentity = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Guest = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AzureCommunicationServicesUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        odataType = "#microsoft.graph.chatMessageFromIdentitySet"
                        Device = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                    } -ClientOnly)
                    CustomData = "FakeStringValue"
                    GroupId = "FakeStringValue"
                    Id = "FakeStringValue"
                    IsValidationOnly = $True
                    Justification = "FakeStringValue"
                    PrincipalId = "FakeStringValue"
                    scheduleInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphrequestSchedule -Property @{
                        recurrence = (New-CimInstance -ClassName MSFT_MicrosoftGraphpatternedRecurrence1 -Property @{
                            pattern = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrencePattern1 -Property @{
                                index = "first"
                                firstDayOfWeek = "sunday"
                                dayOfMonth = 25
                                month = 25
                                daysOfWeek = @("sunday")
                                type = "daily"
                                interval = 25
                            } -ClientOnly)
                            range = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrenceRange1 -Property @{
                                startDate = "2023-01-01T00:00:00.0000000"
                                endDate = "2023-01-01T00:00:00.0000000"
                                recurrenceTimeZone = "FakeStringValue"
                                numberOfOccurrences = 25
                                type = "endDate"
                            } -ClientOnly)
                        } -ClientOnly)
                        expiration = (New-CimInstance -ClassName MSFT_MicrosoftGraphexpirationPattern -Property @{
                            endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            type = "notSpecified"
                        } -ClientOnly)
                        startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    } -ClientOnly)
                    Status = "FakeStringValue"
                    TargetScheduleId = "FakeStringValue"
                    ticketInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphticketInfo -Property @{
                        ticketNumber = "FakeStringValue"
                        ticketSystem = "FakeStringValue"
                    } -ClientOnly)
                    Ensure = "Present"
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
                    return $null
                }
            }
            It 'Should return Values from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Absent'
            }
            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }
            It 'Should Create the group from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName New-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -Exactly 1
            }
        }

        Context -Name "The AADGroupEligibilityScheduleRequest exists but it SHOULD NOT" -Fixture {
            BeforeAll {
                $testParams = @{
                    AccessId = "owner"
                    Action = "adminAssign"
                    approvalId = "FakeStringValue"
                    completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    CreatedBy = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentitySet -Property @{
                        EndpointType = "default"
                        Group = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        OnPremises = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        User = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        ApplicationInstance = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Phone = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Conversation = (New-CimInstance -ClassName MSFT_MicrosoftGraphteamworkConversationIdentity -Property @{
                            Id = "FakeStringValue"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            ApplicationType = "FakeStringValue"
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            IpAddress = "FakeStringValue"
                            AppId = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Application = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteGroup = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Encrypted = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AssertedIdentity = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Guest = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AzureCommunicationServicesUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        odataType = "#microsoft.graph.chatMessageFromIdentitySet"
                        Device = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                    } -ClientOnly)
                    CustomData = "FakeStringValue"
                    GroupId = "FakeStringValue"
                    Id = "FakeStringValue"
                    IsValidationOnly = $True
                    Justification = "FakeStringValue"
                    PrincipalId = "FakeStringValue"
                    scheduleInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphrequestSchedule -Property @{
                        recurrence = (New-CimInstance -ClassName MSFT_MicrosoftGraphpatternedRecurrence1 -Property @{
                            pattern = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrencePattern1 -Property @{
                                index = "first"
                                firstDayOfWeek = "sunday"
                                dayOfMonth = 25
                                month = 25
                                daysOfWeek = @("sunday")
                                type = "daily"
                                interval = 25
                            } -ClientOnly)
                            range = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrenceRange1 -Property @{
                                startDate = "2023-01-01T00:00:00.0000000"
                                endDate = "2023-01-01T00:00:00.0000000"
                                recurrenceTimeZone = "FakeStringValue"
                                numberOfOccurrences = 25
                                type = "endDate"
                            } -ClientOnly)
                        } -ClientOnly)
                        expiration = (New-CimInstance -ClassName MSFT_MicrosoftGraphexpirationPattern -Property @{
                            endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            type = "notSpecified"
                        } -ClientOnly)
                        startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    } -ClientOnly)
                    Status = "FakeStringValue"
                    TargetScheduleId = "FakeStringValue"
                    ticketInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphticketInfo -Property @{
                        ticketNumber = "FakeStringValue"
                        ticketSystem = "FakeStringValue"
                    } -ClientOnly)
                    Ensure = 'Absent'
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
                    return @{
                        AdditionalProperties = @{
                            isValidationOnly = $True
                            scheduleInfo = @{
                                recurrence = @{
                                    pattern = @{
                                        index = "first"
                                        firstDayOfWeek = "sunday"
                                        dayOfMonth = 25
                                        month = 25
                                        daysOfWeek = @("sunday")
                                        type = "daily"
                                        interval = 25
                                    }
                                    range = @{
                                        startDate = "2023-01-01T00:00:00.0000000"
                                        endDate = "2023-01-01T00:00:00.0000000"
                                        recurrenceTimeZone = "FakeStringValue"
                                        numberOfOccurrences = 25
                                        type = "endDate"
                                    }
                                }
                                expiration = @{
                                    endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                                    type = "notSpecified"
                                }
                                startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            }
                            principalId = "FakeStringValue"
                            justification = "FakeStringValue"
                            accessId = "owner"
                            '@odata.type' = "#microsoft.graph.PrivilegedAccessGroupEligibilityScheduleRequest"
                            groupId = "FakeStringValue"
                            action = "adminAssign"
                            targetScheduleId = "FakeStringValue"
                            ticketInfo = @{
                                ticketNumber = "FakeStringValue"
                                ticketSystem = "FakeStringValue"
                            }
                        }
                        approvalId = "FakeStringValue"
                        completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                        CreatedBy = @{
                            '@odata.type' = "#microsoft.graph.chatMessageFromIdentitySet"
                            Group = @{
                            }
                            User = @{
                            }
                            EndpointType = "default"
                            ApplicationInstance = @{
                            }
                            Phone = @{
                            }
                            Conversation = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                AppId = "FakeStringValue"
                                Email = "FakeStringValue"
                                ApplicationType = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                            Application = @{
                            }
                            SiteGroup = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationType = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                            Encrypted = @{
                            }
                            AssertedIdentity = @{
                            }
                            Guest = @{
                            }
                            AzureCommunicationServicesUser = @{
                            }
                            OnPremises = @{
                            }
                            Device = @{
                            }
                            SiteUser = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationType = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                        }
                        CustomData = "FakeStringValue"
                        Id = "FakeStringValue"
                        Status = "FakeStringValue"

                    }
                }
            }

            It 'Should return Values from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return true from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should Remove the group from the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Remove-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -Exactly 1
            }
        }

        Context -Name "The AADGroupEligibilityScheduleRequest Exists and Values are already in the desired state" -Fixture {
            BeforeAll {
                $testParams = @{
                    AccessId = "owner"
                    Action = "adminAssign"
                    approvalId = "FakeStringValue"
                    completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    CreatedBy = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentitySet -Property @{
                        EndpointType = "default"
                        Group = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        OnPremises = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        User = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        ApplicationInstance = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Phone = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Conversation = (New-CimInstance -ClassName MSFT_MicrosoftGraphteamworkConversationIdentity -Property @{
                            Id = "FakeStringValue"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            ApplicationType = "FakeStringValue"
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            IpAddress = "FakeStringValue"
                            AppId = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Application = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteGroup = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Encrypted = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AssertedIdentity = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Guest = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AzureCommunicationServicesUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        odataType = "#microsoft.graph.chatMessageFromIdentitySet"
                        Device = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                    } -ClientOnly)
                    CustomData = "FakeStringValue"
                    GroupId = "FakeStringValue"
                    Id = "FakeStringValue"
                    IsValidationOnly = $True
                    Justification = "FakeStringValue"
                    PrincipalId = "FakeStringValue"
                    scheduleInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphrequestSchedule -Property @{
                        recurrence = (New-CimInstance -ClassName MSFT_MicrosoftGraphpatternedRecurrence1 -Property @{
                            pattern = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrencePattern1 -Property @{
                                index = "first"
                                firstDayOfWeek = "sunday"
                                dayOfMonth = 25
                                month = 25
                                daysOfWeek = @("sunday")
                                type = "daily"
                                interval = 25
                            } -ClientOnly)
                            range = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrenceRange1 -Property @{
                                startDate = "2023-01-01T00:00:00.0000000"
                                endDate = "2023-01-01T00:00:00.0000000"
                                recurrenceTimeZone = "FakeStringValue"
                                numberOfOccurrences = 25
                                type = "endDate"
                            } -ClientOnly)
                        } -ClientOnly)
                        expiration = (New-CimInstance -ClassName MSFT_MicrosoftGraphexpirationPattern -Property @{
                            endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            type = "notSpecified"
                        } -ClientOnly)
                        startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    } -ClientOnly)
                    Status = "FakeStringValue"
                    TargetScheduleId = "FakeStringValue"
                    ticketInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphticketInfo -Property @{
                        ticketNumber = "FakeStringValue"
                        ticketSystem = "FakeStringValue"
                    } -ClientOnly)
                    Ensure = 'Present'
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
                    return @{
                        AdditionalProperties = @{
                            isValidationOnly = $True
                            scheduleInfo = @{
                                recurrence = @{
                                    pattern = @{
                                        index = "first"
                                        firstDayOfWeek = "sunday"
                                        dayOfMonth = 25
                                        month = 25
                                        daysOfWeek = @("sunday")
                                        type = "daily"
                                        interval = 25
                                    }
                                    range = @{
                                        startDate = "2023-01-01T00:00:00.0000000"
                                        endDate = "2023-01-01T00:00:00.0000000"
                                        recurrenceTimeZone = "FakeStringValue"
                                        numberOfOccurrences = 25
                                        type = "endDate"
                                    }
                                }
                                expiration = @{
                                    endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                                    type = "notSpecified"
                                }
                                startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            }
                            principalId = "FakeStringValue"
                            justification = "FakeStringValue"
                            accessId = "owner"
                            '@odata.type' = "#microsoft.graph.PrivilegedAccessGroupEligibilityScheduleRequest"
                            groupId = "FakeStringValue"
                            action = "adminAssign"
                            targetScheduleId = "FakeStringValue"
                            ticketInfo = @{
                                ticketNumber = "FakeStringValue"
                                ticketSystem = "FakeStringValue"
                            }
                        }
                        approvalId = "FakeStringValue"
                        completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                        CreatedBy = @{
                            '@odata.type' = "#microsoft.graph.chatMessageFromIdentitySet"
                            Group = @{
                            }
                            User = @{
                            }
                            EndpointType = "default"
                            ApplicationInstance = @{
                            }
                            Phone = @{
                            }
                            Conversation = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                AppId = "FakeStringValue"
                                Email = "FakeStringValue"
                                ApplicationType = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                            Application = @{
                            }
                            SiteGroup = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationType = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                            Encrypted = @{
                            }
                            AssertedIdentity = @{
                            }
                            Guest = @{
                            }
                            AzureCommunicationServicesUser = @{
                            }
                            OnPremises = @{
                            }
                            Device = @{
                            }
                            SiteUser = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationType = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                        }
                        CustomData = "FakeStringValue"
                        Id = "FakeStringValue"
                        Status = "FakeStringValue"

                    }
                }
            }

            It 'Should return true from the Test method' {
                Test-TargetResource @testParams | Should -Be $true
            }
        }

        Context -Name "The AADGroupEligibilityScheduleRequest exists and values are NOT in the desired state" -Fixture {
            BeforeAll {
                $testParams = @{
                    AccessId = "owner"
                    Action = "adminAssign"
                    approvalId = "FakeStringValue"
                    completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    CreatedBy = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentitySet -Property @{
                        EndpointType = "default"
                        Group = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        OnPremises = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        User = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        ApplicationInstance = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Phone = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Conversation = (New-CimInstance -ClassName MSFT_MicrosoftGraphteamworkConversationIdentity -Property @{
                            Id = "FakeStringValue"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            ApplicationType = "FakeStringValue"
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            IpAddress = "FakeStringValue"
                            AppId = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Application = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteGroup = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                        Encrypted = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AssertedIdentity = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        Guest = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        AzureCommunicationServicesUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        odataType = "#microsoft.graph.chatMessageFromIdentitySet"
                        Device = (New-CimInstance -ClassName MSFT_MicrosoftGraphidentity -Property @{
                        } -ClientOnly)
                        SiteUser = (New-CimInstance -ClassName MSFT_MicrosoftGraphsharePointIdentity -Property @{
                            Id = "FakeStringValue"
                            AzureCommunicationServicesResourceId = "FakeStringValue"
                            UserIdentityType = "aadUser"
                            ApplicationIdentityType = "aadApplication"
                            Details = (New-CimInstance -ClassName MSFT_MicrosoftGraphdetailsInfo -Property @{
                                Name = "Details"
                                isArray = $False
                                CIMType = "MSFT_MicrosoftGraphdetailsInfo"
                            } -ClientOnly)
                            Email = "FakeStringValue"
                            odataType = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                            ApplicationType = "FakeStringValue"
                            IpAddress = "FakeStringValue"
                            InitiatorType = "user"
                            DisplayName = "FakeStringValue"
                            TenantId = "FakeStringValue"
                            LoginName = "FakeStringValue"
                            UserPrincipalName = "FakeStringValue"
                            AppId = "FakeStringValue"
                            Hidden = $True
                            ConversationIdentityType = "team"
                            IdentityType = "FakeStringValue"
                        } -ClientOnly)
                    } -ClientOnly)
                    CustomData = "FakeStringValue"
                    GroupId = "FakeStringValue"
                    Id = "FakeStringValue"
                    IsValidationOnly = $True
                    Justification = "FakeStringValue"
                    PrincipalId = "FakeStringValue"
                    scheduleInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphrequestSchedule -Property @{
                        recurrence = (New-CimInstance -ClassName MSFT_MicrosoftGraphpatternedRecurrence1 -Property @{
                            pattern = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrencePattern1 -Property @{
                                index = "first"
                                firstDayOfWeek = "sunday"
                                dayOfMonth = 25
                                month = 25
                                daysOfWeek = @("sunday")
                                type = "daily"
                                interval = 25
                            } -ClientOnly)
                            range = (New-CimInstance -ClassName MSFT_MicrosoftGraphrecurrenceRange1 -Property @{
                                startDate = "2023-01-01T00:00:00.0000000"
                                endDate = "2023-01-01T00:00:00.0000000"
                                recurrenceTimeZone = "FakeStringValue"
                                numberOfOccurrences = 25
                                type = "endDate"
                            } -ClientOnly)
                        } -ClientOnly)
                        expiration = (New-CimInstance -ClassName MSFT_MicrosoftGraphexpirationPattern -Property @{
                            endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            type = "notSpecified"
                        } -ClientOnly)
                        startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                    } -ClientOnly)
                    Status = "FakeStringValue"
                    TargetScheduleId = "FakeStringValue"
                    ticketInfo = (New-CimInstance -ClassName MSFT_MicrosoftGraphticketInfo -Property @{
                        ticketNumber = "FakeStringValue"
                        ticketSystem = "FakeStringValue"
                    } -ClientOnly)
                    Ensure = 'Present'
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
                    return @{
                        AdditionalProperties = @{
                            justification = "FakeStringValue"
                            scheduleInfo = @{
                                recurrence = @{
                                    pattern = @{
                                        index = "first"
                                        firstDayOfWeek = "sunday"
                                        dayOfMonth = 7
                                        month = 7
                                        daysOfWeek = @("sunday")
                                        type = "daily"
                                        interval = 7
                                    }
                                    range = @{
                                        startDate = "2023-01-01T00:00:00.0000000"
                                        endDate = "2023-01-01T00:00:00.0000000"
                                        recurrenceTimeZone = "FakeStringValue"
                                        numberOfOccurrences = 7
                                        type = "endDate"
                                    }
                                }
                                expiration = @{
                                    endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                                    type = "notSpecified"
                                }
                                startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            }
                            accessId = "owner"
                            principalId = "FakeStringValue"
                            action = "adminAssign"
                            groupId = "FakeStringValue"
                            targetScheduleId = "FakeStringValue"
                            ticketInfo = @{
                                ticketNumber = "FakeStringValue"
                                ticketSystem = "FakeStringValue"
                            }
                        }
                        approvalId = "FakeStringValue"
                        completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                        CreatedBy = @{
                            '@odata.type' = "#microsoft.graph.chatMessageFromIdentitySet"
                            Group = @{
                            }
                            User = @{
                            }
                            EndpointType = "default"
                            ApplicationInstance = @{
                            }
                            Phone = @{
                            }
                            Conversation = @{
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationIdentityType = "aadApplication"
                                Id = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Email = "FakeStringValue"
                                ApplicationType = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                UserIdentityType = "aadUser"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                IdentityType = "FakeStringValue"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                ConversationIdentityType = "team"
                            }
                            Application = @{
                            }
                            SiteGroup = @{
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                Id = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                ApplicationIdentityType = "aadApplication"
                                ApplicationType = "FakeStringValue"
                                UserIdentityType = "aadUser"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                IdentityType = "FakeStringValue"
                                AppId = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                ConversationIdentityType = "team"
                            }
                            Encrypted = @{
                            }
                            AssertedIdentity = @{
                            }
                            Guest = @{
                            }
                            AzureCommunicationServicesUser = @{
                            }
                            OnPremises = @{
                            }
                            Device = @{
                            }
                            SiteUser = @{
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                Id = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                ApplicationIdentityType = "aadApplication"
                                ApplicationType = "FakeStringValue"
                                UserIdentityType = "aadUser"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                IdentityType = "FakeStringValue"
                                AppId = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                ConversationIdentityType = "team"
                            }
                        }
                        CustomData = "FakeStringValue"
                        Id = "FakeStringValue"
                        Status = "FakeStringValue"
                    }
                }
            }

            It 'Should return Values from the Get method' {
                (Get-TargetResource @testParams).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should call the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Update-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -Exactly 1
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                $Global:CurrentModeIsExport = $true
                $Global:PartialExportFileName = "$(New-Guid).partial.ps1"
                $testParams = @{
                    Credential = $Credential
                }

                Mock -CommandName Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -MockWith {
                    return @{
                        AdditionalProperties = @{
                            isValidationOnly = $True
                            scheduleInfo = @{
                                recurrence = @{
                                    pattern = @{
                                        index = "first"
                                        firstDayOfWeek = "sunday"
                                        dayOfMonth = 25
                                        month = 25
                                        daysOfWeek = @("sunday")
                                        type = "daily"
                                        interval = 25
                                    }
                                    range = @{
                                        startDate = "2023-01-01T00:00:00.0000000"
                                        endDate = "2023-01-01T00:00:00.0000000"
                                        recurrenceTimeZone = "FakeStringValue"
                                        numberOfOccurrences = 25
                                        type = "endDate"
                                    }
                                }
                                expiration = @{
                                    endDateTime = "2023-01-01T00:00:00.0000000+01:00"
                                    type = "notSpecified"
                                }
                                startDateTime = "2023-01-01T00:00:00.0000000+01:00"
                            }
                            principalId = "FakeStringValue"
                            justification = "FakeStringValue"
                            accessId = "owner"
                            '@odata.type' = "#microsoft.graph.PrivilegedAccessGroupEligibilityScheduleRequest"
                            groupId = "FakeStringValue"
                            action = "adminAssign"
                            targetScheduleId = "FakeStringValue"
                            ticketInfo = @{
                                ticketNumber = "FakeStringValue"
                                ticketSystem = "FakeStringValue"
                            }
                        }
                        approvalId = "FakeStringValue"
                        completedDateTime = "2023-01-01T00:00:00.0000000+01:00"
                        CreatedBy = @{
                            '@odata.type' = "#microsoft.graph.chatMessageFromIdentitySet"
                            Group = @{
                            }
                            User = @{
                            }
                            EndpointType = "default"
                            ApplicationInstance = @{
                            }
                            Phone = @{
                            }
                            Conversation = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                AppId = "FakeStringValue"
                                Email = "FakeStringValue"
                                ApplicationType = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                            Application = @{
                            }
                            SiteGroup = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationType = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                            Encrypted = @{
                            }
                            AssertedIdentity = @{
                            }
                            Guest = @{
                            }
                            AzureCommunicationServicesUser = @{
                            }
                            OnPremises = @{
                            }
                            Device = @{
                            }
                            SiteUser = @{
                                Id = "FakeStringValue"
                                '@odata.type' = "#microsoft.graph.azureCommunicationServicesUserIdentity"
                                UserIdentityType = "aadUser"
                                ApplicationIdentityType = "aadApplication"
                                AzureCommunicationServicesResourceId = "FakeStringValue"
                                IpAddress = "FakeStringValue"
                                Email = "FakeStringValue"
                                Details = @{
                                    Name = "Details"
                                    isArray = $False
                                }
                                ApplicationType = "FakeStringValue"
                                InitiatorType = "user"
                                DisplayName = "FakeStringValue"
                                TenantId = "FakeStringValue"
                                LoginName = "FakeStringValue"
                                UserPrincipalName = "FakeStringValue"
                                AppId = "FakeStringValue"
                                Hidden = $True
                                ConversationIdentityType = "team"
                                IdentityType = "FakeStringValue"
                            }
                        }
                        CustomData = "FakeStringValue"
                        Id = "FakeStringValue"
                        Status = "FakeStringValue"

                    }
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
