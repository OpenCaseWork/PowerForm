Class BaseAzResourceOptions : PfOptions {
    [string]$Name
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [AzRegion]$AzRegion
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [int]$ResourceNumber=1
    [AzLock]$Lock
    [AzLogging]$Logging
    [bool]$PersistState=$true

    BaseAzResourceOptions() : base(){}
    BaseAzResourceOptions([PfAzureContext]$PfAzureContext) : base(){
        $this.SetResourceGroupName([PfAzureContext]$PfAzureContext)
        $this.SetSubscriptionName([PfAzureContext]$PfAzureContext)
        $this.SetName([PfAzureContext]$PfAzureContext)
        $this.AzRegion=$PfAzureContext.AzRegion
    }
    [void]SetResourceGroupName([PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.ResourceGroupName)){
            $this.ResourceGroupName=$PfAzureContext.ResourceGroupName
        }else{
            $this.ResourceGroupName=[AzNamingStandards]::GetResourceGroupName($PfAzureContext)
        }
    }
    [void]SetSubscriptionName([PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.SubscriptionName)){
            $this.SubscriptionName=$PfAzureContext.SubscriptionName
        }else{
            $this.SubscriptionName=[AzNamingStandards]::GetSubscriptionName($PfAzureContext)
        }
    }
    [void]SetName([PfAzureContext]$PfAzureContext){
        if($PfAzureContext.CompanyInfo){
            $this.Name=[AzNamingStandards]::GetResourceName($this.ClassPrefix,$PfAzureContext)
        }
    }
}