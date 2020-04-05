Class PfManagementGroupOptions : PfOptions {
    [string]$Name
    [string]$ParentManagementGroupName
    [bool]$PersistState=$true

    PfManagementGroupOptions(){}
    PfManagementGroupOptions([PfAzureContext]$PfAzureContext){
        $this.SetName([PfAzureContext]$PfAzureContext)
    }
    [void]SetName([PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.ManagementGroupName)){
            $this.Name=$PfAzureContext.ManagementGroupName
        }else{
            $this.Name=[AzNamingStandards]::GetManagementGroupName($PfAzureContext)
        }
    }
}