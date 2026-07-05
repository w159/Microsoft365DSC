[CmdletBinding()]
param()

$isWindowsPlatform = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform(
    [System.Runtime.InteropServices.OSPlatform]::Windows)

try
{
    Write-Output "Detecting current platform"
    if ($isWindowsPlatform)
    {
        Write-Output "Platform detected: Windows"
    }
    else
    {
        Write-Output "Platform detected: Other"
    }

    $nugetProvider = Get-PackageProvider -Name "NuGet" -ErrorAction SilentlyContinue
    if (-not $nugetProvider)
    {
        Write-Output "NuGet package provider not found. Installing..."
        $null = Install-PackageProvider -Name "NuGet" -Force
    }

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

    Write-Output "Installing Microsoft365DSC module"
    $Parameters = @{
        Name                = "Microsoft365DSC"
        Repository          = "PSGallery"
        Scope               = "AllUsers"
        Force               = [Switch]$true
        SkipPublisherCheck  = [Switch]$true
    }
    Install-Module @Parameters

    Write-Output "Installing Microsoft365DSC module dependencies"
    Update-M365DSCDependencies

    if ($isWindowsPlatform)
    {
        Write-Output "Installing Microsoft365DSC module dependencies in PowerShell 7"
        & pwsh -Command {
            Update-M365DSCDependencies
        }
        if ($LASTEXITCODE -ne 0)
        {
            throw "Could not install Microsoft365DSC module dependencies in PowerShell 7"
        }

        Write-Output "Configuring Windows PowerShell environment"
        Set-ExecutionPolicy Unrestricted -Force

        Get-ChildItem "C:\Program Files\WindowsPowerShell\Modules" -Recurse | Unblock-File
        $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WSMAN\Client' -Name MaxEnvelopeSizekb -Value 1039440 -PropertyType DWORD -Force

        $computerSystem = Get-CimInstance -ClassName "Win32_ComputerSystem"
        $totalPhysicalMemory = $computerSystem.TotalPhysicalMemory
        $quotaConfiguration = Get-CimInstance -Namespace Root -ClassName "__ProviderHostQuotaConfiguration"
        $quotaConfiguration.MemoryAllHosts = $totalPhysicalMemory # Adjust the memory for all processes combined
        $quotaConfiguration.MemoryPerHost  = $totalPhysicalMemory # Adjust the memory for a single wmiprvse.exe process
        Set-CimInstance -InputObject $quotaConfiguration

        [System.Environment]::SetEnvironmentVariable('M365DSCTelemetryEnabled', $false, [System.EnvironmentVariableTarget]::Machine)
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nls\CodePage" -Name "ACP" -Value 65001 -Force
        $null = New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force

        Write-Output "Configuring PowerShell 7 environment"
        & pwsh -Command {
            $PSVersion = [System.String]$PSVersionTable.PSVersion
            $SDK = dotnet --list-sdks
            if ($LASTEXITCODE -ne 0)
            {
                throw "Could not get .NET SDK version"
            }
            $SDKVersion = $SDK.Split(' ')[0].SubString(0, 4)
            $basePath = "C:\Program Files\powershell\.store\powershell.windows.x64\{0}\powershell.windows.x64\{1}\tools\net{2}\any" `
                -f $PSVersion, $PSVersion, $SDKVersion
            $path = Join-Path -Path $basePath -ChildPath "runtimes\win-x64\native\pwrshplugin.dll"
            Copy-Item -Path $path -Destination $basePath
            $null = Enable-PSRemoting -Force -SkipNetworkProfileCheck
        }
        if ($LASTEXITCODE -ne 0)
        {
            throw "Could not configure PowerShell 7 environment"
        }
    }
    else
    {
        Write-Output "Configuring OS environment"
        [System.Environment]::SetEnvironmentVariable('M365DSCTelemetryEnabled', $false, [System.EnvironmentVariableTarget]::Process)

        Write-Output "Copying Microsoft365DSC module to PowerShell 7 module path"
        $PSVersion = [System.String]$PSVersionTable.PSVersion
        $SDK = dotnet --list-sdks
        if ($LASTEXITCODE -ne 0)
        {
            throw "Could not get .NET SDK version"
        }
        $SDKVersion = $SDK.Split(' ')[0].SubString(0, 4)
        $moduleBasePath = (Get-Module -Name Microsoft365DSC).ModuleBase
        $destinationPath = "/usr/share/powershell/.store/powershell.linux.x64/{0}/powershell.linux.x64/{1}/tools/net{2}/any/Modules/Microsoft365DSC" `
            -f $PSVersion, $PSVersion, $SDKVersion
        $null = New-Item -Path $destinationPath -ItemType Directory -Force
        Copy-Item -Path "$moduleBasePath/*" -Recurse -Destination $destinationPath -Force
        Rename-Item -Path "$destinationPath/DSCResources" -NewName "DscResources" -Force
        Remove-Item -Path $moduleBasePath -Recurse -Force
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
