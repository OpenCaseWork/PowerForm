Function Get-PfKeyVault
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName
    )

    return Get-BaseAzResourceCloudState -Name $Name -SubscriptionName $SubscriptionName -ResourceGroupName $ResourceGroupName -AzResourceType $([AzResourceTypes]::KeyVault)
}

