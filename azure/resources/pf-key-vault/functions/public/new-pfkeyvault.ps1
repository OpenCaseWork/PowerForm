Function New-PfKeyVault
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfDeploymentContext] $DeploymentContext
    )
    
    if($global:_PfAzureContext)
    {
        $kv = [PfKeyVaultDefinition]::New($global:_PfAzureContext)
    }
    else{
        $kv = [PfKeyVaultDefinition]::New()
    }

    Add-PfDeploymentContextDefinition -DeploymentContext $DeploymentContext -Definition $kv

    return $kv
    
}

