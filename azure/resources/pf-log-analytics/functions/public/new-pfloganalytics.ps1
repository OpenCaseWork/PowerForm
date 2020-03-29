Function New-PfLogAnalytics
{
    <#
    Param (
        [Parameter(Mandatory = $false)] 
        [PfLogAnalyticsOptions] $Options
    )   
    # use this to get the parameter set name
    if($Options)
    {
        $la=[PfLogAnalyticsBuildState]::New($Options)
    }
    else {
        $la=[PfLogAnalyticsBuildState]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($la) | Out-Null
    return $la
    #>
    if($global:_PfAzureContext)
    {
        $la = [PfLogAnalyticsBuildState]::New($global:_PfAzureContext)
    }
    else{
        $la = [PfLogAnalyticsBuildState]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($la) | Out-Null
    return $la
}

