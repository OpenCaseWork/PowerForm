#Import-Module .\azure\resources\key-vault\key-vault-definition.psm1

#$kv = [KeyVaultDefinition]::new("testsub","testrg")

$manifest = @{
    Path              = '.\azure\resources\pf-log-analytics\pf-log-analytics.psd1'
    RootModule        = 'pf-log-analytics.psm1' 
    Author            = 'Zach Harris'
}
New-ModuleManifest @manifest