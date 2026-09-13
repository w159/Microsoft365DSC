# Resource Comparison Architecture

## Overview

This document describes how resource-specific comparison logic is handled in Microsoft365DSC.
This ensures that drift detection and reporting use the same comparison parameters as the DSC runtime, regardless of whether the comparison is triggered by `Test()` or `New-M365DSCDeltaReport`.

## Problem Statement

Previously, there were two comparison pathways that produced inconsistent results:

1. **Resource-Level Comparison** (via `Test()`):
   * Resources could specify custom comparison logic (PostProcessing, ExcludedProperties, IncludedProperties)
   * Used during DSC runtime operations

2. **Report-Level Comparison** (via `New-M365DSCDeltaReport`):
   * Called `Compare-M365DSCResourceState` directly without resource-specific parameters
   * Lost all custom comparison logic, causing false drift detection

## Solution Architecture

Both pathways ask the resource class itself for its comparison parameters.

### 1. Resource-Level `GetCompareParameters()` Method

`M365DSCResourceBase` declares the method and returns an empty hashtable. Resources that require custom comparison logic override it, returning the same parameters that are passed to `Test-M365DSCTargetResource`:

**Example:** `MSFT_AADRoleAssignmentScheduleRequest`

```powershell
    [System.Collections.Hashtable] GetCompareParameters()
    {
        return @{
            ExcludedProperties = @('Action', 'IsValidationOnly', 'Justification', 'TicketInfo')
            PostProcessing     = {
                param($DesiredValues, $CurrentValues, $ValuesToCheck, $PostProcessingArgs)
                # ... transform values as needed ...
                return [System.Tuple[Hashtable, Hashtable, Hashtable]]::new($DesiredValues, $CurrentValues, $ValuesToCheck)
            }
        }
    }
```

The resource's own `Test()` splats the result:

```powershell
    [bool] Test()
    {
        ...
        $compareParameters = $this.GetCompareParameters()
        return Test-M365DSCTargetResource -DesiredValues $this.GetBoundParameters() `
            -ResourceName $this.GetResourceName() `
            @compareParameters -CurrentValues $this.Get().ToHashtable()
    }
```

**Supported Return Values:**

* `ExcludedProperties` (string[]): Properties to exclude from comparison
* `IncludedProperties` (string[]): Properties to explicitly include in comparison
* `PostProcessing` (ScriptBlock): Custom transformation logic (must return Tuple[Hashtable, Hashtable, Hashtable])
* `PostProcessingArgs` (object[]): Additional arguments passed to PostProcessing scriptblock

The base class also provides `GetSettingsCatalogCompareParameters()`, which the settings-catalog resources delegate to instead of writing their own body.

### 2. Helper Functions

**`Get-M365DSCResourceCompareParameters`** (in `DscResources/_Base/M365DSCResourceFactory.psm1`)

* Resolves the resource name to its class type through the `M365DSCResourceBase` registry
* Constructs an instance with no properties set and returns its `GetCompareParameters()`
* Returns `@{}` for an unknown resource name rather than throwing

This lives with the other class entry points because PowerShell classes do not cross module boundaries: `M365DSCUtil.psm1` cannot write `[AADGroup]::new()`.

**`Get-M365DSCResourceComparisonParameters`** (in `M365DSCUtil.psm1`)

* Caches the result per resource for the lifetime of the session
* Delegates to `Get-M365DSCResourceCompareParameters`

### 3. Integration with New-M365DSCDeltaReport

Report generation asks every resource for its parameters and merges them with the report's own exclusions:

```powershell
$customCompareParams = Get-M365DSCResourceComparisonParameters -ResourceName $resource.ResourceName

# Merge with global exclusions
if ($customCompareParams.ContainsKey('ExcludedProperties'))
{
    $resourceCompareParams.ExcludedProperties = $ExcludedProperties + $customCompareParams.ExcludedProperties | Select-Object -Unique
}

# Add PostProcessing, IncludedProperties, etc.
# ...

# Perform comparison with resource-specific parameters
$compareResult = Compare-M365DSCResourceState @resourceCompareParams
```

## Implementation Guide

### Adding Custom Comparison to a New Resource

1. **Override `GetCompareParameters()`** on your resource class:

    ```powershell
        [System.Collections.Hashtable] GetCompareParameters()
        {
            return @{
                ExcludedProperties = @('PropertyToExclude1', 'PropertyToExclude2')
                # IncludedProperties = @('PropertyToInclude1')  # Optional
                # PostProcessing = $scriptBlock  # Optional
            }
        }
    ```

2. **Splat it** in the resource's `Test()`, as shown above.

3. **Test your implementation**
   * Run your resource's `Test()` - should work as before
   * Run `Assert-M365DSCBlueprint` - should now use the same comparison logic

No registration step is needed: the report path resolves the class and calls the method, so an override is picked up on its own.

### PostProcessing Script Pattern

The PostProcessing scriptblock receives four parameters and must return a Tuple:

```powershell
$postProcessingScript = {
    param
    (
        $DesiredValues,      # Hashtable - values from configuration
        $CurrentValues,      # Hashtable - values from tenant
        $ValuesToCheck,      # Hashtable - properties to compare
        $PostProcessingArgs  # Optional array - additional context
    )

    # Modify values as needed
    # Example: Normalize datetime values
    if ($DesiredValues.StartDate -lt [DateTime]::Now) {
        $DesiredValues.StartDate = $CurrentValues.StartDate
    }

    # MUST return Tuple[Hashtable, Hashtable, Hashtable]
    return [System.Tuple[Hashtable, Hashtable, Hashtable]]::new(
        $DesiredValues,
        $CurrentValues,
        $ValuesToCheck
    )
}
```

The scriptblock is invoked by `Test-M365DSCTargetResource`, outside the instance's scope, so `$this` is not available inside it. State travels via `PostProcessingArgs`.

Note that the report path constructs the instance with no properties set, so any state an override reads from `$this` holds its default there.

## Benefits

1. **Consistency**: Report generation and DSC runtime use identical comparison logic
2. **Maintainability**: Comparison logic lives in one place (the resource class)
3. **Flexibility**: Resources can define complex comparison rules without modifying core engine
4. **Discoverability**: The override sits next to the `Test()` that uses it

## File Locations

* **Base Class:** `Modules/Microsoft365DSC/DscResources/_Base/M365DSCResourceBase.psm1`
* **Class Entry Points:** `Modules/Microsoft365DSC/DscResources/_Base/M365DSCResourceFactory.psm1`
* **Helper Functions:** `Modules/Microsoft365DSC/Modules/M365DSCUtil.psm1`
* **Comparison Engine:** `Modules/Microsoft365DSC/Modules/M365DSCCompare.psm1`
* **Report Generator:** `Modules/Microsoft365DSC/Modules/M365DSCReport.psm1`
* **Resource Example:** `Modules/Microsoft365DSC/DscResources/MSFT_AADRoleAssignmentScheduleRequest/MSFT_AADRoleAssignmentScheduleRequest.psm1`
