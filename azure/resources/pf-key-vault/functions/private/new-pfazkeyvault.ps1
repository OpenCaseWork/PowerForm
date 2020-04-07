Function New-PfAzKeyVault{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfKeyVaultOptions]$Options
    )

    $json = $Options | ConvertTo-Json
    Write-Host("Options that would have been deployed for KeyVault: $json ")

    $state = [PfKeyVaultState]::new()
    $state.Name=$Options.Name
    return $state
}

