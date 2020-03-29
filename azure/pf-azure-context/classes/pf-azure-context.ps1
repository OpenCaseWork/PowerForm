Class PfAzureContext : PfCloudContext{
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [AzRegion]$AzRegion
    [string]$Label
    [string]$CompanyAbbreviation
    [string]$GroupAbbreviation
    [string]$EnvironmentLetter

    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName,[AzRegion]$AzRegion){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
        $this.AzRegion=$AzRegion
    }
    PfAzureContext([string]$CompanyAbbreviation,[string]$GroupAbbreviation,[string]$Label,[string]$EnvironmentLetter,[AzRegion]$AzRegion){
        $this.CompanyAbbreviation=$CompanyAbbreviation
        $this.GroupAbbreviation=$GroupAbbreviation
        $this.EnvironmentLetter=$EnvironmentLetter
        $this.Label=$Label
        $this.AzRegion=$AzRegion
    }
    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName,[string]$CompanyAbbreviation,[string]$GroupAbbreviation,[string]$Label,[string]$EnvironmentLetter,[AzRegion]$AzRegion){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
        $this.CompanyAbbreviation=$CompanyAbbreviation
        $this.GroupAbbreviation=$GroupAbbreviation
        $this.EnvironmentLetter=$EnvironmentLetter
        $this.Label=$Label
        $this.AzRegion=$AzRegion
    }

}