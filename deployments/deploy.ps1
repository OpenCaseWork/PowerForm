try{
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1
    Import-Module .\azure\pf-azure-context\pf-azure-context.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1

    New-PfDeploymentContext

    #Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -AzRegion $([AzRegions]::CentralUs)
    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $([AzRegions]::CentralUs)
    #Set-PfAzureContext  -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $([AzRegions]::CentralUs)
    #Login-AzAccount

    $kv = New-PfKeyVault

    Update-PfAzureContext -Label "DM"

    $la = New-PfLogAnalytics

    $kv2 = Get-PfKeyVault
    $la2 = Get-PfLogAnalytics
    $la3 = Get-PfLogAnalytics -Name "Test" -ResourceGroup "Test"
  
    $results = Deploy-PfDeploymentContext
    $laDef = $results.GetByName($la.Options.Name)
    $laDef

}
catch{
    $test = $_.Exception.Message
}