Function New-PfLogAnalytics
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfDeploymentContext] $DeploymentContext
    )

    if($global:_PfAzureContext)
    {
        $la = [PfLogAnalyticsDefinition]::New($global:_PfAzureContext)
    }
    else{
        $la = [PfLogAnalyticsDefinition]::New()
    }

    Add-PfDeploymentContextDefinition -DeploymentContext $DeploymentContext -Definition $la

    return $la
}

