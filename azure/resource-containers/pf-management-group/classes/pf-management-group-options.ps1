Class PfManagementGroupOptions : BaseAzResourceContainerOptions {
    [string]$ParentManagementGroupName
    [BaseAzResourceContainerDefinition]$ParentManagementGroupDefinition
    PfManagementGroupOptions(){}
    PfManagementGroupOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}