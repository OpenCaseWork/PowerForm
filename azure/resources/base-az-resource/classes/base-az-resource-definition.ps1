Class BaseAzResourceDefinition : PfDefinition{
    [BaseAzResourceOptions]$Options
    [PfDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    BaseAzResourceDefinition() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    BaseAzResourceDefinition([PfAzureContext]$PfAzureContext) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfAzureContext)
    }
}