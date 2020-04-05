Function New-PfResourceGroup
{
    if($global:_PfAzureContext)
    {
        $rg = [PfResourceGroupDefinition]::New($global:_PfAzureContext)
    }
    else{
        $rg = [PfResourceGroupDefinition]::New()
    }
    $global:_PfDeploymentContext.ResourceContainers.Add($rg) | Out-Null
    return $rg
    
}

