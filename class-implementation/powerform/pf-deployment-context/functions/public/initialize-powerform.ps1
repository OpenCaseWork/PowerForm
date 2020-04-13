$global:_PfConfig

Function Initialize-PowerForm
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $CustomConfigFile
    ) 
    
    $global:_PfConfig=[PfConfiguration]::New()

    if(-not [string]::IsNullOrEmpty($CustomConfigFile)){
        $config = Get-Content -Raw -Path $CustomConfigFile | ConvertFrom-Json
        if($config.ResourceTypes)
        {
            $global:_PfConfig.ResourceTypes=$config.ResourceTypes
        }
        if($config.Regions)
        {
            $global:_PfConfig.Regions=$config.Regions
        }
        if($config.Companies)
        {
            $global:_PfConfig.Companies=$config.Companies
        }
        if($config.Environments)
        {
            $global:_PfConfig.Environments=$config.Environments
        }
        if($config.Groups)
        {
            $global:_PfConfig.Groups=$config.Groups
        }
        if($config.Labels)
        {
            $global:_PfConfig.Labels=$config.Labels
        }
    }

    return $global:_PfConfig
}

