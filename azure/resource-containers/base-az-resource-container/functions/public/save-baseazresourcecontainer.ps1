Function Save-BaseAzResourceContainer{
    Param (
        [Parameter(Mandatory = $true)] 
        [BaseAzResourceContainerDefinition]$Definition
    )

    Write-Verbose("Resolving dependencies for $($Definition.ClassPrefix): $($Definition.Options.Name) ...")
    &"Resolve-$($Definition.ClassPrefix)" -Definition $Definition
   
    Write-Verbose("Adding $($Definition.Options.Name) to deployment context definitions ...")
    $global:_PfDeploymentContext.Definitions.Add($Definition) | Out-Null

    return $state
}