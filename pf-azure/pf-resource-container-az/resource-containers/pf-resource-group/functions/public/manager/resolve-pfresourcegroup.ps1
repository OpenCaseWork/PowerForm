Function Resolve-PfResourceGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfResourceGroupDefinition]$Definition
    )

    Write-Verbose("Seeing if ResourceGroup $($Definition.Options.Name) has a parent for dependency tracking...")
    if($Definition.Options.SubscriptionDefinition){
        Write-Verbose("It has a parent definition dependency: $($Definition.Options.SubscriptionDefinition.Options.Name)")
        $Definition.Dependencies.Add($Definition.Options.SubscriptionDefinition) | Out-Null
    } 
}