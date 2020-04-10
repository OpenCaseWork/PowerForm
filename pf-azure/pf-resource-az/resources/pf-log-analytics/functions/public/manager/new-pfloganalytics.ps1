Function New-PfLogAnalytics
{
    if($global:_PfDeployment.CurrentBuild)
    {
        $def = [PfLogAnalyticsDefinition]::New($global:_PfDeployment.CurrentBuild)
    }
    else{
        $def = [PfLogAnalyticsDefinition]::New()
    }

    return $def
}

