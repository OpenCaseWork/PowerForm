Enum PfKeyVaultSku {
    Standard = 0
    Premium = 1
}
Enum PfKeyVaultAzureServicesSetting{
    None = 0
    AzureServices = 1
}
Class PfKeyVaultSecret{
    [string]$Name
    [string]$Value

    PfKeyVaultSecret(){}
}
Class PfKeyVaultAccessPolicy{
    [PfResourceDefinitionAz]$ResourceDefinition
    #[AadObjectState]$AadObjectState
    [string]$ObjectId
    [string[]]$PermissionsToKeys
    [string[]]$PermissionsToSecrets
    [string[]]$PermissionsToCerts
    [string[]]$PermissionsToStorage

    PfKeyVaultAccessPolicy(){}
}
Class PfKeyVaultOptions : PfResourceOptionsAz {
    [IpAddress[]]$IpAddresses
    [PfKeyVaultAccessPolicy[]]$AccessPolicies
    [bool]$EnableFirewall=$true
    [PfKeyVaultAzureServicesSetting]$AzureServicesSetting=[PfKeyVaultAzureServicesSetting]::AzureServices
    [PfKeyVaultSku]$Sku = [PfKeyVaultSku]::Premium
    [bool]$EnabledForDeployment = $true
    [bool]$EnabledForTemplateDeployment = $true
    [bool]$EnabledForDiskEncryption = $true
    [bool]$EnableSoftDelete = $false
    [bool]$EnablePurgProtection = $false
    [PfKeyVaultSecret[]]$SecretsToAdd
    [string[]]$DiagnosticCategoriesToLog = "AuditEvent"
    [string[]]$MetricCategoriesToLog = "AllMetrics"

    PfKeyVaultOptions(){}
    PfKeyVaultOptions([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfKeyVaultDefinition : PfResourceDefinitionAz{
    PfKeyVaultDefinition() : base() {}
    PfKeyVaultDefinition([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}

    [PfKeyVaultState]Deploy(){
        $state = Deploy-PfKeyVault -Definition $this
        return $state
    }
}

Class PfKeyVaultState : PfResourceStateAz{

    PfKeyVaultState(){}
}
