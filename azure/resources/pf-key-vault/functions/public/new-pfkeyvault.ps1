Function New-PfKeyVault
{
    if($global:_PfAzureContext)
    {
        $kv = [PfKeyVaultDefinition]::New($global:_PfAzureContext)
    }
    else{
        $kv = [PfKeyVaultDefinition]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($kv) | Out-Null
    return $kv
    
}

