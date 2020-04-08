Class BaseAzResourceContainerDefinition : PfDefinition{
    BaseAzResourceContainerDefinition() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    BaseAzResourceContainerDefinition([PfBuildContext]$PfBuildContext) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfBuildContext)
    }
    [BaseAzResourceContainerState]Deploy(){
        $state = Deploy-BaseAzResourceContainer -Definition $this
        return $state
    }
    [void]Save(){
        Save-BaseAzResourceContainer -Definition $this
    }
}