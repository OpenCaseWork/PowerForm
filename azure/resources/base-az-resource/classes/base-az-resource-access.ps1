Class BaseAzResourceAccess : PfResource{
    [BaseAzResourceBuildState]$ResourceBuildState
    
    BaseAzResourceAccess() : base(){}
    BaseAzResourceAccess([BaseAzResourceBuildState]$ResourceBuildState) : base(){
        $this.ResourceBuildState=$ResourceBuildState
    }
}