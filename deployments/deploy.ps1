try{
    Import-Module .\azure\pf-azure-context\pf-azure-context.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1

    Get-Command -Module pf-key-vault
    Get-Command -Module pf-log-analytics
    Get-Command -Module pf-deployment-context
    Get-Command -Module pf-azure-context

    $deployContext = New-PfDeploymentContext

    Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"

    #Login-AzAccount

    #Get-Command -Module key-vault
    $kvOptions = New-PfKeyVaultOptions
    $kv = New-PfKeyVaultBuild -Options $kvOptions

    $la = New-PfLogAnalyticsBuild

    $deployContext.Resources.AddRange(@($kv,$la))
    $deployContext.Resources

}
catch{
    $test = $_.Exception.Message
}