Class BaseAzResourceBuildState{
    [BaseAzResourceOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    BaseAzResourceBuildState([AzResourceType]$AzResourceType){
        $this.Options = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Options")
    }
    BaseAzResourceBuildState([BaseAzResourceOptions]$BaseAzResourceOptions, [AzResourceType]$AzResourceType){
        $this.Options = $BaseAzResourceOptions
    }
}