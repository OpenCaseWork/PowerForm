try{
    Import-Module .\azure\az-context\az-context.psd1
    Get-Command -Module az-context
    $az=New-AzContext -SubscriptionName "TestSub" -ResourceGroup "TestRg"

    #Login-AzAccount
    Import-Module .\azure\resources\key-vault\key-vault.psd1
    Get-Command -Module key-vault
    $kvOptions = New-KeyVaultOptions
    $kv = New-KeyVaultDefinition -Options $kvOptions


    #Import-Module .\azure\resources\log-analytics\log-analytics.psd1
    #get-command -Module log-analytics
    #$la = New-LogAnalyticsDefinition 
    #$la | gm

    #Import-Module .\classes\powerform\module\powerform-resource.psd1
    #$pf = [PowerFormResourceDefinition]::new()
}
catch{
    $test = $_.Exception.Message
}