Class PfSubscriptionOptions : PfResourceOptionsAz {
    [string]$OwnerObjectId
    [string]$EnrollmentAccountObjectId
    [string]$ManagementGroupName
    [PfResourceDefinitionAz]$ManagementGroupDefinition
    [string]$OfferType

    PfSubscriptionOptions(){}
    PfSubscriptionOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}