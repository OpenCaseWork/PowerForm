Class PfResourceGroupCloudState : PfResourceContainer{
    [string]$Id
    [string]$Name
    [string]$SubscriptionName
    [string]$Scope
    [object]$CloudBaseObject
    [object]$CloudObject

    PfResourceGroupCloudState(){}
}