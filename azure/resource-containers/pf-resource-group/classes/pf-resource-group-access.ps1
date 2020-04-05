Class PfResourceGroupAccess : PfResourceContainer{
    [PfResourceGroupDefinition]$ResourceGroupDefinition
    
    PfResourceGroupAccess(){}
    PfResourceGroupAccess([PfResourceGroupDefinition]$ResourceGroupDefinition){
        $this.ResourceGroupDefinition=$ResourceGroupDefinition
    }

    [PfResourceGroupState]GetOrSet(){
        Write-Host("Creating or Getting ResourceGroup: $($this.ResourceGroupDefinition.Options.Name)")
        
        $options = $this.ResourceGroupDefinition.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for ResourceGroup: $options ")

        $state = [PfResourceGroupState]::new()
        $state.Name=$this.ResourceGroupDefinition.Options.Name
        return $state
    }
    [PfResourceGroupState]GetState([string]$Name,[string]$SubscriptionName){
        Write-Host("Getting ResourceGroup Cloud State: $($Name)")
        $state = [PfResourceGroupState]::new()
        $state.Name=$Name
        $state.SubscriptionName=$SubscriptionName
        return $state
    }
}