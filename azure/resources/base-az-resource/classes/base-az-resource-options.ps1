Class BaseAzResourceOptions : PfResourceOptions {
    [string]$Name
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [string]$Region
    [hashtable]$Tags
    [int]$ResourceNumber=1
    [AzLock]$Lock
    [AzLogging]$Logging
    [bool]$PersistState=$true

    BaseAzResourceOptions(){}
    BaseAzResourceOptions([PfAzureContext]$PfAzureContext,[AzResourceType]$AzResourceType){
        $this.SetResourceGroupName([PfAzureContext]$PfAzureContext)
        $this.SetSubscriptionName([PfAzureContext]$PfAzureContext)
        $this.SetName([AzResourceType]$AzResourceType,[PfAzureContext]$PfAzureContext)
        $this.Region=$PfAzureContext.Region
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
    [void]SetName([AzResourceType]$AzResourceType,[PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.CompanyAbbreviation)){
            $this.Name=[AzNamingStandards]::GetResourceName($AzResourceType,$PfAzureContext)
        }
    }
}