#Login-AzAccount
Import-Module .\azure\resources\key-vault\module\key-vault.psd1
get-command -Module .\azure\resources\key-vault\module\key-vault.psd1
#$kv = [KeyVaultDefinition]::new("MYAEA-KKZH-D","RG-MYAEA-KKZH-ADM-D")
$kv = New-KeyVaultDefinition -SubscriptionName "MYAEA-KKZH-D" `
    -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"
$kv | gm

Import-Module .\azure\resources\log-analytics\module\log-analytics.psd1
get-command -Module .\azure\resources\log-analytics\module\log-analytics.psd1
$la = [LogAnalyticsDefinition]::new("MYAEA-KKZH-D","RG-MYAEA-KKZH-ADM-D")
$la | gm

#Import-Module .\classes\powerform\module\powerform-resource.psd1
#$pf = [PowerFormResourceDefinition]::new()