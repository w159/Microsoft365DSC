function Get-M365DSCAzureBillingAccount
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param()

    $uri = 'https://management.azure.com/providers/Microsoft.Billing/billingAccounts?api-version=2022-10-01-privatepreview&?includeAll=true'
    $response = Invoke-AzRest -Method GET -Uri $uri
    $result = ConvertFrom-Json $response.Content
    return $result
}

function Get-M365DSCAzureBillingAccountsAssociatedTenant
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $BillingAccountId
    )

    $uri = "https://management.azure.com/providers/Microsoft.Billing/billingAccounts/$($BillingAccountId)/associatedTenants?api-version=2024-04-01"
    $response = Invoke-AzRest -Method GET -Uri $uri
    $result = ConvertFrom-Json $response.Content
    return $result
}

function Remove-M365DSCAzureBillingAccountsAssociatedTenant
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $BillingAccountId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $AssociatedTenantId
    )

    $uri = "https://management.azure.com/providers/Microsoft.Billing/billingAccounts/$($BillingAccountId)/associatedTenants/$($AssociatedTenantId)?api-version=2024-04-01"
    $response = Invoke-AzRest -Method DELETE -Uri $uri
    $result = ConvertFrom-Json $response.Content
    return $result
}
function New-M365DSCAzureBillingAccountsAssociatedTenant
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $BillingAccountId,

        [Parameter(Mandatory = $true)]
        [System.String]
        $AssociatedTenantId,

        [Parameter(Mandatory = $true)]
        [System.Collections.Hashtable]
        $Body
    )

    $uri = "https://management.azure.com/providers/Microsoft.Billing/billingAccounts/$($BillingAccountId)/associatedTenants/$($AssociatedTenantId)?api-version=2024-04-01"
    $payload = ConvertTo-Json $body -Depth 10 -Compress
    $response = Invoke-AzRest -Method PUT -Uri $uri -Payload $payload
    $result = ConvertFrom-Json $response.Content
    return $result
}
