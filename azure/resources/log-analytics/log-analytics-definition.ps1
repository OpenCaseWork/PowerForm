Class LogAnalyticsOptions : AzureResourceOptions {
    LogAnalyticsOptions(){}
}
Class LogAnalyticsBuildState : AzureResourceBuildState{
    LogAnalyticsBuildState(){}
}
Class LogAnalyticsCloudState : AzureResourceCloudState{
    LogAnalyticsCloudState(){}
}
Class LogAnalyticsLoadedState : AzureResourceLoadedState{
    LogAnalyticsLoadedState(){}
}
Class LogAnalyticsDefinition : AzureResourceDefinition{
    LogAnalyticsDefinition([ResourceGroupDefinition]$ResourceGroupDefinition) : base([ResourceGroupDefinition]$ResourceGroupDefinition,[AzureResourceTypes]::LogAnalytics) {}
    LogAnalyticsDefinition([string]$SubscriptionName, [string]$ResourceGroupName) : base([string]$SubscriptionName, [string]$ResourceGroupName,[AzureResourceTypes]::LogAnalytics){}
    LogAnalyticsDefinition([ResourceGroupDefinition]$ResourceGroupDefinition, [LogAnalyticsOptions]$LogAnalyticsOptions) : base([ResourceGroupDefinition]$ResourceGroupDefinition, [LogAnalyticsOptions]$LogAnalyticsOptions,[AzureResourceTypes]::LogAnalytics){}
    LogAnalyticsDefinition([string]$SubscriptionName, [string]$ResourceGroupName, [LogAnalyticsOptions]$LogAnalyticsOptions) : base([string]$SubscriptionName, [string]$ResourceGroupName, [LogAnalyticsOptions]$LogAnalyticsOptions,[AzureResourceTypes]::LogAnalytics){}
}