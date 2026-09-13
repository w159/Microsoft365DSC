<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param
    (
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )

    Import-DscResource -ModuleName Microsoft365DSC

    Node localhost
    {
        TeamsFilesPolicy 'TeamsFilesPolicy-Example'
        {
            DefaultFileUploadAppId              = "<teams-app-id>";
            Ensure                              = "Present";
            FileSharingInChatswithExternalUsers = "Enabled";
            Identity                            = "Retail Store Files";
            NativeFileEntryPoints               = "Enabled";
            SPChannelFilesTab                   = "Enabled";
            ApplicationId                       = $ApplicationId;
            TenantId                            = $TenantId;
            CertificateThumbprint               = $CertificateThumbprint;
        }
    }
}
