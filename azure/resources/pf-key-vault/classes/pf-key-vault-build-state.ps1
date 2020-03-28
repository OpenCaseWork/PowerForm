Class PfKeyVaultBuildState : BaseAzResourceBuildState{
    PfKeyVaultBuildState() : base([AzResourceTypes]::KeyVault){}
    PfKeyVaultBuildState([PfAzureContext]$PfAzureContext) : base([PfAzureContext]$PfAzureContext,[AzResourceTypes]::KeyVault){}
}