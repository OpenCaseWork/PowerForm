try {
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1
    Import-Module .\azure\resource-containers\pf-management-group\pf-management-group.psd1
    Import-Module .\azure\resource-containers\pf-subscription\pf-subscription.psd1
    Import-Module .\azure\resource-containers\pf-resource-group\pf-resource-group.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1

    #$pfContext = New-PfDeploymentContext
    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    #$pfContext = New-PfDeploymentContext -AzConfigFile "$($currentDir)\config\az-config.json"
    $pfContext = New-PfDeploymentContext -GlobalConfigFile "$($currentDir)\config\global-config.json" -AzConfigFile "$($currentDir)\config\az-config.json"

    Set-PfAzureContext -CompanyInfo $pfContext.GlobalConfig.CompanyInfo `
        -Group $pfContext.GlobalConfig.Groups.Lurie `
        -Label $pfContext.GlobalConfig.Labels.WebTeam `
        -Environment $pfContext.GlobalConfig.Environments.Qa `
        -AzRegion $pfContext.AzConfig.Regions.CentralUs

    #Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -AzRegion $pfContext.AzConfig.Regions.CentralUs
    <#Set-PfAzureContext -CompanyInfo $pfContext.GlobalConfig.CompanyInfo `
        -Group $pfContext.GlobalConfig.Groups.Team1 `
        -Label $pfContext.GlobalConfig.Labels.Networking `
        -Environment $pfContext.GlobalConfig.Environments.Development `
        -AzRegion $pfContext.AzConfig.Regions.CentralUs
        #>
    #Set-PfAzureContext  -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $pfContext.AzConfig.Regions.CentralUs

    #Login-AzAccount
    $rootMg = New-PfManagementGroup -DeploymentContext $pfContext
    #$pfContext.AddDefinition($rootMg)

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
    
    Update-PfAzureContext -Label $pfContext.GlobalConfig.Labels.SQL -AzRegion $pfContext.AzConfig.Regions.EastUs2

    $la = New-PfLogAnalytics

    $sub2 = Get-PfSubscription
    $rg2 = Get-PfResourceGroup
    $kv2 = Get-PfKeyVault
    $la2 = Get-PfLogAnalytics
    $la3 = Get-PfLogAnalytics -Name "Test" -ResourceGroup "Test"
  
    $stateCollection =$pfContext.Deploy()
    $laDef = $stateCollection.GetByName($la.Options.Name)
    $laDef
    [hashtable]$ht = $kv.Options.Tags
    $ht

}
catch {
    $test = $_.Exception.Message
}