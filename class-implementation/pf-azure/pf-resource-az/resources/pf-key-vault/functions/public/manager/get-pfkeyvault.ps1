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
        $Name = Get-PfNameFromContextAz -ClassPrefix "PfKeyVault" -PfDeploymentBuild $global:_PfDeployment.CurrentBuild
    }

    if([string]::IsNullOrEmpty($SubscriptionName)){
        $SubscriptionName = Get-PfNameFromContextAz -ClassPrefix "PfSubscription" -PfDeploymentBuild $global:_PfDeployment.CurrentBuild
    }

    if([string]::IsNullOrEmpty($ResourceGroupName)){
        $ResourceGroupName = Get-PfNameFromContextAz -ClassPrefix "PfResourceGroup" -PfDeploymentBuild $global:_PfDeployment.CurrentBuild
    }   

    $state = Get-PfKeyVaultAz -Name $Name -ResourceGroupName $ResourceGroupName -SubscriptionName $SubscriptionName
    
    return $state
}

