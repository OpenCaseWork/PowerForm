$global:_currentPfAzureContext
Function Set-PfAzureContext 
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $true)] 
        [string] $ResourceGroupName
    )   
    
    $global:_currentPfAzureContext = [PfAzureContext]::New($SubscriptionName,$ResourceGroupName)
}

