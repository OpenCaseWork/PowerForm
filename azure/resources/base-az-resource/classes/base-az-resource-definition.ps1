Class BaseAzResourceDependency{
    [string]$Key
    [BaseAzResourceDefinition]$BaseAzResourceDefinition

    BaseAzResourceDependency(){}
}
Class BaseAzResourceOptions {
    [hashtable]$Tags
    [int]$ResourceNumber=1
    [AzLock]$Lock
    [AzLogging]$Logging
    [bool]$PersistState=$true
    BaseAzResourceOptions(){}
}
Class BaseAzResourceBuildState{
    [string]$Name
    [BaseAzResourceOptions]$Options
    [BaseAzResourceDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    BaseAzResourceBuildState(){}
}
Class BaseAzResourceCloudState{
    [object]$CloudBaseObject
    [object]$CloudObject

    BaseAzResourceCloudState(){}
}
Class BaseAzResourceLoadedState{
    [string]$Id
    [string]$Name
    [string]$Scope
    [string]$IdentityId

    BaseAzResourceLoadedState(){}
}
Class BaseAzResourceDefinition : PowerFormResourceDefinition{
    [BaseAzResourceAccess]$Access
    [BaseAzResourceBuildState]$BuildState
    [BaseAzResourceCloudState]$CloudState
    [BaseAzResourceLoadedState]$LoadedState

    BaseAzResourceDefinition([AzResourceType]$AzResourceType){
        $this.Access = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Options")
        $this.CloudState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)LoadedState")
    }
    BaseAzResourceDefinition([BaseAzResourceOptions]$BaseAzResourceOptions, [AzResourceType]$AzResourceType){
        $this.Access = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = $BaseAzResourceOptions
        $this.CloudState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)LoadedState")
    }
}