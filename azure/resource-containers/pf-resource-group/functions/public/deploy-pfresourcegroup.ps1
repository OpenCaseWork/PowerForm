Function Deploy-PfResourceGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfResourceGroupDefinition]$Definition
    )

    Write-Verbose("Seeing if ResourceGroup: $($Definition.Options.Name) exists...")
    $state = Get-PfAzResourceGroup -Name $Definition.Options.Name
    if($state){
        Write-Verbose("$($Definition.Options.Name) exists...")
        Write-Verbose("Checking to see if we should persist the state...")
        if($Definition.Options.PersistState){
            Write-Verbose("We should persist state...")
            Write-Verbose("Updating ResourceGroup: $($Definition.Options.Name)")
            $state = Update-PfAzResourceGroup -Options $Definition.Options
        }
    }
    else{
        Write-Verbose("$($Definition.Options.Name) does not exist...")
        Write-Verbose("Creating $($Definition.Options.Name) ...")
        $state = New-PfAzResourceGroup -Options $Definition.Options
    }

    return $state
}