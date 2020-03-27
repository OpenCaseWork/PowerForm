Class PfKeyVaultBuildState : BaseAzResourceBuildState{
    PfKeyVaultBuildState() : base([AzResourceTypes]::KeyVault){}
    PfKeyVaultBuildState([PfKeyVaultOptions]$PfKeyVaultOptions) : base([PfKeyVaultOptions]$PfKeyVaultOptions,[AzResourceTypes]::KeyVault){}
}