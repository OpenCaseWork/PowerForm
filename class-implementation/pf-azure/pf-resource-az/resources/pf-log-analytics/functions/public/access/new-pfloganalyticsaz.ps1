Function New-PfLogAnalyticsAz{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfLogAnalyticsOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been deployed for LogAnalytics: $json ")

    $state = [PfLogAnalyticsState]::new()
    $state.Name=$Options.Name
    return $state
}

