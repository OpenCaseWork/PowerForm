try {
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1
    Import-Module .\azure\resource-containers\pf-management-group\pf-management-group.psd1
    Import-Module .\azure\resource-containers\pf-subscription\pf-subscription.psd1
    Import-Module .\azure\resource-containers\pf-resource-group\pf-resource-group.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1

    $pfConfig = New-PfDeploymentContext
    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    #$pfConfig = New-PfDeploymentContext -AzConfigFile "$($currentDir)\config\az-config.json"
    $pfConfig = New-PfDeploymentContext -GlobalConfigFile "$($currentDir)\config\global-config.json" -AzConfigFile "$($currentDir)\config\az-config.json"

    Set-PfAzureContext -CompanyInfo $pfConfig.Global.CompanyInfo `
        -Group $pfConfig.Global.Groups.Lurie `
        -Label $pfConfig.Global.Labels.WebTeam `
        -Environment $pfConfig.Global.Environments.Qa `
        -AzRegion $pfConfig.Az.Regions.CentralUs

    #Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -AzRegion $pfConfig.Az.Regions.CentralUs
    <#Set-PfAzureContext -CompanyInfo $pfConfig.Global.CompanyInfo `
        -Group $pfConfig.Global.Groups.Team1 `
        -Label $pfConfig.Global.Labels.Networking `
        -Environment $pfConfig.Global.Environments.Development `
        -AzRegion $pfConfig.Az.Regions.CentralUs
        #>
    #Set-PfAzureContext  -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $pfConfig.Az.Regions.CentralUs

    #Login-AzAccount
    $rootMg = New-PfManagementGroup 
    $getRootMg = Get-PfManagementGroup -Name $rootMg.Options.Name

    $devMg = New-PfManagementGroup
    $devMg.Options.Name="MG-OCW-Dev"
    $devMg.Options.ParentManagementGroupName=$rootMg.Options.Name

    $sub = New-PfSubscription
    $sub.Options.ManagementGroupName = $devMg
    $rg = New-PfResourceGroup

    $kv = New-PfKeyVault
    $kv.Options.Tags.Add("Group","TestGroup")
    $kv.Options.Tags.Add("Label","TestLabel")
    
    Update-PfAzureContext -Label $pfConfig.Global.Labels.SQL -AzRegion $pfConfig.Az.Regions.EastUs2

    $la = New-PfLogAnalytics

    $sub2 = Get-PfSubscription
    $rg2 = Get-PfResourceGroup
    $kv2 = Get-PfKeyVault
    $la2 = Get-PfLogAnalytics
    $la3 = Get-PfLogAnalytics -Name "Test" -ResourceGroup "Test"
  
    $stateCollection = Deploy-PfDeploymentContext
    $laDef = $stateCollection.GetResourceByName($la.Options.Name)
    $laDef
    [hashtable]$ht = $kv.Options.Tags
    $ht

}
catch {
    $test = $_.Exception.Message
}