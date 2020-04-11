Class PfManagementGroupDefinition : PfResourceContainerDefinitionAz{
    PfManagementGroupDefinition() : base() {}
    PfManagementGroupDefinition([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfManagementGroupOptions : PfResourceContainerOptionsAz {
    [string]$ParentManagementGroupName
    [PfResourceContainerDefinitionAz]$ParentManagementGroupDefinition
    PfManagementGroupOptions(){}
    PfManagementGroupOptions([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfManagementGroupState : PfResourceContainerStateAz{
    [string]$ParentManagementGroupName
    PfManagementGroupState(){}
}