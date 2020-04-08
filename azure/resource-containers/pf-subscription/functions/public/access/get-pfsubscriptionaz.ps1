Function Get-PfSubscriptionAz{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    Write-Verbose("Getting Subscription Cloud State: $($Name)")
    $state = [PfSubscriptionState]::new()
    $state.Name=$Name
    return $state
}

