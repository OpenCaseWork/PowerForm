Class PfLogAnalyticsDefinition : BaseAzResourceDefinition{
    
    PfLogAnalyticsDefinition() : base(){}
    PfLogAnalyticsDefinition([PfLogAnalyticsBuildState]$BuildState,[PfLogAnalyticsCloudState]$CloudState) : base([BaseAzResourceBuildState]$BuildState,[BaseAzResourceCloudState]$CloudState){}
}