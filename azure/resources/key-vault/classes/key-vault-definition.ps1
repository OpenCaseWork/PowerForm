Class KeyVaultBuildState : BaseAzResourceBuildState{
    KeyVaultBuildState(){}
}
Class KeyVaultCloudState : BaseAzResourceCloudState{
    KeyVaultCloudState(){}
}
Class KeyVaultDefinition : BaseAzResourceDefinition{
    KeyVaultDefinition() : base([AzResourceTypes]::KeyVault){}
    KeyVaultDefinition([KeyVaultOptions]$KeyVaultOptions) : base([KeyVaultOptions]$KeyVaultOptions,[AzResourceTypes]::KeyVault){}
}