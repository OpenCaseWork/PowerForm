Function Get-PfNameFromContextAz
{
    Param (
        [Parameter(Mandatory = $true)]
        [string] $ClassPrefix,
        [Parameter(Mandatory = $true)]
        [PfDeploymentBuild]$PfDeploymentBuild
    )   

    $name=""
    
    if($PfDeploymentBuild.Label){
        $name=[AzNamingStandards]::GetResourceName($ClassPrefix,$PfDeploymentBuild)
    }

    return $name
}