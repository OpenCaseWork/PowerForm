Class PfManagementGroupDefinition : BaseAzResourceContainerDefinition{
    PfManagementGroupDefinition() : base() {}
    PfManagementGroupDefinition([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}

    [PfManagementGroupState]Deploy(){
        $state = Deploy-PfManagementGroup -Definition $this
        return $state
    }
}