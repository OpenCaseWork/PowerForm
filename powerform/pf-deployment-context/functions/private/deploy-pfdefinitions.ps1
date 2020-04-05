Function Deploy-PfDefinitions
{
    Param (
        [Parameter(Mandatory = $false)] 
        [System.Collections.ArrayList]$PfDefinitions
    ) 
    [System.Collections.ArrayList]$states = @()

    if($PfDefinitions){
        Foreach($definition in $PfDefinitions){
            $access = (New-Object -TypeName "$($definition.ClassPrefix)Access" -ArgumentList $definition)
            $state = $access.GetOrSet()
            
            $states.Add($state) | Out-Null
        }
    }
    return ,$states 
}

