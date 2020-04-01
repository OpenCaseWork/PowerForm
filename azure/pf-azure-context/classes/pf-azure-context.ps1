Class PfAzureContext : PfCloudContext{
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [AzRegion]$AzRegion
    [PfConfigLabel]$Label
    [PfConfigCompanyInfo]$CompanyInfo
    [PfConfigGroup]$Group
    [PfConfigEnvironment]$Environment

    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName,[AzRegion]$AzRegion){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
        $this.AzRegion=$AzRegion
    }
    PfAzureContext([PfConfigCompanyInfo]$CompanyInfo,[PfConfigGroup]$Group,[PfConfigLabel]$Label,[PfConfigEnvironment]$Environment,[AzRegion]$AzRegion){
        $this.CompanyInfo=$CompanyInfo
        $this.Group=$Group
        $this.Environment=$Environment
        $this.Label=$Label
        $this.AzRegion=$AzRegion
    }
    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName,[PfConfigCompanyInfo]$CompanyInfo,[PfConfigGroup]$Group,[PfConfigLabel]$Label,[PfConfigEnvironment]$Environment,[AzRegion]$AzRegion){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
        $this.CompanyInfo=$CompanyInfo
        $this.Group=$Group
        $this.Environmentr=$Environment
        $this.Label=$Label
        $this.AzRegion=$AzRegion
    }

}