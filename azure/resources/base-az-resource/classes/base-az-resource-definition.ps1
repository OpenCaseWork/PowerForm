Class BaseAzResourceDefinition : PfResourceDefinition{
    [BaseAzResourceAccess]$Access
    [BaseAzResourceBuildState]$BuildState
    [BaseAzResourceCloudState]$CloudState

    BaseAzResourceDefinition(){}
}