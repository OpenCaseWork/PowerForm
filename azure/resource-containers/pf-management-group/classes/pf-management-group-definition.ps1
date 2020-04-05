Class PfManagementGroupDefinition : PfDefinition{
    [PfManagementGroupOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    PfManagementGroupDefinition() {
        $this.Options = (New-Object -TypeName "PfManagementGroupOptions")
    }
    PfManagementGroupDefinition([PfAzureContext]$PfAzureContext){
        $this.Options = (New-Object -TypeName "PfManagementGroupOptions" -ArgumentList $PfAzureContext)
    }
}