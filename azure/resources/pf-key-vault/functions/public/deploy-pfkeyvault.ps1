Function Deploy-PfKeyVault{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfKeyVaultDefinition]$Definition
    )

    Write-Verbose("Seeing if KeyVault: $($Definition.Options.Name) exists...")
    $state = Get-PfAzKeyVault -Name $Definition.Options.Name
    if($state){
        Write-Verbose("$($Definition.Options.Name) exists...")
        Write-Verbose("Checking to see if we should persist the state...")
        if($Definition.Options.PersistState){
            Write-Verbose("We should persist state...")
            Write-Verbose("Updating KeyVault: $($Definition.Options.Name)")
            $state = Update-PfAzKeyVault -Options $Definition.Options
        }
    }
    else{
        Write-Verbose("$($Definition.Options.Name) does not exist...")
        Write-Verbose("Creating $($Definition.Options.Name) ...")
        $state = New-PfAzKeyVault -Options $Definition.Options
    }

    return $state
}