Class BaseAzResourceAccess : PfResource{
    [BaseAzResourceBuildState]$ResourceBuildState
    
    BaseAzResourceAccess() : base(){
        #$classPrefix = ($this.GetType()).Name.Replace("Access","")
    }
    BaseAzResourceAccess([BaseAzResourceBuildState]$ResourceBuildState) : base(){
        #$classPrefix = ($this.GetType()).Name.Replace("Access","")
        $this.ResourceBuildState=$ResourceBuildState
    }
}