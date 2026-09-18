using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class AADAgreement : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('The display name of the agreement.')]
    [System.String] $DisplayName

    [DscProperty()]
    [System.ComponentModel.Description('The unique identifier of the agreement.')]
    [System.String] $Id

    [DscProperty()]
    [System.ComponentModel.Description('Whether the user is required to view the agreement document before accepting.')]
    [System.Nullable[System.Boolean]] $IsViewingBeforeAcceptanceRequired

    [DscProperty()]
    [System.ComponentModel.Description('Whether the agreement is per device or per user.')]
    [System.Nullable[System.Boolean]] $IsPerDeviceAcceptanceRequired

    [DscProperty()]
    [System.ComponentModel.Description('Duration after which the user must re-accept the terms of use. Must be in ISO 8601 duration format.')]
    [System.String] $UserReacceptRequiredFrequency

    [DscProperty()]
    [System.ComponentModel.Description('The content of the agreement file.')]
    [System.String] $FileData

    [DscProperty()]
    [System.ComponentModel.Description('The name of the agreement file.')]
    [System.String] $FileName

    [DscProperty()]
    [System.ComponentModel.Description('The language of the agreement file.')]
    [System.String] $Language

    [DscProperty()]
    [System.ComponentModel.Description('Expiration schedule and frequency of the agreement for all users.')]
    [MSFT_TermsExpiration] $TermsExpiration

    [DscProperty()]
    [System.ComponentModel.Description('Specify if the agreement should exist or not.')]
    [ValidateSet('Present', 'Absent')]
    [System.String] $Ensure

    [DscProperty()]
    [System.ComponentModel.Description('Credentials of the workload''s Admin')]
    [System.Management.Automation.PSCredential] $Credential

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Azure Active Directory application to authenticate with.')]
    [System.String] $ApplicationId

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Azure Active Directory tenant used for authentication.')]
    [System.String] $TenantId

    [DscProperty()]
    [System.ComponentModel.Description('Secret of the Azure Active Directory application to authenticate with.')]
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [DscProperty()]
    [System.ComponentModel.Description('Thumbprint of the Azure Active Directory application''s authentication certificate to use for authentication.')]
    [System.String] $CertificateThumbprint

    [DscProperty()]
    [System.ComponentModel.Description('Username can be made up to anything but password will be used for CertificatePassword')]
    [System.Management.Automation.PSCredential] $CertificatePassword

    [DscProperty()]
    [System.ComponentModel.Description('Path to certificate used in service principal usually a PFX file.')]
    [System.String] $CertificatePath

    [DscProperty()]
    [System.ComponentModel.Description('Managed ID being used for authentication.')]
    [System.Nullable[System.Boolean]] $ManagedIdentity

    [DscProperty()]
    [System.ComponentModel.Description('Access token used for authentication.')]
    [System.String[]] $AccessTokens

    # Export-only. Not part of the resource schema.
    [System.String] $Filter

    [AADAgreement] Get()
    {
        $instance = $null
        if ($this.RequiresPowerShellCore())
        {
            $remote = [AADAgreement]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration for the Azure AD Agreement with DisplayName {$($this.DisplayName)}"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.DisplayName -ne $this.DisplayName)
            {
                $null = $this.Connect('MicrosoftGraph')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullReturn = @{
                    DisplayName = $this.DisplayName
                    Ensure      = 'Absent'
                }

                if (-not [System.String]::IsNullOrEmpty($this.Id))
                {
                    $instance = Get-MgBetaAgreement -AgreementId $this.Id -ErrorAction SilentlyContinue
                }

                if ($null -eq $instance)
                {
                    Write-Verbose -Message "Could not find Azure AD Agreement with ID {$($this.Id)}"
                    $instance = Get-MgBetaAgreement -All -Filter "displayName eq '$($this.DisplayName.Replace("'", "''"))'" -ErrorAction SilentlyContinue
                }

                if ($null -eq $instance)
                {
                    Write-Verbose -Message "Could not find Azure AD Agreement with DisplayName {$($this.DisplayName)}"
                    return $this.AsResult($nullReturn)
                }
            }
            else
            {
                $instance = $this.ExportedInstance
            }

            # Get the file data
            $fileContent = $null
            if ($null -ne $instance.File -and $null -ne $instance.File.Data)
            {
                $fileContent = $this.DecodeTextPayload($instance.File.Data)
            }

            $complexTermsExpiration = $null
            if ($null -ne $instance.TermsExpiration)
            {
                $complexTermsExpiration = @{
                    Frequency = $instance.TermsExpiration.Frequency
                }

                if ($null -ne $instance.TermsExpiration.StartDateTime)
                {
                    $complexTermsExpiration.StartDateTime = $instance.TermsExpiration.StartDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
                }
            }

            # TODO: Recheck or possibly regenerate the resource entirely to include all supported properties with the correct structure
            $results = @{
                DisplayName                       = $instance.DisplayName
                Id                                = $instance.Id
                IsViewingBeforeAcceptanceRequired = $instance.IsViewingBeforeAcceptanceRequired
                IsPerDeviceAcceptanceRequired     = $instance.IsPerDeviceAcceptanceRequired
                UserReacceptRequiredFrequency     = $instance.UserReacceptRequiredFrequency
                FileData                          = $fileContent
                FileName                          = $instance.File.Name
                Language                          = $instance.File.Language
                TermsExpiration                   = $complexTermsExpiration
                Ensure                            = 'Present'
                Credential                        = $this.Credential
                ApplicationId                     = $this.ApplicationId
                TenantId                          = $this.TenantId
                ApplicationSecret                 = $this.ApplicationSecret
                CertificateThumbprint             = $this.CertificateThumbprint
                CertificatePath                   = $this.CertificatePath
                CertificatePassword               = $this.CertificatePassword
                ManagedIdentity                   = $this.ManagedIdentity.IsPresent
                AccessTokens                      = $this.AccessTokens
            }

            return $this.AsResult($results)
        }
        catch
        {
            $this.LogError($_, 'Error retrieving data:')

            throw
        }
    }

    [void] Set()
    {
        if ($this.RequiresPowerShellCore())
        {
            $null = $this.InvokeInPowerShellCore('Set')
            return
        }

        Write-Verbose -Message "Setting configuration for the Azure AD Agreement with DisplayName {$($this.DisplayName)}"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $currentInstance = $this.Get().ToHashtable()

        $termsExpirationValue = $null
        if ($null -ne $this.TermsExpiration)
        {
            $termsExpirationValue = @{
                frequency     = $this.TermsExpiration.Frequency
                startDateTime = $this.TermsExpiration.StartDateTime
            }
        }

        if ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
        {
            # Prepare the file content
            $fileContent = @()
            $fileContent += @{
                fileData  = @{
                    data = $this.EncodeTextPayload($this.FileData)
                }
                fileName  = $this.FileName
                language  = $this.Language
                isDefault = $true
            }

            $createParameters = @{
                displayName                       = $this.DisplayName
                isViewingBeforeAcceptanceRequired = $this.IsViewingBeforeAcceptanceRequired
                isPerDeviceAcceptanceRequired     = $this.IsPerDeviceAcceptanceRequired
                userReacceptRequiredFrequency     = $this.UserReacceptRequiredFrequency
                termsExpiration                   = $termsExpirationValue
                files                             = $fileContent
            }

            $createParameters = Remove-NullEntriesFromHashtable -Hash $createParameters
            Write-Verbose -Message "Creating Azure AD Agreement with DisplayName {$($this.DisplayName)} with:`r`n$(ConvertTo-Json $createParameters -Depth 5)"

            New-MgBetaAgreement -BodyParameter $createParameters | Out-Null
        }
        elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
        {
            # Prepare the file content if provided
            $fileContent = $null
            if (-not [System.String]::IsNullOrEmpty($this.FileData))
            {
                $fileContent = @()
                $fileContent += @{
                    fileData = @{
                        data = $this.EncodeTextPayload($this.FileData)
                    }
                    fileName = $this.FileName
                    language = $this.Language
                    isDefault = $true
                }
            }

            $updateParameters = @{
                displayName                       = $this.DisplayName
                isViewingBeforeAcceptanceRequired = $this.IsViewingBeforeAcceptanceRequired
                isPerDeviceAcceptanceRequired     = $this.IsPerDeviceAcceptanceRequired
                userReacceptRequiredFrequency     = $this.UserReacceptRequiredFrequency
                termsExpiration                   = $termsExpirationValue
            }

            if ($null -ne $fileContent)
            {
                $updateParameters.files = $fileContent
            }

            $updateParameters = Remove-NullEntriesFromHashtable -Hash $updateParameters
            Write-Verbose -Message "Updating Azure AD Agreement with ID {$($currentInstance.Id)} with:`r`n$(ConvertTo-Json $updateParameters -Depth 5)"
            Update-MgBetaAgreement -AgreementId $currentInstance.Id `
                -BodyParameter $updateParameters | Out-Null
        }
        elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Removing Azure AD Agreement with DisplayName {$($this.DisplayName)} with ID {$($currentInstance.Id)}"
            Remove-MgBetaAgreement -AgreementId $currentInstance.Id
        }
    }

    [bool] Test()
    {
        return ([M365DSCResourceBase] $this).Test()
    }

    [string] Export()
    {
        if ($this.RequiresPowerShellCore())
        {
            return [string] $this.InvokeInPowerShellCore('Export')
        }

        $ConnectionMode = $this.Connect('MicrosoftGraph')

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Export')

        try
        {
            [array] $exportedInstances = Get-MgBetaAgreement -Filter $this.Filter -All

            $i = 1
            $dscContent = [System.Text.StringBuilder]::new()
            if ($exportedInstances.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckmark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }

            foreach ($config in $exportedInstances)
            {
                $displayedKey = $config.DisplayName
                Write-M365DSCHost -Message "    |---[$i/$($exportedInstances.Count)] $displayedKey" -DeferWrite

                $params = @{
                    DisplayName           = $config.DisplayName
                    Credential            = $this.Credential
                    ApplicationId         = $this.ApplicationId
                    TenantId              = $this.TenantId
                    ApplicationSecret     = $this.ApplicationSecret
                    CertificateThumbprint = $this.CertificateThumbprint
                    CertificatePath       = $this.CertificatePath
                    CertificatePassword   = $this.CertificatePassword
                    ManagedIdentity       = $this.ManagedIdentity.IsPresent
                    AccessTokens          = $this.AccessTokens
                }

                $this.ExportedInstance = $config
                $Results = $this.GetForExport($Params)

                if ($null -ne $Results.TermsExpiration)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.TermsExpiration `
                        -CIMInstanceName 'MSFT_TermsExpiration'

                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.TermsExpiration = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('TermsExpiration') | Out-Null
                    }
                }

                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential `
                    -NoEscape @('TermsExpiration')
                [void]$dscContent.Append($currentDSCBlock)
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
                $i++
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            return $dscContent.ToString()
        }
        catch
        {
            $this.LogError($_, 'Error during Export:')

            throw
        }
    }

    hidden [AADAgreement] AsResult([System.Object] $Values)
    {
        if ($Values -is [AADAgreement])
        {
            return $Values
        }

        $result = [AADAgreement]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}

class MSFT_TermsExpiration
{
    [DscProperty()]
    [System.ComponentModel.Description('The frequency at which the agreement expires for all users after the first expiration set in StartDateTime. Must be in ISO 8601 duration format.')]
    [System.String] $Frequency

    [DscProperty()]
    [System.ComponentModel.Description('The date and time on which the agreement first expires for all users.')]
    [System.String] $StartDateTime
}
