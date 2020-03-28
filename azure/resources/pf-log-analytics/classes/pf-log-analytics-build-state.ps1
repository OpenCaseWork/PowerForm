Class PfLogAnalyticsBuildState : BaseAzResourceBuildState{
    PfLogAnalyticsBuildState() : base([AzResourceTypes]::LogAnalytics){}
    PfLogAnalyticsBuildState([PfAzureContext]$PfAzureContext) : base([PfAzureContext]$PfAzureContext,[AzResourceTypes]::LogAnalytics){}
}