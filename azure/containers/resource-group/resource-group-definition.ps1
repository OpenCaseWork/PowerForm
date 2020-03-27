Class ResourceGroupOptions {
    [hashtable]$Tags
    [AzureLock]$Lock
    [AzureLogging]$Logging
    [bool]$PersistState=$true

    ResourceGroupOptions(){}
}
Class ResourceGroupBuildState{
    [string]$Name
    [ResourceGroupOptions]$Options
    [AzureSecurityDefinition]$Security
    [SubscriptionDefinition]$SubscriptionDefinition

    ResourceGroupBuildState(){}
}
Class ResourceGroupCloudState{
    [object]$CloudBaseObject
    [object]$CloudObject

    ResourceGroupCloudState(){}
}
Class ResourceGroupLoadedState{
    [string]$Id
    [string]$Name
    [string]$Scope

    ResourceGroupLoadedState(){}
}
Class ResourceGroupDefinition{
    [ResourceGroupAccess]$Access
    [ResourceGroupBuildState]$BuildState
    [ResourceGroupCloudState]$CloudState
    [ResourceGroupLoadedState]$LoadedState

    ResourceGroupDefinition([string]$SubscriptionName,[string]$ResourceGroupName){
        $this.Access = [ResourceGroupAccess]::new()
        $this.BuildState = [ResourceGroupBuildState]::new()
        $this.BuildState.SubscriptionDefinition=[SubscriptionDefinition]::new($SubscriptionName)
        $this.CloudState = [ResourceGroupCloudState]::new()
        $this.LoadedState = [ResourceGroupLoadedState]::new()
    }
}