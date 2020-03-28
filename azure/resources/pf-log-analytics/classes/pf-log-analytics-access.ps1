Class PfLogAnalyticsAccess : BaseAzResourceAccess {

    PfLogAnalyticsAccess() : base(){}
    PfLogAnalyticsAccess([PfLogAnalyticsBuildState]$PfLogAnalyticsBuildState) : base([PfLogAnalyticsBuildState]$PfLogAnalyticsBuildState){}

    [void]GetOrSet(){
        Write-Host("Creating or Getting Log Analytics: $($this.ResourceBuildState.Options.Name)")
        
        $options = $this.ResourceBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for Log Analytics: $options ")
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