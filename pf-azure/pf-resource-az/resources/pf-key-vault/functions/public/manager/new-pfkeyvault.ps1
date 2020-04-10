Function New-PfKeyVault
{
    if($global:_PfDeployment.CurrentBuild)
    {
        $def = [PfKeyVaultDefinition]::New($global:_PfDeployment.CurrentBuild)
    }
    else{
        $def = [PfKeyVaultDefinition]::New()
    }
    return $def
}

