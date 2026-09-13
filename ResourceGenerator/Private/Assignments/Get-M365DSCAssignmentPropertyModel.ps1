<#
.SYNOPSIS
    Returns the property model of the Intune Assignments property.

.DESCRIPTION
    Assignments are not part of the entity's CSDL schema - they are a relationship managed
    through their own cmdlet and the shared ConvertFrom/ConvertTo-IntunePolicyAssignment and
    Update-DeviceConfigurationPolicyAssignment helpers. The property model carries the shipped
    MSFT_DeviceManagementConfigurationPolicyAssignments CIM class (camelCase member names,
    matching every converted Intune resource) and an IsAssignments marker that routes it around
    the generic complex-type conversion emitters.
#>
function Get-M365DSCAssignmentPropertyModel
{
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param ()

    $memberDefinitions = @(
        @{ Name = 'dataType'; Description = 'The type of the target assignment.'; IsMandatory = $true }
        @{ Name = 'deviceAndAppManagementAssignmentFilterType'; Description = 'The type of filter of the target assignment i.e. Exclude or Include. Possible values are:none, include, exclude.'; IsMandatory = $false }
        @{ Name = 'deviceAndAppManagementAssignmentFilterId'; Description = 'The Id of the filter for the target assignment.'; IsMandatory = $false }
        @{ Name = 'deviceAndAppManagementAssignmentFilterDisplayName'; Description = 'The display name of the filter for the target assignment.'; IsMandatory = $false }
        @{ Name = 'groupId'; Description = 'The group Id that is the target of the assignment.'; IsMandatory = $false }
        @{ Name = 'groupDisplayName'; Description = 'The group Display Name that is the target of the assignment.'; IsMandatory = $false }
        @{ Name = 'collectionId'; Description = 'The collection Id that is the target of the assignment.(ConfigMgr)'; IsMandatory = $false }
    )

    # Built by hand instead of New-M365DSCPropertyModel: the shipped CIM class uses camelCase
    # member names, which the model factory would Pascal-case.
    $members = foreach ($definition in $memberDefinitions)
    {
        [PSCustomObject]@{
            Name                       = $definition.Name
            GraphName                  = $definition.Name
            RawType                    = 'Edm.String'
            ClrType                    = 'System.String'
            CimClassName               = $null
            FakeKind                   = 'String'
            IsArray                    = $false
            IsKey                      = $false
            IsMandatory                = $definition.IsMandatory
            IsComplex                  = $false
            IsEnum                     = $false
            IsAuth                     = $false
            IsFromAdditionalProperties = $false
            EnumValues                 = @()
            Description                = $definition.Description
            Members                    = @()
            FakeValue                  = $null
            DriftValue                 = $null
        }
    }

    $model = [PSCustomObject]@{
        Name                       = 'Assignments'
        GraphName                  = 'assignments'
        RawType                    = 'Complex'
        ClrType                    = 'MSFT_DeviceManagementConfigurationPolicyAssignments[]'
        CimClassName               = 'MSFT_DeviceManagementConfigurationPolicyAssignments'
        FakeKind                   = 'Complex'
        IsArray                    = $true
        IsKey                      = $false
        IsMandatory                = $false
        IsComplex                  = $true
        IsEnum                     = $false
        IsAuth                     = $false
        IsFromAdditionalProperties = $false
        EnumValues                 = @()
        Description                = 'Represents the assignment to the Intune policy.'
        Members                    = @($members)
        FakeValue                  = $null
        DriftValue                 = $null
    }

    $model | Add-Member -MemberType NoteProperty -Name 'IsAssignments' -Value $true

    return $model
}

<#
.SYNOPSIS
    Tests whether a property model is the special Assignments property.
#>
function Test-M365DSCAssignmentProperty
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Object]
        $Property
    )

    return ($null -ne $Property.PSObject.Properties['IsAssignments'] -and $Property.IsAssignments)
}
