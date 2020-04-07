Function Update-PfAzResourceGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfResourceGroupOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been used for updating ResourceGroup: $json ")

    $state = [PfResourceGroupState]::new()
    $state.Name=$Options.Name
    $state.SubscriptionName=$Options.SubscriptionName
    return $state
}

