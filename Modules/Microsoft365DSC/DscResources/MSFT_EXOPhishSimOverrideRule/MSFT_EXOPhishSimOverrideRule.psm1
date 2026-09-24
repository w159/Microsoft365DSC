using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class EXOPhishSimOverrideRule : M365DSCResourceBase
{
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

    [DscProperty(Key)]
    [System.ComponentModel.Description('The unique identifier (GUID or name) of the override rule. This parameter is mandatory.')]
    [System.String] $Identity

    [DscProperty()]
    [System.ComponentModel.Description('The domains for the override rule.')]
    [System.String[]] $Domains

    [DscProperty()]
    [System.ComponentModel.Description('The IP ranges for the override rule.')]
    [System.String[]] $SenderIpRanges

    [DscProperty()]
    [System.ComponentModel.Description('An optional comment for the override rule.')]
    [System.String] $Comment

    [DscProperty()]
    [System.ComponentModel.Description('The phishing simulation override policy that''s associated with the rule.')]
    [System.String] $Policy

    [DscProperty()]
    [System.ComponentModel.Description('Ensures the presence or absence of the configuration.')]
    [ValidateSet('Present', 'Absent')]
    [System.String] $Ensure

    # Export-only. Not part of the resource schema.
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [EXOPhishSimOverrideRule] Get()
    {
        if ($this.RequiresPowerShellCore())
        {
            $remote = [EXOPhishSimOverrideRule]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration for Phishing Simulation Override Rule with Identity {$($this.Identity)}"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.Identity -ne $this.Identity)
            {
                $null = $this.Connect('ExchangeOnline')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullResult = $this.GetBoundParameters()
                $nullResult.Ensure = 'Absent'

                $instance = Get-EXOPhishSimOverrideRule -Identity $this.Identity -ErrorAction SilentlyContinue
                if ($null -eq $instance)
                {
                    Write-Verbose -Message "Phishing Simulation Override Rule with Identity {$($this.Identity)} not found"
                    return $this.AsResult($nullResult)
                }
            }
            else
            {
                $instance = $this.ExportedInstance
            }

            Write-Verbose -Message "Found Phishing Simulation Override Rule with Identity {$($this.Identity)}"

            $results = @{
                Identity              = $instance.Identity
                SenderIpRanges        = $instance.SenderIpRanges
                Domains               = $instance.Domains
                Comment               = $instance.Comment
                Policy                = $instance.Policy
                Ensure                = 'Present'
                Credential            = $this.Credential
                ApplicationId         = $this.ApplicationId
                TenantId              = $this.TenantId
                CertificateThumbprint = $this.CertificateThumbprint
                CertificatePath       = $this.CertificatePath
                CertificatePassword   = $this.CertificatePassword
                ManagedIdentity       = $this.ManagedIdentity
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

        Write-Verbose -Message "Setting configuration for Phishing Simulation Override Rule with Identity {$($this.Identity)}"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $currentInstance = $this.Get().ToHashtable()

        $setParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()

        # CREATE
        if ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
        {
            $ruleIdentity = $setParameters['Identity']
            $setParameters.Add('Name', $ruleIdentity)
            $setParameters.Remove('Identity')

            New-EXOPhishSimOverrideRule @SetParameters
        }
        # UPDATE
        elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
        {
            # Modify Domains and SenderIpRanges parameters as Set cmdlet for this resource has different parameter names
            $this.ModifyPropertiesForSetCmdlet($setParameters, $currentInstance, 'Domains')
            $this.ModifyPropertiesForSetCmdlet($setParameters, $currentInstance, 'SenderIpRanges')

            Set-EXOPhishSimOverrideRule @SetParameters
        }
        # REMOVE
        elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
        {
            Remove-EXOPhishSimOverrideRule -Identity $setParameters['Identity']
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

        $ConnectionMode = $this.Connect('ExchangeOnline')

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Export')

        try
        {
            [array]$rules = Get-EXOPhishSimOverrideRule

            $i = 1
            $dscContent = [System.Text.StringBuilder]::new()
            if ($rules.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }
            foreach ($config in $rules)
            {
                $displayedKey = $config.Identity
                Write-M365DSCHost -Message "    |---[$i/$($rules.Count)] $displayedKey" -DeferWrite
                $params = @{
                    Identity              = $config.Identity
                    Credential            = $this.Credential
                    ApplicationId         = $this.ApplicationId
                    TenantId              = $this.TenantId
                    CertificateThumbprint = $this.CertificateThumbprint
                    CertificatePath       = $this.CertificatePath
                    CertificatePassword   = $this.CertificatePassword
                    ManagedIdentity       = $this.ManagedIdentity
                    AccessTokens          = $this.AccessTokens
                }
                $this.ExportedInstance = $config
                $Results = $this.GetForExport($Params)
                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential
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

    hidden [void] ModifyPropertiesForSetCmdlet([System.Collections.Hashtable] $setParameters, [System.Collections.Hashtable] $currentInstance, [System.String] $propertyName)
    {
        # Get the arrays
        $setArray = $setParameters[$propertyName]
        $currentArray = $currentInstance[$propertyName]

        # Compare arrays
        $addArray = $setArray | Where-Object { $_ -notin $currentArray }
        $removeArray = $currentArray | Where-Object { $_ -notin $setArray }

        # Modify $setParameters
        if ($addArray.Count -gt 0)
        {
            $setParameters.Add("Add$propertyName", $addArray)
        }
        if ($removeArray.Count -gt 0)
        {
            $setParameters.Add("Remove$propertyName", $removeArray)
        }

        # Remove the original property
        $setParameters.Remove($propertyName)
    }

    hidden [EXOPhishSimOverrideRule] AsResult([System.Object] $Values)
    {
        if ($Values -is [EXOPhishSimOverrideRule])
        {
            return $Values
        }

        $result = [EXOPhishSimOverrideRule]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}
