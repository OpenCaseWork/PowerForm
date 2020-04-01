Function New-PfResourceGroup
{
    if($global:_PfAzureContext)
    {
        $rg = [PfResourceGroupBuildState]::New($global:_PfAzureContext)
    }
    else{
        $rg = [PfResourceGroupBuildState]::New()
    }
    $global:_PfDeploymentContext.ResourceContainers.Add($rg) | Out-Null
    return $rg
    
}

