Function New-PfSubscription
{
    if($global:_PfAzureContext)
    {
        $sub = [PfSubscriptionDefinition]::New($global:_PfAzureContext)
    }
    else{
        $sub = [PfSubscriptionDefinition]::New()
    }
    $global:_PfDeploymentContext.ResourceContainers.Add($sub) | Out-Null
    return $sub
    
}

