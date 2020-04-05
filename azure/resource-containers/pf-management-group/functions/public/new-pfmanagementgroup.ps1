Function New-PfManagementGroup
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfDeploymentContext] $DeploymentContext
    )
    if($global:_PfAzureContext)
    {
        $mg = [PfManagementGroupDefinition]::New($global:_PfAzureContext)
    }
    else{
        $mg = [PfManagementGroupDefinition]::New()
    }

    Add-PfDeploymentContextDefinition -DeploymentContext $DeploymentContext -Definition $mg

    return $mg
}

