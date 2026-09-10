using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class TeamsMeetingConfiguration : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('Only valid value is ''Yes''.')]
    [ValidateSet('Yes')]
    [System.String] $IsSingleInstance

    [DscProperty()]
    [System.ComponentModel.Description('URL to a logo image. This would be included in the meeting invite. Please ensure this URL is publicly accessible for invites that go beyond your federation boundaries.')]
    [System.String] $LogoURL

    [DscProperty()]
    [System.ComponentModel.Description('URL to a website containing legal information and meeting disclaimers. This would be included in the meeting invite. Please ensure this URL is publicly accessible for invites that go beyond your federation boundaries.')]
    [System.String] $LegalURL

    [DscProperty()]
    [System.ComponentModel.Description('URL to a website where users can obtain assistance on joining the meeting.This would be included in the meeting invite. Please ensure this URL is publicly accessible for invites that go beyond your federation boundaries.')]
    [System.String] $HelpURL

    [DscProperty()]
    [System.ComponentModel.Description('Text to be used on custom meeting invitations.')]
    [System.String] $CustomFooterText

    [DscProperty()]
    [System.ComponentModel.Description('Determines whether anonymous users are blocked from joining meetings in the tenant. Set this to TRUE to block anonymous users from joining. Set this to FALSE to allow anonymous users to join meetings.')]
    [System.Nullable[System.Boolean]] $DisableAnonymousJoin

    [DscProperty()]
    [System.ComponentModel.Description('Determines if anonymous users can interact with apps in meetings. Set to TRUE to disable App interaction. ')]
    [System.Nullable[System.Boolean]] $DisableAppInteractionForAnonymousUsers

    [DscProperty()]
    [System.ComponentModel.Description('Determines whether Quality of Service Marking for real-time media (audio, video, screen/app sharing) is enabled in the tenant. Set this to TRUE to enable and FALSE to disable.')]
    [System.Nullable[System.Boolean]] $EnableQoS

    [DscProperty()]
    [System.ComponentModel.Description('Determines if anonymous participants receive surveys to provide feedback about their meeting experience. Set to Disabled to disable anonymous meeting participants to receive surveys. Set to Enabled to allow anonymous meeting participants to receive surveys. Possible values: Enabled, Disabled')]
    [ValidateSet('Disabled', 'Enabled')]
    [System.String] $FeedbackSurveyForAnonymousUsers

    [DscProperty()]
    [System.ComponentModel.Description('When set to True, users within the Tenant will have their presenter role capabilities limited. When set to False, the presenter role capabilities will not be impacted and will remain as is.')]
    [System.Nullable[System.Boolean]] $LimitPresenterRolePermissions

    [DscProperty()]
    [System.ComponentModel.Description('Determines the starting port number for client audio. Minimum allowed value: 1024 Maximum allowed value: 65535 Default value: 50000.')]
    [ValidateRange(1024, 65535)]
    [System.Nullable[System.UInt32]] $ClientAudioPort

    [DscProperty()]
    [System.ComponentModel.Description('Determines the total number of ports available for client audio. Default value is 20.')]
    [System.Nullable[System.UInt32]] $ClientAudioPortRange

    [DscProperty()]
    [System.ComponentModel.Description('Determines the starting port number for client video. Minimum allowed value: 1024 Maximum allowed value: 65535 Default value: 50020.')]
    [ValidateRange(1024, 65535)]
    [System.Nullable[System.UInt32]] $ClientVideoPort

    [DscProperty()]
    [System.ComponentModel.Description('Determines the total number of ports available for client video. Default value is 20.')]
    [System.Nullable[System.UInt32]] $ClientVideoPortRange

    [DscProperty()]
    [System.ComponentModel.Description('Determines the starting port number for client screen sharing or application sharing. Minimum allowed value: 1024 Maximum allowed value: 65535 Default value: 50040.')]
    [ValidateRange(1024, 65535)]
    [System.Nullable[System.UInt32]] $ClientAppSharingPort

    [DscProperty()]
    [System.ComponentModel.Description('Determines whether custom media port and range selections need to be enforced. When set to True, clients will use the specified port range for media traffic. When set to False (the default value) for any available port (from port 1024 through port 65535) will be used to accommodate media traffic.')]
    [System.Nullable[System.Boolean]] $ClientMediaPortRangeEnabled

    [DscProperty()]
    [System.ComponentModel.Description('Determines the total number of ports available for client sharing or application sharing. Default value is 20.')]
    [System.Nullable[System.UInt32]] $ClientAppSharingPortRange

    [DscProperty()]
    [System.ComponentModel.Description('Credentials of the Teams Admin')]
    [System.Management.Automation.PSCredential] $Credential

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Azure Active Directory application to authenticate with.')]
    [System.String] $ApplicationId

    [DscProperty()]
    [System.ComponentModel.Description('Name of the Azure Active Directory tenant used for authentication. Format contoso.onmicrosoft.com')]
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

    [TeamsMeetingConfiguration] Get()
    {
        if ($this.RequiresPowerShellCore())
        {
            $remote = [TeamsMeetingConfiguration]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message 'Getting configuration of Teams Meeting'

        try
        {
            $null = $this.Connect('MicrosoftTeams')

            #Ensure the proper dependencies are installed in the current environment.
            Confirm-M365DSCDependencies

            #region Telemetry
            $this.AddTelemetry('Get')
            #endregion

            $config = Get-CsTeamsMeetingConfiguration -ErrorAction Stop

            return $this.AsResult(@{
                IsSingleInstance                        = 'Yes'
                LogoURL                                = $config.LogoURL
                LegalURL                               = $config.LegalURL
                HelpURL                                = $config.HelpURL
                CustomFooterText                       = $config.CustomFooterText
                DisableAnonymousJoin                   = $config.DisableAnonymousJoin
                EnableQoS                              = $config.EnableQoS
                ClientAudioPort                        = $config.ClientAudioPort
                ClientAudioPortRange                   = $config.ClientAudioPortRange
                ClientVideoPort                        = $config.ClientVideoPort
                ClientVideoPortRange                   = $config.ClientVideoPortRange
                ClientAppSharingPort                   = $config.ClientAppSharingPort
                ClientAppSharingPortRange              = $config.ClientAppSharingPortRange
                ClientMediaPortRangeEnabled            = $config.ClientMediaPortRangeEnabled
                DisableAppInteractionForAnonymousUsers = $config.DisableAppInteractionForAnonymousUsers
                FeedbackSurveyForAnonymousUsers        = $config.FeedbackSurveyForAnonymousUsers
                LimitPresenterRolePermissions          = $config.LimitPresenterRolePermissions
                Credential                             = $this.Credential
                ApplicationId                          = $this.ApplicationId
                TenantId                               = $this.TenantId
                CertificateThumbprint                  = $this.CertificateThumbprint
                CertificatePath                        = $this.CertificatePath
                CertificatePassword                    = $this.CertificatePassword
                ManagedIdentity                        = $this.ManagedIdentity.IsPresent
                AccessTokens                           = $this.AccessTokens
            })
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

        Write-Verbose -Message 'Setting configuration of Teams Meetings'

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $null = $this.Connect('MicrosoftTeams')

        $SetParams = Remove-M365DSCAuthenticationParameter -BoundParameters $this.GetBoundParameters()
        $SetParams.Add('Identity', 'Global')
        $SetParams.Remove('IsSingleInstance') | Out-Null
        Set-CsTeamsMeetingConfiguration @SetParams
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
            $dscContent = [System.Text.StringBuilder]::new()
            $params = @{
                IsSingleInstance      = 'Yes'
                Credential            = $this.Credential
                ApplicationId         = $this.ApplicationId
                TenantId              = $this.TenantId
                CertificateThumbprint = $this.CertificateThumbprint
                CertificatePath       = $this.CertificatePath
                CertificatePassword   = $this.CertificatePassword
                ManagedIdentity       = $this.ManagedIdentity.IsPresent
                AccessTokens          = $this.AccessTokens
            }
            $Results = $this.GetForExport($Params)
            if ($Results -is [System.Collections.Hashtable] -and $Results.Count -gt 1)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $this.GetResourceName() `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $this.GetModulePath() `
                    -Results $Results `
                    -Credential $this.Credential
                [void]$dscContent.Append($currentDSCBlock)
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName

                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiRedX -CommitWrite
            }

            return $dscContent.ToString()
        }
        catch
        {
            $this.LogError($_, 'Error during Export:')

            throw
        }
    }

    hidden [TeamsMeetingConfiguration] AsResult([System.Object] $Values)
    {
        if ($Values -is [TeamsMeetingConfiguration])
        {
            return $Values
        }

        $result = [TeamsMeetingConfiguration]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}
