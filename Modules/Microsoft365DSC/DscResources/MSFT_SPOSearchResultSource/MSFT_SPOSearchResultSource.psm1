using module ..\_Base\M365DSCResourceBase.psm1

[DscResource()]
class SPOSearchResultSource : M365DSCResourceBase
{
    [DscProperty(Key)]
    [System.ComponentModel.Description('The Name of the Result Source.')]
    [System.String] $Name

    [DscProperty()]
    [System.ComponentModel.Description('Description of the Result Source.')]
    [System.String] $Description

    [DscProperty(Mandatory)]
    [System.ComponentModel.Description('The protocol of the Result Source.')]
    [ValidateSet('Local', 'Remote', 'OpenSearch', 'Exchange')]
    [System.String] $Protocol

    [DscProperty()]
    [System.ComponentModel.Description('Address of the root site collection of the remote SharePoint farm or Exchange server.')]
    [System.String] $SourceURL

    [DscProperty()]
    [System.ComponentModel.Description('Select SharePoint Search Results to search over the entire index. Select People Search Results to enable query processing specific to People Search, such as phonetic name matching or nickname matching. Only people profiles will be returned from a People Search source.')]
    [ValidateSet('SharePoint', 'People')]
    [System.String] $Type

    [DscProperty()]
    [System.ComponentModel.Description('Change incoming queries to use this new query text instead. Include the incoming query in the new text by using the query variable ''{searchTerms}''.')]
    [System.String] $QueryTransform

    [DscProperty()]
    [System.ComponentModel.Description('Show partial search or not')]
    [System.Nullable[System.Boolean]] $ShowPartialSearch

    [DscProperty()]
    [System.ComponentModel.Description('Specifies if AutoDiscover should be used for the Exchange Source URL')]
    [System.Nullable[System.Boolean]] $UseAutoDiscover

    [DscProperty()]
    [System.ComponentModel.Description('Present ensures the Search Result Source exists.')]
    [ValidateSet('Present', 'Absent')]
    [System.String] $Ensure

    [DscProperty()]
    [System.ComponentModel.Description('Credentials of the account to authenticate with.')]
    [System.Management.Automation.PSCredential] $Credential

    [DscProperty()]
    [System.ComponentModel.Description('Id of the Azure Active Directory application to authenticate with.')]
    [System.String] $ApplicationId

    [DscProperty()]
    [System.ComponentModel.Description('Secret of the Azure Active Directory application to authenticate with.')]
    [System.Management.Automation.PSCredential] $ApplicationSecret

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

    SPOSearchResultSource() : base()
    {
        $this.ResourceCache['InfoMapping'] = @(
            @{
                Protocol   = 'Local'
                Type       = 'SharePoint'
                ProviderID = 'fa947043-6046-4f97-9714-40d4c113963d'
            },
            @{
                Protocol   = 'Remote'
                Type       = 'SharePoint'
                ProviderID = '1e0c8601-2e5d-4ccb-9561-53743b5dbde7'
            },
            @{
                Protocol   = 'Exchange'
                Type       = 'SharePoint'
                ProviderID = '3a17e140-1574-4093-bad6-e19cdf1c0122'
            },
            @{
                Protocol   = 'OpenSearch'
                Type       = 'SharePoint'
                ProviderID = '3a17e140-1574-4093-bad6-e19cdf1c0121'
            },
            @{
                Protocol   = 'Local'
                Type       = 'People'
                ProviderID = 'e4bcc058-f133-4425-8ffc-1d70596ffd33'
            },
            @{
                Protocol   = 'Remote'
                Type       = 'People'
                ProviderID = 'e377caaa-fcaf-4a1b-b7a1-e69a506a07aa'
            }
        )
    }

