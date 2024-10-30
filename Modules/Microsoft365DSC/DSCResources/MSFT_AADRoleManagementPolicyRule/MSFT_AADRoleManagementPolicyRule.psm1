function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $id,

        [Parameter(Mandatory = $true)]
        [System.String]
        $roleDisplayName,

        [Parameter()]
        [System.String]
        $ruleType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $expirationRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $notificationRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $enablementRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $approvalRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $authenticationContextRule,

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
        $role = Get-MgBetaRoleManagementDirectoryRoleDefinition -All -Filter "DisplayName eq '$($roleDisplayName)'"
        if($null -eq $role)
        {
            Write-Verbose -Message "Could not find an Azure AD Role Management Definition with DisplayName {$roleDisplayName}"
            return $nullResult
        }

        $assignment = Get-MgBetaPolicyRoleManagementPolicyAssignment -Filter "RoleDefinitionId eq '$($role.Id)' and scopeId eq '/' and scopeType eq 'DirectoryRole'"
        if($null -eq $assignment)
        {
            Write-Verbose -Message "Could not find an Azure AD Role Management Policy Assignment with RoleDefinitionId {$role.Id}"
            return $nullResult
        }

        $policyId = $assignment.PolicyId

        $getValue = Get-MgBetaPolicyRoleManagementPolicyRule `
            -UnifiedRoleManagementPolicyId $policyId `
            -UnifiedRoleManagementPolicyRuleId $id  -ErrorAction SilentlyContinue

        if ($null -eq $getValue)
        {
            Write-Verbose -Message "Could not find an Azure AD Role Management Policy Rule with Id {$id} and PolicyId {$policyId}."
            return $nullResult
        }

        Write-Verbose -Message "An Azure AD Role Management Policy Rule with Id {$id} and PolicyId {$policyId} was found"
        $rule = Get-M365DSCRoleManagementPolicyRuleObject -Rule $getValue 

        $results = @{
            Ensure                = 'Present'
            id                    = $id
            roleDisplayName       = $roleDisplayName
            expirationRule        = $rule.expirationRule   
            notificationRule      = $rule.notificationRule
            enablementRule        = $rule.enablementRule
            approvalRule          = $rule.approvalRule
            authenticationContextRule = $rule.authenticationContextRule
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            ManagedIdentity       = $ManagedIdentity.IsPresent
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
        [Parameter(Mandatory = $true)]
        [System.String]
        $id,

        [Parameter(Mandatory = $true)]
        [System.String]
        $roleDisplayName,

        [Parameter()]
        [System.String]
        $ruleType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $expirationRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $notificationRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $enablementRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $approvalRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $authenticationContextRule,

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

    $currentInstance = Get-TargetResource @PSBoundParameters

    $BoundParameters = Remove-M365DSCAuthenticationParameter -BoundParameters $PSBoundParameters


    if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating an Azure AD Role Management Policy Rule with DisplayName {$DisplayName}"

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
        $createParameters.Add("@odata.type", "#microsoft.graph.unifiedRoleManagementPolicyApprovalRule")
        $policy = New-MgBetaPolicyRoleManagementPolicyRule  `
            -UnifiedRoleManagementPolicyId $UnifiedRoleManagementPolicyId `
            -BodyParameter $createParameters
        #endregion
    }
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating the Azure AD Role Management Policy Rule with Id {$($currentInstance.Id)}"

        $updateParameters = ([Hashtable]$BoundParameters).Clone()
        $updateParameters = Rename-M365DSCCimInstanceParameter -Properties $updateParameters

        $updateParameters.Remove('Id') | Out-Null

        $keys = (([Hashtable]$updateParameters).Clone()).Keys
        foreach ($key in $keys)
        {
            if ($null -ne $pdateParameters.$key -and $updateParameters.$key.GetType().Name -like '*CimInstance*')
            {
                $updateParameters.$key = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $updateParameters.UnifiedRoleManagementPolicyRuleId
            }
        }

        #region resource generator code
        $UpdateParameters.Add("@odata.type", "#microsoft.graph.unifiedRoleManagementPolicyApprovalRule")
        Update-MgBetaPolicyRoleManagementPolicyRule `
            -UnifiedRoleManagementPolicyId $UnifiedRoleManagementPolicyId `
            -UnifiedRoleManagementPolicyRuleId $currentInstance.Id `
            -BodyParameter $UpdateParameters
        #endregion
    }
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing the Azure AD Role Management Policy Rule with Id {$($currentInstance.Id)}"
        #region resource generator code
        Remove-MgBetaPolicyRoleManagementPolicyRule  `
            -UnifiedRoleManagementPolicyId $UnifiedRoleManagementPolicyId `
            -UnifiedRoleManagementPolicyRuleId $UnifiedRoleManagementPolicyRuleId
        #endregion
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $id,

        [Parameter(Mandatory = $true)]
        [System.String]
        $roleDisplayName,

        [Parameter()]
        [System.String]
        $ruleType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $expirationRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $notificationRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $enablementRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $approvalRule,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $authenticationContextRule,

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

    Write-Verbose -Message "Testing configuration of the Azure AD Role Management Policy Rule with Id {$Id} and DisplayName {$DisplayName}"

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
        [array]$getValue = Get-MgBetaPolicyRoleManagementPolicyRule `
            -Filter $Filter `
            -All `
            -ErrorAction Stop | Where-Object `
            -FilterScript {
                $_.AdditionalProperties.'@odata.type' -eq '#microsoft.graph.unifiedRoleManagementPolicyApprovalRule'
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
            $displayedKey = $config.Id
            if (-not [String]::IsNullOrEmpty($config.displayName))
            {
                $displayedKey = $config.displayName
            }
            elseif (-not [string]::IsNullOrEmpty($config.name))
            {
                $displayedKey = $config.name
            }
            Write-Host "    |---[$i/$($getValue.Count)] $displayedKey" -NoNewline
            $params = @{
                Id = $config.Id
                DisplayName           =  $config.DisplayName
                Ensure = 'Present'
                Credential = $Credential
                ApplicationId = $ApplicationId
                TenantId = $TenantId
                ApplicationSecret = $ApplicationSecret
                CertificateThumbprint = $CertificateThumbprint
                ManagedIdentity = $ManagedIdentity.IsPresent
                AccessTokens = $AccessTokens
            }

            $Results = Get-TargetResource @Params
            $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                -Results $Results
            if ($null -ne $Results.Setting)
            {
                $complexMapping = @(
                    @{
                        Name = 'Setting'
                        CimInstanceName = 'MicrosoftGraphApprovalSettings1'
                        IsRequired = $False
                    }
                    @{
                        Name = 'ApprovalStages'
                        CimInstanceName = 'MicrosoftGraphApprovalStage'
                        IsRequired = $True
                    }
                    @{
                        Name = 'EscalationApprovers'
                        CimInstanceName = 'MicrosoftGraphUserSet1'
                        IsRequired = $False
                    }
                    @{
                        Name = 'PrimaryApprovers'
                        CimInstanceName = 'MicrosoftGraphUserSet1'
                        IsRequired = $False
                    }
                )
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                    -ComplexObject $Results.Setting `
                    -CIMInstanceName 'MicrosoftGraphapprovalSettings1' `
                    -ComplexTypeMapping $complexMapping

                if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                {
                    $Results.Setting = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('Setting') | Out-Null
                }
            }
            if ($null -ne $Results.Target)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString `
                    -ComplexObject $Results.Target `
                    -CIMInstanceName 'MicrosoftGraphunifiedRoleManagementPolicyRuleTarget'
                if (-not [String]::IsNullOrWhiteSpace($complexTypeStringResult))
                {
                    $Results.Target = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('Target') | Out-Null
                }
            }

            $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -Credential $Credential
            if ($Results.Setting)
            {
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "Setting" -IsCIMArray:$False
            }
            if ($Results.Target)
            {
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "Target" -IsCIMArray:$False
            }

            $dscContent += $currentDSCBlock
            Save-M365DSCPartialExport -Content $currentDSCBlock `
                -FileName $Global:PartialExportFileName
            $i++
            Write-Host $Global:M365DSCEmojiGreenCheckMark
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


