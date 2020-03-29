Function New-PfKeyVaultBuild
{
    if($global:_PfAzureContext)
    {
        $kv = [PfKeyVaultBuildState]::New($global:_PfAzureContext)
    }
    else{
        $kv = [PfKeyVaultBuildState]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($kv) | Out-Null
    return $kv
    
}

