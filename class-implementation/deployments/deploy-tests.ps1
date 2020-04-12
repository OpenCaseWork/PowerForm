#try {

    #shows how to import modules
    Import-Module .\powerform\modules\pf-az-module.psd1

    #shows modules currently imported
    Get-Module

    #shows what functions are exported from each module
   <#
    Get-Command -Module pf-subscription
    Get-Command -Module pf-key-vault
    Get-Command -Module pf-log-analytics
    Get-Command -Module pf-deployment-context 
    Get-Command -Module pf-azure-context
    #>

    ##############################################################################################################
    #
    #              Initialize PowerFrom (Override Default Configuration)
    #
    #############################################################################################################
    #This command need to be run to initialize configurations to use in the deployment contexts
    $currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $pfConfig = Initialize-PowerForm -CustomConfigFile "$($currentDir)\config\custom-config.json"

     ##############################################################################################################
    #
    #              Create a Named Deployment context for the whole test
    #
    #############################################################################################################
    #This command will create a deployment context to start adding build contexts and resources to
    
    $pfContext = New-PfDeployment -Name "DeployTests"

    
    ##############################################################################################################
    #
    #             Add build contexts
    #
    #############################################################################################################
    #This shows you how you can start to add different build contexts to your deployment context.  This 
    #allows you to then switch between those build contexts during your deployment so you can change
    #default values/configuration to be used
    
    Add-PfDeploymentBuild -Name "LurieWebComponentsDev" `
        -Company $pfConfig.Companies.OpenCaseWork `
        -Group $pfConfig.Groups.Lurie `
        -Label $pfConfig.Labels.WebTeam `
        -Environment $pfConfig.Environments.Development `
        -Region $pfConfig.Regions.CentralUs
    
    Add-PfDeploymentBuild -Name "GoodShepAdminComponentsQa" `
        -Company $pfConfig.Companies.OpenCaseWork `
        -Group $pfConfig.Groups.GoodShephard `
        -Label $pfConfig.Labels.AdminTeam `
        -Environment $pfConfig.Environments.Qa `
        -Region $pfConfig.Regions.EastUs2

    ##############################################################################################################
    #
    #               Setting Build Context
    #
    #############################################################################################################

    #I can always add more build context later on throughout the script (this is shown below).  But with the 
    #ones already created, I can now just switch to the context of my choosing and any resources built will
    #be built under that context until I switch to a different build context or add another

    Set-PfDeploymentBuild -Name "LurieWebComponentsDev"

    ##############################################################################################################
    #
    #               Creating a Management Group through context and assigning to sub
    #
    #############################################################################################################

    #The thought here is to let the context create the name for the MG then add a sub to that MG
    $mg = New-PfManagementGroup
    Add-PfDeploymentDefinition($mg)

    $sub = New-PfSubscription
    $sub.Options.ManagementGroupDefinition = $mg
    Add-PfDeploymentDefinition($sub)

    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)



    ##############################################################################################################
    #
    #               Creating Nested Management Groups, Using Get MG, and adding subs to them
    #
    #############################################################################################################

    #The thought here is that I build the default root MG, then add a nest MG under that root, then add a sub to that
    #nested MG.  You could nest as many MGs together as needed.

    $rootMg = New-PfManagementGroup 
    Add-PfDeploymentDefinition($rootMg)

    $getRootMg = Get-PfManagementGroup -Name $rootMg.Options.Name

    $devMg = New-PfManagementGroup
    $devMg.Options.Name="MG-OCW-Dev"
    $devMg.Options.ParentManagementGroupDefinition=$rootMg
    Add-PfDeploymentDefinition($devMg)
    
    $sub = New-PfSubscription
    $sub.Options.ManagementGroupDefinition = $devMg
    Add-PfDeploymentDefinition($sub)

    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

    ##############################################################################################################
    #
    #               Creating a subscription through context
    #
    #############################################################################################################

    #The thought here is that the subscription isn't created yet so we want to make sure it gets created
    #before deploying any resources.  We are creating it with default name from azurecontext 

    $sub = New-PfSubscription
    Add-PfDeploymentDefinition($sub)

    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

    ##############################################################################################################
    #
    #               Getting a subscription through context or named value
    #
    #############################################################################################################

    #Shows how to get subscriptions that are already in the cloud
    $sub = Get-PfSubscription

    $sub2 = Get-PfSubscription -Name "Sub2"

    ##############################################################################################################
    #
    #               Creating a subscription with name defined and adding resources to that sub
    #               How to use an options object to bulk change options
    #
    #############################################################################################################

    #This shows how you can use naming standards through context for everything but point to a subscription that does not 
    #use the naming standards.  All resources would be added to that subscription only if you change the subscription
    #name on the resources.  See how the keyvault below will be added to the testsub, but not the log anlaytics

    $subOptions = [PfSubscriptionOptions]@{
        Name="TestSub"
        OwnerObjectId="67867-768-678678-678-768"
        EnrollmentAccountObjectId="2342-2342-1234-1234123-324"
        OfferType="MS-AZ-300"
        PersistState=$false
    }
    $sub = New-PfSubscription
    $sub.Options=$subOptions
    Add-PfDeploymentDefinition($sub)

    $kv = New-PfKeyVault
    $kv.Options.SubscriptionName = $sub.Options.Name
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

     ##############################################################################################################
    #
    #               Creating a resource group with context values
    #
    #############################################################################################################

    #The thought here is that the resource group isn't created yet so we want to make sure it gets created
    #before deploying any resources.  We are creating it with default name from azurecontext 

    $sub = New-PfSubscription
    Add-PfDeploymentDefinition($sub)

    $rg = New-PfResourceGroup
    Add-PfDeploymentDefinition($rg)

    $rg2 = New-PfResourceGroup
    $rg2.Options.Name="DiffereRG"
    Add-PfDeploymentDefinition($rg2)

    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)
    
    $la = New-PfLogAnalytics
    $la.Options.ResourceGroupName=$rg.Options.Name
    Add-PfDeploymentDefinition($la)

    ##############################################################################################################
    #
    #               Getting a resource group through context or named value
    #
    #############################################################################################################

    #Shows how to get resource groups that are already in the cloud
    $rg = Get-PfResourceGroup
    
    $rg2 = Get-PfResourceGroup -Name "RG2"

    ##############################################################################################################
    #
    #               Build Context can drive naming defaults 
    #
    #############################################################################################################

    #The thought behind this is that a user wants to deploy resources out with best practices/enterprise standards
    #baked into the module.  By defining the deploy context parameters, the names will be created, therefore it knows
    #the RG, Sub, Resources names.  All options are going to be the defaults, so just build the definitions and deploy

    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

    Set-PfDeploymentBuild -Name "GoodShepAdminComponentsQa"

    $kv2 = New-PfKeyVault
    Add-PfDeploymentDefinition($kv2)

    $la2 = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la2)

    ##############################################################################################################
    #
    #               Switch Build Contexts in the middle of deployment context
    #
    #############################################################################################################

    #Shows you can build a keyvault for the admin team, then switch context to the "DM" team and build a LA

    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)

    Set-PfDeploymentBuild -Name "LurieWebComponentsDev"

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

    #Anything after this will be good shepard build context again
    Set-PfDeploymentBuild -Name "GoodShepAdminComponentsQa"
    

    ##############################################################################################################
    #
    #               Override the "enterprise standards"
    #
    #############################################################################################################

    #Shows how you can override the enterprise standards for any option such as name or resource group
        
    $kv = New-PfKeyVault
    $kv.Options.Name = "testing"
    Add-PfDeploymentDefinition($kv)

    Set-PfDeploymentBuild -Name "LurieWebComponentsDev"

    $la = New-PfLogAnalytics
    $la.Options.ResourceGroupName = "NewRg"
    Add-PfDeploymentDefinition($la)

    ##############################################################################################################
    #
    #               Deploy multiple resources with context and deployment context
    #
    #############################################################################################################

    #the thought here is that you get the sub and rg from the current context so all you need to do 
    #is define the name and other options

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    $la.Options.Name = "LA-MYOCW-KKZH-ADM-C1-D01" 
    Add-PfDeploymentDefinition($la)

    ##############################################################################################################
    #
    #               Deploy a single resource with context and deployment context
    #
    #############################################################################################################

    # the thought here is that you get the sub and rg from the
    #current context so all you need to do is define the name and other options

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    Add-PfDeploymentDefinition($kv)


    ##############################################################################################################
    #
    #               Deploy a single resource only
    #
    #############################################################################################################

    #the thought here is that you define everything from options
    #so there is no need for az context or deployment context

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    $kv.Options.SubscriptionName = "MYOCW-KKZH-D" 
    $kv.Options.ResourceGroupName = "RG-MYOCW-KKZH-ADM-D"
    Add-PfDeploymentDefinition($kv)

    ##############################################################################################################
    #
    #               Test Loading a single resource with az context set
    #
    #############################################################################################################

    #The thought is that you could pull a resource just by defining
    #the name and the context will be used to get the rg and sub to pull it from
 
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

    $kv = Get-PfKeyVault

    $kv2 = New-PfKeyVault
    $kv2.Options.Name = "testing"
    Add-PfDeploymentDefinition($kv2)

    ##############################################################################################################
    #
    #               Get resources with overrides of context
    #
    #############################################################################################################

    #Shows how you can override the context values when getting a cloud state for a resource

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

    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    $la.Options.Name = "LA-MYOCW-KKZH-ADM-C1-D01" 
    Add-PfDeploymentDefinition($la)


    ############################################################################################################
    #
    #             Deploy and get the definition of a resource after deploy
    #
    #############################################################################################################


    $kv = New-PfKeyVault
    Add-PfDeploymentDefinition($kv)

    $la = New-PfLogAnalytics
    Add-PfDeploymentDefinition($la)

    $stateCollection = Deploy-PfDeployment
    
    $laDef = $stateCollection.GetByName($la.Options.Name)
    Write-Host("Name Should have override values: $($laDef.Name)")

<#
}
catch {
    $test = $_.Exception.Message
}
#>