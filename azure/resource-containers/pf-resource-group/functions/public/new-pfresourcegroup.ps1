Function New-PfResourceGroup
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfDeploymentContext] $DeploymentContext
    )

    if($global:_PfAzureContext)
    {
        $rg = [PfResourceGroupDefinition]::New($global:_PfAzureContext)
    }
    else{
        $rg = [PfResourceGroupDefinition]::New()
    }

    Add-PfDeploymentContextDefinition -DeploymentContext $DeploymentContext -Definition $rg
    
    return $rg
    
}

