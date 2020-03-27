Function New-PfLogAnalyticsBuild
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfLogAnalyticsOptions] $Options
    )   
    # use this to get the parameter set name
    if($Options)
    {
        [PfLogAnalyticsBuildState]::New($Options)
    }
    else {
        [PfLogAnalyticsBuildState]::New()
    }
}

