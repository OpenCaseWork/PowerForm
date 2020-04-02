Function Get-PfAzureContextManagementGroupName
{
    Param (
        [Parameter(Mandatory = $false)]
        [string] $Name
    )   
    if([string]::IsNullOrEmpty($Name))
    {
        if($global:_PfAzureContext){
            if(-not [string]::IsNullOrEmpty($global:_PfAzureContext.ManagementGroupName)){
                $Name =$global:_PfAzureContext.ManagementGroupName
            }else{
                $Name =[AzNamingStandards]::GetManagementGroupName($global:_PfAzureContext)
            }
        }else {
            Write-Error("There is no ManagementGroupName or PfAzureContext provided.  Please provide a ManagementGroup name.")
        }
    }
    return $Name
}