Class PfManagementGroupOptions : BaseAzResourceContainerOptions {
    [string]$ParentManagementGroupName
    PfManagementGroupOptions(){}
    PfManagementGroupOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}