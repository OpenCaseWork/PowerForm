Class BaseAzResourceOptions : PfOptions {
    [string]$SubscriptionName
    [BaseAzResourceContainerDefinition]$SubscriptionDefinition
    [string]$ResourceGroupName
    [BaseAzResourceContainerDefinition]$ResourceGroupDefinition
    [PfConfigRegion]$Region
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [int]$ResourceNumber=1
    #[AzLock]$Lock
    #[AzLogging]$Logging

    BaseAzResourceOptions() : base(){}
    BaseAzResourceOptions([PfBuildContext]$PfBuildContext)  : base() {
        $this.Name = Get-PfAzResourceNameFromContext -ClassPrefix $this.ClassPrefix -PfBuildContext $PfBuildContext
        $this.SubscriptionName = Get-PfAzResourceNameFromContext -ClassPrefix "PfSubscription" -PfBuildContext $PfBuildContext
        $this.ResourceGroupName = Get-PfAzResourceNameFromContext -ClassPrefix "PfResourceGroup" -PfBuildContext $PfBuildContext
    }
}