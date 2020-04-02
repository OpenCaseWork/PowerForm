Class PfSubscriptionOptions : PfResourceContainer {
    [string]$Name
    [string]$OwnerObjectId
    [string]$EnrollmentAccountObjectId
    [string]$ManagementGroupName
    [string]$OfferType
    [bool]$PersistState=$true

    PfSubscriptionOptions(){}
    PfSubscriptionOptions([PfAzureContext]$PfAzureContext){
        $this.SetName([PfAzureContext]$PfAzureContext)
    }
    [void]SetName([PfAzureContext]$PfAzureContext){
        if(-not [string]::IsNullOrEmpty($PfAzureContext.SubscriptionName)){
            $this.Name=$PfAzureContext.SubscriptionName
        }else{
            $this.Name=[AzNamingStandards]::GetSubscriptionName($PfAzureContext)
        }
    }
}