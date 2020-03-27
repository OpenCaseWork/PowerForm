#Import-Module .\azure\resources\key-vault\key-vault-definition.psm1

#$kv = [KeyVaultDefinition]::new("testsub","testrg")

$manifest = @{
    Path              = '.\azure\resources\log-analytics\log-analytics.psd1'
    RootModule        = 'log-analytics.psm1' 
    Author            = 'Zach Harris'
}
New-ModuleManifest @manifest