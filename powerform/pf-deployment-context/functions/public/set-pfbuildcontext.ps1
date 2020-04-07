Function Set-PfBuildContext 
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string]$Name
    )   
    
    $global:_PfDeploymentContext.CurrentBuildContext = Get-PfBuildContext -Name $Name
}