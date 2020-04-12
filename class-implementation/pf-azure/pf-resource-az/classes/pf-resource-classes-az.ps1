Class PfResourceDefinitionAz : PfDefinitionAz{
    PfResourceDefinitionAz() : base(){}
    PfResourceDefinitionAz([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfResourceOptionsAz : PfOptionsAz {
    [string]$SubscriptionName
    [PfResourceContainerDefinitionAz]$SubscriptionDefinition
    [string]$ResourceGroupName
    [PfResourceContainerDefinitionAz]$ResourceGroupDefinition
    [PfConfigRegion]$Region

    PfResourceOptionsAz() : base(){}
    PfResourceOptionsAz([PfDeploymentBuild]$PfDeploymentBuild)  : base([PfDeploymentBuild]$PfDeploymentBuild) {
        $this.SubscriptionName = Get-PfNameFromContextAz -ClassPrefix "PfSubscription" -PfDeploymentBuild $PfDeploymentBuild
        $this.ResourceGroupName = Get-PfNameFromContextAz -ClassPrefix "PfResourceGroup" -PfDeploymentBuild $PfDeploymentBuild
    }
}

Class PfResourceStateAz : PfStateAz{
    [string]$SubscriptionName
    [string]$ResourceGroupName

    PfResourceStateAz() : base(){}
    
}