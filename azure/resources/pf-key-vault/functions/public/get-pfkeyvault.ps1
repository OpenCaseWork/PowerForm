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

    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfAzResourceNameFromContext -ClassPrefix "PfKeyVault" -PfBuildContext $global:_PfDeploymentContext.CurrentBuildContext
    }

    if([string]::IsNullOrEmpty($SubscriptionName)){
        $SubscriptionName = Get-PfAzResourceNameFromContext -ClassPrefix "PfSubscription" -PfBuildContext $global:_PfDeploymentContext.CurrentBuildContext
    }

    if([string]::IsNullOrEmpty($ResourceGroupName)){
        $ResourceGroupName = Get-PfAzResourceNameFromContext -ClassPrefix "PfResourceGroup" -PfBuildContext $global:_PfDeploymentContext.CurrentBuildContext
    }   

    $state = Get-PfAzKeyVault -Name $Name -ResourceGroupName $ResourceGroupName -SubscriptionName $SubscriptionName
    
    return $state
}

