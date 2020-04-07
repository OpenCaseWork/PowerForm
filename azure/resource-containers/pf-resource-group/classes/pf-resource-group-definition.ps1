Class PfResourceGroupDefinition : BaseAzResourceContainerDefinition{
    PfResourceGroupDefinition() : base() {}
    PfResourceGroupDefinition([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}

    [PfResourceGroupState]Deploy(){
        $state = Deploy-PfResourceGroup -Definition $this
        return $state
    }

    [void]Save(){
        Save-PfResourceGroup -Definition $this
    }
}