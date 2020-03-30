try {
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1

    #$pfConfig = New-PfDeploymentContext
    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfConfig = New-PfDeploymentContext -AzConfigFile "$($currentDir)\configuration\az-configuration.json"


    #Set-PfAzureContext -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -AzRegion $pfConfig.Az.Regions.CentralUs
    Set-PfAzureContext -CompanyAbbreviation "MYOCW" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $pfConfig.Az.Regions.CentralUs
    #Set-PfAzureContext  -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -CompanyAbbreviation "MYOCW" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $pfConfig.Az.Regions.CentralUs

    #Login-AzAccount

    $kv = New-PfKeyVault

    Update-PfAzureContext -Label "DM" -AzRegion $pfConfig.Az.Regions.EastUs2

    $la = New-PfLogAnalytics

    $kv2 = Get-PfKeyVault
    $la2 = Get-PfLogAnalytics
    $la3 = Get-PfLogAnalytics -Name "Test" -ResourceGroup "Test"
  
    $results = Deploy-PfDeploymentContext
    $laDef = $results.GetByName($la.Options.Name)
    $laDef

}
catch {
    $test = $_.Exception.Message
}