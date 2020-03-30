Class BaseAzResourceBuildState : PfResource{
    [BaseAzResourceOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    BaseAzResourceBuildState() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    BaseAzResourceBuildState([PfAzureContext]$PfAzureContext) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfAzureContext)
    }
}