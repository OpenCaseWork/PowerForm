#Import-Module .\azure\resources\key-vault\key-vault-definition.psm1

#$kv = [KeyVaultDefinition]::new("testsub","testrg")

$manifest = @{
    Path              = '.\azure\resources\azure-resource.psd1'
    RootModule        = 'azure-resource-definition.psm1' 
    Author            = 'Zach Harris'
}
New-ModuleManifest @manifest