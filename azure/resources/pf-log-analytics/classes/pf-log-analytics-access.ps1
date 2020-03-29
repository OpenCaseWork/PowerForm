Class PfLogAnalyticsAccess : BaseAzResourceAccess {

    PfLogAnalyticsAccess() : base(){}
    PfLogAnalyticsAccess([PfLogAnalyticsBuildState]$PfLogAnalyticsBuildState) : base([PfLogAnalyticsBuildState]$PfLogAnalyticsBuildState){}

    [PfLogAnalyticsCloudState]GetOrSet(){
        Write-Host("Creating or Getting Log Analytics: $($this.ResourceBuildState.Options.Name)")
        
        $options = $this.ResourceBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for Log Analytics: $options ")

        $cloudState = [PfLogAnalyticsCloudState]::new()
        $cloudState.Name=$this.ResourceBuildState.Options.Name
        $cloudState.SubscriptionName=$this.ResourceBuildState.Options.SubscriptionName
        $cloudState.ResourceGroupName=$this.ResourceBuildState.Options.ResourceGroupName
        return $cloudState
    }
    [PfLogAnalyticsCloudState]GetCloudState([string]$Name,[string]$SubscriptionName,[string]$ResourceGroupName){
        Write-Host("Getting Log Analytics Cloud State: $($Name)")
        
        $cloudState = [PfLogAnalyticsCloudState]::new()
        $cloudState.Name=$Name
        $cloudState.SubscriptionName=$SubscriptionName
        $cloudState.ResourceGroupName=$ResourceGroupName
        return $cloudState
    }
}