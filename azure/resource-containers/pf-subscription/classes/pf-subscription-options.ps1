Class PfSubscriptionOptions : BaseAzResourceContainerOptions {
    [string]$OwnerObjectId
    [string]$EnrollmentAccountObjectId
    [string]$ManagementGroupName
    [string]$OfferType

    PfSubscriptionOptions(){}
    PfSubscriptionOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}