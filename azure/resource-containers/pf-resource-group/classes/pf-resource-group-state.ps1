Class PfResourceGroupState : PfState{
    [string]$Id
    [string]$Name
    [string]$SubscriptionName
    [string]$Scope
    [object]$CloudBaseObject
    [object]$CloudObject

    PfResourceGroupState(){}
}