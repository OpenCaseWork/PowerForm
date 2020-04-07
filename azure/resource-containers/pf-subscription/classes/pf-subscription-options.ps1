Class PfSubscriptionOptions : BaseAzResourceContainerOptions {
    [string]$OwnerObjectId
    [string]$EnrollmentAccountObjectId
    [string]$ManagementGroupName
    [BaseAzResourceContainerDefinition]$ManagementGroupDefinition
    [string]$OfferType

    PfSubscriptionOptions(){}
    PfSubscriptionOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}