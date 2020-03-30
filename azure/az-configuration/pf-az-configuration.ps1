Class PfAzConfiguration : PfCloudConfiguration {
    [object] $ResourceTypes
    [object] $Regions

    PfAzConfiguration(){
        $this.SetRegions()
        $this.SetResourceTypes()
    }
    [void]SetResourceTypes(){
        $this.ResourceTypes = @{
            PfKeyVault = @{
                Name = "Key Vault"
                Abbreviation = "KV"
            }
            PfLogAnalytics = @{
                Name = "Log Analytics"
                Abbreviation = "LA"
            }
        }
    }
    [void]SetRegions(){
        $this.Regions = @{
            CentralUs = @{
                Name = "CentralUs"
                Abbreviation = "C1"
            }
            EastUs2 = @{
                Name = "EastUs2"
                Abbreviation = "E2"
            }
        }
    }
}