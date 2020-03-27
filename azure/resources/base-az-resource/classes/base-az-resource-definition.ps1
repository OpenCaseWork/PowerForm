Class BaseAzResourceDependency{
    [string]$Key
    [BaseAzResourceDefinition]$BaseAzResourceDefinition

    BaseAzResourceDependency(){}
}
Class BaseAzResourceOptions {
    [string]$Name
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [hashtable]$Tags
    [int]$ResourceNumber=1
    [AzLock]$Lock
    [AzLogging]$Logging
    [bool]$PersistState=$true

    BaseAzResourceOptions(){}
    BaseAzResourceOptions([AzCloudContext]$AzCloudContext){
        $this.ResourceGroupName=$AzCloudContext.ResourceGroupName
        $this.SubscriptionName=$AzCloudContext.SubscriptionName
    }
}
Class BaseAzResourceBuildState{
    [string]$Name
    [BaseAzResourceOptions]$Options
    [BaseAzResourceDependency[]]$Dependencies
    [AzSecurityDefinition]$Security

    BaseAzResourceBuildState(){}
}
Class BaseAzResourceCloudState{
    [string]$Id
    [string]$Name
    [string]$Scope
    [string]$IdentityId
    [object]$CloudBaseObject
    [object]$CloudObject

    BaseAzResourceCloudState(){}
}

Class BaseAzResourceDefinition : PfResourceDefinition{
    [BaseAzResourceAccess]$Access
    [BaseAzResourceBuildState]$BuildState
    [BaseAzResourceCloudState]$CloudState

    BaseAzResourceDefinition([AzResourceType]$AzResourceType){
        $this.Access = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Options")
        $this.CloudState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)CloudState")
    }
    BaseAzResourceDefinition([BaseAzResourceOptions]$BaseAzResourceOptions, [AzResourceType]$AzResourceType){
        $this.Access = (New-Object -TypeName "$($AzResourceType.ClassPrefix)Access")
        $this.BuildState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)BuildState")
        $this.BuildState.Options = $BaseAzResourceOptions
        $this.CloudState = (New-Object -TypeName "$($AzResourceType.ClassPrefix)CloudState")
    }
}