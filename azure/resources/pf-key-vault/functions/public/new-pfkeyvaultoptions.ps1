Function New-PfKeyVaultOptions
{
    if($global:_PfAzureContext)
    {
        [PfKeyVaultOptions]::New($global:_PfAzureContext)
    }
    else {
        [PfKeyVaultOptions]::New()
    }
}

