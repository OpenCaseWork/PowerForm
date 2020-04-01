Function Get-PfAzureContextResourceName
{
    Param (
        [Parameter(Mandatory = $false)]
        [string] $Name,
        [Parameter(Mandatory = $true)]
        [string] $ClassPrefix
    )  

    if([string]::IsNullOrEmpty($Name)){
        if($global:_PfAzureContext.CompanyInfo){
            $Name=[AzNamingStandards]::GetResourceName($ClassPrefix,$global:_PfAzureContext)
        }
        else{
            Write-Error("There is no resource Name or PfAzureContext provided.  Please provide a resource name.")
        }
    }


    return $Name
}