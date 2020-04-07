Class PfLogAnalyticsDefinition : BaseAzResourceDefinition{
    PfLogAnalyticsDefinition() : base() {}
    PfLogAnalyticsDefinition([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}

    [PfLogAnalyticsState]Deploy(){
        $state = Deploy-PfLogAnalytics -Definition $this
        return $state
    }
}