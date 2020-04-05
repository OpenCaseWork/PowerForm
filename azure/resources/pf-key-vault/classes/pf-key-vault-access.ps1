Class PfKeyVaultAccess : BaseAzResourceAccess {

    PfKeyVaultAccess() : base(){}
    PfKeyVaultAccess([PfKeyVaultDefinition]$PfKeyVaultDefinition) : base([PfKeyVaultDefinition]$PfKeyVaultDefinition){}

    [PfKeyVaultState]GetOrSet(){
        Write-Host("Creating or Getting KeyVault: $($this.ResourceDefinition.Options.Name)")
        
        $options = $this.ResourceDefinition.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for KeyVault: $options ")

        $state = [PfKeyVaultState]::new()
        $state.Name=$this.ResourceDefinition.Options.Name
        $state.SubscriptionName=$this.ResourceDefinition.Options.SubscriptionName
        $state.ResourceGroupName=$this.ResourceDefinition.Options.ResourceGroupName
        return $state
    }
    [PfKeyVaultState]GetState([string]$Name,[string]$SubscriptionName,[string]$ResourceGroupName){
        Write-Host("Getting KeyVault Cloud State: $($Name)")
        $state = [PfKeyVaultState]::new()
        $state.Name=$Name
        $state.SubscriptionName=$SubscriptionName
        $state.ResourceGroupName=$ResourceGroupName
        return $state
    }
}