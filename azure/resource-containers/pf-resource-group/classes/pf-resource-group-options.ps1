Class PfResourceGroupOptions : BaseAzResourceContainerOptions {
    [string]$SubscriptionName
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [PfConfigRegion]$Region
    #[AzLock]$Lock
    
    PfResourceGroupOptions(){}
    PfResourceGroupOptions([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}
}