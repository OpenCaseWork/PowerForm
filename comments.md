# Comments
-liking the options input into new-definition; this looking solid 
   (ZH) me too

-Context should be able to take a Name also, arbitrary but we will key off of it for top level of state
   (ZH) I am not sure why we would need names for contexts.  My thinking is that it is only needed for deployment.  The context sets properties on the resource itself.  So after the resource is built from context, you can change those properties.  Maybe we are thinking of going two different directions here?

-Support future Set-AzContext (or Get/Load) that will load load if existings?
   (ZH) I no longer think we need a "new-azcontext".  We only need a "set-azcontext".  By the way, this was renamed to "Set-AzCloudContext" because "Set-AzContext" is a command in az module already.

-How to swap MG, Sub, RG?
  -Set-AzContextResourceGroup - swap rg's
      (ZH) ResourceGroup context is just saving/changing a option property of the resource.  So you can always change this on individual resources
  -Set-AzContextSubscription - swap subs
      (ZH) Subscription context is just saving/changing a option property of the resource.  So you can always change this on individual resources
  -Set-AzContextManagement group - swap MG's
      (ZH) Management Group really has nothing to do with resources.  It only affects subscriptions.  So I am thinking this shouldn't be in context, but rather just an option of of a subscription build state only.
  -Or just single set that changes full context?
      (ZH) Not really sure we need a "bulk" context change.  You should change context before building resources.  After you build them, you can individually change those contexts on the resource itself.
-Wondering how to cover related objects, like Access policies on KV
   (ZH) We have the class objects after importing the module.  So we can easily add any access policies/aad groups to the AzSecurityDefinition object of the resources.  We will just need to create "new" functions to create an aadgroup object or access policy object.
  -another parm on New-KeyVaultDefinition?
   (ZH) Was thinking you could just do something like a public function that is "Add-KeyVaultAccessPolicy" and would do something like $kv.BuildState.Security.AccessPolicies.Add($accessPolicy)
-Same with dependencies - another parm just pass in array maybe
   (ZH) I think we build this into the "private" functions.  So when we call the "Add-KeyVaultAccessPolicy" function above, there is a private function that would "Add-Dependency" if a resource object was passed through
-Need a term for 'Related objects'
   (ZH) Not sure I am following you here.

## Scenarios

(ZH) - See deploy-tests.ps1 for some of these examples

1. ManagementGroups + Subs + Resource Groups
   - New-Context with Sub + Rg (and MG?)
   - Set-AzMgGroup
   - Set-AzRg
2. Sub + Multiple Resource Groups
   - New Context with Sub + Rg
   - Set-AzRG to change RG
3. Sub + Single RG
   - Set Context with Sub + Rg