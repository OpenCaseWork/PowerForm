Function Get-PfAzureContextResourceName
{
    Param (
        [Parameter(Mandatory = $false)]
        [string] $Name,
        [Parameter(Mandatory = $true)]
        [string] $ClassPrefix
    )  

    if([string]::IsNullOrEmpty($Name)){
        if(-not [string]::IsNullOrEmpty($global:_PfAzureContext.CompanyAbbreviation)){
            $Name=[AzNamingStandards]::GetResourceName($ClassPrefix,$global:_PfAzureContext)
        }
        else{
            Write-Error("There is no resource Name or PfAzureContext provided.  Please provide a resource name.")
        }
    }

    return $Name
}