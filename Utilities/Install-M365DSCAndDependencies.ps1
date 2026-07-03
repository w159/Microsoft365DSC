[CmdletBinding()]
param()

try
{
    Write-Output "Installing package provider NuGet"
    $null = Install-PackageProvider -Name "NuGet" -Force

    Write-Output "Setting PSGallery InstallationPolicy to Trusted"
    Set-PSRepository -Name "PSGallery" -InstallationPolicy "Trusted"

    Write-Output "Installing PSResourceGet module"
    $parameters = @{
        Name                = "Microsoft.PowerShell.PSResourceGet"
        Repository          = "PSGallery"
        Scope               = "AllUsers"
        Force               = [Switch]$true
        SkipPublisherCheck  = [Switch]$true
    }
    Install-Module @parameters

    Write-Output "Installing Microsoft365Dsc module"
    $Parameters = @{
        Name                = "Microsoft365Dsc"
        Repository          = "PSGallery"
        Scope               = "AllUsers"
        Force               = [Switch]$true
        SkipPublisherCheck  = [Switch]$true
    }
    Install-Module @Parameters

    Write-Output "Installing Microsoft365DSC module dependencies in Windows PowerShell"
    Update-M365DSCDependencies

    Write-Output "Installing Microsoft365DSC module dependencies in PowerShell 7"
    & pwsh -Command {
        Update-M365DSCDependencies
    }

    Write-Output "Configuring Windows PowerShell environment"
    Enable-PSRemoting -Force -SkipNetworkProfileCheck
    winrm quickconfig -force
    Set-ExecutionPolicy Unrestricted -Force

    Get-ChildItem "C:\Program Files\WindowsPowerShell\Modules" -Recurse | Unblock-File
    Set-Item -Path WSMan:\localhost\MaxEnvelopeSizekb -Value 1039440
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WSMAN\Client' -Name MaxEnvelopeSizekb -Value 1039440 -PropertyType DWORD -Force

    $computerSystem = Get-CimInstance -ClassName "Win32_ComputerSystem"
    $totalPhysicalMemory = $computerSystem.TotalPhysicalMemory
    $quotaConfiguration = Get-CimInstance -Namespace Root -ClassName "__ProviderHostQuotaConfiguration"
    $quotaConfiguration.MemoryAllHosts = $totalPhysicalMemory # Adjust the memory for all processes combined
    $quotaConfiguration.MemoryPerHost  = $totalPhysicalMemory # Adjust the memory for a single wmiprvse.exe process
    Set-CimInstance -InputObject $quotaConfiguration

    [System.Environment]::SetEnvironmentVariable('M365DSCTelemetryEnabled', $false, [System.EnvironmentVariableTarget]::Machine)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nls\CodePage" -Name "ACP" -Value 65001 -Force
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force | Out-Null

    Write-Output "Configuring PowerShell 7 environment"
    & pwsh -Command {
        $basePath = "C:\Program Files\powershell\.store\powershell.windows.x64\7.6.2\powershell.windows.x64\7.6.2\tools\net10.0\any"
        Copy-Item -Path "$basePath\runtimes\win-x64\native\pwrshplugin.dll" -Destination $basePath
        Enable-PSRemoting -Force -SkipNetworkProfileCheck
        winrm quickconfig -force
    }
}
catch
{
    throw $_
}

Write-Output ' '
$Message = "Finished installing Microsoft365DSC, dependencies and configuration " + `
    "successfully {0}" -f [Char]::ConvertFromUtf32(0x2705)
Write-Output $Message
