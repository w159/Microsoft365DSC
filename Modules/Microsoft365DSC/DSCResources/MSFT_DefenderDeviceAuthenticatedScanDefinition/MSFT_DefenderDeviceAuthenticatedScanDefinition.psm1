function Get-TargetResource
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
        $Id,

        [Parameter()]
        [System.UInt32]
        $IntervalInHours,

        [Parameter()]
        [System.String]
        $Target,

        [Parameter()]
        [System.Boolean]
        $IsActive,

        [Parameter()]
        [System.String]
        $ScanType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScannerAgent,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScanAuthenticationParams,

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
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    New-M365DSCConnection -Workload 'DefenderForEndpoint' `
        -InboundParameters $PSBoundParameters | Out-Null

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $nullResult = $PSBoundParameters
    $nullResult.Ensure = 'Absent'
    try
    {
        if ($null -ne $Script:exportedInstances -and $Script:ExportMode)
        {
            if (-not [System.String]::IsNullOrEmpty($Id))
            {
                $instance = $Script:exportedInstances | Where-Object -FilterScript {$_.id -eq $Id}
            }
            if ($null -eq $instance)
            {
                $instance = $Script:exportedInstances | Where-Object -FilterScript {$_.scanName -eq $Name}
            }
        }
        else
        {
            $instances = (Invoke-M365DSCDefenderREST -Uri 'https://api.securitycenter.microsoft.com/api/DeviceAuthenticatedScanDefinitions' `
                                                     -Method GET).value
            if (-not [System.String]::IsNullOrEmpty($Id))
            {
                $instance = $instances | Where-Object -FilterScript {$_.id -eq $Id}
            }
            if ($null -eq $instance)
            {
                $instance = $instances | Where-Object -FilterScript {$_.scanName -eq $Name}
            }
        }
        if ($null -eq $instance)
        {
            return $nullResult
        }

        $ScannerAgentValue = $null
        if ($null -ne $instance.scannerAgent)
        {
            $ScannerAgentValue = @{
                id = $instance.scannerAgent.id
                machineId = $instance.scannerAgent.machineId
                machineName = $instance.scannerAgent.machineName
            }
        }
        $ScanAuthenticationParamsValue = $null
        if ($null -ne $instance.scanAuthenticationParams)
        {
            $ScanAuthenticationParamsValue = @{
                "@odata.context"   = $instance.scanAuthenticationParams."@odata.context"
                Type               = $instance.scanAuthenticationParams.type
                KeyVaultUrl        = $instance.scanAuthenticationParams.keyVaultUrl
                KeyVaultSecretName = $instance.scanAuthenticationParams.keyVaultSecretName
                Domain             = $instance.scanAuthenticationParams.Domain
                Username           = $instance.scanAuthenticationParams.Username
                IsGMSAUser         = $instance.scanAuthenticationParams.IsGMSAUser
                CommunityString    = $instance.scanAuthenticationParams.CommunityString
                AuthProtocol       = $instance.scanAuthenticationParams.AuthProtocol
                AuthPassword       = $instance.scanAuthenticationParams.AuthPassword
                PrivProtocol       = $instance.scanAuthenticationParams.PrivProtocol
                PrivPassword       = $instance.scanAuthenticationParams.PrivPassword
            }
        }

        $results = @{
            Name                     = $instance.scanName
            Id                       = $instance.id
            IntervalInHours          = $instance.intervalInHours
            Target                   = $instance.Target
            IsActive                 = $instance.isActive
            ScanType                 = $instance.scanType
            ScannerAgent             = $ScannerAgentValue
            ScanAuthenticationParams = $ScanAuthenticationParamsValue
            Ensure                   = 'Present'
            Credential               = $Credential
            ApplicationId            = $ApplicationId
            TenantId                 = $TenantId
            CertificateThumbprint    = $CertificateThumbprint
            ManagedIdentity          = $ManagedIdentity.IsPresent
            AccessTokens             = $AccessTokens
        }
        return [System.Collections.Hashtable] $results
    }
    catch
    {
        Write-Verbose -Message $_
        New-M365DSCLogEntry -Message 'Error retrieving data:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return $nullResult
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.UInt32]
        $IntervalInHours,

        [Parameter()]
        [System.String]
        $Target,

        [Parameter()]
        [System.Boolean]
        $IsActive,

        [Parameter()]
        [System.String]
        $ScanType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScannerAgent,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScanAuthenticationParams,

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
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentInstance = Get-TargetResource @PSBoundParameters

    $instanceParams = @{
        scanType        = $ScanType
        scanName        = $Name
        isActive        = $IsActive
        target          = $Target
        intervalInHours = $IntervalInHours
        scannerAgent    = @{
            machineName = $ScannerAgent.machineName
            id          = $ScannerAgent.id
        }
        targetType = 'Ip'
        scanAuthenticationParams = @{}
    }
    # CREATE
    if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating new device authenticated scan definition {$Name} with payload:`r`n$(ConvertTo-Json $instanceParams -Depth 10)"
        $response = Invoke-M365DSCDefenderREST -Uri 'https://api.securitycenter.microsoft.com/api/DeviceAuthenticatedScanDefinitions' `
                                               -Method POST `
                                               -Body $instanceParams
    }
    # UPDATE
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        ##TODO - Replace by the Update/Set cmdlet for the resource
        Set-cmdlet @SetParameters
    }
    # REMOVE
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        ##TODO - Replace by the Remove cmdlet for the resource
        Remove-cmdlet @SetParameters
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
        $Name,

        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.UInt32]
        $IntervalInHours,

        [Parameter()]
        [System.String]
        $Target,

        [Parameter()]
        [System.Boolean]
        $IsActive,

        [Parameter()]
        [System.String]
        $ScanType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScannerAgent,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScanAuthenticationParams,

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
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $CurrentValues = Get-TargetResource @PSBoundParameters
    $ValuesToCheck = ([Hashtable]$PSBoundParameters).Clone()

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $ValuesToCheck)"

    $testResult = $true

    #Compare Cim instances
    foreach ($key in $PSBoundParameters.Keys)
    {
        $source = $PSBoundParameters.$key
        $target = $CurrentValues.$key
        if ($source.getType().Name -like '*CimInstance*')
        {
            $testResult = Compare-M365DSCComplexObject `
                -Source ($source) `
                -Target ($target)

            if (-Not $testResult)
            {
                $testResult = $false
                break
            }

            $ValuesToCheck.Remove($key) | Out-Null
        }
    }

    if ($testResult)
    {
        $testResult = Test-M365DSCParameterState -CurrentValues $CurrentValues `
        -Source $($MyInvocation.MyCommand.Source) `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck $ValuesToCheck.Keys
    }

    Write-Verbose -Message "Test-TargetResource returned $testResult"

    return $testResult
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
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
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    $ConnectionMode = New-M365DSCConnection -Workload 'DefenderForEndpoint' `
        -InboundParameters $PSBoundParameters

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    try
    {
        $Script:ExportMode = $true
        [array] $Script:exportedInstances = (Invoke-M365DSCDefenderREST -Uri 'https://api.securitycenter.microsoft.com/api/DeviceAuthenticatedScanDefinitions' `
                                                                       -Method GET).value

        $i = 1
        $dscContent = ''
        if ($Script:exportedInstances.Length -eq 0)
        {
            Write-Host $Global:M365DSCEmojiGreenCheckMark
        }
        else
        {
            Write-Host "`r`n" -NoNewline
        }
        foreach ($config in $Script:exportedInstances)
        {
            if ($null -ne $Global:M365DSCExportResourceInstancesCount)
            {
                $Global:M365DSCExportResourceInstancesCount++
            }

            $displayedKey = $config.scanName
            Write-Host "    |---[$i/$($Script:exportedInstances.Count)] $displayedKey" -NoNewline
            $params = @{
                Name                  = $config.scanName
                id                    = $config.id
                Credential            = $Credential
                ApplicationId         = $ApplicationId
                TenantId              = $TenantId
                CertificateThumbprint = $CertificateThumbprint
                ManagedIdentity       = $ManagedIdentity.IsPresent
                AccessTokens          = $AccessTokens
            }

            $Results = Get-TargetResource @Params
            $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                -Results $Results

            if ($Results.ScannerAgent)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.ScannerAgent -CIMInstanceName DefenderDeviceAuthenticatedScanDefinitionScanAgent
                if ($complexTypeStringResult)
                {
                    $Results.ScannerAgent = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('ScannerAgent') | Out-Null
                }
            }

            if ($Results.ScanAuthenticationParams)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.ScanAuthenticationParams -CIMInstanceName DefenderDeviceAuthenticatedScanDefinitionAuthenticationParams
                if ($complexTypeStringResult)
                {
                    $Results.ScanAuthenticationParams = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('ScanAuthenticationParams') | Out-Null
                }
            }

            $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -Credential $Credential

            if ($Results.ScanAuthenticationParams)
            {
                $isCIMArray = $false
                if ($Results.ScanAuthenticationParams.getType().Fullname -like '*[[\]]')
                {
                    $isCIMArray = $true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName 'ScanAuthenticationParams' -IsCIMArray:$isCIMArray
            }

            if ($Results.ScannerAgent)
            {
                $isCIMArray = $false
                if ($Results.ScannerAgent.getType().Fullname -like '*[[\]]')
                {
                    $isCIMArray = $true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName 'ScannerAgent' -IsCIMArray:$isCIMArray
            }

            $dscContent += $currentDSCBlock
            Save-M365DSCPartialExport -Content $currentDSCBlock `
                -FileName $Global:PartialExportFileName
            $i++
            Write-Host $Global:M365DSCEmojiGreenCheckMark
        }
        return $dscContent
    }
    catch
    {
        Write-Host $Global:M365DSCEmojiRedX

        New-M365DSCLogEntry -Message 'Error during Export:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return ''
    }
}

Export-ModuleMember -Function *-TargetResource
