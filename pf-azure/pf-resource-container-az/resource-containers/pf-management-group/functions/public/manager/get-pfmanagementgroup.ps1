Function Get-PfManagementGroup{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    if([string]::IsNullOrEmpty($Name)){
        $Name = Get-PfNameFromContextAz -ClassPrefix "PfManagementGroup" -PfDeploymentBuild $global:_PfDeployment.CurrentBuild
    }
   
    $state = Get-PfManagementGroupAz -Name $Name
    return $state
}

