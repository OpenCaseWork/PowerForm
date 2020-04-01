Function New-PfSubscription
{
    if($global:_PfAzureContext)
    {
        $sub = [PfSubscriptionBuildState]::New($global:_PfAzureContext)
    }
    else{
        $sub = [PfSubscriptionBuildState]::New()
    }
    $global:_PfDeploymentContext.ResourceContainers.Add($sub) | Out-Null
    return $sub
    
}

