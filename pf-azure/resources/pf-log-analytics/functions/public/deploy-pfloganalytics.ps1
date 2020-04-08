Function Deploy-PfLogAnalytics{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfLogAnalyticsDefinition]$Definition
    )

    Write-Verbose("Seeing if LogAnalytics: $($Definition.Options.Name) exists...")
    $state = Get-PfAzLogAnalytics -Name $Definition.Options.Name
    if($state){
        Write-Verbose("$($Definition.Options.Name) exists...")
        Write-Verbose("Checking to see if we should persist the state...")
        if($Definition.Options.PersistState){
            Write-Verbose("We should persist state...")
            Write-Verbose("Updating LogAnalytics: $($Definition.Options.Name)")
            $state = Update-PfAzLogAnalytics -Options $Definition.Options
        }
    }
    else{
        Write-Verbose("$($Definition.Options.Name) does not exist...")
        Write-Verbose("Creating $($Definition.Options.Name) ...")
        $state = New-PfAzLogAnalytics -Options $Definition.Options
    }

    return $state
}