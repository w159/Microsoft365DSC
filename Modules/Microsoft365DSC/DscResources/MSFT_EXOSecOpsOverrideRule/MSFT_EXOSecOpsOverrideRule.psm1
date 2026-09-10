using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class EXOSecOpsOverrideRule : M365DSCResourceBase
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
    [System.ComponentModel.Description('An optional comment for the override rule.')]
    [System.String] $Comment

    [DscProperty()]
    [System.ComponentModel.Description('The SecOps simulation override policy that''s associated with the rule.')]
    [System.String] $Policy

    [DscProperty()]
    [System.ComponentModel.Description('Ensures the presence or absence of the configuration.')]
    [ValidateSet('Present', 'Absent')]
    [System.String] $Ensure

    # Export-only. Not part of the resource schema.
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [EXOSecOpsOverrideRule] Get()
    {
        if ($this.RequiresPowerShellCore())
        {
            $remote = [EXOSecOpsOverrideRule]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration for Security Operations Override Rule with Identity {$($this.Identity)}"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.Identity -ne $this.Identity)
            {
                $null = $this.Connect('ExchangeOnline')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullResult = $this.GetBoundParameters()
                $nullResult.Ensure = 'Absent'

                $instance = Get-EXOSecOpsOverrideRule -Identity $this.Identity -ErrorAction SilentlyContinue
                if ($null -eq $instance)
                {
                    Write-Verbose -Message "Could not find Security Operations Override Rule with Identity {$($this.Identity)}"
                    return $this.AsResult($nullResult)
                }
            }
            else
            {
                $instance = $this.ExportedInstance
            }

            Write-Verbose -Message "Found Security Operations Override Rule with Identity {$($this.Identity)}"

            $results = @{
                Identity              = $instance.Identity
                Comment               = $instance.Comment
                Policy                = $instance.Policy
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

        Write-Verbose -Message "Setting configuration for Security Operations Override Rule with Identity {$($this.Identity)}"

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
            New-EXOSecOpsOverrideRule @SetParameters
        }
        # UPDATE
        elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
        {
            $setParameters.Remove('Policy')
            Set-EXOSecOpsOverrideRule @SetParameters
        }
        # REMOVE
        elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
        {
            Remove-EXOSecOpsOverrideRule -Identity $this.Identity
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

        ##TODO - Replace workload
        $ConnectionMode = $this.Connect('ExchangeOnline')

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Export')

        try
        {
            [array]$overrideRules = Get-EXOSecOpsOverrideRule

            $i = 1
            $dscContent = [System.Text.StringBuilder]::new()
            if ($overrideRules.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }
            foreach ($config in $overrideRules)
            {
                $displayedKey = $config.Identity
                Write-M365DSCHost -Message "    |---[$i/$($overrideRules.Count)] $displayedKey" -DeferWrite
                $params = @{
                    Identity              = $config.Identity
                    Comment               = $config.Comment
                    Policy                = $config.Policy
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

    hidden [EXOSecOpsOverrideRule] AsResult([System.Object] $Values)
    {
        if ($Values -is [EXOSecOpsOverrideRule])
        {
            return $Values
        }

        $result = [EXOSecOpsOverrideRule]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}
