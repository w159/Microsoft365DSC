using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class AADAppManagementPolicy : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('The display name of the policy.')]
    [System.String] $DisplayName

    [DscProperty()]
    [System.ComponentModel.Description('Id of the policy.')]
    [System.String] $Id

    [DscProperty(Mandatory)]
    [System.ComponentModel.Description('The description of the policy.')]
    [System.String] $Description

    [DscProperty()]
    [System.ComponentModel.Description('Denotes whether the policy is enabled.')]
    [System.Nullable[System.Boolean]] $IsEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Restrictions that apply to an application or service principal object.')]
    [MSFT_AADAppManagementPolicyRestrictions] $Restrictions

    [DscProperty()]
    [System.ComponentModel.Description('Present ensures the instance exists, absent ensures it is removed.')]
    [ValidateSet('Absent', 'Present')]
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

    # Export-only. Not part of the resource schema.
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [AADAppManagementPolicy] Get()
    {
        $instance = $null
        if ($this.RequiresPowerShellCore())
        {
            $remote = [AADAppManagementPolicy]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration of App Management Policy '$($this.DisplayName)'"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.DisplayName -ne $this.DisplayName)
            {
                $null = $this.Connect('MicrosoftGraph')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullResult = $this.GetBoundParameters()
                $nullResult.Ensure = 'Absent'

                if (-not [System.String]::IsNullOrEmpty($this.Id))
                {
                    $instance = Get-MgBetaPolicyAppManagementPolicy -AppManagementPolicyId $this.Id `
                        -ErrorAction SilentlyContinue
                }

                if ($null -eq $instance)
                {
                    Write-Verbose -Message "Could not find App Management Policy with ID {$($this.Id)}"
                    $instance = Get-MgBetaPolicyAppManagementPolicy -Filter "displayName eq '$($this.DisplayName)'" -All `
                        -ErrorAction SilentlyContinue
                }

                if ($null -eq $instance)
                {
                    Write-Verbose -Message "Could not find App Management Policy with DisplayName {$($this.DisplayName)}"
                    return $this.AsResult($nullResult)
                }
            }
            else
            {
                $instance = $this.ExportedInstance
            }

            $restrictionsValue = @{
                passwordCredentials = @()
                keyCredentials      = @()
            }

            foreach ($passwordCred in $instance.Restrictions.PasswordCredentials)
            {
                $newItem = @{
                    restrictForAppsCreatedAfterDateTime = $passwordCred.RestrictForAppsCreatedAfterDateTime.ToString('o')
                    restrictionType                     = $passwordCred.RestrictionType
                    state                               = $passwordCred.State
                }
                if ($null -ne $passwordCred.MaxLifetime)
                {
                    $iso8601Duration = 'P{0}DT{1}H{2}M{3}S' -f $passwordCred.MaxLifetime.Days, $passwordCred.MaxLifetime.Hours, $passwordCred.MaxLifetime.Minutes, $passwordCred.MaxLifetime.Seconds
                    $newItem.Add('maxLifetime', $iso8601Duration)
                }
                $restrictionsValue.passwordCredentials += $newItem
            }

            foreach ($keyCred in $instance.Restrictions.KeyCredentials)
            {
                $newItem = @{
                    restrictForAppsCreatedAfterDateTime = $keyCred.RestrictForAppsCreatedAfterDateTime.ToString('o')
                    restrictionType                     = $keyCred.RestrictionType
                    state                               = $keyCred.State
                }
                if ($null -ne $keyCred.MaxLifetime)
                {
                    $iso8601Duration = 'P{0}DT{1}H{2}M{3}S' -f $keyCred.MaxLifetime.Days, $keyCred.MaxLifetime.Hours, $keyCred.MaxLifetime.Minutes, $keyCred.MaxLifetime.Seconds
                    $newItem.Add('maxLifetime', $iso8601Duration)
                }
                if ($null -ne $keyCred.CertificateBasedApplicationConfigurationIds -and $keyCred.CertificateBasedApplicationConfigurationIds.Count -gt 0)
                {
                    $newItem.Add('certificateBasedApplicationConfigurationIds', [System.String[]]$keyCred.CertificateBasedApplicationConfigurationIds)
                }
                $restrictionsValue.keyCredentials += $newItem
            }

            $results = @{
                DisplayName           = $instance.DisplayName
                Id                    = $instance.Id
                Description           = $instance.Description
                IsEnabled             = $instance.IsEnabled
                Restrictions          = $restrictionsValue
                Ensure                = 'Present'
                Credential            = $this.Credential
                ApplicationId         = $this.ApplicationId
                TenantId              = $this.TenantId
                CertificateThumbprint = $this.CertificateThumbprint
                CertificatePath       = $this.CertificatePath
                CertificatePassword   = $this.CertificatePassword
                ManagedIdentity       = $this.ManagedIdentity.IsPresent
                AccessTokens          = $this.AccessTokens
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

        Write-Verbose -Message "Setting configuration of App Management Policy '$($this.DisplayName)'"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $currentInstance = $this.Get().ToHashtable()
        $setParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()

        $restrictionsValue = @{
            passwordCredentials = @()
            keyCredentials      = @()
        }

        foreach ($passwordCred in $this.Restrictions.PasswordCredentials)
        {
            $newItem = @{
                restrictForAppsCreatedAfterDateTime = [System.DateTime]::Parse($passwordCred.RestrictForAppsCreatedAfterDateTime)
                restrictionType                     = $passwordCred.RestrictionType
                state                               = $passwordCred.State
            }
            if ($null -ne $passwordCred.MaxLifetime)
            {
                $newItem.Add('maxLifetime', $passwordCred.MaxLifetime.ToString())
            }
            $restrictionsValue.passwordCredentials += $newItem
        }

        foreach ($keyCred in $this.Restrictions.KeyCredentials)
        {
            $newItem = @{
                restrictForAppsCreatedAfterDateTime = [System.DateTime]::Parse($keyCred.RestrictForAppsCreatedAfterDateTime)
                restrictionType                     = $keyCred.RestrictionType
                state                               = $keyCred.State
            }
            if ($null -ne $keyCred.MaxLifetime)
            {
                $newItem.Add('maxLifetime', $keyCred.MaxLifetime.ToString())
            }
            if ($null -ne $keyCred.CertificateBasedApplicationConfigurationIds -and $keyCred.CertificateBasedApplicationConfigurationIds.Count -gt 0)
            {
                $newItem.Add('certificateBasedApplicationConfigurationIds', [System.String[]]$keyCred.CertificateBasedApplicationConfigurationIds)
            }
            $restrictionsValue.keyCredentials += $newItem
        }

        $setParameters.Restrictions = $restrictionsValue

        # CREATE
        if ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
        {
            Write-Verbose -Message "Creating new App Management Policy {$($this.DisplayName)} with:`r`n$(ConvertTo-Json $setParameters -Depth 10)"
            New-MgBetaPolicyAppManagementPolicy -BodyParameter $setParameters
        }
        # UPDATE
        elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Updating App Management Policy {$($this.DisplayName)} with:`r`n$(ConvertTo-Json $setParameters -Depth 10)"
            Update-MgBetaPolicyAppManagementPolicy -AppManagementPolicyId $currentInstance.Id -BodyParameter $setParameters
        }
        # REMOVE
        elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Removing App Management Policy {$($this.DisplayName)}"
            Remove-MgBetaPolicyAppManagementPolicy -AppManagementPolicyId $currentInstance.Id
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
            [array] $exportedInstances = Get-MgBetaPolicyAppManagementPolicy -Filter $this.Filter -All -ErrorAction Stop

            $i = 1
            $dscContent = [System.Text.StringBuilder]::new()
            if ($exportedInstances.Count -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }
            foreach ($config in $exportedInstances)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                $displayedKey = $config.DisplayName
                Write-M365DSCHost -Message "    |---[$i/$($exportedInstances.Count)] $displayedKey" -DeferWrite
                $params = @{
                    DisplayName           = $config.DisplayName
                    Id                    = $config.Id
                    Description           = $config.Description
                    Credential            = $this.Credential
                    ApplicationId         = $this.ApplicationId
                    TenantId              = $this.TenantId
                    CertificateThumbprint = $this.CertificateThumbprint
                    CertificatePath       = $this.CertificatePath
                    CertificatePassword   = $this.CertificatePassword
                    ManagedIdentity       = $this.ManagedIdentity.IsPresent
                    AccessTokens          = $this.AccessTokens
                }

                $this.ExportedInstance = $config
                $Results = $this.GetForExport($Params)
                if ($null -ne $Results.Restrictions)
                {
                    $complexMapping = @(
                        @{
                            Name            = 'Restrictions'
                            CimInstanceName = 'AADAppManagementPolicyRestrictions'
                            IsRequired      = $False
                        }
                        @{
                            Name            = 'PasswordCredentials'
                            CimInstanceName = 'AADAppManagementPolicyRestrictionsCredential'
                            IsRequired      = $False
                        }
                        @{
                            Name            = 'KeyCredentials'
                            CimInstanceName = 'AADAppManagementPolicyRestrictionsCredential'
                            IsRequired      = $False
                        }
                    )
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.Restrictions `
                        -CIMInstanceName 'AADAppManagementPolicyRestrictions' `
                        -ComplexTypeMapping $complexMapping

                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.Restrictions = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('Restrictions') | Out-Null
                    }
                }
                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential `
                    -NoEscape @('Restrictions', 'KeyCredentials', 'PasswordCredentials')
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

    hidden [AADAppManagementPolicy] AsResult([System.Object] $Values)
    {
        if ($Values -is [AADAppManagementPolicy])
        {
            return $Values
        }

        $result = [AADAppManagementPolicy]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}

class MSFT_AADAppManagementPolicyRestrictions
{
    [DscProperty()]
    [System.ComponentModel.Description('Collection of keyCredential restrictions settings to be applied to an application or service principal.')]
    [MSFT_AADAppManagementPolicyRestrictionsCredential[]] $KeyCredentials

    [DscProperty()]
    [System.ComponentModel.Description('Collection of password restrictions settings to be applied to an application or service principal.')]
    [MSFT_AADAppManagementPolicyRestrictionsCredential[]] $PasswordCredentials
}

class MSFT_AADAppManagementPolicyRestrictionsCredential
{
    [DscProperty()]
    [System.ComponentModel.Description('Collection of GUIDs of certificateBasedApplicationConfiguration objects that represent trusted certificate authorities. Used when restrictionType is set to trustedCertificateAuthority for keyCredentials.')]
    [System.String[]] $CertificateBasedApplicationConfigurationIds

    [DscProperty()]
    [System.ComponentModel.Description('String value that indicates the maximum lifetime for password expiration, defined as an ISO 8601 duration. For example, P4DT12H30M5S represents four days, 12 hours, 30 minutes, and five seconds. This property is required when restrictionType is set to passwordLifetime.')]
    [System.String] $MaxLifetime

    [DscProperty()]
    [System.ComponentModel.Description('Specifies the date from which the policy restriction applies to newly created applications. For existing applications, the enforcement date can be retroactively applied.')]
    [System.String] $RestrictForAppsCreatedAfterDateTime

    [DscProperty(Mandatory)]
    [System.ComponentModel.Description('The type of restriction being applied. The possible values are: passwordAddition, passwordLifetime, symmetricKeyAddition, symmetricKeyLifetime, customPasswordAddition, asymmetricKeyLifetime, trustedCertificateAuthority, and unknownFutureValue. Each value of restrictionType can be used only once per policy.')]
    [System.String] $RestrictionType

    [DscProperty()]
    [System.ComponentModel.Description('Indicates whether the restriction is evaluated. The possible values are: enabled, disabled, unknownFutureValue. If enabled, the restriction is evaluated. If disabled, the restriction isn''t evaluated or enforced.')]
    [System.String] $State
}
