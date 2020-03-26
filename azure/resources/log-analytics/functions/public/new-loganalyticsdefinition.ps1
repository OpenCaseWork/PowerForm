Function New-LogAnalyticsDefinition 
{
    Param (
        [Parameter(Mandatory = $false)] 
        [LogAnalyticsOptions] $Options
    )   
    # use this to get the parameter set name
    if($Options)
    {
        [LogAnalyticsDefinition]::New($Options)
    }
    else {
        [LogAnalyticsDefinition]::New()
    }
}