Class PfResourceGroupAccess{
    [PfResourceGroupBuildState]$ResourceGroupBuildState
    
    PfResourceGroupAccess(){}
    PfResourceGroupAccess([PfResourceGroupBuildState]$ResourceGroupBuildState){
        $this.ResourceGroupBuildState=$ResourceGroupBuildState
    }

    [PfResourceGroupCloudState]GetOrSet(){
        Write-Host("Creating or Getting ResourceGroup: $($this.ResourceGroupBuildState.Options.Name)")
        
        $options = $this.ResourceGroupBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for ResourceGroup: $options ")

        $cloudState = [PfResourceGroupCloudState]::new()
        $cloudState.Name=$this.ResourceGroupBuildState.Options.Name
        return $cloudState
    }
    [PfResourceGroupCloudState]GetCloudState([string]$Name,[string]$SubscriptionName){
        Write-Host("Getting ResourceGroup Cloud State: $($Name)")
        $cloudState = [PfResourceGroupCloudState]::new()
        $cloudState.Name=$Name
        $cloudState.SubscriptionName=$SubscriptionName
        return $cloudState
    }
}