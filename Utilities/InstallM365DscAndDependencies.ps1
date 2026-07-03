[CmdletBinding()]
[OutputType($NULL)]
Param()

#region Install NuGet package provider
Write-Output "Installing package provider NuGet"
try {
    $NULL = Install-PackageProvider -Name "NuGet" -Force
}
catch {
    throw $_
}
#endregion Install NuGet package provider

#region Set PSGallery InstallationPolicy to Trusted
Write-Output "Setting PSGallery InstallationPolicy to Trusted"
try {
    Set-PSRepository -Name "PSGallery" -InstallationPolicy "Trusted"
}
catch {
    throw $_
}
#endregion Set PSGallery InstallationPolicy to Trusted

#regio Install PSResourceGet module
Write-Output "Installing PSResourceGet module"
$Parameters = @{
    Name                = "Microsoft.PowerShell.PSResourceGet"
    Repository          = "PSGallery"
    Scope               = "AllUsers"
    Force               = [Switch]$true
    SkipPublisherCheck  = [Switch]$true
}
try {
    Install-Module @Parameters
}
catch {
    throw $_
}
#endregion Install PSResourceGet module

#region Install Microsoft365Dsc module
Write-Output "Installing Microsoft365Dsc module"
$Parameters = @{
    Name                = "Microsoft365Dsc"
    Repository          = "PSGallery"
    Scope               = "AllUsers"
    Force               = [Switch]$true
    SkipPublisherCheck  = [Switch]$true
}
try {
    Install-Module @Parameters
}
catch {
    throw $_
}
#endregion Install Microsoft365Dsc module

#region Install Microsoft365Dsc module dependencies
Write-Output "Installing Microsoft365Dsc module dependencies"
try {
    Update-M365DSCDependencies
}
catch {
    throw $_
}
#endregion Install Microsoft365Dsc module dependencies

Write-Output ' '
$Message = "Finished installing Microsoft365Dsc and its dependencies " + `
    "successfully {0}" -f [Char]::ConvertFromUtf32(0x2705)
Write-Output $Message
