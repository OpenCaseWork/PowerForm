Import-Module .\azure\resources\key-vault\module\key-vault.psd1
$kv = [KeyVaultDefinition]::new("testsub","testrg")
$kv

Import-Module .\azure\resources\log-analytics\module\log-analytics.psd1
$la = [LogAnalyticsDefinition]::new("testsub","testrg")
$la

#Import-Module .\classes\powerform\module\powerform-resource.psd1
#$pf = [PowerFormResourceDefinition]::new()