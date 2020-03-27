
Class AzCloudContext : PfCloudContext{
    [string]$SubscriptionName
    [string]$ResourceGroupName

    AzCloudContext([string]$SubscriptionName,[string]$ResourceGroupName){
        $this.SubscriptionName=$SubscriptionName
        $this.ResourceGroupName=$ResourceGroupName
    }
}