$global:_currentAzCloudContext
Function Set-AzCloudContext 
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $true)] 
        [string] $ResourceGroupName
    )   
    
    $global:_currentAzCloudContext = [AzCloudContext]::New($SubscriptionName,$ResourceGroupName)
}

