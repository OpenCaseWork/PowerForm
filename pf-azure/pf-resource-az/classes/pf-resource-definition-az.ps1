Class PfResourceDefinitionAz : PfResourceDefinition{
    PfResourceDefinitionAz() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    PfResourceDefinitionAz([PfBuildContext]$PfBuildContext) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfBuildContext)
    }
    [PfResourceStateAz]Deploy(){
        $state = Deploy-PfResourceAz -Definition $this
        return $state
    }
    [void]Save(){
        Save-PfResourceAz -Definition $this
    }
}