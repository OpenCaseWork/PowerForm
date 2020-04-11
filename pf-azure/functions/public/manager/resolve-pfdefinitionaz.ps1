Function Resolve-PfDefinitionAz{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfDefinitionAz]$Definition
    )

    Write-Verbose("Resolving dependencies for $($Definition.ClassPrefix): $($Definition.Options.Name) ...")

    &"Resolve-$($Definition.ClassPrefix)" -Definition $Definition

    return $state
}