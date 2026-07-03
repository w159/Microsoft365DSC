FROM mcr.microsoft.com/dotnet/sdk:10.0-windowsservercore-ltsc2025

WORKDIR /DSC

COPY ./Utilities/Install-M365DSCAndDependencies.ps1 /DSC/Install-M365DSCAndDependencies.ps1

SHELL ["cmd", "/S", "/C"]

RUN powershell "& "".\Install-M365DSCAndDependencies.ps1"""

ENTRYPOINT ["pwsh", "-NoLogo", "-NoProfile"]
