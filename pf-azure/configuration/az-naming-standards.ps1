#Todo: How do we allow overrides of configuration from deployment?
Class AzNamingStandards{
    static [string]GetResourceName([string]$ClassPrefix,[PfDeploymentBuild]$PfDeploymentBuild){
        $resourceAbbr = $global:_PfConfig.ResourceTypes.$($ClassPrefix).Abbreviation

        if([string]::IsNullOrEmpty($resourceAbbr)){
            Write-Error "There is no abbreviation defined in your custom config file for resource type $($ClassPrefix)" -ErrorAction Stop
        }
        
        $name = switch($ClassPrefix)
        {
            "PfManagementGroup" {"$($resourceAbbr)-$($PfDeploymentBuild.Company.Abbreviation)-Root"; break}
            "PfSubscription" {"$($resourceAbbr)-$($PfDeploymentBuild.Company.Abbreviation)-$($PfDeploymentBuild.Group.Abbreviation)-$($PfDeploymentBuild.Environment.Letter)"; break}
            "PfResourceGroup" {"$($resourceAbbr)-$($PfDeploymentBuild.Company.Abbreviation)-$($PfDeploymentBuild.Group.Abbreviation)-$($PfDeploymentBuild.Label.Abbreviation)-$($PfDeploymentBuild.Environment.Letter)"; break}
            default {"$($resourceAbbr)-$($PfDeploymentBuild.Company.Abbreviation)-$($PfDeploymentBuild.Group.Abbreviation)-$($PfDeploymentBuild.Label.Abbreviation)-$($PfDeploymentBuild.Region.Abbreviation)-$($PfDeploymentBuild.Environment.Letter)01"; break}
        }
        return $name
    }
    static [string]GetResourceName([string]$ClassPrefix,[PfDeploymentBuild]$PfDeploymentBuild,[string]$ResourceNumber){
        $resourceAbbr = $global:_PfConfig.ResourceTypes.$($ClassPrefix).Abbreviation
        return "$($resourceAbbr)-$($PfDeploymentBuild.Company.Abbreviation)-$($PfDeploymentBuild.Group.Abbreviation)-$($PfDeploymentBuild.Label.Abbreviation)-$($PfDeploymentBuild.Region.Abbreviation)-$($PfDeploymentBuild.Environment.Letter)$($ResourceNumber)"
    }
}