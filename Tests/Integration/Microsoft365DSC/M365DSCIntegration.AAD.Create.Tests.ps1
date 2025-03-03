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

    Configuration Master
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
        $Domain = $TenantId
        Node Localhost
        {
                AADAccessReviewDefinition 'AADAccessReviewDefinition-Example'
                {
                    DescriptionForAdmins    = "description for admins";
                    DescriptionForReviewers = "description for reviewers";
                    DisplayName             = "Test Access Review Definition";
                    Ensure                  = "Present";
                    Id                      = "613854e6-c458-4a2c-83fc-e0f4b8b17d60";
                    ScopeValue              = MSFT_MicrosoftGraphaccessReviewScope{
                        PrincipalScopes = @(
                            MSFT_MicrosoftGraphAccessReviewScope{
                                Query = '/v1.0/users?$filter=userType eq ''Guest'''
                                odataType = '#microsoft.graph.accessReviewQueryScope'
                                QueryType = 'MicrosoftGraph'
                            }
                        )
                        ResourceScopes = @(
                            MSFT_MicrosoftGraphAccessReviewScope{
                                Query = '/v1.0/groups/a8ab05ba-6680-4f93-88ae-71099eedfda1/transitiveMembers/microsoft.graph.user/?$count=true&$filter=(userType eq ''Guest'')'
                                odataType = '#microsoft.graph.accessReviewQueryScope'
                                QueryType = 'MicrosoftGraph'
                            }
                            MSFT_MicrosoftGraphAccessReviewScope{
                                Query = '/beta/teams/a8ab05ba-6680-4f93-88ae-71099eedfda1/channels?$filter=membershipType eq ''shared'''
                                odataType = '#microsoft.graph.accessReviewQueryScope'
                                QueryType = 'MicrosoftGraph'
                            }
                        )
                        odataType = '#microsoft.graph.principalResourceMembershipsScope'
                    };
                    SettingsValue           = MSFT_MicrosoftGraphaccessReviewScheduleSettings{
                        ApplyActions = @(
                            MSFT_MicrosoftGraphAccessReviewApplyAction{
                                odataType = '#microsoft.graph.removeAccessApplyAction'
                            }
                        )
                        InstanceDurationInDays = 4
                        RecommendationsEnabled = $False
                        DecisionHistoriesForReviewersEnabled = $False
                        DefaultDecisionEnabled = $False
                        JustificationRequiredOnApproval = $True
                        RecommendationInsightSettings = @(
                            MSFT_MicrosoftGraphAccessReviewRecommendationInsightSetting{
                                SignInScope = 'tenant'
                                RecommendationLookBackDuration = 'P15D'
                                odataType = '#microsoft.graph.userLastSignInRecommendationInsightSetting'
                            }
                        )
                        AutoApplyDecisionsEnabled = $False
                        ReminderNotificationsEnabled = $True
                        Recurrence = MSFT_MicrosoftGraphPatternedRecurrence{
                            Range = MSFT_MicrosoftGraphRecurrenceRange{
                                NumberOfOccurrences = 0
                                Type = 'noEnd'
                                StartDate = '10/18/2024 12:00:00 AM'
                                EndDate = '12/31/9999 12:00:00 AM'
                            }
                            Pattern = MSFT_MicrosoftGraphRecurrencePattern{
                                DaysOfWeek = @()
                                Type = 'weekly'
                                Interval = 1
                                Month = 0
                                Index = 'first'
                                FirstDayOfWeek = 'sunday'
                                DayOfMonth = 0
                            }
        
                        }
                        DefaultDecision = 'None'
                        RecommendationLookBackDuration = '15.00:00:00'
                        MailNotificationsEnabled = $False
                    };
                    StageSettings           = @(
                        MSFT_MicrosoftGraphaccessReviewStageSettings{
                            StageId = '1'
                            RecommendationsEnabled = $True
                            DependsOnValue = @()
                            DecisionsThatWillMoveToNextStage = @('Approve')
                            DurationInDays = 3
                        }
                        MSFT_MicrosoftGraphaccessReviewStageSettings{
                            StageId = '2'
                            RecommendationsEnabled = $True
                            DependsOnValue = @('1')
                            DecisionsThatWillMoveToNextStage = @('Approve')
                            DurationInDays = 3
                        }
                    );
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADAdministrativeUnit 'TestUnit'
                {
                    DisplayName                   = 'Test-Unit'
                    Description                   = 'Test Description'
                    MembershipRule                = "(user.country -eq `"Canada`")"
                    MembershipRuleProcessingState = 'On'
                    MembershipType                = 'Dynamic'
                    IsMemberManagementRestricted  = $False;
                    ScopedRoleMembers             = @(
                        MSFT_MicrosoftGraphScopedRoleMembership
                        {
                            RoleName       = 'User Administrator'
                            RoleMemberInfo = MSFT_MicrosoftGraphMember
                            {
                                Identity = "admin@$TenantId"
                                Type     = "User"
                            }
                        }
                    )
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADApplication 'AADApp1'
                {
                    DisplayName               = "AppDisplayName"
                    AvailableToOtherTenants   = $false
                    Description               = "Application Description"
                    GroupMembershipClaims     = "None"
                    Homepage                  = "https://$TenantId"
                    IdentifierUris            = "https://$TenantId"
                    KnownClientApplications   = ""
                    LogoutURL                 = "https://$TenantId/logout"
                    PublicClient              = $false
                    ReplyURLs                 = "https://$TenantId"
                    Permissions               = @(
                        MSFT_AADApplicationPermission
                        {
                            Name                = 'User.Read'
                            Type                = 'Delegated'
                            SourceAPI           = 'Microsoft Graph'
                            AdminConsentGranted = $false
                        }
                        MSFT_AADApplicationPermission
                        {
                            Name                = 'User.ReadWrite.All'
                            Type                = 'Delegated'
                            SourceAPI           = 'Microsoft Graph'
                            AdminConsentGranted = $True
                        }
                        MSFT_AADApplicationPermission
                        {
                            Name                = 'User.Read.All'
                            Type                = 'AppOnly'
                            SourceAPI           = 'Microsoft Graph'
                            AdminConsentGranted = $True
                        }
                    )
                    Ensure                    = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADAttributeSet 'AADAttributeSetTest'
                {
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Description          = "Attribute set with 420 attributes";
                    Ensure               = "Present";
                    Id                   = "TestAttributeSet";
                    MaxAttributesPerSet  = 420;
                }
                AADAuthenticationContextClassReference 'AADAuthenticationContextClassReference-Test'
                {
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Description          = "Context test";
                    DisplayName          = "My Context";
                    Ensure               = "Present";
                    Id                   = "c3";
                    IsAvailable          = $True;
                }
                AADAuthenticationMethodPolicyExternal 'AADAuthenticationMethodPolicyExternal-Cisco Duo'
                {
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    AppId                 = "e35c54ff-bd24-4c52-921a-4b90a35808eb";
                    DisplayName           = "Cisco Duo";
                    Ensure                = "Present";
                    ExcludeTargets        = @(
                        MSFT_AADAuthenticationMethodPolicyExternalExcludeTarget{
                            Id = 'Design'
                            TargetType = 'group'
                        }
                    );
                    IncludeTargets        = @(
                        MSFT_AADAuthenticationMethodPolicyExternalIncludeTarget{
                            Id = 'Contoso'
                            TargetType = 'group'
                        }
                    );
                    OpenIdConnectSetting  = MSFT_AADAuthenticationMethodPolicyExternalOpenIdConnectSetting{
                        discoveryUrl = 'https://graph.microsoft.com/'
                        clientId = '7698a352-4939-486e-9974-4ea5aff93f74'
                    };
                    State                 = "disabled";
                }
                AADAuthenticationStrengthPolicy 'AADAuthenticationStrengthPolicy-Example'
                {
                    AllowedCombinations  = @("windowsHelloForBusiness","fido2","x509CertificateMultiFactor","deviceBasedPush");
                    Description          = "This is an example";
                    DisplayName          = "Example";
                    Ensure               = "Present";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADClaimsMappingPolicy 'AADClaimsMappingPolicy-Test1234'
                {
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Definition            = @(
                        MSFT_AADClaimsMappingPolicyDefinition{
                            ClaimsMappingPolicy = MSFT_AADClaimsMappingPolicyDefinitionMappingPolicy{
                                ClaimsSchema = @(
                                    MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsSchema{
                                        SamlClaimType = 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'
                                        Source = 'user'
                                        Id = 'userprincipalname'
                                    }
                                    MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsSchema{
                                        SamlClaimType = 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname'
                                        Source = 'user'
                                        Id = 'givenname'
                                    }
                                    MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsSchema{
                                        SamlClaimType = 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'
                                        Source = 'user'
                                        Id = 'displayname'
                                    }
                                    MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsSchema{
                                        SamlClaimType = 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname'
                                        Source = 'user'
                                        Id = 'surname'
                                    }
                                    MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsSchema{
                                        SamlClaimType = 'username'
                                        Source = 'user'
                                        Id = 'userprincipalname'
                                    }
                                )
                                ClaimsTransformation = @(
                                    MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsTransformation{
                                        OutputClaims = @(
                                            MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsTransformationOutputClaims{
                                                ClaimTypeReferenceId = 'TOS'
                                                TransformationClaimType = 'createdClaim'
                                            }
                                        )
                                        Id = 'CreateTermsOfService'
                                        InputParameters = @(
                                            MSFT_AADClaimsMappingPolicyDefinitionMappingPolicyClaimsTransformationInputParameter{
                                                DataType = 'string'
                                                Id = 'value'
                                                Value = 'sandbox'
                                            }
                                        )
                                        TransformationMethod = 'CreateStringClaim'
                                    }
                                )
                                IncludeBasicClaimSet = $True
                                Version = 1
                            }
        
                        }
                    );
                    DisplayName           = "Test1234";
                    Ensure                = "Present";
                    Id                    = "fd0dc3f3-cfdf-4d56-bb03-e18161a5ac93";
                    IsOrganizationDefault = $False;
                }
                AADConditionalAccessPolicy 'ConditionalAccessPolicy'
                {
                    BuiltInControls                          = @("mfa");
                    ClientAppTypes                           = @("all");
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    DeviceFilterMode                         = "exclude";
                    DeviceFilterRule                         = "device.trustType -eq `"AzureAD`" -or device.trustType -eq `"ServerAD`" -or device.trustType -eq `"Workplace`"";
                    DisplayName                              = "Example CAP";
                    Ensure                                   = "Present";
                    ExcludeUsers                             = @("admin@$Domain");
                    GrantControlOperator                     = "OR";
                    IncludeApplications                      = @("All");
                    IncludeRoles                             = @("Attack Payload Author");
                    SignInFrequencyInterval                  = "timeBased";
                    SignInFrequencyIsEnabled                 = $True;
                    SignInFrequencyType                      = "hours";
                    SignInFrequencyValue                     = 1;
                    State                                    = "disabled";
                }
                AADConnectorGroupApplicationProxy 'AADConnectorGroupApplicationProxy-testgroup'
                {
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Ensure                = "Present";
                    Id                    = "4984dcf7-d9e9-4663-90b4-5db09f92a669";
                    Name                  = "testgroup";
                    Region                = "nam";
                }
                AADCrossTenantAccessPolicyConfigurationPartner 'AADCrossTenantAccessPolicyConfigurationPartner'
                {
                    PartnerTenantId              = "e7a80bcf-696e-40ca-8775-a7f85fbb3ebc"; # O365DSC.onmicrosoft.com
                    AutomaticUserConsentSettings = MSFT_AADCrossTenantAccessPolicyAutomaticUserConsentSettings {
                        InboundAllowed           = $True
                        OutboundAllowed          = $True
                    };
                    B2BCollaborationOutbound     = MSFT_AADCrossTenantAccessPolicyB2BSetting {
                        Applications = MSFT_AADCrossTenantAccessPolicyTargetConfiguration{
                            AccessType = 'allowed'
                            Targets    = @(
                                MSFT_AADCrossTenantAccessPolicyTarget{
                                    Target     = 'AllApplications'
                                    TargetType = 'application'
                                }
                            )
                        }
                        UsersAndGroups = MSFT_AADCrossTenantAccessPolicyTargetConfiguration{
                            AccessType = 'allowed'
                            Targets    = @(
                                MSFT_AADCrossTenantAccessPolicyTarget{
                                    Target     = '68bafe64-f86b-4c4e-b33b-9d3eaa11544b' # Office 365
                                    TargetType = 'user'
                                }
                            )
                        }
                    };
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Ensure                       = "Present";
                }
                AADCustomAuthenticationExtension 'AADCustomAuthenticationExtension1'
                {
                    AuthenticationConfigurationResourceId  = "api://microsoft365dsc.com/11105949-846e-42a1-a873-f12db8345013"
                    AuthenticationConfigurationType        = "#microsoft.graph.azureAdTokenAuthentication"
                    ClaimsForTokenConfiguration            = @(
                        MSFT_AADCustomAuthenticationExtensionClaimForTokenConfiguration{
                            ClaimIdInApiResponse = 'MyClaim'
                        }
                        MSFT_AADCustomAuthenticationExtensionClaimForTokenConfiguration{
                            ClaimIdInApiResponse = 'My2ndClaim'
                        }
                    )
                    ClientConfigurationMaximumRetries      = 1
                    ClientConfigurationTimeoutMilliseconds = 2000
                    CustomAuthenticationExtensionType      = "#microsoft.graph.onTokenIssuanceStartCustomExtension"
                    Description                            = "DSC Testing 1"
                    DisplayName                            = "DSCTestExtension"
                    EndPointConfiguration                  = MSFT_AADCustomAuthenticationExtensionEndPointConfiguration{
                        EndpointType = '#microsoft.graph.httpRequestEndpoint'
                        TargetUrl = 'https://Microsoft365DSC.com'
                    }
                    Ensure                                 = "Present";
                    Id                                     = "11105949-846e-42a1-a873-f12db8345013"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADCustomSecurityAttributeDefinition 'AADCustomSecurityAttributeDefinition-ShoeSize'
                {
                    ApplicationId           = $ApplicationId;
                    AttributeSet            = "TestAttributeSet";
                    CertificateThumbprint   = $CertificateThumbprint;
                    Ensure                  = "Present";
                    IsCollection            = $False;
                    IsSearchable            = $True;
                    Name                    = "ShoeSize";
                    Status                  = "Available";
                    TenantId                = $TenantId;
                    Type                    = "String";
                    UsePreDefinedValuesOnly = $False;
                    Description             = "What size of shoe is the person wearing?"
                }
                AADDomain 'AADDomain-Contoso'
                {
                    ApplicationId                    = $ApplicationId;
                    AuthenticationType               = "Managed";
                    CertificateThumbprint            = $CertificateThumbprint;
                    Ensure                           = "Present";
                    Id                               = "contoso.com";
                    IsAdminManaged                   = $True;
                    IsDefault                        = $True;
                    IsRoot                           = $True;
                    IsVerified                       = $True;
                    PasswordNotificationWindowInDays = 14;
                    PasswordValidityPeriodInDays     = 2147483647;
                    TenantId                         = $TenantId;
                }
                AADEntitlementManagementAccessPackage 'myAccessPackage'
                {
                    AccessPackagesIncompatibleWith = @();
                    CatalogId                      = "General";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Description                    = "Integration Tests";
                    DisplayName                    = "Integration Package";
                    Ensure                         = "Present";
                    IsHidden                       = $False;
                    IsRoleScopesVisible            = $True;
                }
                AADEntitlementManagementAccessPackageAssignmentPolicy 'myAssignments'
                {
                    AccessPackageId         = "Integration Package";
                    AccessReviewSettings    = MSFT_MicrosoftGraphassignmentreviewsettings{
                        IsEnabled = $True
                        StartDateTime = '12/17/2022 23:59:59'
                        IsAccessRecommendationEnabled = $True
                        AccessReviewTimeoutBehavior = 'keepAccess'
                        IsApprovalJustificationRequired = $True
                        ReviewerType = 'Self'
                        RecurrenceType = 'quarterly'
                        Reviewers = @()
                        DurationInDays = 25
                    };
                    CanExtend               = $False;
                    Description             = "";
                    DisplayName             = "External tenant";
                    DurationInDays          = 365;
                    RequestApprovalSettings = MSFT_MicrosoftGraphapprovalsettings{
                        ApprovalMode = 'NoApproval'
                        IsRequestorJustificationRequired = $False
                        IsApprovalRequired = $False
                        IsApprovalRequiredForExtension = $False
                    };
                    Ensure                     = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADEntitlementManagementAccessPackageCatalog 'myAccessPackageCatalog'
                {
                    DisplayName         = 'My Catalog'
                    CatalogStatus       = 'Published'
                    CatalogType         = 'UserManaged'
                    Description         = 'Built-in catalog.'
                    IsExternallyVisible = $True
                    Managedidentity     = $False
                    Ensure              = 'Present'
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADGroup 'DependantGroup'
                {
                    DisplayName     = "MyGroup"
                    Description     = "Microsoft DSC Group"
                    SecurityEnabled = $True
                    MailEnabled     = $True
                    GroupTypes      = @("Unified")
                    MailNickname    = "MyGroup"
                    Visibility      = "Private"
                    Ensure          = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADEntitlementManagementAccessPackageCatalogResource 'myAccessPackageCatalogResource'
                {
                    ApplicationId         = $ApplicationId;
                    CatalogId             = "My Catalog";
                    CertificateThumbprint = $CertificateThumbprint;
                    DisplayName           = "MyGroup";
                    OriginSystem          = "AADGroup";
                    OriginId              = 'MyGroup'
                    Ensure                = "Present";
                    IsPendingOnboarding   = $False;
                    TenantId              = $TenantId;
                }
                AADEntitlementManagementConnectedOrganization 'MyConnectedOrganization'
                {
                    Description           = "this is the tenant partner";
                    DisplayName           = "Test Tenant - DSC";
                    ExternalSponsors      = @("AdeleV@$TenantId");
                    IdentitySources       = @(
                        MSFT_AADEntitlementManagementConnectedOrganizationIdentitySource{
                            ExternalTenantId = "e7a80bcf-696e-40ca-8775-a7f85fbb3ebc"
                            DisplayName = 'o365dsc'
                            odataType = '#microsoft.graph.azureActiveDirectoryTenant'
                        }
                    );
                    InternalSponsors      = @("AdeleV@$TenantId");
                    State                 = "configured";
                    Ensure                = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADEntitlementManagementRoleAssignment 'AADEntitlementManagementRoleAssignment-Create'
                {
                    AppScopeId      = "/";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    Ensure          = "Present";
                    Principal       = "AdeleV@$TenantId";
                    RoleDefinition  = "Catalog creator";
                }
                AADFeatureRolloutPolicy 'AADFeatureRolloutPolicy-CertificateBasedAuthentication rollout policy'
                {
                    ApplicationId           = $ApplicationId
                    TenantId                = $TenantId
                    CertificateThumbprint   = $CertificateThumbprint
                    Description             = "CertificateBasedAuthentication rollout policy";
                    DisplayName             = "CertificateBasedAuthentication rollout policy";
                    Ensure                  = "Present";
                    Feature                 = "certificateBasedAuthentication";
                    IsAppliedToOrganization = $False;
                    IsEnabled               = $True;
                }
                AADFederationConfiguration 'MyFederation'
                {
                    IssuerUri                       = 'https://contoso.com/issuerUri'
                    DisplayName                     = 'contoso display name'
                    MetadataExchangeUri             ='https://contoso.com/metadataExchangeUri'
                    PassiveSignInUri                = 'https://contoso.com/signin'
                    PreferredAuthenticationProtocol = 'wsFed'
                    Domains                         = @('contoso.com')
                    SigningCertificate              = 'MIIDADCCAeigAwIBAgIQEX41y8r6'
                    Ensure                          = 'Present'
                    ApplicationId                   = $ApplicationId
                    TenantId                        = $TenantId
                    CertificateThumbprint           = $CertificateThumbprint
                }
                AADFilteringPolicy 'AADFilteringPolicy-MyPolicy'
                {
                    Action                = "block";
                    ApplicationId         = $ApplicationId;
                    CertificateThumbprint = $CertificateThumbprint;
                    Description           = "This is a demo policy";
                    Ensure                = "Present";
                    Name                  = "MyPolicy";
                    TenantId              = $TenantId;
                }
                AADFilteringPolicyRule 'AADFilteringPolicyRule-FQDN'
                {
                    ApplicationId         = $ApplicationId;
                    CertificateThumbprint = $CertificateThumbprint;
                    Destinations          = @(
                        MSFT_AADFilteringPolicyRuleDestination{
                            value = 'Microsoft365DSC.com'
                        }
                    );
                    Ensure                = "Present";
                    Name                  = "MyFQDN";
                    Policy                = "AMyPolicy";
                    RuleType              = "fqdn";
                    TenantId              = $TenantId;
                }
                AADFilteringPolicyRule 'AADFilteringPolicyRule-Web'
                {
                    ApplicationId         = $ApplicationId;
                    CertificateThumbprint = $CertificateThumbprint;
                    Destinations          = @(
                        MSFT_AADFilteringPolicyRuleDestination{
                            name = 'ChildAbuseImages'
                        }
                    );
                    Ensure                = "Present";
                    Name                  = "MyWebContentRule";
                    Policy                = "MyPolicy";
                    RuleType              = "webCategory";
                    TenantId              = $TenantId;
                }
                AADFilteringProfile 'AADFilteringProfile-My Profile'
                {
                    ApplicationId         = $ApplicationId;
                    CertificateThumbprint = $CertificateThumbprint;
                    Description           = "Description of profile";
                    Ensure                = "Present";
                    Name                  = "My PRofile";
                    Policies              = @(
                        MSFT_AADFilteringProfilePolicyLink{
                            Priority = 100
                            LoggingState = 'enabled'
                            PolicyName = 'MyPolicyChoseBine'
                            State = 'enabled'
                        }
                        MSFT_AADFilteringProfilePolicyLink{
                            Priority = 200
                            LoggingState = 'enabled'
                            PolicyName = 'MyTopPolicy'
                            State = 'enabled'
                        }
                    );
                    Priority              = 120;
                    State                 = "enabled";
                    TenantId              = $TenantId;
                }
                AADGroup 'MyGroups'
                {
                    DisplayName     = "DSCGroup"
                    Description     = "Microsoft DSC Group"
                    SecurityEnabled = $True
                    MailEnabled     = $True
                    GroupTypes      = @("Unified")
                    MailNickname    = "M365DSC"
                    Members         = @("admin@$TenantId", "AdeleV@$TenantId")
                    GroupAsMembers  = @("Group1", "Group2")
                    Visibility      = "Private"
                    Owners          = @("admin@$TenantId", "AdeleV@$TenantId")
                    Ensure          = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADGroupEligibilitySchedule 'Example'
                {
                    AccessId              = "member";
                    Ensure                = "Present";
                    GroupDisplayName      = "MyPIMGroup";
                    MemberType            = "direct";
                    PrincipalDisplayname  = "MyPrincipalGroup";
                    PrincipalType         = "group";
                    ScheduleInfo          = MSFT_MicrosoftGraphrequestSchedule{
                        StartDateTime = '2024-12-23T08:59:28.1200000+00:00'
                        Expiration = MSFT_MicrosoftGraphExpirationPattern{
                            EndDateTime = '12/23/2025 8:59:00 AM +00:00'
                            Type = 'afterDateTime'
                        }
                    };
                }
                AADHomeRealmDiscoveryPolicy 'AADHomeRealmDiscoveryPolicy-displayName-value'
                {
                    Definition            = @(
                        MSFT_AADHomeRealDiscoveryPolicyDefinition {
                            PreferredDomain       = 'federated.example.edu'
                            AccelerateToFederatedDomain         = $False
                            AlternateIdLogin = MSFT_AADHomeRealDiscoveryPolicyDefinitionAlternateIdLogin {
                                Enabled = $True
                            }
                        }
                    );
                    DisplayName           = "displayName-value";
                    Ensure                = "Present";
                    IsOrganizationDefault = $False;
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADIdentityAPIConnector 'AADIdentityAPIConnector-TestConnector'
                {
                    DisplayName           = "NewTestConnector";
                    Id                    = "RestApi_NewTestConnector";
                    Username              = "anexas";
                    Password              = New-Object System.Management.Automation.PSCredential('Password', (ConvertTo-SecureString "anexas" -AsPlainText -Force));
                    TargetUrl             = "https://graph.microsoft.com";
                    Ensure                = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADIdentityB2XUserFlow 'AADIdentityB2XUserFlow-B2X_1_TestFlow'
                {
                    ApplicationId             = $ApplicationId
                    TenantId                  = $TenantId
                    CertificateThumbprint     = $CertificateThumbprint
                    ApiConnectorConfiguration = MSFT_MicrosoftGraphuserFlowApiConnectorConfiguration
                    {
                        postAttributeCollectionConnectorName = 'RestApi_f6e8e73d-6b17-433e-948f-f578f12bd57c'
                        postFederationSignupConnectorName = 'RestApi_beeb7152-673c-48b3-b143-9975949a93ca'
                    };
                    Credential                = $Credscredential;
                    Ensure                    = "Present";
                    Id                        = "B2X_1_TestFlow";
                    IdentityProviders         = @("MSASignup-OAUTH","EmailOtpSignup-OAUTH");
                    UserAttributeAssignments  = @(
                        MSFT_MicrosoftGraphuserFlowUserAttributeAssignment
                        {
                            UserInputType = 'textBox'
                            IsOptional = $True
                            DisplayName = 'Email Address'
                            Id = 'emailReadonly'
        
                        }
                        MSFT_MicrosoftGraphuserFlowUserAttributeAssignment
                        {
                            UserInputType = 'dropdownSingleSelect'
                            IsOptional = $True
                            DisplayName = 'Random'
                            Id = 'city'
                            UserAttributeValues = @(
                                MSFT_MicrosoftGraphuserFlowUserAttributeAssignmentUserAttributeValues
                                {
                                    IsDefault = $True
                                    Name = 'S'
                                    Value = '2'
                                }
                                MSFT_MicrosoftGraphuserFlowUserAttributeAssignmentUserAttributeValues
                                {
                                    IsDefault = $True
                                    Name = 'X'
                                    Value = '1'
                                }
                            )
                        }
                        MSFT_MicrosoftGraphuserFlowUserAttributeAssignment{
                            UserInputType = 'textBox'
                            IsOptional = $False
                            DisplayName = 'Piyush1'
                            Id = 'extension_91d51274096941f786b07b9d723d93f4_Piyush1'
        
                        }
                    );
                }
                AADIdentityGovernanceLifecycleWorkflow 'AADIdentityGovernanceLifecycleWorkflow-Onboard pre-hire employee updated version'
                {
                    Category             = "joiner";
                    Description          = "Description the onboard of prehire employee";
                    DisplayName          = "Onboard pre-hire employee updated version";
                    Ensure               = "Present";
                    ExecutionConditions  = MSFT_IdentityGovernanceWorkflowExecutionConditions {
                        ScopeValue = MSFT_IdentityGovernanceScope {
                            Rule = '(not (country eq ''Brazil''))'
                            ODataType = '#microsoft.graph.identityGovernance.ruleBasedSubjectSet'
                        }
                        TriggerValue = MSFT_IdentityGovernanceTrigger {
                            OffsetInDays = 4
                            TimeBasedAttribute = 'employeeHireDate'
                            ODataType = '#microsoft.graph.identityGovernance.timeBasedAttributeTrigger'
                        }
                        ODataType = '#microsoft.graph.identityGovernance.triggerAndScopeBasedConditions'
                    };
                    IsEnabled            = $True;
                    IsSchedulingEnabled  = $False;
                    Tasks                = @(
                        MSFT_AADIdentityGovernanceTask {
                            DisplayName       = 'Add user to groups'
                            Description       = 'Add user to selected groups'
                            Category          = 'joiner,leaver,mover'
                            IsEnabled         = $True
                            ExecutionSequence = 1
                            ContinueOnError   = $True
                            TaskDefinitionId   = '22085229-5809-45e8-97fd-270d28d66910'
                            Arguments         = @(
                                MSFT_AADIdentityGovernanceTaskArguments {
                                    Name  = 'groupID'
                                    Value = '7ad01e00-8c3a-42a6-baaf-39f2390b2565'
                                }
                            )
                        }
                    );
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADIdentityGovernanceLifecycleWorkflowCustomTaskExtension 'AADIdentityGovernanceLifecycleWorkflowCustomTaskExtension-My Custom'
                {
                    ApplicationId         = $ApplicationId;
                    CallbackConfiguration = MSFT_AADIdentityGovernanceLifecycleWorkflowCustomTaskExtensionCallbackConfiguration{
                        TimeoutDuration = 'PT34M'
                        AuthorizedApps = @('M365DSC')
                    };
                    CertificateThumbprint = $CertificateThumbprint;
                    ClientConfiguration   = MSFT_AADIdentityGovernanceLifecycleWorkflowCustomTaskExtensionClientConfiguration{
                        MaximumRetries = 1
                        TimeoutInMilliseconds = 1000
                    };
                    Description           = "My Description";
                    DisplayName           = "My Custom Extension";
                    EndpointConfiguration = MSFT_AADIdentityGovernanceLifecycleWorkflowCustomTaskExtensionEndpointConfiguration{
                        SubscriptionId =       '63e62ab2-fd92-46ce-a393-2cb338039cc7'
                        logicAppWorkflowName = 'MyTestApp'
                        resourceGroupName =    'TestRG'
                        url = 'https://prod-35.eastus.logic.azure.com:443/workflows/xxxxxxxxxxx/triggers/manual/paths/invoke?api-version=2016-10-01'
                    };
                    Ensure                = "Present";
                    TenantId              = $TenantId;
                }
                AADIdentityGovernanceProgram 'AADIdentityGovernanceProgram-Example'
                {
                    ApplicationId           = $ApplicationId
                    TenantId                = $TenantId
                    CertificateThumbprint   = $CertificateThumbprint
                    Description             = "Example Program Description";
                    DisplayName             = "Example";
                    Ensure                  = "Present";
               }
                AADNamedLocationPolicy 'CompanyNetwork'
                {
                    DisplayName = "Company Network"
                    IpRanges    = @("2.1.1.1/32", "1.2.2.2/32")
                    IsTrusted   = $False
                    OdataType   = "#microsoft.graph.ipNamedLocation"
                    Ensure      = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADOrganizationCertificateBasedAuthConfiguration 'AADOrganizationCertificateBasedAuthConfiguration-58b6e58e-10d1-4b8c-845d-d6aefaaecba2'
                {
                    ApplicationId             = $ApplicationId
                    TenantId                  = $TenantId
                    CertificateThumbprint     = $CertificateThumbprint
                    CertificateAuthorities = @(
                        MSFT_MicrosoftGraphcertificateAuthority{
                            IsRootAuthority = $True
        					DeltaCertificateRevocationListUrl = 'pqr.com'
                            Certificate = '<Base64 encoded cert>'
                        }
                        MSFT_MicrosoftGraphcertificateAuthority{
                            IsRootAuthority = $True
                            CertificateRevocationListUrl = 'xyz.com'
                            DeltaCertificateRevocationListUrl = 'pqr.com'
                            Certificate = '<Base64 encoded cert>'
                        }
                    );
                    Ensure                 = "Present";
                    OrganizationId         = "e91d4e0e-d5a5-4e3a-be14-2192592a59af";
                }
                AADRemoteNetwork 'AADRemoteNetwork-Test Remote Network'
                {
                    Ensure                = "Present";
                    ForwardingProfiles    = @("Microsoft 365 traffic forwarding profile");
                    Id                    = "c60c41bb-e512-48e3-8134-c312439a5343";
                    Name                  = "Test Remote Network";
                    Region                = "australiaSouthEast";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    DeviceLinks           = @(
                        MSFT_AADRemoteNetworkDeviceLink {
                            Name                    = 'Test Link'
                            IPAddress               = '1.1.1.1'
                            BandwidthCapacityInMbps = 'mbps500'
                            DeviceVendor            = 'ciscoCatalyst'
                            BgpConfiguration        = MSFT_AADRemoteNetworkDeviceLinkbgpConfiguration {
                                Asn                 = 82
                                LocalIPAddress      = '1.1.1.87'
                                PeerIPAddress       = '1.1.1.2'
                            }
                            RedundancyConfiguration = MSFT_AADRemoteNetworkDeviceLinkRedundancyConfiguration {
                                RedundancyTier      = 'zoneRedundancy'
                                ZoneLocalIPAddress  = '1.1.1.8'
                            }
                            TunnelConfiguration     = MSFT_AADRemoteNetworkDeviceLinkTunnelConfiguration {
                                PreSharedKey               = 'blah'
                                ZoneRedundancyPreSharedKey = 'blah'
                                SaLifeTimeSeconds          = 300
                                IPSecEncryption            = 'gcmAes192'
                                IPSecIntegrity             = 'gcmAes192'
                                IKEEncryption              = 'aes192'
                                IKEIntegrity               = 'gcmAes128'
                                DHGroup                    = 'ecp256'
                                PFSGroup                   = 'pfsmm'
                                ODataType                  = '#microsoft.graph.networkaccess.tunnelConfigurationIKEv2Custom'
                            }
                        }
                    );
                }
                AADRoleAssignmentScheduleRequest 'MyRequest'
                {
                    Action               = "AdminAssign";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    DirectoryScopeId     = "/";
                    Ensure               = "Present";
                    IsValidationOnly     = $False;
                    Principal            = "AdeleV@$TenantId";
                    RoleDefinition       = "Teams Communications Administrator";
                    ScheduleInfo         = MSFT_AADRoleAssignmentScheduleRequestSchedule {
                        startDateTime             = '2023-09-01T02:40:44Z'
                        expiration                = MSFT_AADRoleAssignmentScheduleRequestScheduleExpiration
                            {
                                endDateTime = '2025-10-31T02:40:09Z'
                                type        = 'afterDateTime'
                            }
                    };
                }
                AADRoleDefinition 'AADRoleDefinition1'
                {
                    DisplayName                   = "DSCRole1"
                    Description                   = "DSC created role definition"
                    ResourceScopes                = "/"
                    IsEnabled                     = $true
                    RolePermissions               = "microsoft.directory/applicationPolicies/allProperties/read","microsoft.directory/applicationPolicies/allProperties/update","microsoft.directory/applicationPolicies/basic/update"
                    Version                       = "1.0"
                    Ensure                        = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADRoleEligibilityScheduleRequest 'MyRequest'
                {
                    Action               = "AdminAssign";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    DirectoryScopeId     = "/";
                    Ensure               = "Present";
                    IsValidationOnly     = $False;
                    Principal            = "AdeleV@$TenantId";
                    RoleDefinition       = "Teams Communications Administrator";
                    ScheduleInfo         = MSFT_AADRoleEligibilityScheduleRequestSchedule {
                        startDateTime             = '2023-09-01T02:40:44Z'
                        expiration                = MSFT_AADRoleEligibilityScheduleRequestScheduleExpiration
                            {
                                endDateTime = '2025-10-31T02:40:09Z'
                                type        = 'afterDateTime'
                            }
                    };
                }
                AADServicePrincipal 'AADServicePrincipal'
                {
                    AppId                         = 'AppDisplayName'
                    DisplayName                   = "AppDisplayName"
                    AlternativeNames              = "AlternativeName1","AlternativeName2"
                    AccountEnabled                = $true
                    AppRoleAssignmentRequired     = $false
                    Homepage                      = "https://$TenantId"
                    LogoutUrl                     = "https://$TenantId/logout"
                    ReplyURLs                     = "https://$TenantId"
                    ServicePrincipalType          = "Application"
                    Tags                          = "{WindowsAzureActiveDirectoryIntegratedApp}"
                    Ensure                        = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADSocialIdentityProvider 'AADSocialIdentityProvider-Google'
                {
                    ClientId             = "Google-OAUTH";
                    ClientSecret         = "FakeSecret";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                    DisplayName          = "My Google Provider";
                    Ensure               = "Present";
                    IdentityProviderType = "Google";
                }
                AADTokenLifetimePolicy 'CreateTokenLifetimePolicy'
                {
                    DisplayName           = "PolicyDisplayName"
                    Definition            = @("{`"TokenLifetimePolicy`":{`"Version`":1,`"AccessTokenLifetime`":`"02:00:00`"}}");
                    IsOrganizationDefault = $false
                    Ensure                = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADUser 'ConfigureJohnSMith'
                {
                    UserPrincipalName  = "John.Smith@$TenantId"
                    FirstName          = "John"
                    LastName           = "Smith"
                    DisplayName        = "John J. Smith"
                    City               = "Gatineau"
                    Country            = "Canada"
                    Office             = "Ottawa - Queen"
                    UsageLocation      = "US"
                    Ensure             = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADUserFlowAttribute 'SaiTest'
                {
                    Id                 = "testIdSai"
                    DisplayName        = "saitest"
                    Description        = "sai test description"
                    DataType           = "string"
                    Ensure             = "Present"
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADVerifiedIdAuthority 'AADVerifiedIdAuthority-Contoso'
                {
                    DidMethod            = "web";
                    Ensure               = "Present";
                    KeyVaultMetadata     = MSFT_AADVerifiedIdAuthorityKeyVaultMetadata{
                        SubscriptionId = '2ff65b89-ab22-4489-b84d-e60d1dc30a62'
                        ResourceName = 'xtakeyvault'
                        ResourceUrl = 'https://xtakeyvault.vault.azure.net/'
                        ResourceGroup = 'TBD'
                    };
                    LinkedDomainUrl      = "https://nik-charlebois.com/";
                    Name                 = "Contoso";
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
                AADVerifiedIdAuthorityContract 'AADVerifiedIdAuthorityContract-Sample Custom Verified Credentials'
                {
                    displays             = @(
                        MSFT_AADVerifiedIdAuthorityContractDisplayModel{
                            consent = MSFT_AADVerifiedIdAuthorityContractDisplayConsent{
                                instructions = 'Sign in with your account to get your card.'
                                title = 'Do you want to get your Verified Credential?'
                            }
                            card = MSFT_AADVerifiedIdAuthorityContractDisplayCard{
                                description = 'Use your verified credential to prove to anyone that you know all about verifiable credentials.'
                                issuedBy = 'Microsoft'
                                backgroundColor = '#000000'
                                textColor = '#ffffff'
                                logo = MSFT_AADVerifiedIdAuthorityContractDisplayCredentialLogo{
                                    uri = 'https://didcustomerplayground.z13.web.core.windows.net/VerifiedCredentialExpert_icon.png'
                                    description = 'Verified Credential Expert Logo'
                                }
                                title = 'Verified Credential Expert'
                            }
                            locale = 'en-US'
                            claims = @(
                                MSFT_AADVerifiedIdAuthorityContractDisplayClaims{
                                    label = 'First name'
                                    claim = 'vc.credentialSubject.firstName'
                                    type = 'String'
                                }
                                MSFT_AADVerifiedIdAuthorityContractDisplayClaims{
                                    label = 'Last name'
                                    claim = 'vc.credentialSubject.lastName'
                                    type = 'String'
                                }
                            )
        
                        }
                    );
                    Ensure               = "Present";
                    linkedDomainUrl      = "https://$OrganizationName/";
                    name                 = "Sample Custom Verified Credentials";
                    rules                = MSFT_AADVerifiedIdAuthorityContractRulesModel{
                        validityInterval = 2592000
                        vc = MSFT_AADVerifiedIdAuthorityContractVcType{
                            type = @('VerifiedCredentialExpert')
                        }
                                    attestations = MSFT_AADVerifiedIdAuthorityContractAttestations{
                            idTokenHints = @(
                                MSFT_AADVerifiedIdAuthorityContractAttestationValues{
                                    mapping = @(
                                        MSFT_AADVerifiedIdAuthorityContractClaimMapping{
                                            inputClaim = '$.given_name'
                                            indexed = $False
                                            outputClaim = 'firstName'
                                            required = $True
                                        }
                                        MSFT_AADVerifiedIdAuthorityContractClaimMapping{
                                            inputClaim = '$.family_name'
                                            indexed = $True
                                            outputClaim = 'lastName'
                                            required = $True
                                        }
                                    )
                                    required = $False
                                }
                            )
        
                        }
                    
                    };
                    ApplicationId         = $ApplicationId
                    TenantId              = $TenantId
                    CertificateThumbprint = $CertificateThumbprint
                }
        }
    }

    $ConfigurationData = @{
        AllNodes = @(
            @{
                NodeName                    = "Localhost"
                PSDSCAllowPlaintextPassword = $true
            }
        )
    }

    # Compile and deploy configuration
    try
    {
        Master -ConfigurationData $ConfigurationData -ApplicationId $ApplicationId -TenantId $TenantId -CertificateThumbprint $CertificateThumbprint
        Start-DscConfiguration Master -Wait -Force -Verbose -ErrorAction Stop
    }
    catch
    {
        throw $_
    }
