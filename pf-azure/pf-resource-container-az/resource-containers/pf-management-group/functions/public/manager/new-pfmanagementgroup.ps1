Function New-PfManagementGroup
{
    if($global:_PfDeployment.CurrentBuild)
    {
        $def = [PfManagementGroupDefinition]::New($global:_PfDeployment.CurrentBuild)
    }
    else{
        $def = [PfManagementGroupDefinition]::New()
    }
    
    return $def
}

