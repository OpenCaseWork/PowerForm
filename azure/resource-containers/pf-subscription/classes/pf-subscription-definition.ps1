Class PfSubscriptionDefinition : BaseAzResourceContainerDefinition{
    PfSubscriptionDefinition() : base() {}
    PfSubscriptionDefinition([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}

    [PfSubscriptionState]Deploy(){
        $state = Deploy-PfSubscription -Definition $this
        return $state
    }
}