Class BaseAzResourceCloudState : PfResourceCloudState{
    [string]$Id
    [string]$Name
    [string]$Scope
    [string]$IdentityId
    [object]$CloudBaseObject
    [object]$CloudObject

    BaseAzResourceCloudState(){}
}