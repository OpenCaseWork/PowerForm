Function Resolve-PfSubscription{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfSubscriptionDefinition]$Definition
    )

    Write-Verbose("Seeing if Subscription $($Definition.Options.Name) has a management group for dependency tracking...")
    if($Definition.Options.ManagementGroupDefinition){
        Write-Verbose("It has a management group dependency: $($Definition.Options.ManagementGroupDefinition.Options.Name)")
        $Definition.Dependencies.Add($Definition.Options.ManagementGroupDefinition)
    } 
}