Function Deploy-PfManagementGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfManagementGroupDefinition]$Definition
    )

    Write-Verbose("Seeing if ManagementGroup: $($Definition.Options.Name) exists...")
    $state = Get-PfAzManagementGroup -Name $Definition.Options.Name
    if($state){
        Write-Verbose("$($Definition.Options.Name) exists...")
        Write-Verbose("Checking to see if we should persist the state...")
        if($Definition.Options.PersistState){
            Write-Verbose("We should persist state...")
            Write-Verbose("Updating ManagementGroup: $($Definition.Options.Name)")
            $state = Update-PfAzManagementGroup -Options $Definition.Options
        }
    }
    else{
        Write-Verbose("$($Definition.Options.Name) does not exist...")
        Write-Verbose("Creating $($Definition.Options.Name) ...")
        $state = New-PfAzManagementGroup -Options $Definition.Options
    }

    return $state
}