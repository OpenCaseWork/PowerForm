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
    [BaseAzResourceDefinition]$ResourceDefinition
    #[AadObjectState]$AadObjectState
    [string]$ObjectId
    [string[]]$PermissionsToKeys
    [string[]]$PermissionsToSecrets
    [string[]]$PermissionsToCerts
    [string[]]$PermissionsToStorage

    KeyVaultAccessPolicy(){}
}
Class KeyVaultOptions : BaseAzResourceOptions {
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
    KeyVaultOptions([AzCloudContext]$AzCloudContext) : base([AzCloudContext]$AzCloudContext){}
}