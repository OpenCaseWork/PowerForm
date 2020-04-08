Function Get-PfResourceGroupAz{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    Write-Verbose("Getting ResourceGroup Cloud State: $($Name)")
    $state = [PfResourceGroupState]::new()
    $state.Name=$Name
    return $state
}

