Function Add-PfDeploymentDefinition
{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfDefinition] $Definition
    )

    if($Definition.Platform -eq [PfPlatform]::Azure)
    {
        Resolve-PfDefinitionAz -Definition $Definition
        $global:_PfDeployment.Definitions.Add($Definition) | Out-Null
    }
    else{
        Write-Error("Platform could not be found to deploy the definition to.")
    }

}

