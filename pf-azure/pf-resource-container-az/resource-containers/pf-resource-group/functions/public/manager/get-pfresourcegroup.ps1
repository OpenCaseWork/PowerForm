Function Get-PfResourceGroup{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )
    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfNameFromContextAz -ClassPrefix "PfResourceGroup" -PfDeploymentBuild $global:_PfDeployment.CurrentBuild
    }
   
    $state = Get-PfResourceGroupAz -Name $Name
    return $state
}

