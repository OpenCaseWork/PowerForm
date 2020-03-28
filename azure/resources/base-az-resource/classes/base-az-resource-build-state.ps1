Class BaseAzResourceBuildState : PfResourceBuildState{
    [BaseAzResourceOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security
    [AzResourceType]$AzResourceType

    BaseAzResourceBuildState([AzResourceType]$AzResourceType){
        $this.AzResourceType=$AzResourceType
        $this.Options = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Options")
    }
    BaseAzResourceBuildState([PfAzureContext]$PfAzureContext,[AzResourceType]$AzResourceType){
        $this.AzResourceType=$AzResourceType
        $this.Options = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Options" -ArgumentList $PfAzureContext)
    }
    <#BaseAzResourceBuildState([BaseAzResourceOptions]$BaseAzResourceOptions, [AzResourceType]$AzResourceType){
        $this.AzResourceType=$AzResourceType
        $this.Options = $BaseAzResourceOptions
    }#>
}