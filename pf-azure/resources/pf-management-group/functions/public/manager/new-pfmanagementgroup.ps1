Function New-PfManagementGroup
{
    if($global:_PfDeploymentContext.CurrentBuildContext)
    {
        $def = [PfManagementGroupDefinition]::New($global:_PfDeploymentContext.CurrentBuildContext)
    }
    else{
        $def = [PfManagementGroupDefinition]::New()
    }
    
    return $def
}

