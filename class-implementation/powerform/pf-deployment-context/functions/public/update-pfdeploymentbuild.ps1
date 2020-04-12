Function Update-PfDeploymentBuild 
{
    Param (
        [Parameter(Mandatory = $true)] 
        [string] $Name,
        [Parameter(Mandatory = $false)] 
        [PfConfigCompany] $Company,
        [Parameter(Mandatory = $false)] 
        [PfConfigGroup] $Group,
        [Parameter(Mandatory = $false)] 
        [PfConfigLabel] $Label,
        [Parameter(Mandatory = $false)]  
        [PfConfigEnvironment] $Environment,
        [Parameter(Mandatory = $false)] 
        [PfConfigRegion] $Region
    )

    #get all parameters from this function
    $parameterList = (Get-Command -Name Update-PfDeploymentBuild).Parameters

    $deploymentBuild = Get-DeploymentBuild -Name $Name

    foreach ($parameter in $parameterList) {
        # Grab all parameters that are not default
        $vars = Get-Variable -Name $parameter.Values.Name -ErrorAction SilentlyContinue
        #see what variables need to be set
        foreach($var in $vars){
            if(-not [string]::IsNullOrEmpty($var.Value))
            {
                $deploymentBuild.$($var.Name)=$var.Value
            }
        }
    }
}