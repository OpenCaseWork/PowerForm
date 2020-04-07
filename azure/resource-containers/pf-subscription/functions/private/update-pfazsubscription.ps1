Function Update-PfAzSubscription{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfSubscriptionOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been used for updating Subscription: $json ")

    $state = [PfSubscriptionState]::new()
    $state.Name=$Options.Name
    $state.ManagementGroupName=$Options.ManagementGroupName
    return $state
}

