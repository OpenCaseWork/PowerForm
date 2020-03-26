Function New-AzContext 
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $true)] 
        [string] $ResourceGroupName
    )   

    [AzContext]::New($SubscriptionName,$ResourceGroupName)
}

