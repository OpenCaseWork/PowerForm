#Todo: How do we allow overrides of configuration from deployment?
Class AzNamingStandards{
    static [string]GetResourceGroupName([PfAzureContext]$PfAzureContext){
        return "RG-$($PfAzureContext.CompanyInfo.Abbreviation)-$($PfAzureContext.Group.Abbreviation)-$($PfAzureContext.Label.Abbreviation)-$($PfAzureContext.Environment.Letter)"
    }
    static [string]GetSubscriptionName([PfAzureContext]$PfAzureContext){
        return "$($PfAzureContext.CompanyInfo.Abbreviation)-$($PfAzureContext.Group.Abbreviation)-$($PfAzureContext.Environment.Letter)"
    }
    static [string]GetResourceName([string]$ClassPrefix,[PfAzureContext]$PfAzureContext){
        $resourcAbbr = $global:_PfConfiguration.Az.ResourceTypes.$($ClassPrefix).Abbreviation
        return "$($resourcAbbr)-$($PfAzureContext.CompanyInfo.Abbreviation)-$($PfAzureContext.Group.Abbreviation)-$($PfAzureContext.Label.Abbreviation)-$($PfAzureContext.AzRegion.Abbreviation)-$($PfAzureContext.Environment.Letter)01"
    }
    static [string]GetResourceName([string]$ClassPrefix,[PfAzureContext]$PfAzureContext,[string]$ResourceNumber){
        $resourcAbbr = $global:_PfConfiguration.Az.ResourceTypes.$($ClassPrefix).Abbreviation
        return "$($resourcAbbr)-$($PfAzureContext.CompanyInfo.Abbreviation)-$($PfAzureContext.Group.Abbreviation)-$($PfAzureContext.Label.Abbreviation)-$($PfAzureContext.AzRegion.Abbreviation)-$($PfAzureContext.Environment.Letter)$($ResourceNumber)"
    }
}