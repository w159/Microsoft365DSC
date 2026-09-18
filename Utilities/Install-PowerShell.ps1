[CmdletBinding()]
Param()

$PSVersion = "7.6.6"

$ProgressPreference = 'SilentlyContinue'
Write-Output "Installing PowerShell 7"
Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v$PSVersion/PowerShell-$PSVersion-win-x64.zip" -OutFile "PowerShell-$PSVersion-win-x64.zip"
Unblock-File "PowerShell-$PSVersion-win-x64.zip"
$null = New-Item -ItemType Directory -Path "C:\Program Files\PowerShell\7" -Force
Expand-Archive "PowerShell-$PSVersion-win-x64.zip" -DestinationPath "C:\Program Files\PowerShell\7"
Remove-Item "PowerShell-$PSVersion-win-x64.zip" -Force
[System.Environment]::SetEnvironmentVariable('PATH', "C:\Program Files\PowerShell\7;" + $env:PATH, [System.EnvironmentVariableTarget]::Machine)
$env:PATH = "C:\Program Files\PowerShell\7;" + $env:PATH
