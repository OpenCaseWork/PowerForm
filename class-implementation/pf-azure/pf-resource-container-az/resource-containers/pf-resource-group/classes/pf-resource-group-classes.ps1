Class PfResourceGroupDefinition : PfResourceContainerDefinitionAz{
    PfResourceGroupDefinition() : base() {}
    PfResourceGroupDefinition([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfResourceGroupOptions : PfResourceContainerOptionsAz {
    [string]$SubscriptionName
    [PfResourceContainerDefinitionAz]$SubscriptionDefinition
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [PfConfigRegion]$Region
    #[AzLock]$Lock
    
    PfResourceGroupOptions(){}
    PfResourceGroupOptions([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfResourceGroupState : PfResourceContainerStateAz{
    [string]$SubscriptionName
    PfResourceGroupState(){}
}