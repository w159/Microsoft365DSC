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
        TeamsAppSetupPolicy "TeamsAppSetupPolicy-Example"
        {
            AllowSideLoading      = $true;
            AllowUserPinning      = $true;
            AppPresetList         = "com.microsoft.teamspace.tab.vsts";
            AppPresetMeetingList  = @("com.microsoft.teamspace.tab.planner","95de633a-083e-42f5-b444-a4295d8e9314");
            Description           = "Pins the core apps for frontline staff";
            Ensure                = "Present";
            Identity              = "Frontline App Setup";
            PinnedAppBarApps      = @("2a84919f-59d8-4441-a975-2a8c2643b741"); # Updated Property
            PinnedCallingBarApps  = @("95de633a-083e-42f5-b444-a4295d8e9314");
            PinnedMessageBarApps  = @("0d820ecd-def2-4297-adad-78056cde7c78","com.microsoft.teamspace.tab.planner");
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
