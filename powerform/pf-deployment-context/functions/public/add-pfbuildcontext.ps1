Function Add-PfBuildContext 
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

    $parameterList = (Get-Command -Name Add-PfBuildContext).Parameters;
    $buildContext = [PfBuildContext]::New()

    Update-PfBuildContextProperties -BuildContext $buildContext -Parameters $parameterList

    $global:_PfDeploymentContext.BuildContexts.Add($buildContext) | Out-Null
    $global:_PfDeploymentContext.CurrentBuildContext = $buildContext

}