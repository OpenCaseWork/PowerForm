#Import-Module .\azure\resources\key-vault\key-vault-definition.psm1

#$kv = [KeyVaultDefinition]::new("testsub","testrg")

$manifest = @{
    Path              = '.\azure\az-context\az-context.psd1'
    RootModule        = 'az-context.psm1' 
    Author            = 'Zach Harris'
}
New-ModuleManifest @manifest