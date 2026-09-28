BeforeAll {
    Import-Module "$PSScriptRoot/../../../Modules/Microsoft365DSC/Modules/M365DSCDllLoader.psm1" -Force -Global
    Initialize-M365DSCDllLoader
    Import-Module "$PSScriptRoot/../../../Modules/Microsoft365DSC/Microsoft365DSC.psd1" -Global
    if (-not (Get-Module -Name M365DSCGraphShim))
    {
        Import-Module "$PSScriptRoot/../../../Modules/Microsoft365DSC/Modules/M365DSCGraphShim.psd1" -Global -DisableNameChecking
    }

    if (-not (Get-Command -Name Invoke-MgxRequest -ErrorAction SilentlyContinue))
    {
        function global:Invoke-MgxRequest
        {
            [CmdletBinding()]
            param ($All, $ApiVersion, $Method, $Uri, $Skip, $Top, $PageSize, [switch] $NoPageSize, $Body, $Headers, [switch] $SkipForbidden, [switch] $SkipNotFound)
        }
    }
}

Describe 'M365DSCGraphShim' {
    Context 'Invoke-M365DSCGraphShimRequestV76 with a collection that caps the page size' {
        BeforeAll {
            $Script:TopLimitMessage = "The query specified in the URI is not valid. The limit of '50' for Top query has been exceeded. The value from the incoming request is '999'."
        }

        It 'Retries with the page size limit when the request throws' {
            Mock -ModuleName M365DSCGraphShim -CommandName Invoke-MgxRequest -MockWith {
                if ($PageSize -ne 50)
                {
                    throw $Script:TopLimitMessage
                }
                return @('first', 'second')
            }

            $result = InModuleScope -ModuleName M365DSCGraphShim {
                Invoke-M365DSCGraphShimRequestV76 -Method GET -Uri '/beta/roleManagement/cloudPC/roleDefinitions' -All -ErrorAction Stop
            }

            $result | Should -HaveCount 2
            Should -Invoke -ModuleName M365DSCGraphShim -CommandName Invoke-MgxRequest -Exactly 1 -ParameterFilter { $PageSize -eq 50 }
        }

        It 'Retries with the page size limit when errors are silenced' {
            Mock -ModuleName M365DSCGraphShim -CommandName Invoke-MgxRequest -MockWith {
                if ($PageSize -ne 50)
                {
                    Write-Error -Message $Script:TopLimitMessage
                    return
                }
                return @('first', 'second')
            }

            $result = InModuleScope -ModuleName M365DSCGraphShim {
                Invoke-M365DSCGraphShimRequestV76 -Method GET -Uri '/beta/roleManagement/cloudPC/roleDefinitions' -All -ErrorAction SilentlyContinue
            }

            $result | Should -HaveCount 2
            Should -Invoke -ModuleName M365DSCGraphShim -CommandName Invoke-MgxRequest -Exactly 1 -ParameterFilter { $PageSize -eq 50 }
        }

        It 'Does not retry a single page request' {
            Mock -ModuleName M365DSCGraphShim -CommandName Invoke-MgxRequest -MockWith {
                throw $Script:TopLimitMessage
            }

            {
                InModuleScope -ModuleName M365DSCGraphShim {
                    Invoke-M365DSCGraphShimRequestV76 -Method GET -Uri '/beta/roleManagement/cloudPC/roleDefinitions' -Top 999 -ErrorAction Stop
                }
            } | Should -Throw '*Top query has been exceeded*'
            Should -Invoke -ModuleName M365DSCGraphShim -CommandName Invoke-MgxRequest -Exactly 1
        }
    }
}
