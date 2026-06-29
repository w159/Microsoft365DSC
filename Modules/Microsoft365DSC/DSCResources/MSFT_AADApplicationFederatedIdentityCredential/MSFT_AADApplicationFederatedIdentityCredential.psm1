Confirm-M365DSCModuleDependency -ModuleName 'MSFT_AADApplicationFederatedIdentityCredential'

function Get-M365DSCFederatedIdentityCredentialBody
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [System.String]
        $Subject,

        [Parameter()]
        [System.String[]]
        $Audiences,

        [Parameter()]
        [System.String]
        $Description
    )

    $bodyParameter = @{
        name      = $Name
        issuer    = $Issuer
        subject   = $Subject
        audiences = $Audiences
    }

    if ($PSBoundParameters.ContainsKey('Description'))
    {
        $bodyParameter.Add('description', $Description)
    }

    return $bodyParameter
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ApplicationObjectId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [System.String]
        $Subject,

        [Parameter()]
        [System.String[]]
        $Audiences,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $CertificatePath,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertificatePassword,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    Write-Verbose -Message "Getting federated identity credential {$Name} for application {$ApplicationObjectId}"

    try
    {
        if (-not $Script:exportedInstance -or $Script:exportedInstance.Name -ne $Name -or $Script:exportedInstance.ApplicationObjectId -ne $ApplicationObjectId)
        {
            $null = New-M365DSCConnection -Workload 'MicrosoftGraph' `
                -InboundParameters $PSBoundParameters

            Confirm-M365DSCDependencies

            #region Telemetry
            $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
            $CommandName = $MyInvocation.MyCommand
            $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
                -CommandName $CommandName `
                -Parameters $PSBoundParameters
            Add-M365DSCTelemetryEvent -Data $data
            #endregion

            $nullReturn = $PSBoundParameters
            $nullReturn.Ensure = 'Absent'

            $federatedIdentityCredential = $null
            try
            {
                if (-not [System.String]::IsNullOrEmpty($Id))
                {
                    $federatedIdentityCredential = Get-MgApplicationFederatedIdentityCredential `
                        -ApplicationId $ApplicationObjectId `
                        -FederatedIdentityCredentialId $Id `
                        -ErrorAction SilentlyContinue
                }
            }
            catch
            {
                Write-Verbose -Message "Could not retrieve federated identity credential by ID {$Id}"
            }

            if ($null -eq $federatedIdentityCredential)
            {
                try
                {
                    [array]$federatedIdentityCredential = Get-MgApplicationFederatedIdentityCredential `
                        -ApplicationId $ApplicationObjectId `
                        -Filter "name eq '$($Name -replace "'", "''")'" `
                        -ErrorAction SilentlyContinue
                }
                catch
                {
                    New-M365DSCLogEntry -Message 'Error retrieving data:' `
                        -Exception $_ `
                        -Source $($MyInvocation.MyCommand.Source) `
                        -TenantId $TenantId `
                        -Credential $Credential
                }
            }

            if ($null -eq $federatedIdentityCredential)
            {
                return $nullReturn
            }

            if ($federatedIdentityCredential.Count -gt 1)
            {
                throw "Multiple federated identity credentials with the name $($Name) exist for application $($ApplicationObjectId)."
            }
        }
        else
        {
            $federatedIdentityCredential = $Script:exportedInstance
        }

        $result = @{
            ApplicationObjectId  = $ApplicationObjectId
            Name                 = $federatedIdentityCredential.Name
            Id                   = $federatedIdentityCredential.Id
            Issuer               = $federatedIdentityCredential.Issuer
            Subject              = $federatedIdentityCredential.Subject
            Audiences            = $federatedIdentityCredential.Audiences
            Description          = $federatedIdentityCredential.Description
            Ensure               = 'Present'
            Credential           = $Credential
            ApplicationId        = $ApplicationId
            ApplicationSecret    = $ApplicationSecret
            TenantId             = $TenantId
            CertificateThumbprint = $CertificateThumbprint
            CertificatePath      = $CertificatePath
            CertificatePassword  = $CertificatePassword
            ManagedIdentity      = $ManagedIdentity.IsPresent
            AccessTokens         = $AccessTokens
        }

        return $result
    }
    catch
    {
        New-M365DSCLogEntry -Message 'Error retrieving data:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        throw
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ApplicationObjectId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [System.String]
        $Subject,

        [Parameter()]
        [System.String[]]
        $Audiences,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $CertificatePath,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertificatePassword,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    Write-Verbose -Message "Setting federated identity credential {$Name} for application {$ApplicationObjectId}"

    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentFederatedIdentityCredential = Get-TargetResource @PSBoundParameters
    $bodyParameter = Get-M365DSCFederatedIdentityCredentialBody -Name $Name `
        -Issuer $Issuer `
        -Subject $Subject `
        -Audiences $Audiences `
        -Description $Description

    if ($Ensure -eq 'Present' -and $currentFederatedIdentityCredential.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating federated identity credential {$Name}"
        New-MgApplicationFederatedIdentityCredential `
            -ApplicationId $ApplicationObjectId `
            -BodyParameter $bodyParameter
    }
    elseif ($Ensure -eq 'Present' -and $currentFederatedIdentityCredential.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating federated identity credential {$Name}"
        Update-MgApplicationFederatedIdentityCredential `
            -ApplicationId $ApplicationObjectId `
            -FederatedIdentityCredentialId $currentFederatedIdentityCredential.Id `
            -BodyParameter $bodyParameter
    }
    elseif ($Ensure -eq 'Absent' -and $currentFederatedIdentityCredential.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing federated identity credential {$Name}"
        Remove-MgApplicationFederatedIdentityCredential `
            -ApplicationId $ApplicationObjectId `
            -FederatedIdentityCredentialId $currentFederatedIdentityCredential.Id
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ApplicationObjectId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.String]
        $Issuer,

        [Parameter()]
        [System.String]
        $Subject,

        [Parameter()]
        [System.String[]]
        $Audiences,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $CertificatePath,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertificatePassword,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $result = Test-M365DSCTargetResource -DesiredValues $PSBoundParameters `
        -ResourceName $($MyInvocation.MyCommand.Source).Replace('MSFT_', '')
    return $result
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [System.String]
        $CertificatePath,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $CertificatePassword,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' -InboundParameters $PSBoundParameters

    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $dscContent = [System.Text.StringBuilder]::new()
    try
    {
        [array]$applications = Get-MgApplication -All -Filter $Filter -Property @('id', 'displayName') -ErrorAction Stop
        if ($applications.Length -eq 0)
        {
            Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
        }
        else
        {
            Write-M365DSCHost -Message "`r`n" -DeferWrite
        }

        foreach ($application in $applications)
        {
            [array]$federatedIdentityCredentials = Get-MgApplicationFederatedIdentityCredential `
                -ApplicationId $application.Id `
                -All `
                -ErrorAction Stop

            $i = 1
            foreach ($federatedIdentityCredential in $federatedIdentityCredentials)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                Write-M365DSCHost -Message "    |---[$i/$($federatedIdentityCredentials.Count)] $($application.DisplayName) - $($federatedIdentityCredential.Name)" -DeferWrite
                $params = @{
                    Credential          = $Credential
                    ApplicationId       = $ApplicationId
                    ApplicationSecret   = $ApplicationSecret
                    TenantId            = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    CertificatePath     = $CertificatePath
                    CertificatePassword = $CertificatePassword
                    ManagedIdentity     = $ManagedIdentity.IsPresent
                    ApplicationObjectId = $application.Id
                    Name                = $federatedIdentityCredential.Name
                    Id                  = $federatedIdentityCredential.Id
                    AccessTokens        = $AccessTokens
                }
                $Script:exportedInstance = $federatedIdentityCredential | Add-Member -MemberType NoteProperty -Name ApplicationObjectId -Value $application.Id -PassThru
                $results = Get-TargetResource @params

                if ($results.Ensure -eq 'Present')
                {
                    $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                        -ConnectionMode $ConnectionMode `
                        -ModulePath $PSScriptRoot `
                        -Results $results `
                        -Credential $Credential
                    [void]$dscContent.Append($currentDSCBlock)
                    Save-M365DSCPartialExport -Content $currentDSCBlock `
                        -FileName $Global:PartialExportFileName

                    Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
                    $i++
                }
            }
        }

        return $dscContent.ToString()
    }
    catch
    {
        New-M365DSCLogEntry -Message 'Error during Export:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        throw
    }
}

Export-ModuleMember -Function *-TargetResource
