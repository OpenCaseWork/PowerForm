Class BaseAzResourceDefinition : PfResource{
    [BaseAzResourceBuildState]$BuildState
    [BaseAzResourceCloudState]$CloudState

    BaseAzResourceDefinition() : base(){}
    BaseAzResourceDefinition([BaseAzResourceBuildState]$BuildState,[BaseAzResourceCloudState]$CloudState) : base(){
        $this.BuildState=$BuildState
        $this.CloudState=$CloudState
    }
}