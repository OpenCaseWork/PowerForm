Class PfResultSet{
    [System.Collections.ArrayList]$ResourceDefinitions=@()
    
    PfResultSet(){}

    [PfResource]GetByName([string]$Name){
        $resourceDef = $this.ResourceDefinitions | Where { $_.CloudState.Name -eq $Name }
        return $resourceDef
    }
    [void]Add([PfResource]$ResourceDefiniton){
        $this.ResourceDefinitions.Add($ResourceDefiniton)
    }
}