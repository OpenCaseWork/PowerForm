Class PfResultSet{
    [System.Collections.ArrayList]$ResourceDefinitions=@()
    
    PfResultSet(){}

    [PfResourceDefinition]GetByName([string]$Name){
        $resourceDef = $this.ResourceDefinitions | Where { $_.CloudState.Name -eq $Name }
        return $resourceDef
    }
    [void]Add([PfResourceDefinition]$ResourceDefiniton){
        $this.ResourceDefinitions.Add($ResourceDefiniton)
    }
}