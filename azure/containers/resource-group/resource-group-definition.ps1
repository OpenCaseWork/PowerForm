Class ResourceGroupOptions {
    [hashtable]$Tags
    [AzureLock]$Lock
    [AzureLogging]$Logging
    [string]$SubscriptionName
    [bool]$PersistState=$true

    ResourceGroupOptions(){}
}
Class ResourceGroupBuildState{
    [string]$Name
    [ResourceGroupOptions]$Options
    [AzureSecurityDefinition]$Security

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
    [SubscriptionDefinition]$SubscriptionDefinition

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
        $this.CloudState = [ResourceGroupCloudState]::new()
        $this.LoadedState = [ResourceGroupLoadedState]::new()
    }
}