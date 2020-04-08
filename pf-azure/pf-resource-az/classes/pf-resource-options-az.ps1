Class PfResourceOptionsAz : PfResourceOptions {
    [string]$SubscriptionName
    [PfResourceDefinition]$SubscriptionDefinition
    [string]$ResourceGroupName
    [PfResourceDefinition]$ResourceGroupDefinition
    [PfConfigRegion]$Region
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [int]$ResourceNumber=1
    #[AzLock]$Lock
    #[AzLogging]$Logging

    PfResourceOptionsAz() : base(){}
    PfResourceOptionsAz([PfBuildContext]$PfBuildContext)  : base() {
        $this.Name = Get-PfAzResourceNameFromContext -ClassPrefix $this.ClassPrefix -PfBuildContext $PfBuildContext
        $this.SubscriptionName = Get-PfAzResourceNameFromContext -ClassPrefix "PfSubscription" -PfBuildContext $PfBuildContext
        $this.ResourceGroupName = Get-PfAzResourceNameFromContext -ClassPrefix "PfResourceGroup" -PfBuildContext $PfBuildContext
    }
}