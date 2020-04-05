$global:_PfDeploymentContext

Function New-PfDeploymentContext
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $GlobalConfigFile,
        [Parameter(Mandatory = $false)] 
        [string] $AzConfigFile
    ) 
    
    $global:_PfDeploymentContext=[PfDeploymentContext]::New()

    if(-not [string]::IsNullOrEmpty($AzConfigFile)){
        $azConfig = Get-Content -Raw -Path $AzConfigFile | ConvertFrom-Json
        if($azConfig.ResourceTypes)
        {
            $global:_PfDeploymentContext.AzConfig.ResourceTypes=$azConfig.ResourceTypes
        }
        if($azConfig.Regions)
        {
            $global:_PfDeploymentContext.AzConfig.Regions=$azConfig.Regions
        }
    }

    if(-not [string]::IsNullOrEmpty($GlobalConfigFile)){
        $globalConfig = Get-Content -Raw -Path $GlobalConfigFile | ConvertFrom-Json
        if($globalConfig.CompanyInfo)
        {
            $global:_PfDeploymentContext.GlobalConfig.CompanyInfo=$globalConfig.CompanyInfo
        }
        if($globalConfig.Environments)
        {
            $global:_PfDeploymentContext.GlobalConfig.Environments=$globalConfig.Environments
        }
        if($globalConfig.Groups)
        {
            $global:_PfDeploymentContext.GlobalConfig.Groups=$globalConfig.Groups
        }
        if($globalConfig.Labels)
        {
            $global:_PfDeploymentContext.GlobalConfig.Labels=$globalConfig.Labels
        }
    }

    return $global:_PfDeploymentContext
}

