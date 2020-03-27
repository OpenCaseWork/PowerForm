Function New-PfLogAnalyticsOptions
{
    $context = Get-CurrentPfAzureContext
    if($context)
    {
        [PfLogAnalyticsOptions]::New($context)
    }
    else {
        [PfLogAnalyticsOptions]::New()
    }
}

