using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class SCSupervisoryReviewRule : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('The Name parameter specifies the unique name for the supervisory review policy. The name can''t exceed 64 characters. If the value contains spaces, enclose the value in quotation marks.')]
    [ValidateLength(1, 64)]
    [System.String] $Name

    [DscProperty(Key)]
    [System.ComponentModel.Description('The Policy parameter specifies the supervisory review policy that''s assigned to the rule. You can use any value that uniquely identifies the policy.')]
    [System.String] $Policy

    [DscProperty()]
    [System.ComponentModel.Description('The Condition parameter specifies the conditions and exceptions for the rule.')]
    [System.String] $Condition

    [DscProperty()]
    [System.ComponentModel.Description('The SamplingRate parameter specifies the percentage of communications for review. If you want reviewers to review all detected items, use the value 100.')]
    [ValidateRange(0, 100)]
    [System.Nullable[System.UInt32]] $SamplingRate

    [DscProperty()]
    [System.ComponentModel.Description('Specify if this rule should exist or not.')]
    [ValidateSet('Present', 'Absent')]
    [System.String] $Ensure

    [DscProperty()]
    [System.ComponentModel.Description('Credentials of the Exchange Global Admin')]
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

    [SCSupervisoryReviewRule] Get()
    {
        if ($this.RequiresPowerShellCore())
        {
            $remote = [SCSupervisoryReviewRule]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration of SupervisoryReviewRule for $($this.Name)"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.Name -ne $this.Name)
            {
                $null = $this.Connect('SecurityComplianceCenter')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullReturn = $this.GetBoundParameters()
                $nullReturn.Ensure = 'Absent'

                $RuleObject = Invoke-M365DSCCommand -ScriptBlock { Get-SupervisoryReviewRule -Identity $this.Name -ErrorAction Stop } -SuppressNotFoundError

                if ($null -eq $RuleObject)
                {
                    Write-Verbose -Message "SupervisoryReviewRule $($this.Name) does not exist."
                    return $this.AsResult($nullReturn)
                }
            }
            else
            {
                $RuleObject = $this.ExportedInstance
            }

            Write-Verbose "Found existing SupervisoryReviewRule $($this.Name)"
            $PolicyName = (Get-SupervisoryReviewPolicyV2 -Identity $RuleObject.Policy).Name

            $result = @{
                Name                  = $RuleObject.Name
                Policy                = $PolicyName
                Condition             = $RuleObject.Condition
                SamplingRate          = $RuleObject.SamplingRate
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

            Write-Verbose -Message "Found SupervisoryReviewRule $($this.Name)"
            return $this.AsResult($result)
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

        Write-Verbose -Message "Setting configuration of SupervisoryReviewRule for $($this.Name)"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $CurrentRule = $this.Get().ToHashtable()

        if ($this.Ensure -eq 'Present' -and $CurrentRule.Ensure -eq 'Absent')
        {
            $CreationParams = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()
            New-SupervisoryReviewRule @CreationParams
        }
        elseif ($this.Ensure -eq 'Present' -and $CurrentRule.Ensure -eq 'Present')
        {
            Set-SupervisoryReviewRule -Identity $CurrentRule.Name `
                -Condition $CurrentRule.Condition `
                -SamplingRate $CurrentRule.SamplingRate
        }
        elseif ($this.Ensure -eq 'Absent' -and $CurrentRule.Ensure -eq 'Present')
        {
            throw ("The SCSupervisoryReviewRule resource doesn't not support deleting Rules. " + `
                    'Instead try removing the associated policy, or modifying the existing rule.')
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

        $ConnectionMode = $this.Connect('SecurityComplianceCenter')

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Export')

        try
        {
            [array]$rules = Get-SupervisoryReviewRule -ErrorAction Stop
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
            foreach ($rule in $rules)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                Write-M365DSCHost -Message "    |---[$i/$($rules.Length)] $($rule.Name)" -DeferWrite
                $this.ExportedInstance = $rule
                $Results = $this.GetForExport(@{ Name = $rule.Name; Policy = $rule.Policy })
                $rawResults = $Results.Clone()
                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential `
                    -RawResults $rawResults
                [void]$dscContent.Append($currentDSCBlock)
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
                $i++
            }
            return $dscContent.ToString()
        }
        catch
        {
            $this.LogError($_, 'Error during Export:')

            throw
        }
    }

    hidden [SCSupervisoryReviewRule] AsResult([System.Object] $Values)
    {
        if ($Values -is [SCSupervisoryReviewRule])
        {
            return $Values
        }

        $result = [SCSupervisoryReviewRule]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}
