Class BaseAzResourceState : PfState{
    [string]$Id
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [string]$Name
    [string]$Scope
    [string]$IdentityId
    [object]$CloudBaseObject
    [object]$CloudObject

    BaseAzResourceState() : base(){}
}