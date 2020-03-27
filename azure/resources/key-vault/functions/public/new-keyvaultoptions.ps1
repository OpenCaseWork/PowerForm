Function New-KeyVaultOptions
{
    $context = Get-CurrentAzCloudContext
    if($context)
    {
        [KeyVaultOptions]::New($context)
    }
    else {
        [KeyVaultOptions]::New()
    }
}

