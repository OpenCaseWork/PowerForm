Function New-PfAzResourceGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfResourceGroupOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been deployed for ResourceGroup: $json ")

    $state = [PfResourceGroupState]::new()
    $state.Name=$Options.Name
    $state.SubscriptionName=$Options.SubscriptionName
    return $state
}

