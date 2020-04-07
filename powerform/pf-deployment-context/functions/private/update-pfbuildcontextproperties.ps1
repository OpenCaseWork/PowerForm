Function Update-PfBuildContextProperties
{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfBuildContext]$BuildContext,
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
                $BuildContext.$($var.Name)=$var.Value
            }
        }
    }

}