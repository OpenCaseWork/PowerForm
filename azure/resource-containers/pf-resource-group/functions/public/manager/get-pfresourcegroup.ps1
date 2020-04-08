Function Get-PfResourceGroup{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )
    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfAzResourceNameFromContext -ClassPrefix "PfResourceGroup" -PfBuildContext $global:_PfDeploymentContext.CurrentBuildContext
    }
   
    $state = Get-PfResourceGroupAz -Name $Name
    return $state
}
