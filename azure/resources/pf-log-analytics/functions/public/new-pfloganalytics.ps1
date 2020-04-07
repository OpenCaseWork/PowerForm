Function New-PfLogAnalytics
{
    if($global:_PfDeploymentContext.CurrentBuildContext)
    {
        $def = [PfLogAnalyticsDefinition]::New($global:_PfDeploymentContext.CurrentBuildContext)
    }
    else{
        $def = [PfLogAnalyticsDefinition]::New()
    }

    $global:_PfDeploymentContext.Definitions.Add($def) | Out-Null

    return $def
}