    [SPOSearchResultSource] Get()
    {
        $nullReturn = $null
        if ($this.RequiresPowerShellCore())
        {
            $remote = [SPOSearchResultSource]::new()
            $remote.FromHashtable($this.InvokeInPowerShellCore('Get'))
            return $remote
        }

        Write-Verbose -Message "Getting configuration for Result Source instance $($this.Name)"

        try
        {
            if (-not $this.ResourceCache['exportMode'])
            {
                $null = $this.Connect('PnP')

                Confirm-M365DSCDependencies

                $this.AddTelemetry('Get')

                $nullReturn = @{
                    Name     = $this.Name
                    Protocol = $this.Protocol
                    Ensure   = 'Absent'
                }
                $this.ResourceCache['RecentExtract'] = [Xml] (Get-PnPSearchConfiguration -Scope Subscription)
            }
            $source = $this.ResourceCache['RecentExtract'].SearchConfigurationSettings.SearchQueryConfigurationSettings.SearchQueryConfigurationSettings.Sources.Source `
            | Where-Object -FilterScript { $_.Name -eq $this.Name }

            if ($null -eq $source)
            {
                Write-Verbose -Message "The specified Result Source {$($this.Name)} doesn't already exist."
                return $this.AsResult($nullReturn)
            }

            $ExoSource = [string] $source.ConnectionUrlTemplate
            $SourceHasAutoDiscover = $false
            if ('http://auto?autodiscover=true' -eq $ExoSource)
            {
                $SourceHasAutoDiscover = $true
            }

            $allowPartial = $source.QueryTransform.OverridePropertiesForSeralization.KeyValueOfstringanyType `
            | Where-Object -FilterScript { $_.Key -eq 'AllowPartialResults' }

            $mapping = $this.ResourceCache['InfoMapping'] | Where-Object -FilterScript { $_.ProviderID -eq $source.ProviderId }

            $returnValue = @{
                Name                  = $this.Name
                Description           = [string] $source.Description
                Protocol              = $mapping.Protocol
                Type                  = $mapping.Type
                QueryTransform        = [string] $source.QueryTransform._QueryTemplate
                SourceURL             = [string] $source.ConnectionUrlTemplate
                UseAutoDiscover       = $SourceHasAutoDiscover
                Credential            = $this.Credential
                ApplicationId         = $this.ApplicationId
                TenantId              = $this.TenantId
                ApplicationSecret     = $this.ApplicationSecret
                CertificateThumbprint = $this.CertificateThumbprint
                CertificatePath       = $this.CertificatePath
                CertificatePassword   = $this.CertificatePassword
                ManagedIdentity       = $this.ManagedIdentity
                Ensure                = 'Present'
                AccessTokens          = $this.AccessTokens
            }

            if ($null -ne $allowPartial)
            {
                $returnValue.Add('ShowPartialSearch', [System.Boolean]$allowPartial.Value.InnerText)
            }

            return $this.AsResult($returnValue)
        }
        catch
        {
            $this.LogError($_, 'Error retrieving data:')

            throw
        }
    }

