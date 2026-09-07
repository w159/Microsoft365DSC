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
    -DscResource "AADCrossTenantAccessPolicyConfigurationPartner" -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope
        BeforeAll {

            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@onmicrosoft.com', $secpasswd)

            Mock -ModuleName M365DSCUtil -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName New-MgBetaPolicyCrossTenantAccessPolicyPartner -MockWith {
            }
            Mock -CommandName Update-MgBetaPolicyCrossTenantAccessPolicyPartner -MockWith {
            }
            Mock -CommandName Remove-MgBetaPolicyCrossTenantAccessPolicyPartner -MockWith {
            }
            Mock -CommandName Get-MgBetaPolicyCrossTenantAccessPolicyPartner -MockWith {
                return @{
                    TenantId = "12345-12345-12345-12345-12345"
                    B2BCollaborationInbound = @{
                        applications = @{
                            accessType = 'allowed'
                            targets    = @(
                                @{
                                    target     = 'Office365'
                                    targetType = 'application'
                                }
                            )
                        }
                        usersAndGroups = @{
                            accessType = 'allowed'
                            targets    = @(
                                @{
                                    target     = 'AllUsers'
                                    targetType = 'user'
                                }
                            )
                        }
                    }
                    B2BCollaborationOutbound = @{
                        Applications = @{
                            accessType = 'allowed'
                            targets    = @(
                                @{
                                    target     = 'AllApplications'
                                    targetType = 'application'
                                }
                            )
                        }
                        usersAndGroups = @{
                            accessType = 'allowed'
                            targets    = @(
                                @{
                                    target     = 'My Test Group'
                                    targetType = 'group'
                                }
                            )
                        }
                    }
                    B2BDirectConnectInbound  = @{
                        applications = @{
                            accessType = 'blocked'
                            targets    = @(
                                @{
                                    target     = 'AllApplications'
                                    targetType = 'application'
                                }
                            )
                        }
                        usersAndGroups = @{
                            accessType = 'blocked'
                            targets    = @(
                                @{
                                    target     = 'John.Smith@contoso.com'
                                    targetType = 'user'
                                }
                            )
                        }
                    }
                    TenantRestrictions = @{
                        applications = @{
                            accessType = 'blocked'
                            targets    = @(
                                @{
                                    target     = 'AllApplications'
                                    targetType = 'application'
                                }
                            )
                        }
                        usersAndGroups = @{
                            accessType = 'blocked'
                            targets    = @(
                                @{
                                    target     = 'AllUsers'
                                    targetType = 'user'
                                }
                            )
                        }
                    }
                }
            }

            Mock -CommandName Get-MgUser -MockWith {
                return @{
                    UserPrincipalName = 'John.Smith@contoso.com'
                    Id                = "12345-12345-12345-12345-12345"
                }
            }
            Mock -CommandName Get-MgGroup -MockWith {
                return @{
                    DisplayName = 'My Test Group'
                    Id          = "12345-12345-12345-12345-12345"
                }
            }

            Mock -CommandName New-M365DSCConnection -ModuleName '_Shared' -MockWith {
                return "Credentials"
            }

            # Mock Write-M365DSCHost to hide output during the tests
            Mock -CommandName Write-M365DSCHost -MockWith {
            }
            $Script:exportedInstances =$null
            $Script:ExportMode = $false
        }
        # Test contexts
        Context -Name "The instance should exist and it doesn't" -Fixture {
            BeforeAll {
                $testParams = @{
                B2BCollaborationOutbound = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'My Test Group'
                                    TargetType = 'group'
                                }))
                        })
                    })
                    B2BDirectConnectInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'John.Smith@contoso.com'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    B2BCollaborationInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'Office365'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    TenantRestrictions       = ([MSFT_AADCrossTenantAccessPolicyTenantRestrictions] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    Credential               = $Credential;
                    Ensure                   = "Present";
                    PartnerTenantId          = "12345-12345-12345-12345-12345";
                }

                Mock -CommandName Get-MgBetaPolicyCrossTenantAccessPolicyPartner -MockWith {
                    return $null
                }
            }
            It 'Should return Values from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Absent'
            }
            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should create the instance from the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Set()
                Should -Invoke -CommandName New-MgBetaPolicyCrossTenantAccessPolicyPartner -Exactly 1
            }
        }
        Context -Name "The policy is already in the desired state" -Fixture {
            BeforeAll {
                $testParams = @{
                B2BCollaborationOutbound = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'My Test Group'
                                    TargetType = 'group'
                                }))
                        })
                    })
                    B2BDirectConnectInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'John.Smith@contoso.com'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    B2BCollaborationInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'Office365'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    TenantRestrictions       = ([MSFT_AADCrossTenantAccessPolicyTenantRestrictions] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    Credential               = $Credential;
                    Ensure                   = "Present";
                    PartnerTenantId          = "12345-12345-12345-12345-12345";
                }
            }
            It 'Should return Values from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Present'
            }
            It 'Should return true from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Test() | Should -Be $true
            }
        }

        Context -Name "The policy is NOT in the desired state" -Fixture {
            BeforeAll {
                $testParams = @{
                B2BCollaborationOutbound = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'My Drift Group' # Drift
                                    TargetType = 'group'
                                }))
                        })
                    })
                    B2BDirectConnectInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'John.Smith@contoso.com'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    B2BCollaborationInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'Office365'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    TenantRestrictions       = ([MSFT_AADCrossTenantAccessPolicyTenantRestrictions] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    Credential               = $Credential;
                    Ensure                   = "Present";
                    PartnerTenantId          = "12345-12345-12345-12345-12345";
                }
            }
            It 'Should return Values from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Present'
            }
            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Test() | Should -Be $false
            }
            It 'Should update the instance from the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Set()
                Should -Invoke -CommandName Update-MgBetaPolicyCrossTenantAccessPolicyPartner -Exactly 1
            }
        }

        Context -Name "The instance exists but it SHOULD NOT" -Fixture {
            BeforeAll {
                $testParams = @{
                B2BCollaborationOutbound = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'My Test Group'
                                    TargetType = 'group'
                                }))
                        })
                    })
                    B2BDirectConnectInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'John.Smith@contoso.com'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    B2BCollaborationInbound  = ([MSFT_AADCrossTenantAccessPolicyB2BSetting] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'Office365'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'allowed'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    TenantRestrictions       = ([MSFT_AADCrossTenantAccessPolicyTenantRestrictions] @{
                        Applications = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }))
                        })
                        UsersAndGroups = ([MSFT_AADCrossTenantAccessPolicyTargetConfiguration] @{
                            AccessType = 'blocked'
                            Targets    = @(([MSFT_AADCrossTenantAccessPolicyTarget] @{
                                    Target     = 'AllUsers'
                                    TargetType = 'user'
                                }))
                        })
                    })
                    Credential               = $Credential;
                    Ensure                   = "Absent";
                    PartnerTenantId          = "12345-12345-12345-12345-12345";
                }
            }
            It 'Should return Values from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Present'
            }
            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Test() | Should -Be $false
            }
            It 'Should remove the instance from the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -Property $testParams).Set()
                Should -Invoke -CommandName Remove-MgBetaPolicyCrossTenantAccessPolicyPartner -Exactly 1
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
                $result = Invoke-M365DSCResourceMethod -ResourceName 'AADCrossTenantAccessPolicyConfigurationPartner' -MethodName 'Export' -Parameters $testParams
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}

Invoke-Command -ScriptBlock $Global:DscHelper.CleanupScript -NoNewScope
