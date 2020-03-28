Function New-PfKeyVaultBuild
{
    <#
    Param (
        [Parameter(Mandatory = $false)] 
        [PfKeyVaultOptions] $Options
    )   
    # use this to get the parameter set name
    if($Options)
    {
        $kv = [PfKeyVaultBuildState]::New($Options)
    }
    else {
        $kv = [PfKeyVaultBuildState]::New()
    }
    $global:_PfDeploymentContext.Resources.Add($kv) | Out-Null
    return $kv
    #>

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

