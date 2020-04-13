Function Update-PfDeploymentBuildProperties
{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfDeploymentBuild]$DeploymentBuild,
        [Parameter(Mandatory = $true)] 
        [System.Collections.Generic.Dictionary`2[System.String,System.Management.Automation.ParameterMetadata]]$Parameters
    )   

    foreach ($parameter in $Parameters) {
        # Grab all parameters that are not default
        $vars = Get-Variable -Name $parameter.Values.Name -ErrorAction SilentlyContinue
        #see what variables need to be set
        foreach($var in $vars){
            if(-not [string]::IsNullOrEmpty($var.Value))
            {
                $DeploymentBuild.$($var.Name)=$var.Value
            }
        }
    }

}