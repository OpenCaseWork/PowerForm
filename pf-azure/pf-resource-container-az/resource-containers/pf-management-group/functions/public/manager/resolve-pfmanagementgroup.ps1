Function Resolve-PfManagementGroup{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfManagementGroupDefinition]$Definition
    )

    Write-Verbose("Seeing if ManagementGroup $($Definition.Options.Name) has a parent for dependency tracking...")
    if($Definition.Options.ParentManagementGroupDefinition){
        Write-Verbose("It has a parent definition dependency: $($Definition.Options.ParentManagementGroupDefinition.Options.Name)")
        $Definition.Dependencies.Add($Definition.Options.ParentManagementGroupDefinition)
    } 
}