Class PfResourceGroupOptions : PfOptions {
    [string]$Name
    [string]$SubscriptionName
    [AzRegion]$AzRegion
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [AzLock]$Lock
    [bool]$PersistState=$true

    PfResourceGroupOptions(){}
    PfResourceGroupOptions([PfAzureContext]$PfAzureContext){
        $this.SetName([PfAzureContext]$PfAzureContext)
        $this.SetSubscriptionName([PfAzureContext]$PfAzureContext)
        $this.AzRegion=$PfAzureContext.AzRegion
    }
    [void]SetName([PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.ResourceGroupName)){
            $this.Name=$PfAzureContext.ResourceGroupName
        }else{
            $this.Name=[AzNamingStandards]::GetResourceGroupName($PfAzureContext)
        }
    }
    [void]SetSubscriptionName([PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.SubscriptionName)){
            $this.SubscriptionName=$PfAzureContext.SubscriptionName
        }else{
            $this.SubscriptionName=[AzNamingStandards]::GetSubscriptionName($PfAzureContext)
        }
    }
}