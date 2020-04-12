Function New-PfResourceGroup
{
    if($global:_PfDeployment.CurrentBuild)
    {
        $def = [PfResourceGroupDefinition]::New($global:_PfDeployment.CurrentBuild)
    }
    else{
        $def = [PfResourceGroupDefinition]::New()
    }

    return $def
}

