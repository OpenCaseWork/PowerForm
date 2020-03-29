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
        [string] $CompanyAbbreviation,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [string] $GroupAbbreviation,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [string] $Label,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [string] $EnvironmentLetter,
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
            $global:_PfAzureContext = [PfAzureContext]::New($CompanyAbbreviation,$GroupAbbreviation,$Label,$EnvironmentLetter,$AzRegion)
        }
        "All"{
            $global:_PfAzureContext = [PfAzureContext]::New($SubscriptionName,$ResourceGroupName,$CompanyAbbreviation,$GroupAbbreviation,$Label,$EnvironmentLetter,$AzRegion)
        }
    }
}