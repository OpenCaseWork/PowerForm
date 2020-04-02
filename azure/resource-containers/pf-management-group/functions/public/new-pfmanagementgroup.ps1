Function New-PfManagementGroup
{
    if($global:_PfAzureContext)
    {
        $sub = [PfManagementGroupBuildState]::New($global:_PfAzureContext)
    }
    else{
        $sub = [PfManagementGroupBuildState]::New()
    }
    $global:_PfDeploymentContext.ResourceContainers.Add($sub) | Out-Null
    return $sub
    
}

