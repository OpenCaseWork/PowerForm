$global:_PfDeploymentContext
$global:_PfConfiguration
Function New-PfDeploymentContext
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $GlobalConfigFile,
        [Parameter(Mandatory = $false)] 
        [string] $AzConfigFile
    ) 
    
    $global:_PfConfiguration=[PfConfiguration]::new()

    if(-not [string]::IsNullOrEmpty($AzConfigFile)){
        $azConfig = Get-Content -Raw -Path $AzConfigFile | ConvertFrom-Json
        if($azConfig.ResourceTypes)
        {
            $global:_PfConfiguration.Az.ResourceTypes=$azConfig.ResourceTypes
        }
        if($azConfig.Regions)
        {
            $global:_PfConfiguration.Az.Regions=$azConfig.Regions
        }
    }

    if(-not [string]::IsNullOrEmpty($GlobalConfigFile)){
        $globalConfig = Get-Content -Raw -Path $GlobalConfigFile | ConvertFrom-Json
        if($globalConfig.CompanyInfo)
        {
            $global:_PfConfiguration.Global.CompanyInfo=$globalConfig.CompanyInfo
        }
        if($globalConfig.Environments)
        {
            $global:_PfConfiguration.Global.Environments=$globalConfig.Environments
        }
        if($globalConfig.Groups)
        {
            $global:_PfConfiguration.Global.Groups=$globalConfig.Groups
        }
        if($globalConfig.Labels)
        {
            $global:_PfConfiguration.Global.Labels=$globalConfig.Labels
        }
    }

    $global:_PfDeploymentContext=[PfDeploymentContext]::New()

    return $global:_PfConfiguration
}

