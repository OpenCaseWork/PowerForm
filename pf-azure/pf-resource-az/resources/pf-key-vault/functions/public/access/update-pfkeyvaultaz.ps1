Function Update-PfKeyVaultAz{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfKeyVaultOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been used for updating KeyVault: $json ")

    $state = [PfKeyVaultState]::new()
    $state.Name=$Options.Name
    return $state
}

