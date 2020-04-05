Class PfStateCollection{
    [System.Collections.ArrayList]$ResourceContainerStates=@()
    [System.Collections.ArrayList]$ResourceStates=@()
    
    PfStateCollection(){}

    [PfResource]GetResourceByName([string]$Name){
        $resourceState = $this.ResourceStates | Where { $_.Name -eq $Name }
        return $resourceState
    }
    [PfResource]GetResourceContainerByName([string]$Name){
        $resourceContainerState = $this.ResourceContainerStates | Where { $_.Name -eq $Name }
        return $resourceContainerState
    }
    [void]Add([PfResource]$ResourceState){
        $this.ResourceStates.Add($ResourceState)
    }
    [void]Add([PfResourceContainer]$ResourceContainerState){
        $this.ResourceContainerStates.Add($ResourceContainerState)
    }
}