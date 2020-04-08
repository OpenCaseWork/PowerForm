Function Deploy-PfResourceAz{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfResourceDefinitionAz]$Definition
    )

    Write-Verbose("Seeing if $($Definition.ClassPrefix): $($Definition.Options.Name) exists...")
    $state = &"Get-$($Definition.ClassPrefix)Az" -Name $Definition.Options.Name
    if($state){
        Write-Verbose("$($Definition.Options.Name) exists...")
        Write-Verbose("Checking to see if we should persist the state...")
        if($Definition.Options.PersistState){
            Write-Verbose("We should persist state...")
            Write-Verbose("Updating $($Definition.ClassPrefix): $($Definition.Options.Name)")
            $state = &"Update-$($Definition.ClassPrefix)Az" -Options $Definition.Options
        }
    }
    else{
        Write-Verbose("$($Definition.Options.Name) does not exist...")
        Write-Verbose("Creating $($Definition.Options.Name) ...")
        $state = &"New-$($Definition.ClassPrefix)Az" -Options $Definition.Options
    }

    return $state
}