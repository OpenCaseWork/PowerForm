Class PfConfiguration {
    [PfCloudConfiguration]$Az
    [PfGlobalConfiguration]$Global
    
    PfConfiguration(){
        $this.Az=(New-Object -TypeName "PfAzConfiguration")
        $this.Global=(New-Object -TypeName "PfGlobalConfiguration")
    }
}