Function New-PfSubscription
{
    if($global:_PfDeploymentContext.CurrentBuildContext)
    {
        $def = [PfSubscriptionDefinition]::New($global:_PfDeploymentContext.CurrentBuildContext)
    }
    else{
        $def = [PfSubscriptionDefinition]::New()
    }
    return $def
}

