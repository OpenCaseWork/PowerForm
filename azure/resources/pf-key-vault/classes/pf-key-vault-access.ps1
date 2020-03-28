Class PfKeyVaultAccess : BaseAzResourceAccess {

    PfKeyVaultAccess() : base(){}
    PfKeyVaultAccess([PfKeyVaultBuildState]$PfKeyVaultBuildState) : base([PfKeyVaultBuildState]$PfKeyVaultBuildState){}

    [void]GetOrSet(){
        Write-Host("Creating or Getting KeyVault: $($this.ResourceBuildState.Options.Name)")
        
        $options = $this.ResourceBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for KeyVault: $options ")
    }
    [PfKeyVaultCloudState]GetCloudState([string]$KvName,[string]$SubscriptionName,[string]$ResourceGroupName){
        Write-Host("Getting KeyVault Cloud State: $($KvName)")
        
        return [PfKeyVaultCloudState]::new()
    }
}