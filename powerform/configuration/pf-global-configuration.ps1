Class PfGlobalConfiguration {
    [object] $Environments
    [object] $CompanyInfo
    [object] $Groups
    [object] $Labels

    PfGlobalConfiguration(){
        $this.SetEnvironments()
        $this.SetCompanyInfo()
        $this.SetGroups()
        $this.SetLabels()
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
    [void]SetCompanyInfo(){
        $this.CompanyInfo = @{
            Name = "PowerForm"
            Abbreviation = "PFRM"
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
}