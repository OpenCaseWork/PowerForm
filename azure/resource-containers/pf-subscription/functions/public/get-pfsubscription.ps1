Function Get-PfSubscription{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    $contextSubscriptionName = Get-PfAzureContextSubscriptionName -Name $Name
    $access = (New-Object -TypeName "PfSubscriptionAccess")
    return $access.GetState($contextSubscriptionName)
}

