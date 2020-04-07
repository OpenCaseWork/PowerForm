Function New-PfResourceGroup
{
    if($global:_PfDeploymentContext.CurrentBuildContext)
    {
        $def = [PfResourceGroupDefinition]::New($global:_PfDeploymentContext.CurrentBuildContext)
    }
    else{
        $def = [PfResourceGroupDefinition]::New()
    }

    $global:_PfDeploymentContext.Definitions.Add($def) | Out-Null

    return $def
}

