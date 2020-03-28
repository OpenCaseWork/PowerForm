try{
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1
    Import-Module .\azure\pf-azure-context\pf-azure-context.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1


    Get-Command -Module pf-key-vault
    Get-Command -Module pf-log-analytics
    Get-Command -Module pf-deployment-context 
    Get-Command -Module pf-azure-context

    New-PfDeploymentContext

    #Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -Region "CentralUs" 
    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "ADM" -EnvironmentLetter "D" -Region "CentralUs"
    #Set-PfAzureContext  -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "ADM" -EnvironmentLetter "D" -Region "CentralUs"
    #Login-AzAccount

    #Get-Command -Module key-vault
    #$kvOptions = New-PfKeyVaultOptions
    #$kvOptions.Name="KV-MYAEA-KKZH-ADM-C1-D01" 
    #$kv = New-PfKeyVaultBuild -Options $kvOptions
    $kv = New-PfKeyVaultBuild

    $la = New-PfLogAnalyticsBuild

    #$deployContext.Resources.AddRange(@($kv,$la))
  
    Deploy-PfDeploymentContext

}
catch{
    $test = $_.Exception.Message
}