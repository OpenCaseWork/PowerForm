Function New-PfResourceGroup
{
    if($global:_PfDeploymentContext.CurrentBuildContext)
    {
        $def = [PfResourceGroupDefinition]::New($global:_PfDeploymentContext.CurrentBuildContext)
    }
    else{
        $def = [PfResourceGroupDefinition]::New()
    }

    return $def
}

