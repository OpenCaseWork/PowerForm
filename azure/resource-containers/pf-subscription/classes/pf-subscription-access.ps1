Class PfSubscriptionAccess{
    [PfSubscriptionBuildState]$SubscriptionBuildState
    
    PfSubscriptionAccess(){}
    PfSubscriptionAccess([PfSubscriptionBuildState]$SubscriptionBuildState){
        $this.SubscriptionBuildState=$SubscriptionBuildState
    }

    [PfSubscriptionCloudState]GetOrSet(){
        Write-Host("Creating or Getting Subscription: $($this.SubscriptionBuildState.Options.Name)")
        
        $options = $this.SubscriptionBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for Subscription: $options ")

        $cloudState = [PfSubscriptionCloudState]::new()
        $cloudState.Name=$this.SubscriptionBuildState.Options.Name
        return $cloudState
    }
    [PfSubscriptionCloudState]GetCloudState([string]$Name){
        Write-Host("Getting Subscription Cloud State: $($Name)")
        $cloudState = [PfSubscriptionCloudState]::new()
        $cloudState.Name=$Name
        return $cloudState
    }
}