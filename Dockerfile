FROM mcr.microsoft.com/dotnet/sdk:10.0-windowsservercore-ltsc2025

WORKDIR /DSC

COPY ./Utilities/InstallM365DscAndDependencies.ps1 /DSC/InstallM365DscAndDependencies.ps1

SHELL ["cmd", "/S", "/C"]

RUN powershell "& "".\InstallM365DscAndDependencies.ps1"""

ENTRYPOINT ["pwsh", "-NoLogo", "-NoProfile"]
