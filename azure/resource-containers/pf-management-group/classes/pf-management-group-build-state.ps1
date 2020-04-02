Class PfManagementGroupBuildState : PfResourceContainer{
    [PfManagementGroupOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    PfManagementGroupBuildState() {
        $this.Options = (New-Object -TypeName "PfManagementGroupOptions")
    }
    PfManagementGroupBuildState([PfAzureContext]$PfAzureContext){
        $this.Options = (New-Object -TypeName "PfManagementGroupOptions" -ArgumentList $PfAzureContext)
    }
}