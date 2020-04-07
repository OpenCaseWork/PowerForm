#try {
    $VerbosePreference = "continue"
    #Import-Module .\powerform\powerform-az.psd1
    #Import-Module .\azure\resource-containers\base-az-resource-container\base-az-resource-container.psd1
    #Import-Module .\azure\resource-containers\pf-management-group\pf-management-group.psd1
    #Import-Module .\azure\resource-containers\pf-subscription\pf-subscription.psd1
    #Import-Module .\azure\resource-containers\pf-resource-group\pf-resource-group.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1
    #Import-Module .\azure\resources\base-az-resource\base-az-resource.psd1

    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfConfig = Initialize-PowerForm -CustomConfigFile "$($currentDir)\config\custom-config.json"

    $pfContext = New-PfDeploymentContext -Name "OcwDevelopment"
    
    Add-PfBuildContext -Name "LurieWebComponentsDev" `
        -Company $pfConfig.Companies.OpenCaseWork `
        -Group $pfConfig.Groups.Lurie `
        -Label $pfConfig.Labels.WebTeam `
        -Environment $pfConfig.Environments.Development `
        -Region $pfConfig.Regions.CentralUs
    
    Add-PfBuildContext -Name "LurieAdminComponentsDev" `
        -Company $pfConfig.Companies.OpenCaseWork `
        -Group $pfConfig.Groups.Lurie `
        -Label $pfConfig.Labels.AdminTeam `
        -Environment $pfConfig.Environments.Development `
        -Region $pfConfig.Regions.CentralUs
    
    Set-PfBuildContext -Name "LurieAdminComponentsDev"
    #Login-AzAccount
    $rootMg = New-PfManagementGroup

    $getRootMg = Get-PfManagementGroup -Name $rootMg.Options.Name

    $devMg = New-PfManagementGroup
    $devMg.Options.Name="MG-OCW-Dev"
    $devMg.Options.ParentManagementGroupName=$rootMg.Options.Name

    $sub = New-PfSubscription
    $sub.Options.ManagementGroupName = $devMg.Options.Name

    $getSub = Get-PfSubscription -Name $sub.Options.Name

    $rg = New-PfResourceGroup
    $rg.Options.SubscriptionName = $sub.Options.Name

    $getRg = Get-PfResourceGroup -Name $rg.Options.Name
    
    $kv = New-PfKeyVault
    $kv.Options.Tags.Add("Group","TestGroup")
    $kv.Options.Tags.Add("Label","TestLabel")

    $getKv = Get-PfKeyVault -Name $kv.Options.Name
  
    Set-PfBuildContext -Name "LurieWebComponentsDev"

    $la = New-PfLogAnalytics

    $sub2 = Get-PfSubscription
    $rg2 = Get-PfResourceGroup
    $kv2 = Get-PfKeyVault
    $la2 = Get-PfLogAnalytics
    $la3 = Get-PfLogAnalytics -Name "Test" -ResourceGroup "Test"


    
    $stateCollection = Deploy-PfDeploymentContext
    $stateCollection 

    $laDef = $stateCollection.GetByName($la.Options.Name)
    $laDef
    [hashtable]$ht = $kv.Options.Tags
    $ht
    #>

<#
}
catch {
    $test = $_.Exception.Message
}
#>