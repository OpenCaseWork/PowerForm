Function New-PfKeyVaultOptions
{
    $context = Get-CurrentPfAzureContext
    if($context)
    {
        [PfKeyVaultOptions]::New($context)
    }
    else {
        [PfKeyVaultOptions]::New()
    }
}

