Function Get-PfSubscription{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfAzResourceNameFromContext -ClassPrefix "PfSubscription" -PfBuildContext $global:_PfDeploymentContext.CurrentBuildContext
    }
   
    $state = Get-PfSubscriptionAz -Name $Name
    return $state
    
}

