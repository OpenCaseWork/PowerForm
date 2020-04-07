Class BaseAzResourceContainerDefinition : PfDefinition{
    BaseAzResourceContainerDefinition() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    BaseAzResourceContainerDefinition([PfBuildContext]$PfBuildContext) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfBuildContext)
    }
}