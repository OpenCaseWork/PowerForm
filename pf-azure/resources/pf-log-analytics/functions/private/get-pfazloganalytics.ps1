Function Get-PfAzLogAnalytics{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName,
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName
    )

    Write-Verbose("Getting LogAnalytics Cloud State: $($Name)")
    $state = [PfLogAnalyticsState]::new()
    $state.Name=$Name
    $state.SubscriptionName=$SubscriptionName
    $state.ResourceGroupName=$ResourceGroupName
    return $state
}

