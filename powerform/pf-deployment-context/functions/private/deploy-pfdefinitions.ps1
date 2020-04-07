Function Deploy-PfDefinitions
{
    Param (
        [Parameter(Mandatory = $false)] 
        [System.Collections.ArrayList]$PfDefinitions
    ) 
    [System.Collections.ArrayList]$states = @()

    if($PfDefinitions){
        Foreach($definition in $PfDefinitions){
            $state = $definition.Deploy()
            
            $states.Add($state) | Out-Null
        }
    }
    return ,$states 
}

