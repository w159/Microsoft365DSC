using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class TeamsComplianceRecordingPolicy : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('Unique identifier of the application instance of a policy-based recording application to be retrieved.')]
    [System.String] $Identity

    [DscProperty()]
    [System.ComponentModel.Description('A list of application instances of policy-based recording applications to assign to this policy. The Id of each of these application instances must be the ObjectId of the application instance as obtained by the Get-CsOnlineApplicationInstance cmdlet.')]
    [MSFT_TeamsComplianceRecordingApplication[]] $ComplianceRecordingApplications

    [DscProperty()]
    [System.ComponentModel.Description('Enables administrators to provide explanatory text to accompany a Teams recording policy. For example, the Description might include information about the users the policy should be assigned to.')]
    [System.String] $Description

    [DscProperty()]
    [System.ComponentModel.Description('Setting this attribute to true disables recording audio notifications for 1:1 calls that are under compliance recording.')]
    [System.Nullable[System.Boolean]] $DisableComplianceRecordingAudioNotificationForCalls

    [DscProperty()]
    [System.ComponentModel.Description('Controls whether this Teams recording policy is active or not.')]
    [System.Nullable[System.Boolean]] $Enabled

    [DscProperty()]
    [System.ComponentModel.Description('Setting this attribute to true enables compliance recording for calls that have been re-routed from a compliance recording-enabled user. Supported call scenarios include forward, transfer, delegation, call groups, and simultaneous ring.')]
    [System.Nullable[System.Boolean]] $RecordReroutedCalls

    [DscProperty()]
    [System.ComponentModel.Description('This parameter is reserved for future use.')]
    [System.Nullable[System.Boolean]] $WarnUserOnRemoval

    [DscProperty()]
    [System.ComponentModel.Description('Present ensures the instance exists, absent ensures it is removed.')]
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
    [System.String] $Filter = '*'

    # Export-only. Not part of the resource schema.
    [System.Management.Automation.PSCredential] $ApplicationSecret

    [TeamsComplianceRecordingPolicy] Get()
    {
        $nullResult = $null
        if ($this.RequiresPowerShellCore())
        {
            $remote = [TeamsComplianceRecordingPolicy]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration for TeamsComplianceRecordingPolicy $($this.Identity)"

        try
        {
            if (-not $this.ExportedInstance -or $this.ExportedInstance.Identity -ne $this.Identity)
            {
                $null = $this.Connect('MicrosoftTeams')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullResult = $this.GetBoundParameters()
                $nullResult.Ensure = 'Absent'

                $instance = Get-CsTeamsComplianceRecordingPolicy -Identity $this.Identity -ErrorAction SilentlyContinue
            }
            else
            {
                $instance = $this.ExportedInstance
            }

            if ($null -eq $instance)
            {
                return $this.AsResult($nullResult)
            }

            $ComplexComplianceRecordingApplications = @()
            if ($instance.ComplianceRecordingApplications.Count -gt 0)
            {
                foreach ($CurrentComplianceRecordingApplications in $instance.ComplianceRecordingApplications)
                {
                    $MyComplianceRecordingApplications = [ordered]@{}
                    $ComplianceRecordingPairedApplications = @()
                    if ($CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications.Count -gt 0)
                    {
                        foreach ($CurrentComplianceRecordingPairedApplications in $CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications)
                        {
                            $ComplianceRecordingPairedApplications += $CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications.Id
                        }
                    }
                    $MyComplianceRecordingApplications.Add('ComplianceRecordingPairedApplications', $ComplianceRecordingPairedApplications)
                    $MyComplianceRecordingApplications.Add('Id', $CurrentComplianceRecordingApplications.Id)
                    $MyComplianceRecordingApplications.Add('RequiredBeforeMeetingJoin', $CurrentComplianceRecordingApplications.RequiredBeforeMeetingJoin)
                    $MyComplianceRecordingApplications.Add('RequiredBeforeCallEstablishment', $CurrentComplianceRecordingApplications.RequiredBeforeCallEstablishment)
                    $MyComplianceRecordingApplications.Add('RequiredDuringMeeting', $CurrentComplianceRecordingApplications.RequiredDuringMeeting)
                    $MyComplianceRecordingApplications.Add('RequiredDuringCall', $CurrentComplianceRecordingApplications.RequiredDuringCall)
                    $MyComplianceRecordingApplications.Add('ConcurrentInvitationCount', $CurrentComplianceRecordingApplications.ConcurrentInvitationCount)

                    if ($MyComplianceRecordingApplications.values.Where({ $null -ne $_ }).Count -gt 0)
                    {
                        $ComplexComplianceRecordingApplications += $MyComplianceRecordingApplications
                    }
                }
            }

            Write-Verbose -Message "Found an instance with Identity {$($this.Identity)}"
            $results = @{
                Identity                                            = $instance.Identity
                ComplianceRecordingApplications                     = $ComplexComplianceRecordingApplications
                Description                                         = $instance.Description
                DisableComplianceRecordingAudioNotificationForCalls = $instance.DisableComplianceRecordingAudioNotificationForCalls
                Enabled                                             = $instance.Enabled
                RecordReroutedCalls                                 = $instance.RecordReroutedCalls
                WarnUserOnRemoval                                   = $instance.WarnUserOnRemoval
                Ensure                                              = 'Present'
                Credential                                          = $this.Credential
                ApplicationId                                       = $this.ApplicationId
                TenantId                                            = $this.TenantId
                CertificateThumbprint                               = $this.CertificateThumbprint
                CertificatePath                                     = $this.CertificatePath
                CertificatePassword                                 = $this.CertificatePassword
                ManagedIdentity                                     = $this.ManagedIdentity.IsPresent
                AccessTokens                                        = $this.AccessTokens
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
        $keyName = $null
        if ($this.RequiresPowerShellCore())
        {
            $null = $this.InvokeInPowerShellCore('Set')
            return
        }

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $currentInstance = $this.Get().ToHashtable()

        if ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
        {
            $createParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()

            $keys = $createParameters.Keys
            foreach ($key in $keys)
            {
                if ($null -ne $createParameters.$key -and $createParameters.$key.GetType().Name -like '*cimInstance*')
                {
                    $keyName = $key.Substring(0, 1).ToLower() + $key.Substring(1, $key.Length - 1)
                    $keyValue = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $createParameters.$key
                    $createParameters.Remove($key) | Out-Null
                    $createParameters.Add($keyName, $keyValue)
                }
            }

            # Before calling Set-CsTeamsComplianceRecordingPolicy, convert IDs (strings) to ComplianceRecordingApplication objects
            if ($createParameters.ContainsKey('ComplianceRecordingApplications') -and `
                    $null -ne $createParameters.ComplianceRecordingApplications)
            {
                # Fetch ComplianceRecordingApplication objects based on provided IDs
                $appObjects = @()
                foreach ($appId in $createParameters.ComplianceRecordingApplications)
                {
                    $appObj = Get-CsTeamsComplianceRecordingApplication -Identity $appId -ErrorAction Stop
                    if ($null -ne $appObj)
                    {
                        $appObjects += $appObj
                    }
                    else
                    {
                        throw "Compliance Recording Application with ID '$appId' not found."
                    }
                }
                # Replace string IDs with actual application objects
                $createParameters['ComplianceRecordingApplications'] = $appObjects
            }

            Write-Verbose -Message "Creating a Teams Compliance Recording Policy with Identity {$($this.Identity)}"
            New-CsTeamsComplianceRecordingPolicy @createParameters | Out-Null

            if ($this.ComplianceRecordingApplications.Count -gt 0)
            {
                foreach ($CurrentComplianceRecordingApplications in $this.ComplianceRecordingApplications)
                {
                    $Instance = $CurrentComplianceRecordingApplications.Id
                    $RequiredBeforeMeetingJoin = $CurrentComplianceRecordingApplications.RequiredBeforeMeetingJoin
                    $RequiredBeforeCallEstablishment = $CurrentComplianceRecordingApplications.RequiredBeforeCallEstablishment
                    $RequiredDuringMeeting = $CurrentComplianceRecordingApplications.RequiredDuringMeeting
                    $RequiredDuringCall = $CurrentComplianceRecordingApplications.RequiredDuringCall
                    $ConcurrentInvitationCount = $CurrentComplianceRecordingApplications.ConcurrentInvitationCount

                    $CsTeamsComplianceRecordingApplication = Get-CsTeamsComplianceRecordingApplication -Identity $CsTeamsComplianceRecordingApplicationIdentity -ErrorAction SilentlyContinue
                    if ($null -eq $CsTeamsComplianceRecordingApplication)
                    {
                        New-CsTeamsComplianceRecordingApplication `
                            -RequiredBeforeMeetingJoin $RequiredBeforeMeetingJoin `
                            -RequiredBeforeCallEstablishment $RequiredBeforeCallEstablishment `
                            -RequiredDuringMeeting $RequiredDuringMeeting `
                            -RequiredDuringCall $RequiredDuringCall `
                            -ConcurrentInvitationCount $ConcurrentInvitationCount `
                            -Parent $this.Identity -Id $Instance
                    }
                    else
                    {
                        Set-CsTeamsComplianceRecordingApplication `
                            -Identity $CsTeamsComplianceRecordingApplicationIdentity `
                            -RequiredBeforeMeetingJoin $RequiredBeforeMeetingJoin `
                            -RequiredBeforeCallEstablishment $RequiredBeforeCallEstablishment `
                            -RequiredDuringMeeting $RequiredDuringMeeting `
                            -RequiredDuringCall $RequiredDuringCall `
                            -ConcurrentInvitationCount $ConcurrentInvitationCount
                    }

                    if ($CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications.Count -gt 0)
                    {
                        Set-CsTeamsComplianceRecordingApplication `
                            -Identity "$($this.Identity) + '/' + $Instance" `
                            -ComplianceRecordingPairedApplications @(New-CsTeamsComplianceRecordingPairedApplication `
                                -Id $CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications)
                    }
                }
                $NewCsTeamsComplianceRecordingApplication = Get-CsTeamsComplianceRecordingApplication | Where-Object { $_.Identity -match $this.Identity }
                Set-CsTeamsComplianceRecordingPolicy -Identity $this.Identity -ComplianceRecordingApplications $NewCsTeamsComplianceRecordingApplication
            }

        }
        elseif ($this.Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Updating the Teams Compliance Recording Policy with Identity {$($this.Identity)}"
            $updateParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()

            $keys = $updateParameters.Keys
            foreach ($key in $keys)
            {
                if ($null -ne $updateParameters.$key -and $updateParameters.$key.GetType().Name -like '*cimInstance*')
                {
                    $keyValue = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $updateParameters.$key
                    $updateParameters.Remove($key) | Out-Null
                    $updateParameters.Add($keyName, $keyValue)
                }
            }

            # Before calling Set-CsTeamsComplianceRecordingPolicy, convert IDs (strings) to ComplianceRecordingApplication objects
            if ($updateParameters.ContainsKey('ComplianceRecordingApplications') -and `
                    $null -ne $updateParameters.ComplianceRecordingApplications)
            {
                # Fetch ComplianceRecordingApplication objects based on provided IDs
                $appObjects = @()
                foreach ($appId in $updateParameters.ComplianceRecordingApplications)
                {
                    $appObj = Get-CsTeamsComplianceRecordingApplication -Identity $appId -ErrorAction Stop
                    if ($null -ne $appObj)
                    {
                        $appObjects += $appObj
                    }
                    else
                    {
                        throw "Compliance Recording Application with ID '$appId' not found."
                    }
                }
                # Replace string IDs with actual application objects
                $updateParameters['ComplianceRecordingApplications'] = $appObjects
            }

            # Now call the cmdlet with corrected parameters
            Set-CsTeamsComplianceRecordingPolicy @updateParameters | Out-Null
            if ($this.ComplianceRecordingApplications.Count -gt 0)
            {
                foreach ($CurrentComplianceRecordingApplications in $this.ComplianceRecordingApplications)
                {
                    $Instance = $CurrentComplianceRecordingApplications.Id
                    $RequiredBeforeMeetingJoin = $CurrentComplianceRecordingApplications.RequiredBeforeMeetingJoin
                    $RequiredBeforeCallEstablishment = $CurrentComplianceRecordingApplications.RequiredBeforeCallEstablishment
                    $RequiredDuringMeeting = $CurrentComplianceRecordingApplications.RequiredDuringMeeting
                    $RequiredDuringCall = $CurrentComplianceRecordingApplications.RequiredDuringCall
                    $ConcurrentInvitationCount = $CurrentComplianceRecordingApplications.ConcurrentInvitationCount

                    $CsTeamsComplianceRecordingApplicationIdentity = $this.Identity + '/' + $Instance

                    $CsTeamsComplianceRecordingApplication = Get-CsTeamsComplianceRecordingApplication -Identity $CsTeamsComplianceRecordingApplicationIdentity -ErrorAction SilentlyContinue
                    if ($null -eq $CsTeamsComplianceRecordingApplication)
                    {
                        New-CsTeamsComplianceRecordingApplication `
                            -RequiredBeforeMeetingJoin $RequiredBeforeMeetingJoin `
                            -RequiredBeforeCallEstablishment $RequiredBeforeCallEstablishment `
                            -RequiredDuringMeeting $RequiredDuringMeeting `
                            -RequiredDuringCall $RequiredDuringCall `
                            -ConcurrentInvitationCount $ConcurrentInvitationCount `
                            -Parent $this.Identity -Id $Instance
                    }
                    else
                    {
                        Set-CsTeamsComplianceRecordingApplication `
                            -Identity $CsTeamsComplianceRecordingApplicationIdentity `
                            -RequiredBeforeMeetingJoin $RequiredBeforeMeetingJoin `
                            -RequiredBeforeCallEstablishment $RequiredBeforeCallEstablishment `
                            -RequiredDuringMeeting $RequiredDuringMeeting `
                            -RequiredDuringCall $RequiredDuringCall `
                            -ConcurrentInvitationCount $ConcurrentInvitationCount
                    }

                    if ($CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications.Count -gt 0)
                    {
                        [string]$CsTeamsComplianceRecordingApplicationIdentity = $this.Identity + '/' + $Instance
                        [string]$ComplianceRecordingPairedApplications = $CurrentComplianceRecordingApplications.ComplianceRecordingPairedApplications
                        Set-CsTeamsComplianceRecordingApplication -Identity $CsTeamsComplianceRecordingApplicationIdentity -ComplianceRecordingPairedApplications @(New-CsTeamsComplianceRecordingPairedApplication -Id $ComplianceRecordingPairedApplications)
                    }
                }
                $NewCsTeamsComplianceRecordingApplication = Get-CsTeamsComplianceRecordingApplication | Where-Object { $_.Identity -match $this.Identity }
                Set-CsTeamsComplianceRecordingPolicy -Identity $this.Identity -ComplianceRecordingApplications $NewCsTeamsComplianceRecordingApplication
            }
        }
        elseif ($this.Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
        {
            Write-Verbose -Message "Removing the Teams Compliance Recording Policy with Identity {$($this.Identity)}"
            Remove-CsTeamsComplianceRecordingPolicy -Identity $currentInstance.Identity
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

        $ConnectionMode = $this.Connect('MicrosoftTeams')

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Export')

        try
        {
            [array]$getValue = Get-CsTeamsComplianceRecordingPolicy -Filter $this.Filter -ErrorAction Stop

            $i = 1
            $dscContent = [System.Text.StringBuilder]::new()
            if ($getValue.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }
            foreach ($config in $getValue)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                $displayedKey = $config.Identity
                if (-not [String]::IsNullOrEmpty($config.displayName))
                {
                    $displayedKey = $config.displayName
                }
                Write-M365DSCHost -Message "    |---[$i/$($getValue.Count)] $displayedKey" -DeferWrite
                $params = @{
                    Identity              = $config.Identity
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

                $this.ExportedInstance = $config
                $Results = $this.GetForExport($Params)

                if ($null -ne $Results.ComplianceRecordingApplications)
                {
                    $complexMapping = @(
                        @{
                            Name            = 'ComplianceRecordingApplications'
                            CimInstanceName = 'TeamsComplianceRecordingApplication'
                            IsRequired      = $False
                        }
                    )
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.ComplianceRecordingApplications `
                        -CIMInstanceName 'TeamsComplianceRecordingApplication' `
                        -ComplexTypeMapping $complexMapping

                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.ComplianceRecordingApplications = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('ComplianceRecordingApplications') | Out-Null
                    }
                }

                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential `
                    -NoEscape @('ComplianceRecordingApplications')
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

    hidden [TeamsComplianceRecordingPolicy] AsResult([System.Object] $Values)
    {
        if ($Values -is [TeamsComplianceRecordingPolicy])
        {
            return $Values
        }

        $result = [TeamsComplianceRecordingPolicy]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}

class MSFT_TeamsComplianceRecordingApplication
{
    [DscProperty(Mandatory)]
    [System.ComponentModel.Description('A name that uniquely identifies the application instance of the policy-based recording application.')]
    [System.String] $Id

    [DscProperty()]
    [System.ComponentModel.Description('Determines the other policy-based recording applications to pair with this application to achieve application resiliency. Can only have one paired application.')]
    [System.String[]] $ComplianceRecordingPairedApplications

    [DscProperty()]
    [System.ComponentModel.Description('Indicates whether the policy-based recording application must be in the meeting before the user is allowed to join the meeting.')]
    [System.Nullable[System.Boolean]] $RequiredBeforeMeetingJoin

    [DscProperty()]
    [System.ComponentModel.Description('Indicates whether the policy-based recording application must be in the call before the call is allowed to establish.')]
    [System.Nullable[System.Boolean]] $RequiredBeforeCallEstablishment

    [DscProperty()]
    [System.ComponentModel.Description('Indicates whether the policy-based recording application must be in the meeting while the user is in the meeting.')]
    [System.Nullable[System.Boolean]] $RequiredDuringMeeting

    [DscProperty()]
    [System.ComponentModel.Description('Indicates whether the policy-based recording application must be in the call while the call is active.')]
    [System.Nullable[System.Boolean]] $RequiredDuringCall

    [DscProperty()]
    [System.ComponentModel.Description('Determines the number of invites to send out to the application instance of the policy-based recording application. Can be set to 1 or 2 only.')]
    [System.String] $ConcurrentInvitationCount
}
