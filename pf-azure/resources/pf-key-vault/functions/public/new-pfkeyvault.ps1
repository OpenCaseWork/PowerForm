Function New-PfKeyVault
{
    if($global:_PfDeploymentContext.CurrentBuildContext)
    {
        $def = [PfKeyVaultDefinition]::New($global:_PfDeploymentContext.CurrentBuildContext)
    }
    else{
        $def = [PfKeyVaultDefinition]::New()
    }

    $global:_PfDeploymentContext.Definitions.Add($def) | Out-Null

    return $def
}

