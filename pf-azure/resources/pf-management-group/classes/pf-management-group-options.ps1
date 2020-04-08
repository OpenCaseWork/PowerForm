Class PfManagementGroupOptions : PfResourceOptionsAz {
    [string]$ParentManagementGroupName
    [PfResourceDefinitionAz]$ParentManagementGroupDefinition
    PfManagementGroupOptions(){}
    PfManagementGroupOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}