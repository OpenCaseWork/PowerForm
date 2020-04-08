Function Get-PfManagementGroup{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfAzResourceNameFromContext -ClassPrefix "PfManagementGroup" -PfBuildContext $global:_PfDeploymentContext.CurrentBuildContext
    }
   
    $state = Get-PfManagementGroupAz -Name $Name
    return $state
}

