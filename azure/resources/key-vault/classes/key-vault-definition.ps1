Class KeyVaultBuildState : BaseAzResourceBuildState{
    KeyVaultBuildState(){}
}
Class KeyVaultCloudState : BaseAzResourceCloudState{
    KeyVaultCloudState(){}
}
Class KeyVaultLoadedState : BaseAzResourceLoadedState{
    KeyVaultLoadedState(){}
}
Class KeyVaultDefinition : BaseAzResourceDefinition{
    KeyVaultDefinition() : base([AzResourceTypes]::KeyVault){}
    KeyVaultDefinition([KeyVaultOptions]$KeyVaultOptions) : base([KeyVaultOptions]$KeyVaultOptions,[AzResourceTypes]::KeyVault){}
}