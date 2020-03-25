Class AzureResourceDependency{
    [string]$Key
    [AzureResourceDefinition]$AzureResourceDefinition

    AzureResourceDependency(){}
}
Class AzureResourceOptions {
    [hashtable]$Tags
    [int]$ResourceNumber=1
    [AzureLock]$Lock
    [AzureLogging]$Logging
    [bool]$PersistState=$true
    [string]$ResourceGroupName
    [string]$SubscriptionName
    AzureResourceOptions(){}
}
Class AzureResourceBuildState{
    [string]$Name
    [AzureResourceOptions]$Options
    [AzureResourceDependency[]]$Dependencies
    [AzureSecurityDefinition]$Security

    AzureResourceBuildState(){}
}
Class AzureResourceCloudState{
    [object]$CloudBaseObject
    [object]$CloudObject

    AzureResourceCloudState(){}
}
Class AzureResourceLoadedState{
    [string]$Id
    [string]$Name
    [ResourceGroupDefinition]$ResourceGroupDefinition
    [string]$Scope
    [string]$IdentityId

    AzureResourceLoadedState(){}
}
Class AzureResourceDefinition : PowerFormResourceDefinition{
    [AzureResourceAccess]$Access
    [AzureResourceBuildState]$BuildState
    [AzureResourceCloudState]$CloudState
    [AzureResourceLoadedState]$LoadedState

    AzureResourceDefinition([ResourceGroupDefinition]$ResourceGroupDefinition, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Options")
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
    }
    AzureResourceDefinition([string]$SubscriptionName, [string]$ResourceGroupName, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Options")
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
    }
    AzureResourceDefinition([ResourceGroupDefinition]$ResourceGroupDefinition, [AzureResourceOptions]$AzureResourceOptions, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = $AzureResourceOptions
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
    }
    AzureResourceDefinition([string]$SubscriptionName, [string]$ResourceGroupName, [AzureResourceOptions]$AzureResourceOptions, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = $AzureResourceOptions
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
    }
}