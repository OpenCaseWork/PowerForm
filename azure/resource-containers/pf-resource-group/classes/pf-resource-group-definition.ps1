Class PfResourceGroupDefinition{
    [PfResourceGroupBuildState]$BuildState
    [PfResourceGroupCloudState]$CloudState

    PfResourceGroupDefinition(){}
    PfResourceGroupDefinition([PfResourceGroupBuildState]$BuildState,[PfResourceGroupCloudState]$CloudState){
        $this.BuildState=$BuildState
        $this.CloudState=$CloudState
    }
}