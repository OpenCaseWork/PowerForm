Class PfSubscriptionBuildState : PfResourceContainer{
    [PfSubscriptionOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    PfSubscriptionBuildState() {
        $this.Options = (New-Object -TypeName "PfSubscriptionOptions")
    }
    PfSubscriptionBuildState([PfAzureContext]$PfAzureContext){
        $this.Options = (New-Object -TypeName "PfSubscriptionOptions" -ArgumentList $PfAzureContext)
    }
}