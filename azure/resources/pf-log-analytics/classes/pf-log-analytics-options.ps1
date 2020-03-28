Class PfLogAnalyticsOptions : BaseAzResourceOptions {
    PfLogAnalyticsOptions(){}
    PfLogAnalyticsOptions([PfAzureContext]$PfAzureContext) : base([PfAzureContext]$PfAzureContext,[AzResourceTypes]::LogAnalytics){}
}