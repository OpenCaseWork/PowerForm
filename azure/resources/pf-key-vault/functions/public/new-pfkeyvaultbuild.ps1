Function New-PfKeyVaultBuild
{
    Param (
        [Parameter(Mandatory = $false)] 
        [PfKeyVaultOptions] $Options
    )   
    # use this to get the parameter set name
    if($Options)
    {
        [PfKeyVaultBuildState]::New($Options)
    }
    else {
        [PfKeyVaultBuildState]::New()
    }
}

