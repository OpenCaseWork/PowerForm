Function Add-PfDeploymentBuild 
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

    $parameterList = (Get-Command -Name Add-PfDeploymentBuild).Parameters;
    $deploymentBuild = [PfDeploymentBuild]::New()

    Update-PfDeploymentBuildProperties -DeploymentBuild $deploymentBuild -Parameters $parameterList

    $global:_PfDeployment.Builds.Add($deploymentBuild) | Out-Null
    $global:_PfDeployment.CurrentBuild = $deploymentBuild

}