Function Get-BaseAzResourceCloudState
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName,
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

    if([string]::IsNullOrEmpty($SubscriptionName))
    {
        if($global:_PfAzureContext){
            if(-not [string]::IsNullOrEmpty($global:_PfAzureContext.SubscriptionName)){
                $SubscriptionName =$global:_PfAzureContext.SubscriptionName
            }else{
                $SubscriptionName =[AzNamingStandards]::GetSubscriptionName($global:_PfAzureContext)
            }
        }else {
            Write-Error("There is no SubscriptionName or PfAzureContext provided.  Please provide a subscription name.")
        }
    }

    if([string]::IsNullOrEmpty($ResourceGroupName))
    {
        if($global:_PfAzureContext){
            if(-not [string]::IsNullOrEmpty($global:_PfAzureContext.ResourceGroupName)){
                $ResourceGroupName =$global:_PfAzureContext.ResourceGroupName
            }else{
                $ResourceGroupName =[AzNamingStandards]::GetResourceGroupName($global:_PfAzureContext)
            }
        }else {
            Write-Error("There is no ResourceGroupName or PfAzureContext provided.  Please provide a Resource Group name.")
        }
    }

    $access = (New-Object -TypeName "$($ClassPrefix)Access")
    return $access.GetCloudState($Name,$SubscriptionName,$ResourceGroupName)
}

