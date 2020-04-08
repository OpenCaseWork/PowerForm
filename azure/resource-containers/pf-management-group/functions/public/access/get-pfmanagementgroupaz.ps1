Function Get-PfManagementGroupAz{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    Write-Verbose("Getting ManagementGroup Cloud State: $($Name)")
    $state = [PfManagementGroupState]::new()
    $state.Name=$Name
    return $state
}

