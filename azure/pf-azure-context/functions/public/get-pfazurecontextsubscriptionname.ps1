Function Get-PfAzureContextSubscriptionName
{
    Param (
        [Parameter(Mandatory = $false)]
        [string] $Name
    )   
    if([string]::IsNullOrEmpty($Name))
    {
        if($global:_PfAzureContext){
            if(-not [string]::IsNullOrEmpty($global:_PfAzureContext.SubscriptionName)){
                $Name =$global:_PfAzureContext.SubscriptionName
            }else{
                $Name =[AzNamingStandards]::GetSubscriptionName($global:_PfAzureContext)
            }
        }else {
            Write-Error("There is no SubscriptionName or PfAzureContext provided.  Please provide a subscription name.")
        }
    }
    return $Name
}