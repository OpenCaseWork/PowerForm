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

    return Get-BaseAzResourceState -Name $Name `
        -SubscriptionName $SubscriptionName `
        -ResourceGroupName $ResourceGroupName `
        -ClassPrefix "PfKeyVault"
}

