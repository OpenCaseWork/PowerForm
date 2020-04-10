Function Get-PfSubscription{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfNameFromContextAz -ClassPrefix "PfSubscription" -PfDeploymentBuild $global:_PfDeployment.CurrentBuild
    }
   
    $state = Get-PfSubscriptionAz -Name $Name
    return $state
    
}

