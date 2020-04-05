Class PfDeploymentContext{

    [System.Collections.ArrayList]$Definitions=@()
    [PfCloudConfiguration]$AzConfig
    [PfGlobalConfiguration]$GlobalConfig
    
    PfDeploymentContext(){
        $this.AzConfig=(New-Object -TypeName "PfAzConfiguration")
        $this.GlobalConfig=(New-Object -TypeName "PfGlobalConfiguration")
    }
    [PfStateCollection]Deploy(){
        return Deploy-PfDeploymentContext
    }
    [void]AddDefinition([PfDefinition]$Definition){
        $this.Definitions.Add($Definition)
    }
}