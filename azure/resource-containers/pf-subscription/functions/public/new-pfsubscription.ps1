Function New-PfSubscription
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfDeploymentContext] $DeploymentContext
    )

    if($global:_PfAzureContext)
    {
        $sub = [PfSubscriptionDefinition]::New($global:_PfAzureContext)
    }
    else{
        $sub = [PfSubscriptionDefinition]::New()
    }

    Add-PfDeploymentContextDefinition -DeploymentContext $DeploymentContext -Definition $sub

    return $sub
    
}

