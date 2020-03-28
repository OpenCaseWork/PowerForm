Function New-PfLogAnalyticsOptions
{
    if($global:_PfAzureContext)
    {
        [PfLogAnalyticsOptions]::New($global:_PfAzureContext)
    }
    else {
        [PfLogAnalyticsOptions]::New()
    }
}

