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
    -DscResource 'AADAgreement' -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope
        BeforeAll {

            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@onmicrosoft.com', $secpasswd)

            $Global:PartialExportFileName = 'c:\TestPath'

            Mock -CommandName Save-M365DSCPartialExport -MockWith {
            }

            Mock -CommandName Get-PSSession -MockWith {
            }

            Mock -CommandName Remove-PSSession -MockWith {
            }

            Mock -CommandName New-M365DSCConnection -ModuleName '_Shared' -MockWith {
                return 'Credentials'
            }

            Mock -ModuleName M365DSCUtil -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName Get-MSCloudLoginConnectionProfile -MockWith {
            }

            Mock -CommandName Get-MgBetaAgreement -MockWith {
                return @{
                    DisplayName                          = 'Test Agreement'
                    Id                                   = '12345'
                    IsViewingBeforeAcceptanceRequired    = $true
                    IsPerDeviceAcceptanceRequired        = $false
                    UserReacceptRequiredFrequency        = 'P90D'
                    File                                 = @{
                        Data     = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes('Terms content'))
                        Name     = 'terms.txt'
                        Language = 'en-US'
                    }
                    TermsExpiration                      = @{
                        Frequency     = 'P365D'
                        StartDateTime = [System.DateTime]::new(2026, 1, 1, 0, 0, 0, [System.DateTimeKind]::Utc)
                    }
                }
            }

            Mock -CommandName New-MgBetaAgreement -MockWith {
            }

            Mock -CommandName Update-MgBetaAgreement -MockWith {
            }

            Mock -CommandName Remove-MgBetaAgreement -MockWith {
            }

            # Mock Write-M365DSCHost to hide output during the tests
            Mock -CommandName Write-M365DSCHost -MockWith {
            }
            $Script:exportedInstances = $null
            $Script:ExportMode = $false
        }

        # Test contexts
        Context -Name 'The AADAgreement should exist but it DOES NOT' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                          = 'Test Agreement'
                    IsViewingBeforeAcceptanceRequired    = $true
                    IsPerDeviceAcceptanceRequired        = $false
                    UserReacceptRequiredFrequency        = 'P90D'
                    FileData                             = 'Terms content'
                    FileName                             = 'terms.txt'
                    Language                             = 'en-US'
                    TermsExpiration                      = @{
                        Frequency     = 'P365D'
                        StartDateTime = '2026-01-01T00:00:00Z'
                    }
                    Ensure                               = 'Present'
                    Credential                           = $Credential
                }

                Mock -CommandName Get-MgBetaAgreement -MockWith {
                    return $null
                }
            }

            It 'Should return values from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Absent'
            }

            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should Create the agreement from the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Set()
                Should -Invoke -CommandName New-MgBetaAgreement -Exactly 1
            }
        }

        Context -Name 'The AADAgreement exists but it SHOULD NOT' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName = 'Test Agreement'
                    Ensure      = 'Absent'
                    Credential  = $Credential
                }
            }

            It 'Should return values from the Get method' {
                ((New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Get().ToHashtable()).Ensure | Should -Be 'Present'
            }

            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should Remove the agreement from the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Set()
                Should -Invoke -CommandName Remove-MgBetaAgreement -Exactly 1
            }
        }

        Context -Name 'The AADAgreement Exists and Values are already in the desired state' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                          = 'Test Agreement'
                    IsViewingBeforeAcceptanceRequired    = $true
                    IsPerDeviceAcceptanceRequired        = $false
                    UserReacceptRequiredFrequency        = 'P90D'
                    FileData                             = 'Terms content'
                    FileName                             = 'terms.txt'
                    Language                             = 'en-US'
                    TermsExpiration                      = @{
                        Frequency     = 'P365D'
                        StartDateTime = '2026-01-01T00:00:00Z'
                    }
                    Ensure                               = 'Present'
                    Credential                           = $Credential
                }
            }

            It 'Should return true from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Test() | Should -Be $true
            }
        }

        Context -Name 'The AADAgreement exists and values are NOT in the desired state' -Fixture {
            BeforeAll {
                $testParams = @{
                    DisplayName                          = 'Test Agreement'
                    IsViewingBeforeAcceptanceRequired    = $false
                    IsPerDeviceAcceptanceRequired        = $true
                    UserReacceptRequiredFrequency        = 'P30D'
                    FileData                             = 'Updated terms content'
                    FileName                             = 'updated_terms.txt'
                    Language                             = 'en-US'
                    TermsExpiration                      = @{
                        Frequency     = 'P365D'
                        StartDateTime = '2026-01-01T00:00:00Z'
                    }
                    Ensure                               = 'Present'
                    Credential                           = $Credential
                }
            }

            It 'Should return false from the Test method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Test() | Should -Be $false
            }

            It 'Should call the Set method' {
                (New-M365DSCResourceInstance -ResourceName 'AADAgreement' -Property $testParams).Set()
                Should -Invoke -CommandName Update-MgBetaAgreement -Exactly 1
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
                $result = Invoke-M365DSCResourceMethod -ResourceName 'AADAgreement' -MethodName 'Export' -Parameters $testParams
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}
