try{
    Import-Module .\azure\az-cloud-context\az-cloud-context.psd1
    Import-Module .\azure\resources\key-vault\key-vault.psd1
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1

    Get-Command -Module key-vault
    Get-Command -Module pf-deployment-context
    Get-Command -Module az-context

    $deployContext = New-PfDeploymentContext

    Set-AzCloudContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"

    #Login-AzAccount

    #Get-Command -Module key-vault
    $kvOptions = New-KeyVaultOptions
    $kv = New-KeyVaultDefinition -Options $kvOptions

    $deployContext.ResourceDefinitions.Add($kv)
    $deployContext.ResourceDefinitions

    #$la = New-LogAnalyticsDefinition 
    #$la | gm

}
catch{
    $test = $_.Exception.Message
}