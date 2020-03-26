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
    AzureResourceOptions(){}
}
Class AzureResourceBuildState{
    [string]$Name
    [AzureResourceOptions]$Options
    [AzureResourceDependency[]]$Dependencies
    [AzureSecurityDefinition]$Security
    [ResourceGroupDefinition]$ResourceGroupDefinition

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
        $this.BuildState.ResourceGroupDefinition = $ResourceGroupDefinition
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
    }
    AzureResourceDefinition([string]$SubscriptionName, [string]$ResourceGroupName, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Options")
        $this.BuildState.ResourceGroupDefinition = [ResourceGroupDefinition]::new($SubscriptionName,$ResourceGroupName)
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
    }
    AzureResourceDefinition([ResourceGroupDefinition]$ResourceGroupDefinition, [AzureResourceOptions]$AzureResourceOptions, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = $AzureResourceOptions
        $this.BuildState.ResourceGroupDefinition = $ResourceGroupDefinition
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
        $this.ResourceGroupDefinition = $ResourceGroupDefinition
    }
    AzureResourceDefinition([string]$SubscriptionName, [string]$ResourceGroupName, [AzureResourceOptions]$AzureResourceOptions, [AzureResourceType]$AzureResourceType){
        $this.Access = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = $AzureResourceOptions
        $this.BuildState.ResourceGroupDefinition = [ResourceGroupDefinition]::new($SubscriptionName,$ResourceGroupName)
        $this.CloudState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)CloudState")
        $this.LoadedState = (New-Object -TypeName "$($AzureResourceType.ClassPrefix)LoadedState")
        $this.ResourceGroupDefinition = [ResourceGroupDefinition]::new($SubscriptionName,$ResourceGroupName)
    }
}