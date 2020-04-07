Class PfConfiguration {
    [object] $Environments
    [object] $Companies
    [object] $Groups
    [object] $Labels
    [object] $ResourceTypes
    [object] $Regions

    PfConfiguration(){
        $this.SetEnvironments()
        $this.SetCompanies()
        $this.SetGroups()
        $this.SetLabels()
        $this.SetRegions()
        $this.SetResourceTypes()
    }
    [void]SetEnvironments(){
        $this.Environments = @{
            Sandbox = @{
                Name = "Sandbox"
                Abbreviation = "SDBX"
                Letter = "S"
            }
            Development = @{
                Name = "Development"
                Abbreviation = "DEV"
                Letter = "D"
            }
            Integration = @{
                Name = "Integration"
                Abbreviation = "INT"
                Letter = "I"
            }
            Qa = @{
                Name = "Qa"
                Abbreviation = "QA"
                Letter = "Q"
            }
            Production = @{
                Name = "Production"
                Abbreviation = "Prod"
                Letter = "P"
            }
        }
    }
    [void]SetCompanies(){
        $this.Companies = @{
            PowerForm = @{
                Name = "PowerForm"
                Abbreviation = "PFRM"
            }
        }
    }
    [void]SetGroups(){
        $this.Groups = @{
            Team1 = @{
                Name = "Demo Team 1"
                Abbreviation = "DTM1"
            }
            Team2 = @{
                Name = "Demo Team 2"
                Abbreviation = "DTM2"
            }
        }
    }
    [void]SetLabels(){
        $this.Labels = @{
            SQL = @{
                Name = "SQL Components"
                Abbreviation = "SQL"
            }
            Networking = @{
                Name = "Networking Components"
                Abbreviation = "NET"
            }
            Web = @{
                Name = "Web Components"
                Abbreviation = "WEB"
            }
        }
    }
    [void]SetResourceTypes(){
        $this.ResourceTypes = @{
            PfManagementGroup = @{
                Name = "Management Group"
                Abbreviation = "MG"
            }
            PfSubscription = @{
                Name = "Subscription"
                Abbreviation = "SUB"
            }
            PfResourceGroup = @{
                Name = "Resource Group"
                Abbreviation = "RG"
            }
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