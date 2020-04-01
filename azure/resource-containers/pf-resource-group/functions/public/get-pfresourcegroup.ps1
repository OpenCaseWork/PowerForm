Function Get-PfResourceGroup{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName
    )

    $contextResourceGroupName = Get-PfAzureContextResourceGroupName -Name $Name
    $contextSubscriptionName = Get-PfAzureContextSubscriptionName -Name $SubscriptionName

    $access = (New-Object -TypeName "PfResourceGroupAccess")
    return $access.GetCloudState($contextResourceGroupName,$contextSubscriptionName)
}

