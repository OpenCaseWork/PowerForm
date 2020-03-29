Class PfKeyVaultDefinition : BaseAzResourceDefinition{
    PfKeyVaultDefinition() : base(){}
    PfKeyVaultDefinition([PfKeyVaultBuildState]$BuildState,[PfKeyVaultCloudState]$CloudState) : base([BaseAzResourceBuildState]$BuildState,[BaseAzResourceCloudState]$CloudState){}
}