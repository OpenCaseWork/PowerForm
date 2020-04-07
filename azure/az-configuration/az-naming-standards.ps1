#Todo: How do we allow overrides of configuration from deployment?
Class AzNamingStandards{
    static [string]GetResourceName([string]$ClassPrefix,[PfBuildContext]$PfBuildContext){
        $resourceAbbr = $global:_PfConfig.ResourceTypes.$($ClassPrefix).Abbreviation

        if([string]::IsNullOrEmpty($resourceAbbr)){
            Write-Error "There is no abbreviation defined in your custom config file for resource type $($ClassPrefix)" -ErrorAction Stop
        }
        
        $name = switch($ClassPrefix)
        {
            "PfManagementGroup" {"$($resourceAbbr)-$($PfBuildContext.Company.Abbreviation)-Root"; break}
            "PfSubscription" {"$($resourceAbbr)-$($PfBuildContext.Company.Abbreviation)-$($PfBuildContext.Group.Abbreviation)-$($PfBuildContext.Environment.Letter)"; break}
            "PfResourceGroup" {"$($resourceAbbr)-$($PfBuildContext.Company.Abbreviation)-$($PfBuildContext.Group.Abbreviation)-$($PfBuildContext.Label.Abbreviation)-$($PfBuildContext.Environment.Letter)"; break}
            default {"$($resourceAbbr)-$($PfBuildContext.Company.Abbreviation)-$($PfBuildContext.Group.Abbreviation)-$($PfBuildContext.Label.Abbreviation)-$($PfBuildContext.Region.Abbreviation)-$($PfBuildContext.Environment.Letter)01"; break}
        }
        return $name
    }
    static [string]GetResourceName([string]$ClassPrefix,[PfBuildContext]$PfBuildContext,[string]$ResourceNumber){
        $resourceAbbr = $global:_PfConfig.ResourceTypes.$($ClassPrefix).Abbreviation
        return "$($resourceAbbr)-$($PfBuildContext.Company.Abbreviation)-$($PfBuildContext.Group.Abbreviation)-$($PfBuildContext.Label.Abbreviation)-$($PfBuildContext.Region.Abbreviation)-$($PfBuildContext.Environment.Letter)$($ResourceNumber)"
    }
}