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
        [string] $TeamAbbreviation,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [string] $EnvironmentLetter,
        [Parameter(Mandatory = $true, ParameterSetName="All")] 
        [Parameter(Mandatory = $true, ParameterSetName="AzureInfo")] 
        [Parameter(Mandatory = $true, ParameterSetName="OrgInfo")] 
        [string] $Region
    )   
    switch ($PsCmdlet.ParameterSetName)
    {
        "AzureInfo"{
            $global:_PfAzureContext= [PfAzureContext]::New($SubscriptionName,$ResourceGroupName,$Region)
        }
        "OrgInfo"{
            $global:_PfAzureContext = [PfAzureContext]::New($CompanyAbbreviation,$GroupAbbreviation,$TeamAbbreviation,$EnvironmentLetter,$Region)
        }
        "All"{
            $global:_PfAzureContext = [PfAzureContext]::New($SubscriptionName,$ResourceGroupName,$CompanyAbbreviation,$GroupAbbreviation,$TeamAbbreviation,$EnvironmentLetter,$Region)
        }
    }
}