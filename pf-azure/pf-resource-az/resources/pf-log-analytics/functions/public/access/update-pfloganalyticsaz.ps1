Function Update-PfLogAnalyticsAz{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfLogAnalyticsOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been used for updating LogAnalytics: $json ")

    $state = [PfLogAnalyticsState]::new()
    $state.Name=$Options.Name
    return $state
}

