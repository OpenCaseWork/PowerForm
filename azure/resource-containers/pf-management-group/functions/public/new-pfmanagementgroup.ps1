Function New-PfManagementGroup
{
    if($global:_PfAzureContext)
    {
        $sub = [PfManagementGroupDefinition]::New($global:_PfAzureContext)
    }
    else{
        $sub = [PfManagementGroupDefinition]::New()
    }
    $global:_PfDeploymentContext.ResourceContainers.Add($sub) | Out-Null
    return $sub
    
}

