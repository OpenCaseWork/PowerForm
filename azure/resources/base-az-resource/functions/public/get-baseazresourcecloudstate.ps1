Function Get-BaseAzResourceState
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName,
        [Parameter(Mandatory = $true)] 
        [string] $ClassPrefix
    )

    
    $contextResourceName = Get-PfAzureContextResourceName -Name $Name -ClassPrefix $ClassPrefix
    $contextSubscriptionName = Get-PfAzureContextSubscriptionName -Name $SubscriptionName
    $contextResourceGroupName = Get-PfAzureContextResourceGroupName -Name $ResourceGroupName
   
    $access = (New-Object -TypeName "$($ClassPrefix)Access")
    return $access.GetState($contextResourceName,$contextSubscriptionName,$contextResourceGroupName)
}

