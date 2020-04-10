Function New-PfSubscription
{
    if($global:_PfDeployment.CurrentBuild)
    {
        $def = [PfSubscriptionDefinition]::New($global:_PfDeployment.CurrentBuild)
    }
    else{
        $def = [PfSubscriptionDefinition]::New()
    }
    return $def
}

