function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter()]
        [System.String]
        $id,

        [Parameter()]
        [System.String]
        $linkedDomainUrl,

        [Parameter()]
        [System.String]
        $name,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $displays,

        [Parameter()]
        [System.String]
        [ValidateSet('Absent', 'Present')]
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
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    $ConnectionMode = New-M365DSCConnection -Workload 'AdminAPI' `
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

    $nullResult = $PSBoundParameters
    $nullResult.Ensure = 'Absent'
    try
    {
        if ($null -ne $Script:exportedInstances -and $Script:ExportMode)
        {
            $instances = $Script:exportedInstances
        }
        else
        {
            $uri = "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/authorities"
            $response = Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'GET'
            $authorities = $response.value
            if ($null -eq $authorities)
            {
                return $nullResult
            }
            $authority = Get-M365DSCVerifiedIdAuthorityObject -Authority ($authorities | Where-Object -FilterScript {$_.didModel.linkedDomainUrls[0] -eq $linkedDomainUrl})

            if ($null -eq $authority)
            {
                return $nullResult
            }

            $uri = "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/authorities/$($authority.Id)/contracts"
            $response = Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'GET'
            $contracts = $response.value
        }
        if ($null -eq $contracts)
        {
            return $nullResult
        }

        $contract = Get-M365DSCVerifiedIdAuthorityContractObject -Contract ($contracts | Where-Object -FilterScript {$_.name -eq $name})
        if ($null -eq $contract)
        {
            return $nullResult
        }

        $results = @{
            id                                                                    = $contract.id
            name                                                                  = $contract.name
            linkedDomainUrl                                                       = $linkedDomainUrl
            displays                                                              = $contract.displays
            Ensure                                                                = 'Present'
            Credential                                                            = $Credential
            ApplicationId                                                         = $ApplicationId
            TenantId                                                              = $TenantId
            CertificateThumbprint                                                 = $CertificateThumbprint
            ApplicationSecret                                                     = $ApplicationSecret
            AccessTokens                                                          = $AccessTokens
        }
        return [System.Collections.Hashtable] $results

    }
    catch
    {
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
        [Parameter()]
        [System.String]
        $id,

        [Parameter()]
        [System.String]
        $linkedDomainUrl,

        [Parameter()]
        [System.String]
        $name,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $displays,

        [Parameter()]
        [System.String]
        [ValidateSet('Absent', 'Present')]
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

    New-M365DSCConnection -Workload 'AdminAPI' `
        -InboundParameters $PSBoundParameters | Out-Null

    $currentInstance = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Retrieved current instance: $($currentInstance.Name) with Id $($currentInstance.Id)"
    $BoundParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $PSBoundParameters

    $uri = "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/authorities/" + $currentInstance.Id

    if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating an VerifiedId Authority with Name {$Name} and Id $($currentInstance.Id)"

        $body = @{
            name = $Name
            linkedDomainUrl = $LinkedDomainUrl
            didMethod = $DidMethod
            keyVaultMetadata     = @{
                subscriptionId = $KeyVaultMetadata.SubscriptionId
                resourceGroup = $KeyVaultMetadata.ResourceGroup
                resourceName = $KeyVaultMetadata.ResourceName
                resourceUrl = $KeyVaultMetadata.ResourceUrl
            }
        }
        Write-Verbose -Message "Creating VerifiedId Authority with body $($body | ConvertTo-Json -Depth 5)"

        $uri = "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/authorities" 
        Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'POST' -Body $body
    }
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating an VerifiedId Authority with Name {$Name} and Id $($currentInstance.Id)"

        Write-Warning -Message "You can only update Name of the VerifiedId Authority, if you want to update other properties, please delete and recreate the VerifiedId Authority."
        $body = @{
            name = $Name
        }
        Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'PATCH' -Body $body
    }
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing VerifiedId Authority with Name {$Name} and Id $($currentInstance.Id)"

        $uri = "https://verifiedid.did.msidentity.com/beta/verifiableCredentials/authorities/" + $currentInstance.Id
        Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'DELETE'
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter()]
        [System.String]
        $id,

        [Parameter()]
        [System.String]
        $linkedDomainUrl,

        [Parameter()]
        [System.String]
        $name,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $displays,

        [Parameter()]
        [System.String]
        [ValidateSet('Absent', 'Present')]
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
        [Switch]
        $ManagedIdentity,

        [Parameter()]
        [System.String[]]
        $AccessTokens
    )

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    Write-Verbose -Message 'Testing configuration of AADVerifiedIdAuthority'

    $CurrentValues = Get-TargetResource @PSBoundParameters

    $ValuesToCheck = ([Hashtable]$PSBoundParameters).clone()

    $testTargetResource = $true

    #Compare Cim instances
    foreach ($key in $PSBoundParameters.Keys)
    {
        $source = $PSBoundParameters.$key
        $target = $CurrentValues.$key
        if ($null -ne $source -and $source.GetType().Name -like '*CimInstance*' -and $source -notlike '*Permission*')
        {
            $testResult = Compare-M365DSCComplexObject `
                -Source ($source) `
                -Target ($target)

            if (-not $testResult)
            {
                Write-Verbose "TestResult returned False for $source"
                $testTargetResource = $false
            }
            else {
                $ValuesToCheck.Remove($key) | Out-Null
            }
        }
    }

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $TestResult = Test-M365DSCParameterState -CurrentValues $CurrentValues `
    -Source $($MyInvocation.MyCommand.Source) `
    -DesiredValues $PSBoundParameters `
    -ValuesToCheck $ValuesToCheck.Keys `
    -IncludedDrifts $driftedParams

    if(-not $TestResult)
    {
        $testTargetResource = $false
    }


    Write-Verbose -Message "Test-TargetResource returned $testTargetResource"

    return $testTargetResource


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

    $ConnectionMode = New-M365DSCConnection -Workload 'AdminAPI' `
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

    $dscContent = [System.Text.StringBuilder]::new()
    $i = 1
    Write-Host "`r`n" -NoNewline
    try
    {
        $Script:ExportMode = $true
        $uri = "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/authorities"
        $response = Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'GET'
        [array] $authorities = $response.value


        [array] $Script:exportedInstances = $()

        foreach ($authority in $authorities)
        {
            $uri = "https://verifiedid.did.msidentity.com/v1.0/verifiableCredentials/authorities/$($authority.Id)/contracts"
            $response = Invoke-M365DSCVerifiedIdWebRequest -Uri $uri -Method 'GET'
            $contracts = $response.value

            foreach($contract in $contracts)
            {
                $Script:exportedInstances += $contract

                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                Write-Host "    |---[$i/$($Script:exportedInstances.Count)] $($contract.name)" -NoNewline
                $Params = @{
                    linkedDomainUrl       = $authority.didModel.linkedDomainUrls[0]
                    name                  = $contract.name
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    ApplicationSecret     = $ApplicationSecret
                    Credential            = $Credential
                    Managedidentity       = $ManagedIdentity.IsPresent
                    AccessTokens          = $AccessTokens
                }

                $Results = Get-TargetResource @Params

                if ($Results.Ensure -eq 'Present')
                {
                    $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                    -Results $Results

                    if ($null -ne $Results.displays)
                    {
                        $complexMapping = @(
                            @{
                                Name = 'displays'
                                CimInstanceName = 'AADVerifiedIdAuthorityContractDisplayModel'
                                IsRequired = $False
                            }
                        )
                        $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.displays `
                        -CIMInstanceName 'AADVerifiedIdAuthorityContractDisplayModel' `
                        -ComplexTypeMapping $complexMapping

                        if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                        {
                            $Results.displays = $complexTypeStringResult
                        }
                        else
                        {
                            $Results.Remove('displays') | Out-Null
                        }
                    }


                    $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $PSScriptRoot `
                    -Results $Results `
                    -Credential $Credential

                    if ($Results.displays)
                    {
                        $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "displays" -IsCIMArray:$true
                    }

                    $dscContent.Append($currentDSCBlock) | Out-Null
                    Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
                    Write-Host $Global:M365DSCEmojiGreenCheckMark
                    $i++
                }
            }
        }
        return $dscContent.ToString()
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


function Get-M365DSCVerifiedIdAuthorityContractObject
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter()]
        $Contract
    )

    if ($null -eq $Contract)
    {
        return $null
    }

    Write-Verbose -Message "Retrieving values for contract {$($Contract.name)}"
    $values = @{
        id                 = $Contract.id
        name               = $Contract.name
    }
    if ($null -ne $Contract.displays)
    {
        $displays = @()
        foreach ($display in $Contract.displays)
        {
            $displays += @{
                locale = $display.locale
                credential = @{
                }
                consent = @{
                }
            }
        }

        $values.Add('displays', $displays)
    }
    return $values
}


function Get-M365DSCVerifiedIdAuthorityObject
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter()]
        $Authority
    )

    if ($null -eq $Authority)
    {
        return $null
    }

    Write-Verbose -Message "Retrieving values for authority {$($Authority.didModel.linkedDomainUrls[0])}"
    $did = ($Authority.didModel.did -split ":")[1]
    $values = @{
        Id                 = $Authority.Id
        Name               = $Authority.Name
        LinkedDomainUrl    = $Authority.didModel.linkedDomainUrls[0]
        DidMethod          = $did
    }
    if ($null -ne $Authority.KeyVaultMetadata)
    {
        $KeyVaultMetadata = @{
            SubscriptionId = $Authority.KeyVaultMetadata.SubscriptionId
            ResourceGroup = $Authority.KeyVaultMetadata.ResourceGroup
            ResourceName = $Authority.KeyVaultMetadata.ResourceName
            ResourceUrl = $Authority.KeyVaultMetadata.ResourceUrl
        }

        $values.Add('KeyVaultMetadata', $KeyVaultMetadata)
    }
    return $values
}

function Invoke-M365DSCVerifiedIdWebRequest
{
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $Uri,

        [Parameter()]
        [System.String]
        $Method = 'GET',

        [Parameter()]
        [System.Collections.Hashtable]
        $Body
    )

    $headers = @{
        Authorization = $Global:MSCloudLoginConnectionProfile.AdminAPI.AccessToken
        "Content-Type" = "application/json"
    }

    if($Method -eq 'PATCH' -or $Method -eq 'POST')
    {
        $BodyJson = $body | ConvertTo-Json 
        $response = Invoke-WebRequest -Method $Method -Uri $Uri -Headers $headers -Body $BodyJson
    }
    else {
        $response = Invoke-WebRequest -Method $Method -Uri $Uri -Headers $headers 
    }

    if($Method -eq 'DELETE')
    {
        return $null
    }
    $result = ConvertFrom-Json $response.Content
    return $result
}

Export-ModuleMember -Function *-TargetResource
