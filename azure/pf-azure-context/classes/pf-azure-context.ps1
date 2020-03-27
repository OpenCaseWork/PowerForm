
Class PfAzureContext : PfCloudContext{
    [string]$SubscriptionName
    [string]$ResourceGroupName

    PfAzureContext([string]$SubscriptionName,[string]$ResourceGroupName){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
    }
}