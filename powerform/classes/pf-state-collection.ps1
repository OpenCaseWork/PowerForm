Class PfStateCollection{
    [System.Collections.ArrayList]$States=@()
    
    PfStateCollection(){}

    [PfResourceState]GetByName([string]$Name){
        #todo:  Just an example for now, but this could return an arraylist if multiple with same name.  Need to handle
        $resourceState = $this.States | Where { $_.Name -eq $Name } | Select-Object -First 1
        return $resourceState
    }
    [void]Add([PfResourceState]$ResourceState){
        $this.States.Add($ResourceState)
    }
}