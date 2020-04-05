Class PfSubscriptionAccess : PfAccess{
    [PfSubscriptionDefinition]$SubscriptionDefinition
    
    PfSubscriptionAccess(){}
    PfSubscriptionAccess([PfSubscriptionDefinition]$SubscriptionDefinition){
        $this.SubscriptionDefinition=$SubscriptionDefinition
    }

    [PfSubscriptionState]GetOrSet(){
        Write-Host("Creating or Getting Subscription: $($this.SubscriptionDefinition.Options.Name)")
        
        $options = $this.SubscriptionDefinition.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for Subscription: $options ")

        $state = [PfSubscriptionState]::new()
        $state.Name=$this.SubscriptionDefinition.Options.Name
        return $state
    }
    [PfSubscriptionState]GetState([string]$Name){
        Write-Host("Getting Subscription Cloud State: $($Name)")
        $state = [PfSubscriptionState]::new()
        $state.Name=$Name
        return $state
    }
}