Class PfSubscriptionDefinition : PfResourceContainer{
    [PfSubscriptionBuildState]$BuildState
    [PfSubscriptionCloudState]$CloudState

    PfSubscriptionDefinition(){}
    PfSubscriptionDefinition([PfSubscriptionBuildState]$BuildState,[PfSubscriptionCloudState]$CloudState){
        $this.BuildState=$BuildState
        $this.CloudState=$CloudState
    }
}