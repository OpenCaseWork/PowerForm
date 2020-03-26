# Comments
-liking the options input into new-definition; this looking solid
-Context should be able to take a Name also, arbitrary but we will key off of it for top level of state
-Support future Set-AzContext (or Get/Load) that will load load if existings?
-How to swap MG, Sub, RG?
  -Set-AzContextResourceGroup - swap rg's
  -Set-AzContextSubscription - swap subs
  -Set-AzContextManagement group - swap MG's
  -Or just single set that changes full context?
-Wondering how to cover related objects, like Access policies on KV
  -another parm on New-KeyVaultDefinition?
-Same with dependencies - another parm just pass in array maybe
-Need a term for 'Related objects'

## Scenarios

1. ManagementGroups + Subs + Resource Groups
   - New-Context with Sub + Rg (and MG?)
   - Set-AzMgGroup
   - Set-AzRg
2. Sub + Multiple Resource Groups
   - New Context with Sub + Rg
   - Set-AzRG to change RG
3. Sub + Single RG
   - Set Context with Sub + Rg