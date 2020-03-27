try{
    Import-Module .\azure\az-cloud-context\az-cloud-context.psd1
    Import-Module .\azure\resources\key-vault\key-vault.psd1
    Import-Module .\azure\resources\log-analytics\log-analytics.psd1
    Import-Module .\powerform\pf-deployment-context\pf-deployment-context.psd1

    Get-Command -Module log-analytics
    Get-Command -Module key-vault
    Get-Command -Module pf-deployment-context
    Get-Command -Module az-cloud-context

    ##############################################################################################################
    #
    #               Deployment Context can drive naming defaults 
    #
    #############################################################################################################

    #Still need to build this. The thought behind this is that a user wants to deploy resources out with best practices/enterprise standards
    #baked into the module.  By defining the deploy context parameters, the names will be created, therefore it knows
    #the RG, Sub, Resources names.  All options are going to be the defaults, so just build the definitions and deploy

    #$deployContext = New-PfDeploymentContext -CompanyAbbreviation "MYAEA" -GroupAbbreviation "KKZH" -TeamAbbreviation "ADM" -EnvironmentLetter "D"

    #name, az context built from deployment context params above
    #$kv = New-KeyVaultDefinition

    #name, az context built from deployment context params above
    #$la = New-LogAnalyticsDefinition

    #$deployContext.ResourceDefinitions.AddRange(@($kv,$la))
    #$deployContext.Deploy()


    ##############################################################################################################
    #
    #               Deploy multiple resources with context and deployment context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options

    $deployContext = New-PfDeploymentContext

    Set-AzCloudContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"

    $kvOptions = New-KeyVaultOptions
    $kvOptions.Name="KV-MYAEA-KKZH-ADM-C1-D01" 
    $kv = New-KeyVaultDefinition -Options $kvOptions

    $laOptions = New-LogAnalyticsOptions
    $laOptions.Name="LA-MYAEA-KKZH-ADM-C1-D01" 
    $la = New-LogAnalyticsDefinition -Options $laOptions

    $deployContext.ResourceDefinitions.AddRange(@($kv,$la))
    #$deployContext.Deploy()

    ##############################################################################################################
    #
    #               Deploy a single resource with context and deployment context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options

    $deployContext2 = New-PfDeploymentContext

    Set-AzCloudContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"

    $kvOptions = New-KeyVaultOptions
    $kvOptions.Name="KV-MYAEA-KKZH-ADM-C1-D01" 
    $kv = New-KeyVaultDefinition -Options $kvOptions

    $deployContext2.ResourceDefinitions.Add($kv)
    #$deployContext2.Deploy()



    ##############################################################################################################
    #
    #               Deploy a single resource with context
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options

    Set-AzCloudContext -SubscriptionName "MYAEA-KKZH-D" -ResourceGroupName "RG-MYAEA-KKZH-ADM-D"

    #Get-Command -Module key-vault
    $kvOptions = New-KeyVaultOptions
    $kvOptions.Name="KV-MYAEA-KKZH-ADM-C1-D01" 
    $kv = New-KeyVaultDefinition -Options $kvOptions

    #$kv.Access.Deploy()

    ##############################################################################################################
    #
    #               Deploy a single resource only
    #
    #############################################################################################################

    #Still need to write the deploy method, but the thought here is that you define everything from options
    #so there is no need for az context or deployment context

    $kvOptions = New-KeyVaultOptions

    $kvOptions.Name="KV-MYAEA-KKZH-ADM-C1-D01" 
    $kvOptions.SubscriptionName="MYAEA-KKZH-D" 
    $kvOptions.ResourceGroupName="RG-MYAEA-KKZH-ADM-D"

    $kv = New-KeyVaultDefinition -Options $kvOptions

    #$kv.Access.Deploy()

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