Function Resolve-PfKeyVault{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfKeyVaultDefinition]$Definition
    )

    Write-Verbose("Seeing if KeyVault $($Definition.Options.Name) has a parent for dependency tracking...")
    if($Definition.Options.ParentKeyVaultDefinition){
        Write-Verbose("It has a parent definition dependency: $($Definition.Options.ResourceGroupDefinition.Options.Name)")
        $Definition.Dependencies.Add($Definition.Options.ResourceGroupDefinition)
    } 
}