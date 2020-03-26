Function New-KeyVaultDefinition 
(
    [Parameter(Position=0, ParameterSetName="StringNames")]
    [string]$SubscriptionName,
    [Parameter(Position=1, ParameterSetName="StringNames")]
    [string]$ResourceGroupName,
    [Parameter(Position=0, ParameterSetName="ResourceGroupDefinition")]
    [ResourceGroupDefinition]$ResourceGroupDefinition
)
{
    # use this to get the parameter set name
    if($PSCmdlet.ParameterSetName -eq "StringNames")
    {
        [KeyVaultDefinition]::New($ResourceGroupName,$SubscriptionName)
    }
}
Export-ModuleMember -Function New-KeyVaultDefinition