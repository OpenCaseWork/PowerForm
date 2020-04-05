Class PfResourceGroupDefinition : PfResourceContainer{
    [PfResourceGroupOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    PfResourceGroupDefinition() {
        $this.Options = (New-Object -TypeName "PfResourceGroupOptions")
    }
    PfResourceGroupDefinition([PfAzureContext]$PfAzureContext){
        $this.Options = (New-Object -TypeName "PfResourceGroupOptions" -ArgumentList $PfAzureContext)
    }
}