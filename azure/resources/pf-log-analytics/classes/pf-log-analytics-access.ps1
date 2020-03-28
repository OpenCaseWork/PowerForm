Class PfLogAnalyticsAccess : BaseAzResourceAccess {

    PfLogAnalyticsAccess([PfLogAnalyticsBuildState]$PfLogAnalyticsBuildState) : base([PfLogAnalyticsBuildState]$PfLogAnalyticsBuildState){}

    [void]GetOrSet(){
        Write-Host("Creating or Getting Log Analytics: $($this.ResourceBuildState.Options.Name)")
        
        $options = $this.ResourceBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for Log Analytics: $options ")
    }
}