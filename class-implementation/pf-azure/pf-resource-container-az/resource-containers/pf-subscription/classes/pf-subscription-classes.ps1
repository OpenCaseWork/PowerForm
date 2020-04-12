Class PfSubscriptionDefinition : PfResourceContainerDefinitionAz{
    PfSubscriptionDefinition() : base() {}
    PfSubscriptionDefinition([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfSubscriptionOptions : PfResourceContainerOptionsAz {
    [string]$OwnerObjectId
    [string]$EnrollmentAccountObjectId
    [string]$ManagementGroupName
    [PfResourceContainerDefinitionAz]$ManagementGroupDefinition
    [string]$OfferType

    PfSubscriptionOptions(){}
    PfSubscriptionOptions([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfSubscriptionState : PfResourceContainerStateAz{
    [string]$ManagementGroupName
    PfSubscriptionState(){}
}