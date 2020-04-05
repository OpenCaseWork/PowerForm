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
        $la=[PfLogAnalyticsDefinition]::New($Options)
    }
    else {
        $la=[PfLogAnalyticsDefinition]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($la) | Out-Null
    return $la
    #>
    if($global:_PfAzureContext)
    {
        $la = [PfLogAnalyticsDefinition]::New($global:_PfAzureContext)
    }
    else{
        $la = [PfLogAnalyticsDefinition]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($la) | Out-Null
    return $la
}

