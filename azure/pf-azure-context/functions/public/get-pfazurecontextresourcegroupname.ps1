Function Get-PfAzureContextResourceGroupName
{
    Param (
        [Parameter(Mandatory = $false)]
        [string] $Name
    )   
    if([string]::IsNullOrEmpty($Name))
    {
        if($global:_PfAzureContext){
            if(-not [string]::IsNullOrEmpty($global:_PfAzureContext.ResourceGroupName)){
                $Name =$global:_PfAzureContext.ResourceGroupName
            }else{
                $Name =[AzNamingStandards]::GetResourceGroupName($global:_PfAzureContext)
            }
        }else {
            Write-Error("There is no ResourceGroupName or PfAzureContext provided.  Please provide a Resource Group name.")
        }
    }
    return $Name
}