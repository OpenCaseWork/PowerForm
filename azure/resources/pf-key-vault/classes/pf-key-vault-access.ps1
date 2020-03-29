Class PfKeyVaultAccess : BaseAzResourceAccess {

    PfKeyVaultAccess() : base(){}
    PfKeyVaultAccess([PfKeyVaultBuildState]$PfKeyVaultBuildState) : base([PfKeyVaultBuildState]$PfKeyVaultBuildState){}

    [PfKeyVaultCloudState]GetOrSet(){
        Write-Host("Creating or Getting KeyVault: $($this.ResourceBuildState.Options.Name)")
        
        $options = $this.ResourceBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for KeyVault: $options ")

        $cloudState = [PfKeyVaultCloudState]::new()
        $cloudState.Name=$this.ResourceBuildState.Options.Name
        $cloudState.SubscriptionName=$this.ResourceBuildState.Options.SubscriptionName
        $cloudState.ResourceGroupName=$this.ResourceBuildState.Options.ResourceGroupName
        return $cloudState
    }
    [PfKeyVaultCloudState]GetCloudState([string]$Name,[string]$SubscriptionName,[string]$ResourceGroupName){
        Write-Host("Getting KeyVault Cloud State: $($Name)")
        $cloudState = [PfKeyVaultCloudState]::new()
        $cloudState.Name=$Name
        $cloudState.SubscriptionName=$SubscriptionName
        $cloudState.ResourceGroupName=$ResourceGroupName
        return $cloudState
    }
}