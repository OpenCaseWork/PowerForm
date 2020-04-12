Class PfDefinitionAz : PfDefinition{
    [PfPlatform]$Platform = [PfPlatform]::Azure

    PfDefinitionAz() : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options")
    }
    PfDefinitionAz([PfDeploymentBuild]$PfDeploymentBuild) : base(){
        $this.Options = (New-Object -TypeName "$($this.ClassPrefix)Options" -ArgumentList $PfDeploymentBuild)
    }
}

Class PfOptionsAz : PfOptions {
    [System.Collections.Generic.Dictionary[string,string]]$Tags = [System.Collections.Generic.Dictionary[string,string]]::new()
    [int]$IterationNumber=1
    #[AzLock]$Lock
    #[AzLogging]$Logging

    PfOptionsAz() : base(){}
    PfOptionsAz([PfDeploymentBuild]$PfDeploymentBuild)  : base() {
        $this.Name = Get-PfNameFromContextAz -ClassPrefix $this.ClassPrefix -PfDeploymentBuild $PfDeploymentBuild
    }
}

Class PfStateAz : PfState{
    [PfPlatform]$Platform = [PfPlatform]::Azure
    PfStateAz() : base(){}
}