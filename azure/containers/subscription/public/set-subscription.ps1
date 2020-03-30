. "..\private\get-azure-state.ps1"
. "..\private\new-azure-state.ps1"
. "..\private\set-configuration.ps1"
. "..\private\set-pf-state.ps1"
 
Function Set-AzSubscriptionDefinition {
  Param (
    [Parameter(Mandatory = $true)] [String] $EnrollmentAccountObjectId,
    [Parameter(Mandatory = $true)] [String] $Name,
    [Parameter(Mandatory = $false)] [bool] $UsePowerFormState = $false,
    [Parameter(Mandatory = $false)] [bool] $UpdateConfiguration = $false
    #-OfferType <String>
    #[-OwnerObjectId <String[]>]
    #[-OwnerSignInName <String[]>]
    #[-OwnerApplicationId <String[]>]
    #[-AsJob]
    #[-DefaultProfile <IAzureContextContainer>]
    #[-WhatIf]
    #[-Confirm]
  )      
  
  #$subState = Get-AzureSubscriptionState -Name $Name
  
  #Set-AzureSubscriptionState -Name ...
 
  #Set-AzureSubscriptionConfiguration

  #Set-PowerFormSubscriptionState 

} #End Function  
