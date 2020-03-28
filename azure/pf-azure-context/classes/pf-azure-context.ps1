Class PfAzureContext : PfCloudContext{
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [string]$Region
    [string]$Label
    [string]$CompanyAbbreviation
    [string]$GroupAbbreviation
    [string]$EnvironmentLetter

    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName,[string]$Region){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
        $this.Region=$Region
    }
    PfAzureContext([string]$CompanyAbbreviation,[string]$GroupAbbreviation,[string]$Label,[string]$EnvironmentLetter,[string]$Region){
        $this.CompanyAbbreviation=$CompanyAbbreviation
        $this.GroupAbbreviation=$GroupAbbreviation
        $this.EnvironmentLetter=$EnvironmentLetter
        $this.Label=$Label
        $this.Region=$Region
    }
    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName,[string]$CompanyAbbreviation,[string]$GroupAbbreviation,[string]$Label,[string]$EnvironmentLetter,[string]$Region){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
        $this.CompanyAbbreviation=$CompanyAbbreviation
        $this.GroupAbbreviation=$GroupAbbreviation
        $this.EnvironmentLetter=$EnvironmentLetter
        $this.Label=$Label
        $this.Region=$Region
    }

}