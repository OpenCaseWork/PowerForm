Class PfLogAnalyticsDefinition : BaseAzResourceDefinition{
    PfLogAnalyticsDefinition() : base([AzResourceTypes]::KeyVault){}
    PfLogAnalyticsDefinition([PfLogAnalyticsOptions]$PfLogAnalyticsOptions) : base([PfLogAnalyticsOptions]$PfLogAnalyticsOptions,[AzResourceTypes]::KeyVault){}
}