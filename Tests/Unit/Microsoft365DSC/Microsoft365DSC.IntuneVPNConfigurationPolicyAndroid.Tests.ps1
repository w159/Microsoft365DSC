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
    -DscResource "IntuneVPNConfigurationPolicyAndroid" -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope
        BeforeAll {

            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@mydomain.com', $secpasswd)

            Mock -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName Get-PSSession -MockWith {
            }

            Mock -CommandName Remove-PSSession -MockWith {
            }

            Mock -CommandName Update-MgBetaDeviceManagementDeviceConfiguration -MockWith {
            }

            Mock -CommandName New-MgBetaDeviceManagementDeviceConfiguration -MockWith {
            }

            Mock -CommandName Remove-MgBetaDeviceManagementDeviceConfiguration -MockWith {
            }

            Mock -CommandName New-M365DSCConnection -MockWith {
                return "Credentials"
            }

            # Mock Write-Host to hide output during the tests
            Mock -CommandName Write-Host -MockWith {
            }
            $Script:exportedInstances =$null
            $Script:ExportMode = $false

            Mock -CommandName Get-MgBetaDeviceManagementDeviceConfigurationAssignment -MockWith {
            }

        }

        # Test contexts
        Context -Name "The IntuneVPNConfigurationPolicyAndroid should exist but it DOES NOT" -Fixture {
            BeforeAll {
                $testParams = @{
                    AuthenticationMethod = "certificate"
                    ConnectionName = "FakeStringValue"
                    ConnectionType = "ciscoAnyConnect"
                    customData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValue -Property @{
                            value = "FakeStringValue"
                            key = "FakeStringValue"
                        } -ClientOnly)
                    )
                    customKeyValueData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValuePair -Property @{
                            value = "FakeStringValue"
                            name = "FakeStringValue"
                        } -ClientOnly)
                    )
                    description = "FakeStringValue"
                    DeviceManagementApplicabilityRuleDeviceMode = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleDeviceMode -Property @{
                        DeviceMode = "standardConfiguration"
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsEdition = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsEdition -Property @{
                        OsEditionTypes = @("windows10Enterprise")
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsVersion = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsVersion -Property @{
                        MaxOSVersion = "FakeStringValue"
                        Name = "FakeStringValue"
                        MinOSVersion = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DisplayName = "FakeStringValue"
                    fingerprint = "FakeStringValue"
                    Id = "FakeStringValue"
                    realm = "FakeStringValue"
                    role = "FakeStringValue"
                    RoleScopeTagIds = @("FakeStringValue")
                    servers = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunevpnServer -Property @{
                            address = "FakeStringValue"
                            description = "FakeStringValue"
                            isDefaultServer = $True
                        } -ClientOnly)
                    )
                    SupportsScopeTags = $True
                    Version = 25
                    Ensure = "Present"
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgBetaDeviceManagementDeviceConfiguration -MockWith {
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
                Should -Invoke -CommandName New-MgBetaDeviceManagementDeviceConfiguration -Exactly 1
            }
        }

        Context -Name "The IntuneVPNConfigurationPolicyAndroid exists but it SHOULD NOT" -Fixture {
            BeforeAll {
                $testParams = @{
                    AuthenticationMethod = "certificate"
                    ConnectionName = "FakeStringValue"
                    ConnectionType = "ciscoAnyConnect"
                    customData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValue -Property @{
                            value = "FakeStringValue"
                            key = "FakeStringValue"
                        } -ClientOnly)
                    )
                    customKeyValueData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValuePair -Property @{
                            value = "FakeStringValue"
                            name = "FakeStringValue"
                        } -ClientOnly)
                    )
                    description = "FakeStringValue"
                    DeviceManagementApplicabilityRuleDeviceMode = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleDeviceMode -Property @{
                        DeviceMode = "standardConfiguration"
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsEdition = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsEdition -Property @{
                        OsEditionTypes = @("windows10Enterprise")
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsVersion = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsVersion -Property @{
                        MaxOSVersion = "FakeStringValue"
                        Name = "FakeStringValue"
                        MinOSVersion = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DisplayName = "FakeStringValue"
                    fingerprint = "FakeStringValue"
                    Id = "FakeStringValue"
                    realm = "FakeStringValue"
                    role = "FakeStringValue"
                    RoleScopeTagIds = @("FakeStringValue")
                    servers = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunevpnServer -Property @{
                            address = "FakeStringValue"
                            description = "FakeStringValue"
                            isDefaultServer = $True
                        } -ClientOnly)
                    )
                    SupportsScopeTags = $True
                    Version = 25
                    Ensure = 'Absent'
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgBetaDeviceManagementDeviceConfiguration -MockWith {
                    return @{
                        AdditionalProperties = @{
                            role = "FakeStringValue"
                            connectionName = "FakeStringValue"
                            customData = @(
                                @{
                                    value = "FakeStringValue"
                                    key = "FakeStringValue"
                                }
                            )
                            realm = "FakeStringValue"
                            connectionType = "ciscoAnyConnect"
                            '@odata.type' = "#microsoft.graph.androidVpnConfiguration"
                            authenticationMethod = "certificate"
                            servers = @(
                                @{
                                    address = "FakeStringValue"
                                    description = "FakeStringValue"
                                    isDefaultServer = $True
                                }
                            )
                            fingerprint = "FakeStringValue"
                            customKeyValueData = @(
                                @{
                                    value = "FakeStringValue"
                                    name = "FakeStringValue"
                                }
                            )
                        }
                        description = "FakeStringValue"
                        DeviceManagementApplicabilityRuleDeviceMode = @{
                            DeviceMode = "standardConfiguration"
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsEdition = @{
                            OsEditionTypes = @("windows10Enterprise")
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsVersion = @{
                            MaxOSVersion = "FakeStringValue"
                            Name = "FakeStringValue"
                            MinOSVersion = "FakeStringValue"
                            RuleType = "include"
                        }
                        DisplayName = "FakeStringValue"
                        Id = "FakeStringValue"
                        RoleScopeTagIds = @("FakeStringValue")
                        SupportsScopeTags = $True
                        Version = 25

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
                Should -Invoke -CommandName Remove-MgBetaDeviceManagementDeviceConfiguration -Exactly 1
            }
        }

        Context -Name "The IntuneVPNConfigurationPolicyAndroid Exists and Values are already in the desired state" -Fixture {
            BeforeAll {
                $testParams = @{
                    AuthenticationMethod = "certificate"
                    ConnectionName = "FakeStringValue"
                    ConnectionType = "ciscoAnyConnect"
                    customData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValue -Property @{
                            value = "FakeStringValue"
                            key = "FakeStringValue"
                        } -ClientOnly)
                    )
                    customKeyValueData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValuePair -Property @{
                            value = "FakeStringValue"
                            name = "FakeStringValue"
                        } -ClientOnly)
                    )
                    description = "FakeStringValue"
                    DeviceManagementApplicabilityRuleDeviceMode = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleDeviceMode -Property @{
                        DeviceMode = "standardConfiguration"
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsEdition = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsEdition -Property @{
                        OsEditionTypes = @("windows10Enterprise")
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsVersion = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsVersion -Property @{
                        MaxOSVersion = "FakeStringValue"
                        Name = "FakeStringValue"
                        MinOSVersion = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DisplayName = "FakeStringValue"
                    fingerprint = "FakeStringValue"
                    Id = "FakeStringValue"
                    realm = "FakeStringValue"
                    role = "FakeStringValue"
                    RoleScopeTagIds = @("FakeStringValue")
                    servers = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunevpnServer -Property @{
                            address = "FakeStringValue"
                            description = "FakeStringValue"
                            isDefaultServer = $True
                        } -ClientOnly)
                    )
                    SupportsScopeTags = $True
                    Version = 25
                    Ensure = 'Present'
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgBetaDeviceManagementDeviceConfiguration -MockWith {
                    return @{
                        AdditionalProperties = @{
                            role = "FakeStringValue"
                            connectionName = "FakeStringValue"
                            customData = @(
                                @{
                                    value = "FakeStringValue"
                                    key = "FakeStringValue"
                                }
                            )
                            realm = "FakeStringValue"
                            connectionType = "ciscoAnyConnect"
                            '@odata.type' = "#microsoft.graph.androidVpnConfiguration"
                            authenticationMethod = "certificate"
                            servers = @(
                                @{
                                    address = "FakeStringValue"
                                    description = "FakeStringValue"
                                    isDefaultServer = $True
                                }
                            )
                            fingerprint = "FakeStringValue"
                            customKeyValueData = @(
                                @{
                                    value = "FakeStringValue"
                                    name = "FakeStringValue"
                                }
                            )
                        }
                        description = "FakeStringValue"
                        DeviceManagementApplicabilityRuleDeviceMode = @{
                            DeviceMode = "standardConfiguration"
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsEdition = @{
                            OsEditionTypes = @("windows10Enterprise")
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsVersion = @{
                            MaxOSVersion = "FakeStringValue"
                            Name = "FakeStringValue"
                            MinOSVersion = "FakeStringValue"
                            RuleType = "include"
                        }
                        DisplayName = "FakeStringValue"
                        Id = "FakeStringValue"
                        RoleScopeTagIds = @("FakeStringValue")
                        SupportsScopeTags = $True
                        Version = 25

                    }
                }
            }

            It 'Should return true from the Test method' {
                Test-TargetResource @testParams | Should -Be $true
            }
        }

        Context -Name "The IntuneVPNConfigurationPolicyAndroid exists and values are NOT in the desired state" -Fixture {
            BeforeAll {
                $testParams = @{
                    AuthenticationMethod = "certificate"
                    ConnectionName = "FakeStringValue"
                    ConnectionType = "ciscoAnyConnect"
                    customData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValue -Property @{
                            value = "FakeStringValue"
                            key = "FakeStringValue"
                        } -ClientOnly)
                    )
                    customKeyValueData = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunekeyValuePair -Property @{
                            value = "FakeStringValue"
                            name = "FakeStringValue"
                        } -ClientOnly)
                    )
                    description = "FakeStringValue"
                    DeviceManagementApplicabilityRuleDeviceMode = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleDeviceMode -Property @{
                        DeviceMode = "standardConfiguration"
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsEdition = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsEdition -Property @{
                        OsEditionTypes = @("windows10Enterprise")
                        Name = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DeviceManagementApplicabilityRuleOsVersion = (New-CimInstance -ClassName MSFT_IntunedeviceManagementApplicabilityRuleOsVersion -Property @{
                        MaxOSVersion = "FakeStringValue"
                        Name = "FakeStringValue"
                        MinOSVersion = "FakeStringValue"
                        RuleType = "include"
                    } -ClientOnly)
                    DisplayName = "FakeStringValue"
                    fingerprint = "FakeStringValue"
                    Id = "FakeStringValue"
                    realm = "FakeStringValue"
                    role = "FakeStringValue"
                    RoleScopeTagIds = @("FakeStringValue")
                    servers = [CimInstance[]]@(
                        (New-CimInstance -ClassName MSFT_IntunevpnServer -Property @{
                            address = "FakeStringValue"
                            description = "FakeStringValue"
                            isDefaultServer = $True
                        } -ClientOnly)
                    )
                    SupportsScopeTags = $True
                    Version = 25
                    Ensure = 'Present'
                    Credential = $Credential;
                }

                Mock -CommandName Get-MgBetaDeviceManagementDeviceConfiguration -MockWith {
                    return @{
                        AdditionalProperties = @{
                            customData = @(
                                @{
                                    value = "FakeStringValue"
                                    key = "FakeStringValue"
                                }
                            )
                            role = "FakeStringValue"
                            realm = "FakeStringValue"
                            connectionType = "ciscoAnyConnect"
                            connectionName = "FakeStringValue"
                            servers = @(
                                @{
                                    address = "FakeStringValue"
                                    description = "FakeStringValue"
                                }
                            )
                            authenticationMethod = "certificate"
                            fingerprint = "FakeStringValue"
                            customKeyValueData = @(
                                @{
                                    value = "FakeStringValue"
                                    name = "FakeStringValue"
                                }
                            )
                        }
                        description = "FakeStringValue"
                        DeviceManagementApplicabilityRuleDeviceMode = @{
                            DeviceMode = "standardConfiguration"
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsEdition = @{
                            OsEditionTypes = @("windows10Enterprise")
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsVersion = @{
                            MaxOSVersion = "FakeStringValue"
                            Name = "FakeStringValue"
                            MinOSVersion = "FakeStringValue"
                            RuleType = "include"
                        }
                        DisplayName = "FakeStringValue"
                        Id = "FakeStringValue"
                        RoleScopeTagIds = @("FakeStringValue")
                        Version = 7
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
                Should -Invoke -CommandName Update-MgBetaDeviceManagementDeviceConfiguration -Exactly 1
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                $Global:CurrentModeIsExport = $true
                $Global:PartialExportFileName = "$(New-Guid).partial.ps1"
                $testParams = @{
                    Credential = $Credential
                }

                Mock -CommandName Get-MgBetaDeviceManagementDeviceConfiguration -MockWith {
                    return @{
                        AdditionalProperties = @{
                            role = "FakeStringValue"
                            connectionName = "FakeStringValue"
                            customData = @(
                                @{
                                    value = "FakeStringValue"
                                    key = "FakeStringValue"
                                }
                            )
                            realm = "FakeStringValue"
                            connectionType = "ciscoAnyConnect"
                            '@odata.type' = "#microsoft.graph.androidVpnConfiguration"
                            authenticationMethod = "certificate"
                            servers = @(
                                @{
                                    address = "FakeStringValue"
                                    description = "FakeStringValue"
                                    isDefaultServer = $True
                                }
                            )
                            fingerprint = "FakeStringValue"
                            customKeyValueData = @(
                                @{
                                    value = "FakeStringValue"
                                    name = "FakeStringValue"
                                }
                            )
                        }
                        description = "FakeStringValue"
                        DeviceManagementApplicabilityRuleDeviceMode = @{
                            DeviceMode = "standardConfiguration"
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsEdition = @{
                            OsEditionTypes = @("windows10Enterprise")
                            Name = "FakeStringValue"
                            RuleType = "include"
                        }
                        DeviceManagementApplicabilityRuleOsVersion = @{
                            MaxOSVersion = "FakeStringValue"
                            Name = "FakeStringValue"
                            MinOSVersion = "FakeStringValue"
                            RuleType = "include"
                        }
                        DisplayName = "FakeStringValue"
                        Id = "FakeStringValue"
                        RoleScopeTagIds = @("FakeStringValue")
                        SupportsScopeTags = $True
                        Version = 25

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
