Function Set-PfDeploymentBuild 
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string]$Name
    )   
    
    $global:_PfDeployment.CurrentBuild = Get-PfDeploymentBuild -Name $Name
}