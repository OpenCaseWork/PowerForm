try {

    #shows how to import modules
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1
    Import-Module .\azure\pf-azure-context\pf-azure-context.psd1
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1

    #shows what functions are exported from each module
    Get-Command -Module pf-key-vault
    Get-Command -Module pf-log-analytics
    Get-Command -Module pf-deployment-context 
    Get-Command -Module pf-azure-context

    ##############################################################################################################
    #
    #               Deployment Context can drive naming defaults 
    #
    #############################################################################################################

    #The thought behind this is that a user wants to deploy resources out with best practices/enterprise standards
    #baked into the module.  By defining the deploy context parameters, the names will be created, therefore it knows
    #the RG, Sub, Resources names.  All options are going to be the defaults, so just build the definitions and deploy

    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -CompanyInfo $pfContext.Global.CompanyInfo `
        -Group $pfContext.Global.Groups.Team1 `
        -Label $pfContext.Global.Labels.Networking `
        -Environment $pfContext.Global.Environments.Development `
        -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    $la = New-PfLogAnalytics
    $results = Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Switch Az Contexts in the middle of deployment context
    #
    #############################################################################################################

    #Shows you can build a keyvault for the admin team, then switch context to the "DM" team and build a LA

    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -CompanyInfo $pfContext.Global.CompanyInfo `
        -Group $pfContext.Global.Groups.Team1 `
        -Label $pfContext.Global.Labels.Networking `
        -Environment $pfContext.Global.Environments.Development `
        -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    Update-PfAzureContext -Label $pfContext.Global.Labels.SQL
    $la = New-PfLogAnalytics
    $results = Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Override the "enterprise standards"
    #
    #############################################################################################################

    #Shows how you can override the enterprise standards for any option such as name or resource group

    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -CompanyInfo $pfContext.Global.CompanyInfo `
        -Group $pfContext.Global.Groups.Team1 `
        -Label $pfContext.Global.Labels.Networking `
        -Environment $pfContext.Global.Environments.Development `
        -AzRegion $pfContext.Az.Regions.CentralUs
        
    $kv = New-PfKeyVault
    $kv.Options.Name = "testing"
    Update-PfAzureContext -Label $pfContext.Global.Labels.SQL
    $la = New-PfLogAnalytics
    $la.Options.ResourceGroupName = "NewRg"
    $results = Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Deploy multiple resources with context and deployment context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options


    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -SubscriptionName "MYOCW-TEST-D" -ResourceGroupName "RG-MYOCW-TEST-ADM-D" -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    $la = New-PfLogAnalytics
    $la.Options.Name = "LA-MYOCW-KKZH-ADM-C1-D01" 
    $results = Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Deploy a single resource with context and deployment context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options


    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    $results = Deploy-PfDeploymentContext


    ##############################################################################################################
    #
    #               Deploy a single resource only
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you define everything from options
    #so there is no need for az context or deployment context

    $pfContext = New-PfDeploymentContext
    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    $kv.Options.SubscriptionName = "MYOCW-KKZH-D" 
    $kv.Options.ResourceGroupName = "RG-MYOCW-KKZH-ADM-D"
    $results = Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Test Loading a single resource with az context set
    #
    #############################################################################################################

    #The thought is that you could pull a resource just by defining
    #the name and the context will be used to get the rg and sub to pull it from
 

    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -AzRegion $pfContext.Az.Regions.CentralUs
    $kv = Get-PfKeyVault -Name "KV-MYOCW-KKZH-ADM-C1-D01"

    ##############################################################################################################
    #
    #               Test Loading a single resource only
    #
    #############################################################################################################

    #The thought is that you could pull a resource without any 
    #az context or deployment context.
    #And if you even had a context set, this would still load that resource from any rg or sub outside the context
    
    $kv = Get-PfKeyVault -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -Name "KV-MYOCW-KKZH-ADM-C1-D01"

    ##############################################################################################################
    #
    #               Get resources with context set with "enterprise standards"
    #
    #############################################################################################################

    #Shows how you can use the get cloud state function with enterprise standards defined in context.
    #Also shows how you can get a resource within a deployment context as well


    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -CompanyAbbreviation "MYOCW" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = Get-PfKeyVault
    $kv2 = New-PfKeyVault
    $kv2.Options.Name = "testing"
    $results = Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Get resources with overrides of context
    #
    #############################################################################################################

    #Shows how you can override the context values when getting a cloud state for a resource

    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -CompanyAbbreviation "MYOCW" -GroupAbbreviation "KKZH" -Label "ADM" -EnvironmentLetter "D" -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = Get-PfKeyVault
    $kv2 = Get-PfKeyVault -Name "test"
    $kv3 = Get-PfKeyVault -Name "test" -ResourceGroupName "DM"
    $kv4 = Get-PfKeyVault -Name "test" -ResourceGroupName "DM" -SubscriptionName "testSub"

    ##############################################################################################################
    #
    #               Deploy resources and then use the definitions after
    #
    #############################################################################################################

    #Shows how you can deploy resources, get their definiton objects back and have them available for comparison or reference


    $pfContext = New-PfDeploymentContext
    Set-PfAzureContext -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -AzRegion $pfContext.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    $la = New-PfLogAnalytics
    $la.Options.Name = "LA-MYOCW-KKZH-ADM-C1-D01" 
    $results = Deploy-PfDeploymentContext
    
    $laDef = $results.GetByName($la.Options.Name)
    if ($laDef.CloudState.Name -eq $laDef.BuildState.Options.Name) {
        Write-Host("Names check out...")
    }

    ############################################################################################################
    #
    #              Override PowerForm's Default Azure Configuration
    #
    #############################################################################################################

      #Shows how you can override azure config options in new-deploymentcontext
    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfContext = New-PfDeploymentContext -AzConfigFile "$($currentDir)\config\az-config.json"
    Set-PfAzureContext -CompanyInfo $pfContext.Global.CompanyInfo `
        -Group $pfContext.Global.Groups.Team1 `
        -Label $pfContext.Global.Labels.Networking `
        -Environment $pfContext.Global.Environments.Development `
        -AzRegion $pfContext.Az.Regions.CentralUs
    $kv = New-PfKeyVault
    $la = New-PfLogAnalytics
    $results = Deploy-PfDeploymentContext
    
    $laDef = $results.GetByName($la.Options.Name)
    if($laDef.CloudState.Name -eq $laDef.BuildState.Options.Name){
        Write-Host("Name Should have azure override values: $($laDef.CloudState.Name)")
    }

     ############################################################################################################
    #
    #              Override PowerForm's Default Global Configuration
    #
    #############################################################################################################

     #Shows how you can override global config options in new-deploymentcontext
    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfContext = New-PfDeploymentContext -GlobalConfigFile "$($currentDir)\config\global-config.json"
    
    #notice the property changes on group, label, and environment.  These are custom object from config now
    Set-PfAzureContext -CompanyInfo $pfConfig.Global.CompanyInfo `
        -Group $pfConfig.Global.Groups.Lurie `
        -Label $pfConfig.Global.Labels.WebTeam `
        -Environment $pfConfig.Global.Environments.Qa `
        -AzRegion $pfConfig.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    $la = New-PfLogAnalytics
    $results = Deploy-PfDeploymentContext
    
    $laDef = $results.GetByName($la.Options.Name)
    if($laDef.CloudState.Name -eq $laDef.BuildState.Options.Name){
        Write-Host("Name Should have global override values: $($laDef.CloudState.Name)")
    }

    ############################################################################################################
    #
    #              Override PowerForm's Default Global AND Azure Configuration
    #
    #############################################################################################################

    #Shows how you can override config options in new-deploymentcontext

    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfContext = New-PfDeploymentContext -GlobalConfigFile "$($currentDir)\config\global-config.json"  -AzConfigFile "$($currentDir)\config\az-config.json"
    
    #notice the property changes on group, label, and environment.  These are custom object from config now
    Set-PfAzureContext -CompanyInfo $pfConfig.Global.CompanyInfo `
        -Group $pfConfig.Global.Groups.Lurie `
        -Label $pfConfig.Global.Labels.WebTeam `
        -Environment $pfConfig.Global.Environments.Qa `
        -AzRegion $pfConfig.Az.Regions.CentralUs

    $kv = New-PfKeyVault
    $la = New-PfLogAnalytics
    $results = Deploy-PfDeploymentContext
    
    $laDef = $results.GetByName($la.Options.Name)
    if($laDef.CloudState.Name -eq $laDef.BuildState.Options.Name){
        Write-Host("Name Should have override values: $($laDef.CloudState.Name)")
    }

}
catch {
    $test = $_.Exception.Message
}