    [void] Set()
    {
        $currentID = $null
        if ($this.RequiresPowerShellCore())
        {
            $null = $this.InvokeInPowerShellCore('Set')
            return
        }

        Write-Verbose -Message "Setting configuration for Result Source instance $($this.Name)"

        Confirm-M365DSCDependencies

        $this.AddTelemetry('Set')

        $null = $this.Connect('PnP')

        if ($this.Ensure -eq 'Absent')
        {
            Write-Verbose -Message "Removing SPOSearchResultSource {$($this.Name)}"
            Remove-PnPSearchConfiguration -Configuration $this.Name -Scope Subscription
            return
        }

        Write-Verbose -Message 'Reading SearchConfigurationSettings XML file'
        $SearchConfigTemplatePath = Join-Path -Path $this.GetModulePath() `
            -ChildPath './Dependencies/SearchConfigurationSettings.xml' `
            -Resolve
        $SearchConfigXML = [Xml] (Get-Content $SearchConfigTemplatePath -Raw)

        # Get the result source back if it already exists.
        if ($null -eq $this.ResourceCache['RecentExtract'])
        {
            $this.ResourceCache['RecentExtract'] = [XML] (Get-PnPSearchConfiguration -Scope Subscription)
        }

        $source = $this.ResourceCache['RecentExtract'].SearchConfigurationSettings.SearchQueryConfigurationSettings.SearchQueryConfigurationSettings.Sources.Source `
        | Where-Object -FilterScript { $_.Name -eq $this.Name }
        if ($null -ne $source)
        {
            $currentID = $source.Id
        }

        Write-Verbose -Message 'Generating new SearchConfigurationSettings XML file'
        $newSource = $SearchConfigXML.CreateElement('d4p1:Source', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')

        Write-Verbose -Message 'Setting ConnectionUrlTemplate'
        $node = $SearchConfigXML.CreateElement('d4p1:ConnectionUrlTemplate', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')
        $node.InnerText = $this.SourceUrl
        $newSource.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting CreatedDate'
        $node = $SearchConfigXML.CreateElement('d4p1:CreatedDate', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')
        $node.InnerText = [DateTime]::Now.ToString('yyyy-MM-ddTHH:mm:ss.00')
        $newSource.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting Description'
        $node = $SearchConfigXML.CreateElement('d4p1:Description', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')
        $node.InnerText = $this.Description
        $newSource.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting Existing Id'
        $node = $SearchConfigXML.CreateElement('d4p1:Id', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')

        if ($null -ne $currentID)
        {
            $node.InnerText = $currentId
        }
        else
        {
            $node.InnerText = (New-Guid).ToString()
        }
        $newSource.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting Name'
        $node = $SearchConfigXML.CreateElement('d4p1:Name', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')
        $node.InnerText = $this.Name
        $newSource.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting ProviderId'
        $mapping = $this.ResourceCache['InfoMapping'] | Where-Object -FilterScript { $_.Protocol -eq $this.Protocol -and $_.Type -eq $this.Type }
        $node = $SearchConfigXML.CreateElement('d4p1:ProviderId', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')
        $node.InnerText = $mapping.ProviderID
        $newSource.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting QueryTransform'
        $queryTransformNode = $SearchConfigXML.CreateElement('d4p1:QueryTransform', `
                'http://schemas.datacontract.org/2004/07/Microsoft.Office.Server.Search.Administration.Query')
        $queryTransformNode.SetAttribute('xmlns:d6p1', 'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')

