Class PfConfiguration {
    [PfCloudConfiguration]$Az
    
    PfConfiguration(){
        $this.Az=(New-Object -TypeName "PfAzConfiguration")
    }
}