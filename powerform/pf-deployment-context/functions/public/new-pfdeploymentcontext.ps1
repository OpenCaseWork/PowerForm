$global:_PfDeploymentContext
$global:_PfConfiguration
Function New-PfDeploymentContext
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $PfConfigFile,
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

    $global:_PfDeploymentContext=[PfDeploymentContext]::New()

    return $global:_PfConfiguration
}

