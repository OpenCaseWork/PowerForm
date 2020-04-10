Function Get-PfDeploymentBuild
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string]$Name
    )   

    $deploymentBuild = $global:_PfDeployment.Builds | Where { $_.Name -eq $Name } | Select-Object -First 1
    if($deploymentBuild){
        return $deploymentBuild
    }
    else {
        Write-Error("Could not find build context named: $($Name)")
    }
}