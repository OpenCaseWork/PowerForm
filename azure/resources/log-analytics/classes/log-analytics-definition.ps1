Class LogAnalyticsBuildState : BaseAzResourceBuildState{
    LogAnalyticsBuildState(){}
}
Class LogAnalyticsCloudState : BaseAzResourceCloudState{
    LogAnalyticsCloudState(){}
}
Class LogAnalyticsLoadedState : BaseAzResourceLoadedState{
    LogAnalyticsLoadedState(){}
}
Class LogAnalyticsDefinition : BaseAzResourceDefinition{
    LogAnalyticsDefinition() : base([AzResourceTypes]::LogAnalytics){}
    LogAnalyticsDefinition([LogAnalyticsOptions]$LogAnalyticsOptions) : base([LogAnalyticsOptions]$LogAnalyticsOptions,[AzResourceTypes]::LogAnalytics){}
}