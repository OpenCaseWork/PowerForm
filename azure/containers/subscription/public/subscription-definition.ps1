Class SubscriptionOptions {
    [string]$Name
    [hashtable]$Tags
    [AzureLock]$Lock
    [AzureLogging]$Logging
    [bool]$PersistState=$true

    SubscriptionOptions(){}
}
Class SubscriptionBuildState{
    [SubscriptionOptions]$Options
    [AzureSecurityDefinition]$Security

    SubscriptionBuildState(){}
}
Class SubscriptionCloudState{
    [object]$CloudBaseObject
    [object]$CloudObject

    SubscriptionCloudState(){}
}
Class SubscriptionLoadedState{
    [string]$Id
    [string]$Name
    [string]$Scope

    SubscriptionLoadedState(){}
}
Class SubscriptionDefinition{
    [SubscriptionAccess]$Access
    [SubscriptionBuildState]$BuildState
    [SubscriptionCloudState]$CloudState
    [SubscriptionLoadedState]$LoadedState
    [SubscriptionDefinition]$SubscriptionDefinition

    SubscriptionDefinition([string]$SubscriptionName){
        $this.Access = [SubscriptionAccess]::new()
        $this.BuildState = [SubscriptionBuildState]::new()
        $this.CloudState = [SubscriptionCloudState]::new()
        $this.LoadedState = [SubscriptionLoadedState]::new()
    }
}