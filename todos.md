# Todos
-So are you saying that we need to have a function then that would be "Import-PfEnvironmentConfig" and then take in a path to a json config file that we would then store in a variable? And then that config function need to be the first thing instantiated within a deployment script?

-thinking probably worth scrubbing hashtables.
    (ZH) I have to understand this more.  Every convert to json I use on hashtables works

-Context should be able to take a Name also, arbitrary but we will key off of it for top level of state
   (ZH) I am not sure why we would need names for contexts.  My thinking is that it is only needed for deployment.  The context sets properties on the resource itself.  So after the resource is built from context, you can change those properties.  Maybe we are thinking of going two different directions here?

-Wondering how to cover related objects, like Access policies on KV
    (ZH) We have the class objects after importing the module.  So we can easily add any access policies/aad groups to the AzSecurityDefinition object of the resources.  We will just need to create "new" functions to create an aadgroup object or access policy object.

-another parm on New-KeyVaultDefinition?
   (ZH) Was thinking you could just do something like a public function that is "Add-KeyVaultAccessPolicy" and would do something like $kv.BuildState.Security.AccessPolicies.Add($accessPolicy)

-Same with dependencies - another parm just pass in array maybe
   (ZH) I think we build this into the "private" functions.  So when we call the "Add-KeyVaultAccessPolicy" function above, there is a private function that would "Add-Dependency" if a resource object was passed through

-Need a term for 'Related objects' the 'related object' basically just meaning state of a thing that is not specifically a 'resource dependency'. were talking about how to persist the RG/Sub link for resource and one option was treating these as something that is related to the current defined object. and then a 'type' could be 'resource' or 'rg' or whatever want to call it

-Need to add a deployment plan which would show the order and dependencies of the deployed resources
-Rename resultset to statecollection
-Renaming "CloudState" to State
-Rename "BuildState to Definition
-Remove current defintion object that has cloudstate and buildstate in it