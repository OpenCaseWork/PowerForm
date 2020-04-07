Function Get-PfBuildContext
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string]$Name
    )   

    $buildContext = $global:_PfDeploymentContext.BuildContexts | Where { $_.Name -eq $Name } | Select-Object -First 1
    if($buildContext){
        return $buildContext
    }
    else {
        Write-Error("Could not find build context named: $($Name)")
    }
}