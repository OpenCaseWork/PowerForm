Class PfKeyVaultAccess : BaseAzResourceAccess {

    PfKeyVaultAccess([PfKeyVaultBuildState]$PfKeyVaultBuildState) : base([PfKeyVaultBuildState]$PfKeyVaultBuildState){}

    [void]GetOrSet(){
        Write-Host("Creating or Getting KeyVault: $($this.ResourceBuildState.Options.Name)")
        
        $options = $this.ResourceBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for KeyVault: $options ")
    }
}