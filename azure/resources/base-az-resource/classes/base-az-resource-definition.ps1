Class BaseAzResourceDefinition : PfResourceDefinition{
    [BaseAzResourceBuildState]$BuildState
    [BaseAzResourceCloudState]$CloudState

    BaseAzResourceDefinition(){}
    BaseAzResourceDefinition([BaseAzResourceBuildState]$BuildState,[BaseAzResourceCloudState]$CloudState){
        $this.BuildState=$BuildState
        $this.CloudState=$CloudState
    }
}