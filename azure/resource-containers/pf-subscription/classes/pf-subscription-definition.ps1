Class PfSubscriptionDefinition : PfResourceContainer{
    [PfSubscriptionOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    PfSubscriptionDefinition() {
        $this.Options = (New-Object -TypeName "PfSubscriptionOptions")
    }
    PfSubscriptionDefinition([PfAzureContext]$PfAzureContext){
        $this.Options = (New-Object -TypeName "PfSubscriptionOptions" -ArgumentList $PfAzureContext)
    }
}