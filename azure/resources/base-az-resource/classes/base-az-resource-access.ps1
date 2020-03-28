Class BaseAzResourceAccess : PfResourceAccess{
    [BaseAzResourceBuildState]$ResourceBuildState
    
    BaseAzResourceAccess(){}
    BaseAzResourceAccess([BaseAzResourceBuildState]$ResourceBuildState){
        $this.ResourceBuildState=$ResourceBuildState
    }
}