#Import-Module .\azure\resources\key-vault\key-vault-definition.psm1

#$kv = [KeyVaultDefinition]::new("testsub","testrg")

$manifest = @{
    Path              = '.\azure\resources\base-resource\base-resource.psd1'
    RootModule        = 'base-resource.psm1' 
    Author            = 'Zach Harris'
}
New-ModuleManifest @manifest