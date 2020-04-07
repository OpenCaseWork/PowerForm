Function Save-PfSubscription{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfSubscriptionDefinition]$Definition
    )

    Write-Verbose("Resolving dependencies for $($Definition.Options.Name) ...")
    Resolve-PfSubscription -Definition $Definition
   
    Write-Verbose("Adding $($Definition.Options.Name) to deployment context definitions ...")
    $global:_PfDeploymentContext.Definitions.Add($Definition) | Out-Null

    return $state
}