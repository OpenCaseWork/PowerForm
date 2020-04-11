#try {
    $VerbosePreference = "continue"
    #$ErrorActionPreference = "Stop"
    Import-Module .\powerform\modules\pf-az-module.psd1

    Get-Module
    #Get-Command -Module pf-az-module

    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfConfig = Initialize-PowerForm -CustomConfigFile "$($currentDir)\config\custom-config.json"

    $pfDeployment = New-PfDeployment -Name "OcwDevelopment"
    
    Add-PfDeploymentBuild -Name "LurieAdminComponentsDev" `
        -Company $pfConfig.Companies.OpenCaseWork `
        -Group $pfConfig.Groups.Lurie `
        -Label $pfConfig.Labels.AdminTeam `
        -Environment $pfConfig.Environments.Development `
        -Region $pfConfig.Regions.CentralUs
    
    Set-PfDeploymentBuild -Name "LurieAdminComponentsDev"
    #Login-AzAccount
    $rootMg = New-PfManagementGroup
    Add-PfDeploymentDefinition($rootMg)

    $getRootMg= Get-PfManagementGroup -Name $rootMg.Options.Name

    $devMg = New-PfManagementGroup
    $devMg.Options.Name="MG-OCW-Dev"
    $devMg.Options.ParentManagementGroupDefinition=$rootMg
    Add-PfDeploymentDefinition($devMg)


    $sub = New-PfSubscription
    $sub.Options.ManagementGroupDefinition = $devMg
    Add-PfDeploymentDefinition($sub)


    $getSub = Get-PfSubscription -Name $sub.Options.Name

    $rg = New-PfResourceGroup
    $rg.Options.SubscriptionDefinition = $sub
    Add-PfDeploymentDefinition($rg)


    $getRg = Get-PfResourceGroup -Name $rg.Options.Name
    
    $kv = New-PfKeyVault
    $kv.Options.Tags.Add("Group","TestGroup")
    $kv.Options.Tags.Add("Label","TestLabel")
    Add-PfDeploymentDefinition($kv)

    $getKv = Get-PfKeyVault -Name $kv.Options.Name

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

    $sub2 = Get-PfSubscription
    $rg2 = Get-PfResourceGroup
    $kv2 = Get-PfKeyVault
    $la2 = Get-PfLogAnalytics
    $la3 = Get-PfLogAnalytics -Name "Test" -ResourceGroup "Test"


    
    $stateCollection = Deploy-PfDeployment
    $stateCollection 

    $laDef = $stateCollection.GetByName($la.Options.Name)
    $laDef
    [hashtable]$ht = $kv.Options.Tags
    $ht
    
<#}
catch {
    $test = $_.Exception.Message
}#>
