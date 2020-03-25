Enum KeyVaultSku {
    Standard = 0
    Premium = 1
}
Enum KeyVaultAzureServicesSetting{
    None = 0
    AzureServices = 1
}
Class KeyVaultSecret{
    [string]$Name
    [string]$Value

    KeyVaultSecret(){}
}
Class KeyVaultAccessPolicy{
    [AzureResourceDefinition]$ResourceDefinition
    #[AadObjectState]$AadObjectState
    [string]$ObjectId
    [string[]]$PermissionsToKeys
    [string[]]$PermissionsToSecrets
    [string[]]$PermissionsToCerts
    [string[]]$PermissionsToStorage

    KeyVaultAccessPolicy(){}
}
Class KeyVaultOptions : AzureResourceOptions {
    [IpAddress[]]$IpAddresses
    [KeyVaultAccessPolicy[]]$AccessPolicies
    [bool]$EnableFirewall=$true
    [KeyVaultAzureServicesSetting]$AzureServicesSetting=[KeyVaultAzureServicesSetting]::AzureServices
    [KeyVaultSku]$Sku = [KeyVaultSku]::Premium
    [bool]$EnabledForDeployment = $true
    [bool]$EnabledForTemplateDeployment = $true
    [bool]$EnabledForDiskEncryption = $true
    [bool]$EnableSoftDelete = $false
    [bool]$EnablePurgProtection = $false
    [KeyVaultSecret[]]$SecretsToAdd

    KeyVaultOptions(){}
}
Class KeyVaultBuildState : AzureResourceBuildState{
    KeyVaultBuildState(){}
}
Class KeyVaultCloudState : AzureResourceCloudState{
    KeyVaultCloudState(){}
}
Class KeyVaultLoadedState : AzureResourceLoadedState{
    KeyVaultLoadedState(){}
}
Class KeyVaultDefinition : AzureResourceDefinition{
    KeyVaultDefinition([ResourceGroupDefinition]$ResourceGroupDefinition) : base([ResourceGroupDefinition]$ResourceGroupDefinition,[AzureResourceTypes]::KeyVault) {}
    KeyVaultDefinition([string]$SubscriptionName, [string]$ResourceGroupName) : base([string]$SubscriptionName, [string]$ResourceGroupName,[AzureResourceTypes]::KeyVault){}
    KeyVaultDefinition([ResourceGroupDefinition]$ResourceGroupDefinition, [KeyVaultOptions]$KeyVaultOptions) : base([ResourceGroupDefinition]$ResourceGroupDefinition, [KeyVaultOptions]$KeyVaultOptions,[AzureResourceTypes]::KeyVault){}
    KeyVaultDefinition([string]$SubscriptionName, [string]$ResourceGroupName, [KeyVaultOptions]$KeyVaultOptions) : base([string]$SubscriptionName, [string]$ResourceGroupName, [KeyVaultOptions]$KeyVaultOptions,[AzureResourceTypes]::KeyVault){}
}