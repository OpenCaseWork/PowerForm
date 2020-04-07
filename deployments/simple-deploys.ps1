    
    #shows how to import modules
    Import-Module .\azure\resources\pf-key-vault\pf-key-vault.psd1
    Import-Module .\azure\resources\pf-log-analytics\pf-log-analytics.psd1

    #The purpose of this script is to show you can still work very simply with powerform and not have to get to overly complex

    ##############################################################################################################
    #
    #              Get a resource
    #
    #############################################################################################################
    #Shows how to get a resource.  No need to set a deployment context, build context, etc.

    $kv = Get-PfKeyVault -SubscriptionName "MYOCW-KKZH-D" -ResourceGroupName "RG-MYOCW-KKZH-ADM-D" -Name "KV-MYOCW-KKZH-ADM-C1-D01"

    ##############################################################################################################
    #
    #              Single resource deploy
    #
    #############################################################################################################
    #Shows the simple way to deploy a keyvault

    $pfContext = New-PfDeploymentContext
    $kv = New-PfKeyVault
    $kv.Options.Name = "KV-MYOCW-KKZH-ADM-C1-D01" 
    $kv.Options.SubscriptionName = "MYOCW-KKZH-D" 
    $kv.Options.ResourceGroupName = "RG-MYOCW-KKZH-ADM-D"
    $stateCollection = Deploy-PfDeploymentContext