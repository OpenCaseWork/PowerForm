Class BaseAzResourceAccess : PfResourceAccess{
    [BaseAzResourceBuildState]$ResourceBuildState
    BaseAzResourceAccess([BaseAzResourceBuildState]$ResourceBuildState){
        $this.ResourceBuildState=$ResourceBuildState
    }
}