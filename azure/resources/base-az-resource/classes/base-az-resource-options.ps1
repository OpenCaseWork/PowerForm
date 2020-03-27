Class BaseAzResourceOptions {
    [string]$Name
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [hashtable]$Tags
    [int]$ResourceNumber=1
    [AzLock]$Lock
    [AzLogging]$Logging
    [bool]$PersistState=$true

    BaseAzResourceOptions(){}
    BaseAzResourceOptions([PfAzureContext]$PfAzureContext){
        $this.ResourceGroupName=$PfAzureContext.ResourceGroupName
        $this.SubscriptionName=$PfAzureContext.SubscriptionName
    }
}