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
    -DscResource 'SCSensitivityLabel' -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope

        BeforeAll {
            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@onmicrosoft.com', $secpasswd)

            Mock -ModuleName M365DSCUtil -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName New-M365DSCConnection -ModuleName '_Shared' -MockWith {
                return 'Credentials'
            }

            Mock -CommandName Import-PSSession -MockWith {
            }

            Mock -CommandName New-PSSession -MockWith {
            }

            Mock -CommandName Remove-Label -MockWith {
            }

            Mock -CommandName New-Label -MockWith {
                return @{

                }
            }

            Mock -CommandName Set-Label -MockWith {
                return @{

                }
            }

            Mock -CommandName Start-Sleep -MockWith {
            }

            Mock -CommandName Get-DlpSensitiveInformationType -MockWith {
                return @(
                    [PSCustomObject]@{Name = 'ABA Routing Number'; Id = 'cb353f78-2b72-4c3c-8827-92ebe4f69fdf'; RulePackId = '00000000-0000-0000-0000-000000000000' },
                    [PSCustomObject]@{Name = 'All Full Names'; Id = '50b8b56b-4ef8-44c2-a924-03374f5831ce'; RulePackId = '00000000-0000-0000-0000-000000000004' }
                )
            }

            Mock -CommandName Get-Label -MockWith {
                return @(
                    @{
                        Name           = 'TestLabel'
                        Comment        = 'This is a test label'
                        ToolTip        = 'Test tool tip'
                        DisplayName    = 'Test label'
                        ParentId       = 'MyLabel'
                        Priority       = '2'
                        Settings       = '[LabelStatus, Enabled]'
                        LocaleSettings = '{"LocaleKey":"DisplayName","Settings":[{"Key":"en-us","Value":"English DisplayName"}]}'
                        Conditions     = '{"And":[{"Or":[{"Key":"CCSI","Value":"cb353f78-2b72-4c3c-8827-92ebe4f69fdf","Properties":null,"Settings":[{"Key":"mincount","Value":"1"},{"Key":"maxconfidence","Value":"100"},{"Key":"rulepackage","Value":"00000000-0000-0000-0000-000000000000"},{"Key":"name","Value":"ABA Routing Number"},{"Key":"groupname","Value":"Group1"},{"Key":"minconfidence","Value":"85"},{"Key":"maxcount","Value":"-1"},{"Key":"policytip","Value":"My Perfect Test Tip!"},{"Key":"confidencelevel","Value":"High"},{"Key":"autoapplytype","Value":"Recommend"}]},{"Key":"ContentMatchesModule","Value":"ba38aa0f-8c86-4c73-87db-95147a0f4420","Properties":null,"Settings":[{"Key":"name","Value":"Legal Affairs"},{"Key":"groupname","Value":"Group1"},{"Key":"policytip","Value":"My Perfect Test Tip!"},{"Key":"autoapplytype","Value":"Recommend"}]}]},{"And":[{"Key":"CCSI","Value":"50b8b56b-4ef8-44c2-a924-03374f5831ce","Properties":null,"Settings":[{"Key":"mincount","Value":"10"},{"Key":"maxconfidence","Value":"100"},{"Key":"rulepackage","Value":"00000000-0000-0000-0000-000000000004"},{"Key":"name","Value":"All Full Names"},{"Key":"groupname","Value":"Group2"},{"Key":"minconfidence","Value":"85"},{"Key":"maxcount","Value":"100"},{"Key":"policytip","Value":"My Perfect Test Tip!"},{"Key":"confidencelevel","Value":"High"},{"Key":"autoapplytype","Value":"Recommend"}]},{"Key":"ContentMatchesModule","Value":"ba38aa0f-8c86-4c73-87db-95147a0f4420","Properties":null,"Settings":[{"Key":"name","Value":"Legal Affairs"},{"Key":"groupname","Value":"Group2"},{"Key":"policytip","Value":"My Perfect Test Tip!"},{"Key":"autoapplytype","Value":"Recommend"}]}]}]}'
                    }
                    @{
                        Name           = 'MyLabel'
                    }
                )
            }

            # Mock Write-M365DSCHost to hide output during the tests
            Mock -CommandName Write-M365DSCHost -MockWith {
            }
            $Script:exportedInstances =$null
            $Script:ExportMode = $false
        }

        # Test contexts
        Context -Name "Label doesn't already exist" -Fixture {
            BeforeAll {
                $testParams = @{
                    Name             = 'TestLabel'
                    Comment          = 'This is a test label'
                    Tooltip          = 'Test tool tip'
                    DisplayName      = 'Test label'
                    ParentId         = 'TestLabel'
                    AdvancedSettings = ([MSFT_SCLabelSetting] @{
                            Key   = 'LabelStatus'
                            Value = 'Enabled'
                        })
                    LocaleSettings   = ([MSFT_SCLabelLocaleSettings] @{
                            LocaleKey     = 'DisplayName'
                            LabelSettings = ([MSFT_SCLabelSetting] @{
                                    Key   = 'en-us'
                                    Value = 'English DisplayName'
                                })
                        })
                    AutoLabelingSettings = [MSFT_SCSLAutoLabelingSettings] @{
                        Operator      = 'And'
                        AutoApplyType = 'Recommend'
                        PolicyTip     = 'My Perfect Test Tip!'
                        Groups        = @(
                            [MSFT_SCSLSensitiveInformationGroup] @{
                                Name = 'Group1'
                                Operator = 'Or'
                                SensitiveInformationType = @(
                                    [MSFT_SCSLSensitiveInformationType] @{
                                        name = 'ABA Routing Number'
                                        confidencelevel = 'High'
                                        mincount = 1
                                        maxcount = -1
                                    }
                                )
                                TrainableClassifier = @(
                                    [MSFT_SCSLTrainableClassifiers] @{
                                        name = 'Legal Affairs'
                                    }
                                )
                            }
                            [MSFT_SCSLSensitiveInformationGroup] @{
                                Name = 'Group2'
                                Operator = 'And'
                                SensitiveInformationType = @(
                                    [MSFT_SCSLSensitiveInformationType] @{
                                        name = 'All Full Names'
                                        confidencelevel = 'High'
                                        mincount = 10
                                        maxcount = 100
                                    }
                                )
                                TrainableClassifier = @(
                                    [MSFT_SCSLTrainableClassifiers] @{
                                        name = 'Legal Affairs'
                                    }
                                )
                            }
                        )
                    }
                    Credential       = $Credential
                    Ensure           = 'Present'
                }

                Mock -CommandName Get-Label -MockWith {
                    return $null
                }
            }

            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should return Absent from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Absent'
            }

            It 'Should call the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Set()
            }
        }

        Context -Name 'Label already exists, but is incorrectly configured' -Fixture {
            BeforeAll {
                $testParams = @{
                    Name             = 'TestLabel'
                    Comment          = 'Updated comment' # Drift
                    ToolTip          = 'Test tool tip'
                    DisplayName      = 'Test label'
                    ParentId         = 'MyLabel'

                    AdvancedSettings = ([MSFT_SCLabelSetting] @{
                            Key   = 'LabelStatus'
                            Value = 'Enabled'
                        })

                    LocaleSettings   = ([MSFT_SCLabelLocaleSettings] @{
                            LocaleKey     = 'DisplayName'
                            LabelSettings = ([MSFT_SCLabelSetting] @{
                                    Key   = 'en-us'
                                    Value = 'English DisplayName'
                                })
                        })

                    AutoLabelingSettings = [MSFT_SCSLAutoLabelingSettings] @{
                            Operator      = 'And'
                            AutoApplyType = 'Recommend'
                            PolicyTip     = 'My Perfect Test Tip!'
                            Groups        = @(
                                [MSFT_SCSLSensitiveInformationGroup] @{
                                    Name = 'Group1'
                                    Operator = 'Or'
                                    SensitiveInformationType = @(
                                        [MSFT_SCSLSensitiveInformationType] @{
                                            name = 'ABA Routing Number'
                                            confidencelevel = 'High'
                                            mincount = 1
                                            maxcount = -1
                                        }
                                    )
                                    TrainableClassifier = @(
                                        [MSFT_SCSLTrainableClassifiers] @{
                                            name = 'Legal Affairs'
                                        }
                                    )
                                }
                                [MSFT_SCSLSensitiveInformationGroup] @{
                                    Name = 'Group2'
                                    Operator = 'And'
                                    SensitiveInformationType = @(
                                        [MSFT_SCSLSensitiveInformationType] @{
                                            name = 'All Full Names'
                                            confidencelevel = 'High'
                                            mincount = 1
                                            maxcount = 100
                                        }
                                    )
                                    TrainableClassifier = @(
                                        [MSFT_SCSLTrainableClassifiers] @{
                                            name = 'Legal Affairs'
                                        }
                                    )
                                }
                            )
                        }

                    Credential       = $Credential
                    Ensure           = 'Present'
                }
            }

            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should update from the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Set()
            }

            It 'Should return Present from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Present'
            }
        }

        Context -Name 'Label already exists and is correctly configured' -Fixture {
            BeforeAll {
                $testParams = @{
                    Name             = 'TestLabel'
                    Comment          = 'This is a test label'
                    ToolTip          = 'Test tool tip'
                    DisplayName      = 'Test label'
                    ParentId         = 'MyLabel'

                    AdvancedSettings = ([MSFT_SCLabelSetting] @{
                            Key   = 'LabelStatus'
                            Value = 'Enabled'
                        })

                    LocaleSettings   = ([MSFT_SCLabelLocaleSettings] @{
                            LocaleKey     = 'DisplayName'
                            LabelSettings = ([MSFT_SCLabelSetting] @{
                                    Key   = 'en-us'
                                    Value = 'English DisplayName'
                                })
                        })

                    AutoLabelingSettings = [MSFT_SCSLAutoLabelingSettings] @{
                            Operator      = 'And'
                            AutoApplyType = 'Recommend'
                            PolicyTip     = 'My Perfect Test Tip!'
                            Groups        = @(
                                [MSFT_SCSLSensitiveInformationGroup] @{
                                    Name = 'Group1'
                                    Operator = 'Or'
                                    SensitiveInformationType = @(
                                        [MSFT_SCSLSensitiveInformationType] @{
                                            name = 'ABA Routing Number'
                                            confidencelevel = 'High'
                                            mincount = 1
                                            maxcount = -1
                                        }
                                    )
                                    TrainableClassifier = @(
                                        [MSFT_SCSLTrainableClassifiers] @{
                                            name = 'Legal Affairs'
                                        }
                                    )
                                }
                                [MSFT_SCSLSensitiveInformationGroup] @{
                                    Name = 'Group2'
                                    Operator = 'And'
                                    SensitiveInformationType = @(
                                        [MSFT_SCSLSensitiveInformationType] @{
                                            name = 'All Full Names'
                                            confidencelevel = 'High'
                                            mincount = 10
                                            maxcount = 100
                                        }
                                    )
                                    TrainableClassifier = @(
                                        [MSFT_SCSLTrainableClassifiers] @{
                                            name = 'Legal Affairs'
                                        }
                                    )
                                }
                            )
                        }

                    Credential       = $Credential
                    Ensure           = 'Present'
                }
            }

            It 'Should return true from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Test() | Should -Be $true
            }
        }

        Context -Name 'Label should not exist' -Fixture {
            BeforeAll {
                $testParams = @{
                    Name       = 'TestLabel_DoesNotExist'
                    ParentId   = 'MyLabel'
                    Credential = $Credential
                    Ensure     = 'Absent'
                }
            }

            It 'Should return false from the Test method' {

                Mock -CommandName Get-Label -MockWith {
                    return @{
                        Name     = 'TestLabel_DoesNotExist'
                        ParentId = 'MyLabel'
                    }
                }
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should delete from the Set method' {
                Mock -CommandName Get-Label -MockWith {
                    $null
                }
                (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Set()
            }

            It 'Should return Absent from the Get method' {
                Mock -CommandName Get-Label -MockWith {
                    $null
                }
                ((New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Absent'
            }
        }

        Context -Name 'PostProcessing complex settings comparison' -Fixture {
            BeforeAll {
                Mock -CommandName New-M365DSCLogEntry -MockWith {
                }

                $postProcessing = (New-M365DSCResourceInstance -ResourceName 'SCSensitivityLabel' -Property @{
                        Name       = 'TestLabel'
                        Credential = $Credential
                    }).GetCompareParameters().PostProcessing
            }

            It 'Should treat null and empty Operator and AutoApplyType as equal' {
                $desired = @{ Operator = ''; AutoApplyType = $null; Groups = @() }
                $current = [PSCustomObject]@{ Operator = $null; AutoApplyType = ''; Groups = @() }
                [SCSensitivityLabel]::TestAutoLabelingSettings($desired, $current, $true) | Should -BeTrue
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 0 -Exactly -Scope It
            }

            It 'Should report a group missing on either side' {
                $withGroup = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number' }) }) }
                $withoutGroup = @{ Operator = 'And'; Groups = @() }
                [SCSensitivityLabel]::TestAutoLabelingSettings($withGroup, $withoutGroup, $true) | Should -BeFalse
                [SCSensitivityLabel]::TestAutoLabelingSettings($withoutGroup, $withGroup, $true) | Should -BeFalse
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 2 -Exactly -Scope It
            }

            It 'Should compare maxcount only when the desired side specifies it' {
                $withMaxCount = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number'; maxcount = '9' }) }) }
                $withoutMaxCount = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number' }) }) }
                [SCSensitivityLabel]::TestAutoLabelingSettings($withMaxCount, $withoutMaxCount, $false) | Should -BeFalse
                [SCSensitivityLabel]::TestAutoLabelingSettings($withoutMaxCount, $withMaxCount, $false) | Should -BeTrue
            }

            It 'Should treat an empty maxcount and a null maxcount as equal' {
                $desired = @{ Operator = 'And'; Groups = @(@{ Name = 'Default'; Operator = 'And'; SensitiveInformationType = @(@{ name = 'Credit Card Number'; maxcount = '' }) }) }
                $current = @{ Operator = 'And'; Groups = @(@{ Name = 'Default'; Operator = 'And'; SensitiveInformationType = @(@{ name = 'Credit Card Number'; maxcount = $null }) }) }
                [SCSensitivityLabel]::TestAutoLabelingSettings($desired, $current, $true) | Should -BeTrue
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 0 -Exactly -Scope It
            }

            It 'Should read the current side from class instances' {
                $desired = @{ Operator = 'And'; AutoApplyType = 'Recommend'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number'; mincount = '1' }) }) }
                $current = [MSFT_SCSLAutoLabelingSettings] @{
                    Operator      = 'And'
                    AutoApplyType = 'Recommend'
                    Groups        = @(
                        [MSFT_SCSLSensitiveInformationGroup] @{
                            Name                     = 'Group1'
                            Operator                 = 'Or'
                            SensitiveInformationType = @(
                                [MSFT_SCSLSensitiveInformationType] @{
                                    name     = 'ABA Routing Number'
                                    mincount = '1'
                                }
                            )
                        }
                    )
                }
                [SCSensitivityLabel]::TestAutoLabelingSettings($desired, $current, $true) | Should -BeTrue
            }

            It 'Should compare array valued advanced settings as sets' {
                $desired = @(@{ Key = 'contenttype'; Value = @('File', 'Email') })
                [SCSensitivityLabel]::TestAdvancedSettings($desired, @(@{ Key = 'ContentType'; Value = @('Email', 'File') }), $true) | Should -BeTrue
                [SCSensitivityLabel]::TestAdvancedSettings($desired, @(@{ Key = 'contenttype'; Value = @('File') }), $true) | Should -BeFalse
                [SCSensitivityLabel]::TestAdvancedSettings(@(@{ Key = 'color'; Value = @('#FF0000') }), @(@{ Key = 'color'; Value = '#ff0000' }), $true) | Should -BeTrue
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 1 -Exactly -Scope It
            }

            It 'Should match a single element locale setting value against a scalar' {
                $desired = @(@{ LocaleKey = 'DisplayName'; LabelSettings = @(@{ Key = 'en-us'; Value = @('English DisplayName') }) })
                [SCSensitivityLabel]::TestLocaleSettings($desired, @(@{ LocaleKey = 'DisplayName'; LabelSettings = @(@{ Key = 'EN-US'; Value = 'English DisplayName' }) }), $true) | Should -BeTrue
                [SCSensitivityLabel]::TestLocaleSettings($desired, @(@{ LocaleKey = 'DisplayName'; LabelSettings = @(@{ Key = 'en-us'; Value = 'Other' }) }), $true) | Should -BeFalse
                [SCSensitivityLabel]::TestLocaleSettings($desired, @(@{ LocaleKey = 'Tooltip'; LabelSettings = @(@{ Key = 'en-us'; Value = 'English DisplayName' }) }), $true) | Should -BeFalse
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 2 -Exactly -Scope It
            }

            It 'Should not write log entries when PostProcessing runs in a report context' {
                $desiredValues = @{ AutoLabelingSettings = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number'; mincount = '1' }) }) } }
                $currentValues = @{ AutoLabelingSettings = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number'; mincount = '5' }) }) } }
                $result = $postProcessing.Invoke($desiredValues, $currentValues, $desiredValues.Clone(), @(@{ IsReport = $true }))
                $result.Item1.AutoLabelingSettings | Should -Be 'AutoLabelingSettings drift detected'
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 0 -Exactly -Scope It
            }

            It 'Should write the log entry once when PostProcessing runs outside a report context' {
                $desiredValues = @{ AutoLabelingSettings = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number'; mincount = '1' }) }) } }
                $currentValues = @{ AutoLabelingSettings = @{ Operator = 'And'; Groups = @(@{ Name = 'Group1'; Operator = 'Or'; SensitiveInformationType = @(@{ name = 'ABA Routing Number'; mincount = '5' }) }) } }
                $result = $postProcessing.Invoke($desiredValues, $currentValues, $desiredValues.Clone(), @())
                $result.Item1.AutoLabelingSettings | Should -Be 'AutoLabelingSettings drift detected'
                Should -Invoke -CommandName New-M365DSCLogEntry -Times 1 -Exactly -Scope It -ParameterFilter {
                    $Message -like "AutoLabelingSettings do not match: *`r`n- Parameter 'mincount' does not match*Current: '5'. Desired: '1'.*"
                }
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                $Global:CurrentModeIsExport = $true
                $Global:PartialExportFileName = "$(New-Guid).partial.ps1"
                $testParams = @{
                    Credential = $Credential
                }
                Mock -CommandName Get-Label -MockWith {
                    return @{
                        Name           = 'TestRule'
                        Settings       = '{"Key": "LabelStatus",
                                            "Value": "Enabled"}'
                        LocaleSettings = '{"LocaleKey":"DisplayName",
                                            "LabelSettings":[
                                            {"Key":"en-us","Value":"English Display Names"}]}'
                    }
                }
            }

            It 'Should Reverse Engineer resource from the Export method' {
                $result = Invoke-M365DSCResourceMethod -ResourceName 'SCSensitivityLabel' -MethodName 'Export' -Parameters $testParams
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}

Invoke-Command -ScriptBlock $Global:DscHelper.CleanupScript -NoNewScope
