
#Login-AzAccount
Import-Module .\azure\resources\key-vault\key-vault.psd1
Get-Command -Module key-vault
$kvOptions = New-KeyVaultOptions
$kvOptions 
$kv = New-KeyVaultDefinition -Options $kvOptions
$kv 

#Import-Module .\azure\resources\log-analytics\log-analytics.psd1
#get-command -Module log-analytics
#$la = New-LogAnalyticsDefinition 
#$la | gm

#Import-Module .\classes\powerform\module\powerform-resource.psd1
#$pf = [PowerFormResourceDefinition]::new()