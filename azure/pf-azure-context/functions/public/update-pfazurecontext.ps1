$global:_PfAzureContext
Function Update-PfAzureContext 
{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $SubscriptionName,
        [Parameter(Mandatory = $false)] 
        [string] $ResourceGroupName,
        [Parameter(Mandatory = $false)] 
        [PfConfigCompanyInfo] $CompanyInfo,
        [Parameter(Mandatory = $false)] 
        [PfConfigGroup] $Group,
        [Parameter(Mandatory = $false)] 
        [PfConfigLabel] $Label,
        [Parameter(Mandatory = $false)]  
        [PfConfigEnvironment] $Environment,
        [Parameter(Mandatory = $false)] 
        [AzRegion] $AzRegion
    )

    #get all parameters from this function
    $parameterList = (Get-Command -Name Update-PfAzureContext).Parameters;

    foreach ($parameter in $parameterList) {
        # Grab all parameters that are not default
        $vars = Get-Variable -Name $parameter.Values.Name -ErrorAction SilentlyContinue
        #see what variables need to be set
        foreach($var in $vars){
            Set-PfAzureContextProperty($var)
        }
    }
}