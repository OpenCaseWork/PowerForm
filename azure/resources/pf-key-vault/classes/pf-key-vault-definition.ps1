Class PfKeyVaultDefinition : BaseAzResourceDefinition{
    PfKeyVaultDefinition() : base() {}
    PfKeyVaultDefinition([PfBuildContext]$PfBuildContext) : base([PfBuildContext]$PfBuildContext){}

    [PfKeyVaultState]Deploy(){
        $state = Deploy-PfKeyVault -Definition $this
        return $state
    }
}