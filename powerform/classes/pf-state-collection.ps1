Class PfStateCollection{
    [System.Collections.ArrayList]$States=@()
    
    PfStateCollection(){}

    [PfState]GetByName([string]$Name){
        #todo:  Just an example for now, but this could return an arraylist if multiple with same name.  Need to handle
        $resourceState = $this.ResourceStates | Where { $_.Name -eq $Name }
        return $resourceState
    }
    [void]Add([PfState]$ResourceState){
        $this.States.Add($ResourceState)
    }
}