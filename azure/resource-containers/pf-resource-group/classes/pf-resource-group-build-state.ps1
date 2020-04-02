Class PfResourceGroupBuildState : PfResourceContainer{
    [PfResourceGroupOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    PfResourceGroupBuildState() {
        $this.Options = (New-Object -TypeName "PfResourceGroupOptions")
    }
    PfResourceGroupBuildState([PfAzureContext]$PfAzureContext){
        $this.Options = (New-Object -TypeName "PfResourceGroupOptions" -ArgumentList $PfAzureContext)
    }
}