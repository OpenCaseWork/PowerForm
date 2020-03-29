#Todo: How do we allow overrides of configuration from deployment?
Class AzRegions{
    static [AzRegion]$CentralUs = @{
        Name = "CentralUs"
        Abbreviation = "C1"
    }
    static [AzRegion]$EastUs2 = @{
        Name = "EastUs2"
        Abbreviation = "E2"
    }
}