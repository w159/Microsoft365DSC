function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        #region resource generator code
        [Parameter()]
        [ValidateSet('owner','member','unknownFutureValue')]
        [System.String]
        $AccessId,

        [Parameter()]
        [System.String]
        $GroupId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupDisplayName,

        [Parameter()]
        [System.String]
        $PrincipalId,

        [Parameter()]
        [System.String]
        $TargetScheduleId,

        [Parameter()]
        [ValidateSet('adminAssign','adminUpdate','adminRemove','selfActivate','selfDeactivate','adminExtend','adminRenew','selfExtend','selfRenew','unknownFutureValue')]
        [System.String]
        $Action,

        [Parameter()]
        [System.Boolean]
        $IsValidationOnly,

        [Parameter()]
        [System.String]
        $Justification,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScheduleInfo,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TicketInfo,

        [Parameter()]
        [System.String]
        $ApprovalId,

        [Parameter()]
        [System.String]
        $CompletedDateTime,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $CreatedBy,

        [Parameter()]
        [System.String]
        $CustomData,

        [Parameter()]
        [System.String]
        $Id,

        #endregion

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

    Write-Verbose -Message "Getting configuration of the Azure AD Group Eligibility Schedule Request with Id {$Id} and DisplayName {$DisplayName}"

    try
    {
        $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
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

        $getValue = $null
        #region resource generator code
        if (-not $PSBoundParameters.ContainsKey('Id') -or [string]::IsNullOrEmpty($Id)) {
            $Group = Get-MgGroup -Filter "displayName eq '$GroupDisplayName'" -ErrorAction SilentlyContinue
            if([string]::IsNullOrEmpty($GroupId)){
                Write-Verbose -Message "Could not find an Azure AD Group with DisplayName {$GroupDisplayName}."
                return $nullResult
            }
            elseif($Group.Length -gt 1){
                Write-Verbose -Message "Found multiple Azure AD Groups with DisplayName {$GroupDisplayName}."
                return $nullResult
            }
            else{
                $getValue = Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -Filter "groupId eq '$($Group.Id)'" -ErrorAction SilentlyContinue
            }
        }
        else{
            $getValue = Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -PrivilegedAccessGroupEligibilityScheduleRequestId $Id  -ErrorAction SilentlyContinue
        }
        #endregion
        if ($null -eq $getValue)
        {
            Write-Verbose -Message "Could not find an Azure AD Group Eligibility Schedule Request with Id {$Id}."
            return $nullResult
        }
        $Id = $getValue.Id
        Write-Verbose -Message "An Azure AD Group Eligibility Schedule Request with Id {$Id} for Group {$($group.DisplayName)} was found"

        #region resource generator code
        $complexScheduleInfo = @{}
        $complexExpiration = @{}
        $complexExpiration.Add('Duration', $getValue.additionalProperties.scheduleInfo.expiration.duration)
        if ($null -ne $getValue.additionalProperties.scheduleInfo.expiration.endDateTime)
        {
            $complexExpiration.Add('EndDateTime', ([DateTimeOffset]$getValue.additionalProperties.scheduleInfo.expiration.endDateTime).ToString(''))
        }
        if ($null -ne $getValue.additionalProperties.scheduleInfo.expiration.type)
        {
            $complexExpiration.Add('Type', $getValue.additionalProperties.scheduleInfo.expiration.type.ToString())
        }
        if ($complexExpiration.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexExpiration = $null
        }
        $complexScheduleInfo.Add('Expiration',$complexExpiration)
        $complexRecurrence = @{}
        $complexPattern = @{}
        $complexPattern.Add('DayOfMonth', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.dayOfMonth)
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.pattern.daysOfWeek)
        {
            $complexPattern.Add('DaysOfWeek', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.daysOfWeek.ToString())
        }
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.pattern.firstDayOfWeek)
        {
            $complexPattern.Add('FirstDayOfWeek', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.firstDayOfWeek.ToString())
        }
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.pattern.index)
        {
            $complexPattern.Add('Index', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.index.ToString())
        }
        $complexPattern.Add('Interval', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.interval)
        $complexPattern.Add('Month', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.month)
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.pattern.type)
        {
            $complexPattern.Add('Type', $getValue.additionalProperties.scheduleInfo.recurrence.pattern.type.ToString())
        }
        if ($complexPattern.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexPattern = $null
        }
        $complexRecurrence.Add('Pattern',$complexPattern)
        $complexRange = @{}
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.range.endDate)
        {
            $complexRange.Add('EndDate', ([DateTime]$getValue.additionalProperties.scheduleInfo.recurrence.range.endDate).ToString(''))
        }
        $complexRange.Add('NumberOfOccurrences', $getValue.additionalProperties.scheduleInfo.recurrence.range.numberOfOccurrences)
        $complexRange.Add('RecurrenceTimeZone', $getValue.additionalProperties.scheduleInfo.recurrence.range.recurrenceTimeZone)
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.range.startDate)
        {
            $complexRange.Add('StartDate', ([DateTime]$getValue.additionalProperties.scheduleInfo.recurrence.range.startDate).ToString(''))
        }
        if ($null -ne $getValue.additionalProperties.scheduleInfo.recurrence.range.type)
        {
            $complexRange.Add('Type', $getValue.additionalProperties.scheduleInfo.recurrence.range.type.ToString())
        }
        if ($complexRange.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexRange = $null
        }
        $complexRecurrence.Add('Range',$complexRange)
        if ($complexRecurrence.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexRecurrence = $null
        }
        $complexScheduleInfo.Add('Recurrence',$complexRecurrence)
        if ($null -ne $getValue.AdditionalProperties.scheduleInfo.startDateTime)
        {
            $complexScheduleInfo.Add('StartDateTime', ([DateTimeOffset]$getValue.AdditionalProperties.scheduleInfo.startDateTime).ToString('o'))
        }
        if ($complexScheduleInfo.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexScheduleInfo = $null
        }

        $complexTicketInfo = @{}
        $complexTicketInfo.Add('TicketNumber', $getValue.AdditionalProperties.ticketInfo.ticketNumber)
        $complexTicketInfo.Add('TicketSystem', $getValue.AdditionalProperties.ticketInfo.ticketSystem)
        if ($complexTicketInfo.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexTicketInfo = $null
        }

        $complexCreatedBy = @{}
        $complexApplication = @{}
        $complexApplication.Add('id', $getValue.createdBy.application.id)
        $complexApplication.Add('displayName', $getValue.createdBy.application.displayName)
        if ($complexApplication.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexApplication = $null
        }
        $complexCreatedBy.Add('Application',$complexApplication)
        $complexDevice = @{}
        $complexDevice.Add('id', $getValue.createdBy.device.id)
        $complexDevice.Add('displayName', $getValue.createdBy.device.displayName)
        if ($complexDevice.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexDevice = $null
        }
        $complexCreatedBy.Add('Device',$complexDevice)
        $complexUser = @{}
        $complexUser.Add('id', $getValue.createdBy.user.id)
        $complexUser.Add('displayName', $getValue.createdBy.user.displayName)
        if ($complexUser.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexUser = $null
        }
        $complexCreatedBy.Add('User',$complexUser)
        $complexConversation = @{}
        if ($null -ne $getValue.createdBy.conversation.conversationIdentityType)
        {
            $complexConversation.Add('ConversationIdentityType', $getValue.createdBy.conversation.conversationIdentityType.ToString())
        }
        $complexConversation.Add('DisplayName', $getValue.createdBy.conversation.displayName)
        $complexConversation.Add('Id', $getValue.createdBy.conversation.id)
        $complexConversation.Add('AzureCommunicationServicesResourceId', $getValue.createdBy.conversation.azureCommunicationServicesResourceId)
        $complexConversation.Add('ApplicationType', $getValue.createdBy.conversation.applicationType)
        $complexConversation.Add('Hidden', $getValue.createdBy.conversation.hidden)
        $complexConversation.Add('TenantId', $getValue.createdBy.conversation.tenantId)
        $complexConversation.Add('Email', $getValue.createdBy.conversation.email)
        if ($null -ne $getValue.createdBy.conversation.initiatorType)
        {
            $complexConversation.Add('InitiatorType', $getValue.createdBy.conversation.initiatorType.ToString())
        }
        $complexDetails = @{}
        if ($complexDetails.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexDetails = $null
        }
        $complexConversation.Add('Details',$complexDetails)
        $complexConversation.Add('IdentityType', $getValue.createdBy.conversation.identityType)
        $complexConversation.Add('AppId', $getValue.createdBy.conversation.appId)
        $complexConversation.Add('LoginName', $getValue.createdBy.conversation.loginName)
        if ($null -ne $getValue.createdBy.conversation.applicationIdentityType)
        {
            $complexConversation.Add('ApplicationIdentityType', $getValue.createdBy.conversation.applicationIdentityType.ToString())
        }
        if ($null -ne $getValue.createdBy.conversation.userIdentityType)
        {
            $complexConversation.Add('UserIdentityType', $getValue.createdBy.conversation.userIdentityType.ToString())
        }
        $complexConversation.Add('IpAddress', $getValue.createdBy.conversation.ipAddress)
        $complexConversation.Add('UserPrincipalName', $getValue.createdBy.conversation.userPrincipalName)
        if ($null -ne $getValue.createdBy.conversation.'@odata.type')
        {
            $complexConversation.Add('odataType', $getValue.createdBy.conversation.'@odata.type'.ToString())
        }
        if ($complexConversation.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexConversation = $null
        }
        $complexCreatedBy.Add('Conversation',$complexConversation)
        $complexApplicationInstance = @{}
        $complexApplicationInstance.Add('Type', $getValue.createdBy.applicationInstance.type)
        if ($complexApplicationInstance.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexApplicationInstance = $null
        }
        $complexCreatedBy.Add('ApplicationInstance',$complexApplicationInstance)
        $complexAssertedIdentity = @{}
        $complexAssertedIdentity.Add('Type', $getValue.createdBy.assertedIdentity.type)
        if ($complexAssertedIdentity.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexAssertedIdentity = $null
        }
        $complexCreatedBy.Add('AssertedIdentity',$complexAssertedIdentity)
        $complexAzureCommunicationServicesUser = @{}
        $complexAzureCommunicationServicesUser.Add('Type', $getValue.createdBy.azureCommunicationServicesUser.type)
        if ($complexAzureCommunicationServicesUser.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexAzureCommunicationServicesUser = $null
        }
        $complexCreatedBy.Add('AzureCommunicationServicesUser',$complexAzureCommunicationServicesUser)
        $complexEncrypted = @{}
        $complexEncrypted.Add('Type', $getValue.createdBy.encrypted.type)
        if ($complexEncrypted.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexEncrypted = $null
        }
        $complexCreatedBy.Add('Encrypted',$complexEncrypted)
        if ($null -ne $getValue.CreatedBy.endpointType)
        {
            $complexCreatedBy.Add('EndpointType', $getValue.CreatedBy.endpointType.ToString())
        }
        $complexGuest = @{}
        $complexGuest.Add('Type', $getValue.createdBy.guest.type)
        if ($complexGuest.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexGuest = $null
        }
        $complexCreatedBy.Add('Guest',$complexGuest)
        $complexOnPremises = @{}
        $complexOnPremises.Add('Type', $getValue.createdBy.onPremises.type)
        if ($complexOnPremises.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexOnPremises = $null
        }
        $complexCreatedBy.Add('OnPremises',$complexOnPremises)
        $complexPhone = @{}
        $complexPhone.Add('Type', $getValue.createdBy.phone.type)
        if ($complexPhone.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexPhone = $null
        }
        $complexCreatedBy.Add('Phone',$complexPhone)
        $complexGroup = @{}
        $complexGroup.Add('Type', $getValue.createdBy.group.type)
        if ($complexGroup.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexGroup = $null
        }
        $complexCreatedBy.Add('Group',$complexGroup)
        $complexSiteGroup = @{}
        $complexSiteGroup.Add('LoginName', $getValue.createdBy.siteGroup.loginName)
        $complexSiteGroup.Add('DisplayName', $getValue.createdBy.siteGroup.displayName)
        $complexSiteGroup.Add('Id', $getValue.createdBy.siteGroup.id)
        $complexSiteGroup.Add('AzureCommunicationServicesResourceId', $getValue.createdBy.siteGroup.azureCommunicationServicesResourceId)
        $complexSiteGroup.Add('ApplicationType', $getValue.createdBy.siteGroup.applicationType)
        $complexSiteGroup.Add('Hidden', $getValue.createdBy.siteGroup.hidden)
        $complexSiteGroup.Add('TenantId', $getValue.createdBy.siteGroup.tenantId)
        $complexSiteGroup.Add('Email', $getValue.createdBy.siteGroup.email)
        if ($null -ne $getValue.createdBy.siteGroup.initiatorType)
        {
            $complexSiteGroup.Add('InitiatorType', $getValue.createdBy.siteGroup.initiatorType.ToString())
        }
        $complexDetails = @{}
        if ($complexDetails.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexDetails = $null
        }
        $complexSiteGroup.Add('Details',$complexDetails)
        $complexSiteGroup.Add('IdentityType', $getValue.createdBy.siteGroup.identityType)
        $complexSiteGroup.Add('AppId', $getValue.createdBy.siteGroup.appId)
        if ($null -ne $getValue.createdBy.siteGroup.applicationIdentityType)
        {
            $complexSiteGroup.Add('ApplicationIdentityType', $getValue.createdBy.siteGroup.applicationIdentityType.ToString())
        }
        if ($null -ne $getValue.createdBy.siteGroup.conversationIdentityType)
        {
            $complexSiteGroup.Add('ConversationIdentityType', $getValue.createdBy.siteGroup.conversationIdentityType.ToString())
        }
        if ($null -ne $getValue.createdBy.siteGroup.userIdentityType)
        {
            $complexSiteGroup.Add('UserIdentityType', $getValue.createdBy.siteGroup.userIdentityType.ToString())
        }
        $complexSiteGroup.Add('IpAddress', $getValue.createdBy.siteGroup.ipAddress)
        $complexSiteGroup.Add('UserPrincipalName', $getValue.createdBy.siteGroup.userPrincipalName)
        if ($null -ne $getValue.createdBy.siteGroup.'@odata.type')
        {
            $complexSiteGroup.Add('odataType', $getValue.createdBy.siteGroup.'@odata.type'.ToString())
        }
        if ($complexSiteGroup.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexSiteGroup = $null
        }
        $complexCreatedBy.Add('SiteGroup',$complexSiteGroup)
        $complexSiteUser = @{}
        $complexSiteUser.Add('LoginName', $getValue.createdBy.siteUser.loginName)
        $complexSiteUser.Add('DisplayName', $getValue.createdBy.siteUser.displayName)
        $complexSiteUser.Add('Id', $getValue.createdBy.siteUser.id)
        $complexSiteUser.Add('AzureCommunicationServicesResourceId', $getValue.createdBy.siteUser.azureCommunicationServicesResourceId)
        $complexSiteUser.Add('ApplicationType', $getValue.createdBy.siteUser.applicationType)
        $complexSiteUser.Add('Hidden', $getValue.createdBy.siteUser.hidden)
        $complexSiteUser.Add('TenantId', $getValue.createdBy.siteUser.tenantId)
        $complexSiteUser.Add('Email', $getValue.createdBy.siteUser.email)
        if ($null -ne $getValue.createdBy.siteUser.initiatorType)
        {
            $complexSiteUser.Add('InitiatorType', $getValue.createdBy.siteUser.initiatorType.ToString())
        }
        $complexDetails = @{}
        if ($complexDetails.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexDetails = $null
        }
        $complexSiteUser.Add('Details',$complexDetails)
        $complexSiteUser.Add('IdentityType', $getValue.createdBy.siteUser.identityType)
        $complexSiteUser.Add('AppId', $getValue.createdBy.siteUser.appId)
        if ($null -ne $getValue.createdBy.siteUser.applicationIdentityType)
        {
            $complexSiteUser.Add('ApplicationIdentityType', $getValue.createdBy.siteUser.applicationIdentityType.ToString())
        }
        if ($null -ne $getValue.createdBy.siteUser.conversationIdentityType)
        {
            $complexSiteUser.Add('ConversationIdentityType', $getValue.createdBy.siteUser.conversationIdentityType.ToString())
        }
        if ($null -ne $getValue.createdBy.siteUser.userIdentityType)
        {
            $complexSiteUser.Add('UserIdentityType', $getValue.createdBy.siteUser.userIdentityType.ToString())
        }
        $complexSiteUser.Add('IpAddress', $getValue.createdBy.siteUser.ipAddress)
        $complexSiteUser.Add('UserPrincipalName', $getValue.createdBy.siteUser.userPrincipalName)
        if ($null -ne $getValue.createdBy.siteUser.'@odata.type')
        {
            $complexSiteUser.Add('odataType', $getValue.createdBy.siteUser.'@odata.type'.ToString())
        }
        if ($complexSiteUser.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexSiteUser = $null
        }
        $complexCreatedBy.Add('SiteUser',$complexSiteUser)
        if ($null -ne $getValue.CreatedBy.'@odata.type')
        {
            $complexCreatedBy.Add('odataType', $getValue.CreatedBy.'@odata.type'.ToString())
        }
        if ($complexCreatedBy.values.Where({$null -ne $_}).Count -eq 0)
        {
            $complexCreatedBy = $null
        }
        #endregion

        #region resource generator code
        $enumAccessId = $null
        if ($null -ne $getValue.AdditionalProperties.accessId)
        {
            $enumAccessId = $getValue.AdditionalProperties.accessId.ToString()
        }

        $enumAction = $null
        if ($null -ne $getValue.AdditionalProperties.action)
        {
            $enumAction = $getValue.AdditionalProperties.action.ToString()
        }
        #endregion

        #region resource generator code
        $dateCompletedDateTime = $null
        if ($null -ne $getValue.CompletedDateTime)
        {
            $dateCompletedDateTime = ([DateTimeOffset]$getValue.CompletedDateTime).ToString('o')
        }
        #endregion

        $results = @{
            #region resource generator code
            AccessId              = $enumAccessId
            GroupId               = $getValue.groupId
            GroupDisplayName      = $group.DisplayName
            PrincipalId           = $getValue.principalId
            TargetScheduleId      = $getValue.targetScheduleId
            Action                = $enumAction
            IsValidationOnly      = $getValue.isValidationOnly
            Justification         = $getValue.justification
            ScheduleInfo          = $complexScheduleInfo
            TicketInfo            = $complexTicketInfo
            ApprovalId            = $getValue.ApprovalId
            CompletedDateTime     = $dateCompletedDateTime
            CreatedBy             = $complexCreatedBy
            CustomData            = $getValue.CustomData
            Id                    = $getValue.Id
            Ensure                = 'Present'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            ManagedIdentity       = $ManagedIdentity.IsPresent
            #endregion
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
        #region resource generator code
        [Parameter()]
        [ValidateSet('owner','member','unknownFutureValue')]
        [System.String]
        $AccessId,

        [Parameter()]
        [System.String]
        $GroupId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupDisplayName,

        [Parameter()]
        [System.String]
        $PrincipalId,

        [Parameter()]
        [System.String]
        $TargetScheduleId,

        [Parameter()]
        [ValidateSet('adminAssign','adminUpdate','adminRemove','selfActivate','selfDeactivate','adminExtend','adminRenew','selfExtend','selfRenew','unknownFutureValue')]
        [System.String]
        $Action,

        [Parameter()]
        [System.Boolean]
        $IsValidationOnly,

        [Parameter()]
        [System.String]
        $Justification,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScheduleInfo,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TicketInfo,

        [Parameter()]
        [System.String]
        $ApprovalId,

        [Parameter()]
        [System.String]
        $CompletedDateTime,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $CreatedBy,

        [Parameter()]
        [System.String]
        $CustomData,

        [Parameter()]
        [System.String]
        $Id,

        #endregion
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

    Write-Verbose -Message "Setting configuration of the Azure AD Group Eligibility Schedule Request with Id {$Id} and DisplayName {$DisplayName}"

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

    $BoundParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $PSBoundParameters


    if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating an Azure AD Group Eligibility Schedule Request with DisplayName {$DisplayName}"

        $createParameters = ([Hashtable]$BoundParameters).Clone()
        $createParameters = Rename-M365DSCCimInstanceParameter -Properties $createParameters
        $createParameters.Remove('Id') | Out-Null

        $keys = (([Hashtable]$createParameters).Clone()).Keys
        foreach ($key in $keys)
        {
            if ($null -ne $createParameters.$key -and $createParameters.$key.GetType().Name -like '*CimInstance*')
            {
                $createParameters.$key = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $createParameters.$key
            }
        }
        #region resource generator code
        $createParameters.Add("@odata.type", "#microsoft.graph.PrivilegedAccessGroupEligibilityScheduleRequest")
        $policy = New-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -BodyParameter $createParameters
        #endregion
    }
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating the Azure AD Group Eligibility Schedule Request with Id {$($currentInstance.Id)}"

        $updateParameters = ([Hashtable]$BoundParameters).Clone()
        $updateParameters = Rename-M365DSCCimInstanceParameter -Properties $updateParameters

        $updateParameters.Remove('Id') | Out-Null

        $keys = (([Hashtable]$updateParameters).Clone()).Keys
        foreach ($key in $keys)
        {
            if ($null -ne $pdateParameters.$key -and $updateParameters.$key.GetType().Name -like '*CimInstance*')
            {
                $updateParameters.$key = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $updateParameters.PrivilegedAccessGroupEligibilityScheduleRequestId
            }
        }

        #region resource generator code
        $UpdateParameters.Add("@odata.type", "#microsoft.graph.PrivilegedAccessGroupEligibilityScheduleRequest")
        Update-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest `
            -PrivilegedAccessGroupEligibilityScheduleRequestId $currentInstance.Id `
            -BodyParameter $UpdateParameters
        #endregion
    }
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing the Azure AD Group Eligibility Schedule Request with Id {$($currentInstance.Id)}"
        #region resource generator code
        Remove-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest -PrivilegedAccessGroupEligibilityScheduleRequestId $currentInstance.Id
        #endregion
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        #region resource generator code
        [Parameter()]
        [ValidateSet('owner','member','unknownFutureValue')]
        [System.String]
        $AccessId,

        [Parameter()]
        [System.String]
        $GroupId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupDisplayName,

        [Parameter()]
        [System.String]
        $PrincipalId,

        [Parameter()]
        [System.String]
        $TargetScheduleId,

        [Parameter()]
        [ValidateSet('adminAssign','adminUpdate','adminRemove','selfActivate','selfDeactivate','adminExtend','adminRenew','selfExtend','selfRenew','unknownFutureValue')]
        [System.String]
        $Action,

        [Parameter()]
        [System.Boolean]
        $IsValidationOnly,

        [Parameter()]
        [System.String]
        $Justification,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $ScheduleInfo,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TicketInfo,

        [Parameter()]
        [System.String]
        $ApprovalId,

        [Parameter()]
        [System.String]
        $CompletedDateTime,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $CreatedBy,

        [Parameter()]
        [System.String]
        $CustomData,

        [Parameter()]
        [System.String]
        $Id,

        #endregion

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

    Write-Verbose -Message "Testing configuration of the Azure AD Group Eligibility Schedule Request with Id {$Id} and DisplayName {$DisplayName}"

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
        [System.String]
        $Filter,

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

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
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
        #region resource generator code
        $groups = Get-MgGroup -Filter "MailEnabled eq false and NOT(groupTypes/any(x:x eq 'DynamicMembership'))" -Property "displayname,Id" -CountVariable CountVar  -ConsistencyLevel eventual -ErrorAction Stop
        foreach ($group in $groups)
        {
            $getValue = Get-MgIdentityGovernancePrivilegedAccessGroupEligibilityScheduleRequest `
                -Filter "groupId eq '$($group.Id)'" `
                -All `
                -ErrorAction Stop
            if($null -eq $getValue)
            {
                continue
            }
            #endregion

            $i = 1
            $dscContent = ''
            if ($getValue.Length -eq 0)
            {
                Write-Host $Global:M365DSCEmojiGreenCheckMark
            }
            else
            {
                Write-Host "`r`n" -NoNewline
            }
            foreach ($config in $getValue)
            {
                $displayedKey = $config.Id + " / " + $group.DisplayName
                Write-Host "    |---[$i/$($getValue.Count)] $displayedKey" -NoNewline
                $params = @{
                    Id                    = $config.Id
                    GroupDisplayName      = $group.DisplayName
                    Ensure                = 'Present'
                    Credential            = $Credential
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    ApplicationSecret     = $ApplicationSecret
                    CertificateThumbprint = $CertificateThumbprint
                    ManagedIdentity       = $ManagedIdentity.IsPresent
                    AccessTokens          = $AccessTokens
                }

                $Results = Get-TargetResource @Params
                $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                    -Results $Results
                if ($null -ne $Results.ScheduleInfo)
                {
                    $complexMapping = @(
                        @{
                            Name = 'ScheduleInfo'
                            CimInstanceName = 'MicrosoftGraphRequestSchedule'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Expiration'
                            CimInstanceName = 'MicrosoftGraphExpirationPattern'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Recurrence'
                            CimInstanceName = 'MicrosoftGraphPatternedRecurrence1'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Pattern'
                            CimInstanceName = 'MicrosoftGraphRecurrencePattern1'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Range'
                            CimInstanceName = 'MicrosoftGraphRecurrenceRange1'
                            IsRequired = $False
                        }
                    )
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.ScheduleInfo `
                        -CIMInstanceName 'MicrosoftGraphrequestSchedule' `
                        -ComplexTypeMapping $complexMapping

                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.ScheduleInfo = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('ScheduleInfo') | Out-Null
                    }
                }
                if ($null -ne $Results.TicketInfo)
                {
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.TicketInfo `
                        -CIMInstanceName 'MicrosoftGraphticketInfo'
                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.TicketInfo = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('TicketInfo') | Out-Null
                    }
                }
                if ($null -ne $Results.CreatedBy)
                {
                    $complexMapping = @(
                        @{
                            Name = 'CreatedBy'
                            CimInstanceName = 'MicrosoftGraphIdentitySet'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Application'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Device'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'User'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Conversation'
                            CimInstanceName = 'MicrosoftGraphTeamworkConversationIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Details'
                            CimInstanceName = 'MicrosoftGraphDetailsInfo'
                            IsRequired = $False
                        }
                        @{
                            Name = 'ApplicationInstance'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'AssertedIdentity'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'AzureCommunicationServicesUser'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Encrypted'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Guest'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'OnPremises'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Phone'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Group'
                            CimInstanceName = 'MicrosoftGraphIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'SiteGroup'
                            CimInstanceName = 'MicrosoftGraphSharePointIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Details'
                            CimInstanceName = 'MicrosoftGraphDetailsInfo'
                            IsRequired = $False
                        }
                        @{
                            Name = 'SiteUser'
                            CimInstanceName = 'MicrosoftGraphSharePointIdentity'
                            IsRequired = $False
                        }
                        @{
                            Name = 'Details'
                            CimInstanceName = 'MicrosoftGraphDetailsInfo'
                            IsRequired = $False
                        }
                    )
                    $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                        -ComplexObject $Results.CreatedBy `
                        -CIMInstanceName 'MicrosoftGraphidentitySet' `
                        -ComplexTypeMapping $complexMapping

                    if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                    {
                        $Results.CreatedBy = $complexTypeStringResult
                    }
                    else
                    {
                        $Results.Remove('CreatedBy') | Out-Null
                    }
                }

                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $PSScriptRoot `
                    -Results $Results `
                    -Credential $Credential
                if ($Results.ScheduleInfo)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "ScheduleInfo" -IsCIMArray:$False
                }
                if ($Results.TicketInfo)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "TicketInfo" -IsCIMArray:$False
                }
                if ($Results.CreatedBy)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "CreatedBy" -IsCIMArray:$False
                }

                $dscContent += $currentDSCBlock
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
                $i++
                Write-Host $Global:M365DSCEmojiGreenCheckMark
            }
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
