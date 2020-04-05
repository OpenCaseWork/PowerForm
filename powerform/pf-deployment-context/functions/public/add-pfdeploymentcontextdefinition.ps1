Function Add-PfDeploymentContextDefinition
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfDeploymentContext] $DeploymentContext,
        [Parameter(Mandatory = $true)] 
        [PfDefinition] $Definition
    )

    if($DeploymentContext){
        $DeploymentContext.Definitions.Add($Definition) | Out-Null
    }
    else {
        $global:_PfDeploymentContext.Definitions.Add($Definition) | Out-Null
    }
}

