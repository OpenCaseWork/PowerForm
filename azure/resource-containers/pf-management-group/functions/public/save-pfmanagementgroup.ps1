Function Save-PfManagementGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfManagementGroupDefinition]$Definition
    )

    Write-Verbose("Resolving dependencies for $($Definition.Options.Name) ...")
    Resolve-PfManagementGroup -Definition $Definition
   
    Write-Verbose("Adding $($Definition.Options.Name) to deployment context definitions ...")
    $global:_PfDeploymentContext.Definitions.Add($Definition) | Out-Null

    return $state
}