function Get-M365DSCRoleManagementPolicyRuleObject
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter()]
        $Rule
    )

    if ($null -eq $Rule)
    {
        return $null
    }

    $odataType = "@odata.type"
    $values = @{
        id                 = $Rule.id
        ruleType           = $Rule.AdditionalProperties.$odataType
    }

    if($values.ruleType -eq '#microsoft.graph.unifiedRoleManagementPolicyExpirationRule')
    {
        $expirationRule = @{
            isExpirationRequired = $Rule.AdditionalProperties.isExpirationRequired
            maximumDuration = $Rule.AdditionalProperties.maximumDuration
        }
        $values.Add('expirationRule', $expirationRule)
    }

    if($values.ruleType -eq '#microsoft.graph.unifiedRoleManagementPolicyNotificationRule')
    {
        $notificationRule = @{
            notificationType = $Rule.AdditionalProperties.notificationType
            recipientType = $Rule.AdditionalProperties.recipientType
            notificationLevel = $Rule.AdditionalProperties.notificationLevel
            isDefaultRecipientsEnabled = $Rule.AdditionalProperties.isDefaultRecipientsEnabled
            notificationRecipients = [array]$Rule.AdditionalProperties.notificationRecipients
        }
        $values.Add('notificationRule', $notificationRule)
    }

    if($values.ruleType -eq '#microsoft.graph.unifiedRoleManagementPolicyEnablementRule')
    {
        $enablementRule = @{
            enabledRules = [array]$Rule.AdditionalProperties.enabledRules
        }
        $values.Add('enablementRule', $enablementRule)
    }

    if($values.ruleType -eq '#microsoft.graph.unifiedRoleManagementPolicyApprovalRule')
    {
        $approvalStages = @()
        foreach($stage in $Rule.AdditionalProperties.setting.approvalStages)
        {
            $primaryApprovers = @()
            foreach($approver in $stage.primaryApprovers)
            {
                $primaryApprover = @{
                    odataType = $approver.$odataType
                }
                $primaryApprovers += $primaryApprover
            }

            $escalationApprovers = @()
            foreach($approver in $stage.escalationApprovers)
            {
                $escalationApprover = @{
                    odataType = $approver.$odataType
                }
                $escalationApprovers += $escalationApprover
            }

            $approvalStage = @{
                approvalStageTimeOutInDays = $stage.approvalStageTimeOutInDays
                escalationTimeInMinutes = $stage.escalationTimeInMinutes
                isApproverJustificationRequired = $stage.isApproverJustificationRequired
                isEscalationEnabled = $stage.isEscalationEnabled
                escalationApprovers = $escalationApprovers
                primaryApprovers = $primaryApprovers
            }

            $approvalStages += $approvalStage
        }
        $setting = @{
            approvalMode = $Rule.AdditionalProperties.setting.approvalMode;
            isApprovalRequired = $Rule.AdditionalProperties.setting.isApprovalRequired
            isApprovalRequiredForExtension = $Rule.AdditionalProperties.setting.isApprovalRequiredForExtension
            isRequestorJustificationRequired = $Rule.AdditionalProperties.setting.isRequestorJustificationRequired
            approvalStages = $approvalStages
        }
        $approvalRule = @{
            setting = $setting
        }
        $values.Add('approvalRule', $approvalRule)
    }

    if($values.ruleType -eq '#microsoft.graph.unifiedRoleManagementPolicyAuthenticationContextRule')
    {
        $authenticationContextRule = @{
            isEnabled = $Rule.AdditionalProperties.isEnabled
            claimValue = $Rule.AdditionalProperties.claimValue
        }
        $values.Add('authenticationContextRule', $authenticationContextRule)
    }


    return $values
}

Export-ModuleMember -Function *-TargetResource
