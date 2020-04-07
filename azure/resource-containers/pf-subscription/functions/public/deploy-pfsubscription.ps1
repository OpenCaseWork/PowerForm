Function Deploy-PfSubscription{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfSubscriptionDefinition]$Definition
    )

    Write-Verbose("Seeing if Subscription: $($Definition.Options.Name) exists...")
    $state = Get-PfAzSubscription -Name $Definition.Options.Name
    if($state){
        Write-Verbose("$($Definition.Options.Name) exists...")
        Write-Verbose("Checking to see if we should persist the state...")
        if($Definition.Options.PersistState){
            Write-Verbose("We should persist state...")
            Write-Verbose("Updating Subscription: $($Definition.Options.Name)")
            $state = Update-PfAzSubscription -Options $Definition.Options
        }
    }
    else{
        Write-Verbose("$($Definition.Options.Name) does not exist...")
        Write-Verbose("Creating $($Definition.Options.Name) ...")
        $state = New-PfAzSubscription -Options $Definition.Options
    }

    return $state
}