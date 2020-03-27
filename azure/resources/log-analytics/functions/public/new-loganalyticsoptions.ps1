Function New-LogAnalyticsOptions
{
    $context = Get-CurrentAzCloudContext
    if($context)
    {
        [LogAnalyticsOptions]::New($context)
    }
    else {
        [LogAnalyticsOptions]::New()
    }
}

