Class PfKeyVaultDefinition : BaseAzResourceDefinition{
    PfKeyVaultDefinition() : base([AzResourceTypes]::KeyVault){}
    PfKeyVaultDefinition([PfKeyVaultOptions]$PfKeyVaultOptions) : base([PfKeyVaultOptions]$PfKeyVaultOptions,[AzResourceTypes]::KeyVault){}
}