try{

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

    New-PfDeploymentContext

    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "ADM" -EnvironmentLetter "D" -Region "CentralUs"

    #name, az context built from deployment context params above
    $kv = New-PfKeyVaultBuild

    #name, az context built from deployment context params above
    $la = New-PfLogAnalyticsBuild

    Deploy-PfDeploymentContext

     ##############################################################################################################
    #
    #               Switch Az Contexts in the middle of deployment context
    #
    #############################################################################################################

    #Shows you can build a keyvault for the admin team, then switch context to the "DM" team and build a LA

    New-PfDeploymentContext

    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "ADM" -EnvironmentLetter "D" -Region "CentralUs"

    #name, az context built from deployment context params above
    $kv = New-PfKeyVaultBuild

    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "DM" -EnvironmentLetter "D" -Region "CentralUs"

    #name, az context built from deployment context params above
    $la = New-PfLogAnalyticsBuild

    Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Override the "enterprise standards"
    #
    #############################################################################################################

    #Shows how you can override the enterprise standards for any option such as name or resource group

    New-PfDeploymentContext

    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "ADM" -EnvironmentLetter "D" -Region "CentralUs"

    #name, az context built from deployment context params above
    $kv = New-PfKeyVaultBuild
    $kv.Options.Name = "testing"
    Set-PfAzureContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "DM" -EnvironmentLetter "D" -Region "CentralUs"

    #name, az context built from deployment context params above
    $la = New-PfLogAnalyticsBuild
    $la.Options.ResourceGroupName="NewRg"
    Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Deploy multiple resources with context and deployment context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options

    New-PfDeploymentContext

    Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -Region "CentralUs"

    $kv = New-PfKeyVaultBuild
    $kv.Options.Name="KV-MYAEA-KKZH-ADM-C1-D01" 

    $la = New-PfLogAnalyticsBuild
    $la.Options.Name="LA-MYAEA-KKZH-ADM-C1-D01" 

    Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Deploy a single resource with context and deployment context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options

    New-PfDeploymentContext

    Set-PfAzureContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -Region "CentralUs"

    $kv = New-PfKeyVaultBuild
    $kv.Options.Name="KV-MYAEA-KKZH-ADM-C1-D01" 

    Deploy-PfDeploymentContext


    ##############################################################################################################
    #
    #               Deploy a single resource only
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you define everything from options
    #so there is no need for az context or deployment context

    New-PfDeploymentContext

    $kv = New-PfKeyVaultBuild
    $kv.Options.Name="KV-MYAEA-KKZH-ADM-C1-D01" 
    $kv.Options.SubscriptionName="MYAEA-KKZH-D" 
    $kv.Options.ResourceGroupName="RG-MYAEA-KKZH-ADM-D"

    Deploy-PfDeploymentContext

    ##############################################################################################################
    #
    #               Test Loading a single resource with az context set
    #
    #############################################################################################################

    #Still need to write the get function, but the thought is that you could pull a resource just by defining
    #the name and the context will be used to get the rg and sub to pull it from
 
    #Set-AzCloudContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"
    #$kv = Get-KeyVaultDefinition -Name "KV-MYAEA-KKZH-ADM-C1-D01"


    ##############################################################################################################
    #
    #               Test Loading a single resource only
    #
    #############################################################################################################

    #Still need to write the get function, but the thought is that you could pull a resource without any 
    #az context or deployment context.
    #And if you even had a context set, this would still load that resource from any rg or sub outside the context
    
    #$kv = Get-KeyVaultDefinition -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D" -Name "KV-MYAEA-KKZH-ADM-C1-D01"

}
catch{
    $test = $_.Exception.Message
}