        Write-Verbose -Message 'Setting QueryTransform:Id'
        $node = $SearchConfigXML.CreateElement('d6p1:Id', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $node.InnerText = (New-Guid).ToString()
        $queryTransformNode.AppendChild($node)

        Write-Verbose -Message 'Setting QueryTransform:ParentType'
        $queryTransformNode = $SearchConfigXML.CreateElement('d6p1:ParentType', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $node.InnerText = 'Source'
        $queryTransformNode.AppendChild($node)

        Write-Verbose -Message 'Setting QueryTransform:QueryPropertyExpressions'
        $QueryPropertyExpressions = $SearchConfigXML.CreateElement('d6p1:QueryPropertyExpressions', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')

        Write-Verbose -Message 'Setting QueryTransform:QueryPropertyExpressions:MaxSize'
        $node = $SearchConfigXML.CreateElement('d6p1:MaxSize', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $node.InnerText = '2147483647'
        $QueryPropertyExpressions.AppendChild($node)

        Write-Verbose -Message 'Setting QueryTransform:QueryPropertyExpressions:OrderedItems'
        $node = $SearchConfigXML.CreateElement('d6p1:OrderedItems', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $QueryPropertyExpressions.AppendChild($node)

        $queryTransformNode.AppendChild($QueryPropertyExpressions)

        Write-Verbose -Message 'Setting QueryTransform:_IsReadOnly'
        $node = $SearchConfigXML.CreateElement('d6p1:_IsReadOnly', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $node.InnerText = 'true'
        $queryTransformNode.AppendChild($node)

        Write-Verbose -Message 'Setting QueryTransform:_QueryTemplate'
        $node = $SearchConfigXML.CreateElement('d6p1:_QueryTemplate', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $node.InnerText = $this.QueryTransform
        $queryTransformNode.AppendChild($node) | Out-Null

        Write-Verbose -Message 'Setting QueryTransform:_SourceId'
        $node = $SearchConfigXML.CreateElement('d6p1:_SourceId', `
                'http://www.microsoft.com/sharepoint/search/KnownTypes/2008/08')
        $node.SetAttribute('i:nil', 'true')
        $queryTransformNode.AppendChild($node)

        Write-Verbose -Message 'Inserting QueryTransform'
        $newSource.AppendChild($queryTransformNode) | Out-Null

        Write-Verbose -Message 'Inserting new Source Node'
        $xmlNode = $SearchConfigXML.SearchConfigurationSettings.SearchQueryConfigurationSettings.SearchQueryConfigurationSettings.Sources.OwnerDocument.ImportNode($newSource, $true)
        $SearchConfigXML.SearchConfigurationSettings.SearchQueryConfigurationSettings.SearchQueryConfigurationSettings.Sources.AppendChild($xmlNode)

        Write-Verbose -Message 'Saving XML file in a temporary location'
        $tempPath = Join-Path -Path $ENV:TEMP `
            -ChildPath ((New-Guid).ToString().Split('-')[0] + '.config')
        $SearchConfigXML.OuterXml | Out-File $tempPath

        # Create the Result Source if it doesn't already exist
        Write-Verbose -Message 'Applying new Search Configuration back to the Office365 Tenant'
        Set-PnPSearchConfiguration -Scope Subscription -Path $tempPath
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

        try
        {
            $ConnectionMode = $this.Connect('PnP')

            #Ensure the proper dependencies are installed in the current environment.
            Confirm-M365DSCDependencies

            #region Telemetry
            $this.AddTelemetry('Export')
            #endregion

            $SearchConfig = [Xml] (Get-PnPSearchConfiguration -Scope Subscription -ErrorAction Stop)
            [array]$sources = $SearchConfig.SearchConfigurationSettings.SearchQueryConfigurationSettings.SearchQueryConfigurationSettings.Sources.Source
            $this.ResourceCache['RecentExtract'] = $SearchConfig
            $this.ResourceCache['exportMode'] = $true

            $dscContent = [System.Text.StringBuilder]::new()
            $i = 1
            $sourcesLength = $sources.Length

            if ($sources.Length -eq 0)
            {
                Write-M365DSCHost -Message $Global:M365DSCEmojiGreenCheckMark -CommitWrite
            }
            else
            {
                Write-M365DSCHost -Message "`r`n" -DeferWrite
            }
            foreach ($source in $sources)
            {
                if ($null -ne $Global:M365DSCExportResourceInstancesCount)
                {
                    $Global:M365DSCExportResourceInstancesCount++
                }

                $mapping = $this.ResourceCache['InfoMapping'] | Where-Object -FilterScript { $_.ProviderID -eq $source.ProviderId }
                Write-M365DSCHost -Message "    |---[$i/$($sourcesLength)] $($source.Name)" -DeferWrite

                $Params = @{
                    Name                  = $source.Name
                    Protocol              = $mapping.Protocol
                    Credential            = $this.Credential
                    ApplicationId         = $this.ApplicationId
                    TenantId              = $this.TenantId
                    ApplicationSecret     = $this.ApplicationSecret
                    CertificateThumbprint = $this.CertificateThumbprint
                    CertificatePath       = $this.CertificatePath
                    CertificatePassword   = $this.CertificatePassword
                    ManagedIdentity       = $this.ManagedIdentity
                    AccessTokens          = $this.AccessTokens
                }
                $Results = $this.GetForExport($Params)
                if ($Results -is [System.Collections.Hashtable] -and $Results.Count -gt 2)
                {
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

    hidden [SPOSearchResultSource] AsResult([System.Object] $Values)
    {
        if ($Values -is [SPOSearchResultSource])
        {
            return $Values
        }

        $result = [SPOSearchResultSource]::new()
        $result.ClearNonSchemaProperties()
        if ($Values -is [System.Collections.Hashtable])
        {
            $result.FromHashtable($Values)
        }

        return $result
    }
}
