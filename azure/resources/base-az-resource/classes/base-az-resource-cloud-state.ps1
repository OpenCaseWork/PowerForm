Class BaseAzResourceCloudState : PfResource{
    [string]$Id
    [string]$SubscriptionName
    [string]$ResourceGroupName
    [string]$Name
    [string]$Scope
    [string]$IdentityId
    [object]$CloudBaseObject
    [object]$CloudObject

    BaseAzResourceCloudState() : base(){}
}