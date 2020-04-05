Class BaseAzResourceAccess : PfAccess{
    [BaseAzResourceDefinition]$ResourceDefinition
    
    BaseAzResourceAccess() : base(){}
    BaseAzResourceAccess([BaseAzResourceDefinition]$ResourceDefinition) : base(){
        $this.ResourceDefinition=$ResourceDefinition
    }
}