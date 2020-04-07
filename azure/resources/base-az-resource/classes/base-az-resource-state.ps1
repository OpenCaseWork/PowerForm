Class BaseAzResourceState : PfState{
    [string]$SubscriptionName
    [string]$ResourceGroupName

    BaseAzResourceState() : base(){}
    
}