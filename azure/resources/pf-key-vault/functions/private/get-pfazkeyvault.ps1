Function Get-PfAzKeyVault{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName,
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName
    )

    Write-Verbose("Getting KeyVault Cloud State: $($Name)")
    $state = [PfKeyVaultState]::new()
    $state.Name=$Name
    $state.SubscriptionName=$SubscriptionName
    $state.ResourceGroupName=$ResourceGroupName
    return $state
}

