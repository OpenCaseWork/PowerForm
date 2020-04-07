Class BaseAzResourceDefinition : PfDefinition{
    BaseAzResourceDefinition() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    BaseAzResourceDefinition([PfBuildContext]$PfBuildContext) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfBuildContext)
    }
}