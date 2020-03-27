Class PfLogAnalyticsBuildState : BaseAzResourceBuildState{
    PfLogAnalyticsBuildState() : base([AzResourceTypes]::LogAnalytics){}
    PfLogAnalyticsBuildState([PfLogAnalyticsOptions]$PfLogAnalyticsOptions) : base([PfLogAnalyticsOptions]$PfLogAnalyticsOptions,[AzResourceTypes]::LogAnalytics){}
}