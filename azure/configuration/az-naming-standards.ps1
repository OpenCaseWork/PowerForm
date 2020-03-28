#Todo: How do we allow overrides of configuration from deployment?
Class AzNamingStandards{
    static [string]GetResourceGroupName([PfAzureContext]$PfAzureContext){
        return "RG-$($PfAzureContext.CompanyAbbreviation)-$($PfAzureContext.GroupAbbreviation)-$($PfAzureContext.TeamAbbreviation)-$($PfAzureContext.EnvironmentLetter)"
    }
    static [string]GetSubscriptionName([PfAzureContext]$PfAzureContext){
        return "$($PfAzureContext.CompanyAbbreviation)-$($PfAzureContext.GroupAbbreviation)-$($PfAzureContext.EnvironmentLetter)"
    }
    static [string]GetResourceName([AzResourceType]$AzResourceType,[PfAzureContext]$PfAzureContext){
        #TODO: need to pass in resource number and find a way to abbreviate region
        return "$($AzResourceType.Abbreviation)-$($PfAzureContext.CompanyAbbreviation)-$($PfAzureContext.GroupAbbreviation)-$($PfAzureContext.TeamAbbreviation)-C1-$($PfAzureContext.EnvironmentLetter)01"
    }
}