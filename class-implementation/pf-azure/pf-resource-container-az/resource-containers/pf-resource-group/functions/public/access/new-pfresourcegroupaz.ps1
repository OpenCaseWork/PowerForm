Function New-PfResourceGroupAz{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfResourceGroupOptions]$Options
    )

    $state = New-_PfAzResourceGroup -Name $Name
    return $state
}

