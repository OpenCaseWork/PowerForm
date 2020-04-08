Function Get-PfAzResourceNameFromContext
{
    Param (
        [Parameter(Mandatory = $true)]
        [string] $ClassPrefix,
        [Parameter(Mandatory = $true)]
        [PfBuildContext]$PfBuildContext
    )   

    $name=""
    
    if($PfBuildContext.Label){
        $name=[AzNamingStandards]::GetResourceName($ClassPrefix,$PfBuildContext)
    }

    return $name
}