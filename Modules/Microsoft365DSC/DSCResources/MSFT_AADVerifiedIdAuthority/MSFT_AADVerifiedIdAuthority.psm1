function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [System.String]
        $Id,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $LinkedDomainUrl,

        [Parameter()]
        [System.String]
        $DidMethod,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $KeyVaultMetadata,

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
            $instances = $response.value
        }
        if ($null -eq $instances)
        {
            return $nullResult
        }

        $instance = Get-M365DSCVerifiedIdAuthorityObject -Authority ($instances | Where-Object -FilterScript {$_.Name -eq $Name})
        if ($null -eq $instance)
        {
            return $nullResult
        }

        $results = @{
            Id                                                                    = $instance.Id
            Name                                                                  = $instance.Name
            LinkedDomainUrl                                                       = $instance.LinkedDomainUrl
            DidMethod                                                             = $instance.DidMethod
            KeyVaultMetadata                                                      = $instance.KeyVaultMetadata
            Ensure                                                                = $Ensure
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
        [System.String]
        $Id,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $LinkedDomainUrl,

        [Parameter()]
        [System.String]
        $DidMethod,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $KeyVaultMetadata,

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

    # #Ensure the proper dependencies are installed in the current environment.
    # Confirm-M365DSCDependencies

    # #region Telemetry
    # $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    # $CommandName = $MyInvocation.MyCommand
    # $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
    #     -CommandName $CommandName `
    #     -Parameters $PSBoundParameters
    # Add-M365DSCTelemetryEvent -Data $data
    # #endregion

    # $currentInstance = Get-TargetResource @PSBoundParameters

    # $BoundParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $PSBoundParameters

    # if($StageSettings -ne $null)
    # {
    #     Write-Verbose -Message "StageSettings cannot be updated after creation of access review definition."

    #     if($currentInstance.Ensure -ne 'Absent') {
    #         Write-Verbose -Message "Removing the Azure AD Access Review Definition with Id {$($currentInstance.Id)}"
    #         Remove-MgBetaIdentityGovernanceAccessReviewDefinition -AccessReviewScheduleDefinitionId $currentInstance.Id
    #     }

    #     Write-Verbose -Message "Creating an Azure AD Access Review Definition with DisplayName {$DisplayName}"

    #     $createParameters = ([Hashtable]$BoundParameters).Clone()

    #     $createParameters = Rename-M365DSCCimInstanceParameter -Properties $createParameters
    #     $createParameters.Remove('Id') | Out-Null

    #     $createParameters.Add('Scope', $createParameters.ScopeValue)
    #     $createParameters.Remove('ScopeValue') | Out-Null

    #     $createParameters.Add('Settings', $createParameters.SettingsValue)
    #     $createParameters.Remove('SettingsValue') | Out-Null

    #     foreach ($hashtable in $createParameters.StageSettings) {
    #         $propertyToRemove = 'DependsOnValue'
    #         $newProperty = 'DependsOn'
    #         if ($hashtable.ContainsKey($propertyToRemove)) {
    #             $value = $hashtable[$propertyToRemove]
    #             $hashtable[$newProperty] = $value
    #             $hashtable.Remove($propertyToRemove)
    #         }
    #     }

    #     foreach ($hashtable in $createParameters.StageSettings) {
    #         $keys = (([Hashtable]$hashtable).Clone()).Keys
    #         foreach ($key in $keys)
    #         {
    #             $value = $hashtable.$key
    #             $hashtable.Remove($key)
    #             $hashtable.Add($key.Substring(0,1).ToLower() + $key.Substring(1), $value)
    #         }
    #     }

    #     foreach ($hashtable in $createParameters.StageSettings) {
    #         Write-Verbose -Message "Priting Values: $(Convert-M365DscHashtableToString -Hashtable $hashtable)"
    #     }

    #     $keys = (([Hashtable]$createParameters).Clone()).Keys
    #     foreach ($key in $keys)
    #     {
    #         if ($null -ne $createParameters.$key -and $createParameters.$key.GetType().Name -like '*CimInstance*')
    #         {
    #             $createParameters.$key = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $createParameters.$key
    #         }
    #     }
    #     $createParameters.Add("@odata.type", "#microsoft.graph.AccessReviewScheduleDefinition")
    #     $policy = New-MgBetaIdentityGovernanceAccessReviewDefinition -BodyParameter $createParameters
    #     return;
    # }

    # if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    # {
    #     Write-Verbose -Message "Creating an Azure AD Access Review Definition with DisplayName {$DisplayName}"

    #     $createParameters = ([Hashtable]$BoundParameters).Clone()

    #     $createParameters = Rename-M365DSCCimInstanceParameter -Properties $createParameters

    #     $createParameters.Remove('Id') | Out-Null

    #     $createParameters.Add('Scope', $createParameters.ScopeValue)
    #     $createParameters.Remove('ScopeValue') | Out-Null

    #     $createParameters.Add('Settings', $createParameters.SettingsValue)
    #     $createParameters.Remove('SettingsValue') | Out-Null

    #     foreach ($hashtable in $createParameters.StageSettings) {
    #         $propertyToRemove = 'DependsOnValue'
    #         $newProperty = 'DependsOn'
    #         if ($hashtable.ContainsKey($propertyToRemove)) {
    #             $value = $hashtable[$propertyToRemove]
    #             $hashtable[$newProperty] = $value
    #             $hashtable.Remove($propertyToRemove)
    #         }
    #     }

    #     foreach ($hashtable in $createParameters.StageSettings) {
    #         $keys = (([Hashtable]$hashtable).Clone()).Keys
    #         foreach ($key in $keys)
    #         {
    #             $value = $hashtable.$key
    #             $hashtable.Remove($key)
    #             $hashtable.Add($key.Substring(0,1).ToLower() + $key.Substring(1), $value)
    #         }
    #     }

    #     foreach ($hashtable in $createParameters.StageSettings) {
    #         Write-Verbose -Message "Priting Values: $(Convert-M365DscHashtableToString -Hashtable $hashtable)"
    #     }

    #     $keys = (([Hashtable]$createParameters).Clone()).Keys
    #     foreach ($key in $keys)
    #     {
    #         if ($null -ne $createParameters.$key -and $createParameters.$key.GetType().Name -like '*CimInstance*')
    #         {
    #             $createParameters.$key = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $createParameters.$key
    #         }
    #     }
    #     #region resource generator code
    #     $createParameters.Add("@odata.type", "#microsoft.graph.AccessReviewScheduleDefinition")
    #     $policy = New-MgBetaIdentityGovernanceAccessReviewDefinition -BodyParameter $createParameters
    #     #endregion
    # }
    # elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    # {
    #     Write-Verbose -Message "Updating the Azure AD Access Review Definition with Id {$($currentInstance.Id)}"

    #     $updateParameters = ([Hashtable]$BoundParameters).Clone()
    #     $updateParameters = Rename-M365DSCCimInstanceParameter -Properties $updateParameters

    #     $updateParameters.Remove('Id') | Out-Null

    #     $updateParameters.Add('Scope', $updateParameters.ScopeValue)
    #     $updateParameters.Remove('ScopeValue') | Out-Null

    #     $updateParameters.Add('Settings', $updateParameters.SettingsValue)
    #     $updateParameters.Remove('SettingsValue') | Out-Null


    #     $keys = (([Hashtable]$updateParameters).Clone()).Keys
    #     foreach ($key in $keys)
    #     {
    #         if ($null -ne $pdateParameters.$key -and $updateParameters.$key.GetType().Name -like '*CimInstance*')
    #         {
    #             $updateParameters.$key = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $updateParameters.AccessReviewScheduleDefinitionId
    #         }
    #     }

    #     #region resource generator code
    #     $UpdateParameters.Add("@odata.type", "#microsoft.graph.AccessReviewScheduleDefinition")
    #     Set-MgBetaIdentityGovernanceAccessReviewDefinition `
    #         -AccessReviewScheduleDefinitionId $currentInstance.Id `
    #         -BodyParameter $UpdateParameters
    #     #endregion
    # }
    # elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    # {
    #     Write-Verbose -Message "Removing the Azure AD Access Review Definition with Id {$($currentInstance.Id)}"
    #     #region resource generator code
    #     Remove-MgBetaIdentityGovernanceAccessReviewDefinition -AccessReviewScheduleDefinitionId $currentInstance.Id
    #     #endregion
    # }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [System.String]
        $Id,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $LinkedDomainUrl,

        [Parameter()]
        [System.String]
        $DidMethod,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $KeyVaultMetadata,

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

    Write-Verbose -Message "Testing configuration of the Azure AD Access Review Definition with Id {$Id} and DisplayName {$DisplayName}"

    $CurrentValues = Get-TargetResource @PSBoundParameters
    $ValuesToCheck = ([Hashtable]$PSBoundParameters).clone()

    if ($CurrentValues.Ensure -ne $Ensure)
    {
        Write-Verbose -Message "Test-TargetResource returned $false"
        return $false
    }
    $testResult = $true

    #Compare Cim instances
    foreach ($key in $PSBoundParameters.Keys)
    {
        $source = $PSBoundParameters.$key
        $target = $CurrentValues.$key
        if ($null -ne $source -and $source.GetType().Name -like '*CimInstance*')
        {
            $testResult = Compare-M365DSCComplexObject `
                -Source ($source) `
                -Target ($target)

            if (-not $testResult)
            {
                break
            }

            $ValuesToCheck.Remove($key) | Out-Null
        }
    }

    $ValuesToCheck.Remove('Id') | Out-Null
    $ValuesToCheck = Remove-M365DSCAuthenticationParameter -BoundParameters $ValuesToCheck

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $ValuesToCheck)"

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
        [array] $Script:exportedInstances = $response.value

        foreach ($authority in $Script:exportedInstances)
        {
            if ($null -ne $Global:M365DSCExportResourceInstancesCount)
            {
                $Global:M365DSCExportResourceInstancesCount++
            }

            Write-Host "    |---[$i/$($Script:exportedInstances.Count)] $($authority.Name)" -NoNewline
            $Params = @{
                Name                  = $authority.Name
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

                if ($null -ne $Results.KeyVaultMetadata)
                {
                    $complexMapping = @(
                        @{
                            Name = 'KeyVaultMetadata'
                            CimInstanceName = 'AADVerifiedIdAuthorityKeyVaultMetadata'
                            IsRequired = $False
                        }
                    )
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                    -ComplexObject $Results.KeyVaultMetadata `
                    -CIMInstanceName 'AADVerifiedIdAuthorityKeyVaultMetadata' `
                    -ComplexTypeMapping $complexMapping

                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.KeyVaultMetadata = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('KeyVaultMetadata') | Out-Null
                    }
                }


                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -Credential $Credential

                if ($Results.KeyVaultMetadata)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "KeyVaultMetadata" -IsCIMArray:$False
                }

                $dscContent.Append($currentDSCBlock) | Out-Null
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                -FileName $Global:PartialExportFileName
                Write-Host $Global:M365DSCEmojiGreenCheckMark
                $i++
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

    Write-Verbose -Message "Retrieving values for authority {$($Authority.Name)}"
    $did = ($Authority.didModel.did -split ":")[1]
    $values = @{
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

Export-ModuleMember -Function *-TargetResource
