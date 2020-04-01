$global:_PfAzureContext
Function Set-PfAzureContext 
{
    Param (
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="AzureInfo")] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="AzureInfo")] 
        [string] $ResourceGroupName,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [PfConfigCompanyInfo] $CompanyInfo,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [PfConfigGroup] $Group,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [PfConfigLabel] $Label,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [PfConfigEnvironment] $Environment,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="AzureInfo")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [AzRegion] $AzRegion
    )   
    switch ($PsCmdlet.ParameterSetName)
    {
        "AzureInfo"{
            $global:_PfAzureContext= [PfAzureContext]::New($SubscriptionName,$ResourceGroupName,$AzRegion)
        }
        "OrgInfo"{
            $global:_PfAzureContext = [PfAzureContext]::New($CompanyInfo,$Group,$Label,$Environment,$AzRegion)
        }
        "All"{
            $global:_PfAzureContext = [PfAzureContext]::New($SubscriptionName,$ResourceGroupName,$CompanyInfo,$Group,$Label,$Environment,$AzRegion)
        }
    }
}