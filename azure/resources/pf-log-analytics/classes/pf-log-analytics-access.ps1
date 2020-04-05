Class PfLogAnalyticsAccess : BaseAzResourceAccess {

    PfLogAnalyticsAccess() : base(){}
    PfLogAnalyticsAccess([PfLogAnalyticsDefinition]$PfLogAnalyticsDefinition) : base([PfLogAnalyticsDefinition]$PfLogAnalyticsDefinition){}

    [PfLogAnalyticsState]GetOrSet(){
        Write-Host("Creating or Getting Log Analytics: $($this.ResourceDefinition.Options.Name)")
        
        $options = $this.ResourceDefinition.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for Log Analytics: $options ")

        $state = [PfLogAnalyticsState]::new()
        $state.Name=$this.ResourceDefinition.Options.Name
        $state.SubscriptionName=$this.ResourceDefinition.Options.SubscriptionName
        $state.ResourceGroupName=$this.ResourceDefinition.Options.ResourceGroupName
        return $state
    }
    [PfLogAnalyticsState]GetState([string]$Name,[string]$SubscriptionName,[string]$ResourceGroupName){
        Write-Host("Getting Log Analytics Cloud State: $($Name)")
        
        $state = [PfLogAnalyticsState]::new()
        $state.Name=$Name
        $state.SubscriptionName=$SubscriptionName
        $state.ResourceGroupName=$ResourceGroupName
        return $state
    }
}