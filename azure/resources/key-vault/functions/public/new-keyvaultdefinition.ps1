Function New-KeyVaultDefinition 
{
    Param (
        [Parameter(Mandatory = $false)] 
        [KeyVaultOptions] $Options
    )   
    # use this to get the parameter set name
    if($Options)
    {
        [KeyVaultDefinition]::New($Options)
    }
    else {
        [KeyVaultDefinition]::New()
    }
}

