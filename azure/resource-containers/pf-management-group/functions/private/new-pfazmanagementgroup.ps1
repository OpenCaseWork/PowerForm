Function New-PfAzManagementGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfManagementGroupOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been deployed for ManagementGroup: $json ")

    $state = [PfManagementGroupState]::new()
    $state.Name=$Options.Name
    $state.ParentManagementGroupName=$Options.ParentManagementGroupName
    return $state
}

