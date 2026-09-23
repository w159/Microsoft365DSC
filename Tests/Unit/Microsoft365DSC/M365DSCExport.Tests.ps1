BeforeAll {
    Import-Module "$PSScriptRoot/../../../Modules/Microsoft365DSC/Modules/M365DSCDllLoader.psm1" -Force -Global
    Initialize-M365DSCDllLoader
    Import-Module "$PSScriptRoot/../../../Modules/Microsoft365DSC/Microsoft365DSC.psd1" -Global -WarningAction SilentlyContinue
}

Describe 'Export-M365DSCConfiguration' {
    It 'accepts ThrottleLimit only together with Parallel' {
        $parameters = (Get-Command -Name Export-M365DSCConfiguration).Parameters
        @($parameters['ThrottleLimit'].ParameterSets.Keys) | Should -Be @('ExportParallel')
        $parameters['Parallel'].ParameterSets['ExportParallel'].IsMandatory | Should -BeTrue
    }

    It 'defaults ThrottleLimit to 5' {
        $parameter = (Get-Command -Name Export-M365DSCConfiguration).ScriptBlock.Ast.Body.ParamBlock.Parameters |
            Where-Object -FilterScript { $_.Name.VariablePath.UserPath -eq 'ThrottleLimit' }
        $parameter.DefaultValue.Value | Should -Be 5
    }

    It 'rejects a ThrottleLimit below 1' {
        { Export-M365DSCConfiguration -Parallel -ThrottleLimit 0 -Components 'AADGroup' } | Should -Throw -ExceptionType ([System.Management.Automation.ParameterBindingException])
    }
}

Describe 'Get-M365DSCWorkloadForResource' {
    It 'returns the VIVA workload for Viva resources' {
        Get-M365DSCWorkloadForResource -ResourceName 'VivaEngagementRoleMember' | Should -Be 'VIVA'
    }
}
