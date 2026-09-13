<#
.SYNOPSIS
    Appends parameter stubs for a cmdlet noun to Tests\Unit\Stubs\Microsoft365.psm1.

.DESCRIPTION
    The unit tests run against stub functions rather than the real modules. For every cmdlet of
    the noun (highest installed version), a bare function shell with a typed parameter list is
    appended - unless a stub for the noun already exists.

.PARAMETER CmdletNoun
    Specifies the cmdlet noun, e.g. 'MgBetaPolicyPermissionGrantPolicy'.

.PARAMETER StubFilePath
    Specifies the stub file. Defaults to Tests\Unit\Stubs\Microsoft365.psm1 in the repository.
#>
function Update-M365DSCStubFile
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $CmdletNoun,

        [Parameter()]
        [System.String]
        $StubFilePath
    )

    if ([System.String]::IsNullOrEmpty($StubFilePath))
    {
        $StubFilePath = Join-Path -Path $PSScriptRoot -ChildPath '..\..\..\Tests\Unit\Stubs\Microsoft365.psm1' -Resolve
    }

    $content = Get-Content -Path $StubFilePath
    if (($content | Select-String -Pattern "function Get-$CmdletNoun$").Count -gt 0)
    {
        Write-Verbose -Message "Stubs for noun '$CmdletNoun' already exist in $StubFilePath."
        return
    }

    $stub = Get-M365DSCCmdletStub -CmdletNoun $CmdletNoun
    if ([System.String]::IsNullOrEmpty($stub))
    {
        Write-Warning -Message "No cmdlets found for noun '$CmdletNoun'; the stub file was not updated."
        return
    }

    $content += "#region $CmdletNoun`r`n" + $stub + "#endregion`r`n"
    Set-Content -Path $StubFilePath -Value $content
}

<#
.SYNOPSIS
    Renders stub function shells for every cmdlet of a noun.
#>
function Get-M365DSCCmdletStub
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $CmdletNoun
    )

    $parametersToSkip = @(
        'Verbose', 'Debug', 'ErrorAction', 'WarningAction', 'InformationAction', 'ErrorVariable',
        'WarningVariable', 'InformationVariable', 'OutVariable', 'OutBuffer', 'PipelineVariable',
        'WhatIf', 'Confirm', 'ProgressAction', 'IfMatch'
    )

    $commands = @(Get-Command -Noun $CmdletNoun -ErrorAction SilentlyContinue)
    if ($commands.Count -eq 0)
    {
        return ''
    }

    $latestVersion = ($commands | Sort-Object -Property Version -Descending | Select-Object -First 1).Version
    $commands = @($commands | Where-Object -FilterScript { $_.Version -eq $latestVersion } | Sort-Object -Property Name)

    $builder = [System.Text.StringBuilder]::new()
    foreach ($command in $commands)
    {
        $null = $builder.AppendLine("function $($command.Name)")
        $null = $builder.AppendLine('{')
        $null = $builder.AppendLine('    [CmdletBinding()]')
        $null = $builder.AppendLine('    param')
        $null = $builder.AppendLine('    (')

        $parameterNames = @($command.Parameters.Keys | Where-Object -FilterScript { $_ -notin $parametersToSkip })
        $index = 0
        foreach ($parameterName in $parameterNames)
        {
            $parameter = $command.Parameters[$parameterName]
            $type = $parameter.ParameterType.ToString()
            if ($type -notlike 'System.*')
            {
                $type = 'PSObject'
                if ($parameter.ParameterType.IsArray)
                {
                    $type += '[]'
                }
            }

            $null = $builder.AppendLine('        [Parameter()]')
            $null = $builder.AppendLine("        [$type]")
            $null = $builder.Append("        `$$($parameter.Name)")
            if ($index -lt $parameterNames.Count - 1)
            {
                $null = $builder.Append(",`r`n")
            }
            $null = $builder.Append("`r`n")
            $index++
        }

        $null = $builder.AppendLine('    )')
        $null = $builder.AppendLine("}`r`n")
    }

    return $builder.ToString()
}
