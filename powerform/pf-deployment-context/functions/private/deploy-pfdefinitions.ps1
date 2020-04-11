Function Deploy-PfDefinitions
{
    Param (
        [Parameter(Mandatory = $false)] 
        [System.Collections.ArrayList]$PfDefinitions
    ) 
    [System.Collections.ArrayList]$states = @()

    if($PfDefinitions){
        Foreach($definition in $PfDefinitions){
            if($definition.Platform -eq [PfPlatform]::Azure)
            {
                $state = Deploy-PfDefinitionAz -Definition $definition
                $states.Add($state) | Out-Null
            }
            else{
                Write-Error("Platform could not be found to deploy the definition to.")
            }
        }
    }
    return ,$states 
}

