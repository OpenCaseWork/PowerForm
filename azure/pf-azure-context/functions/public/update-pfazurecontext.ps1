$global:_PfAzureContext
Function Update-PfAzureContext 
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName,
        [Parameter(Mandatory = $false)] 
        [string] $CompanyAbbreviation,
        [Parameter(Mandatory = $false)] 
        [string] $GroupAbbreviation,
        [Parameter(Mandatory = $false)] 
        [string] $Label,
        [Parameter(Mandatory = $false)]  
        [string] $EnvironmentLetter,
        [Parameter(Mandatory = $false)] 
        [string] $Region
    )

    if(-not [string]::IsNullOrEmpty($SubscriptionName))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.SubscriptionName)){
            Write-Error("Cannot change context of SubscriptionName because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.SubscriptionName=$SubscriptionName
        }
    }

    if(-not [string]::IsNullOrEmpty($ResourceGroupName))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.ResourceGroupName)){
            Write-Error("Cannot change context of ResourceGroupName because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.ResourceGroupName=$ResourceGroupName
        }
    }

    if(-not [string]::IsNullOrEmpty($CompanyAbbreviation))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.CompanyAbbreviation)){
            Write-Error("Cannot change context of CompanyAbbreviation because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.CompanyAbbreviation=$CompanyAbbreviation
        }
    }

    if(-not [string]::IsNullOrEmpty($GroupAbbreviation))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.GroupAbbreviation)){
            Write-Error("Cannot change context of GroupAbbreviation because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.GroupAbbreviation=$GroupAbbreviation
        }
    }

    if(-not [string]::IsNullOrEmpty($Label))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.Label)){
            Write-Error("Cannot change context of Label because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.Label=$Label
        }
    }

    if(-not [string]::IsNullOrEmpty($EnvironmentLetter))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.EnvironmentLetter)){
            Write-Error("Cannot change context of EnvironmentLetter because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.EnvironmentLetter=$EnvironmentLetter
        }
    }

    if(-not [string]::IsNullOrEmpty($Region))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.Region)){
            Write-Error("Cannot change context of Region because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.Region=$Region
        }
    }
    
}