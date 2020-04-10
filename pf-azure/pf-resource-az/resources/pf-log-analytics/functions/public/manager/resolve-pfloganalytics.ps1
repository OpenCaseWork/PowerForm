Function Resolve-PfLogAnalytics{
    Param (
        [Parameter(Mandatory = $true)] 
        [PfLogAnalyticsDefinition]$Definition
    )

    Write-Verbose("Seeing if LogAnalytics $($Definition.Options.Name) has a parent for dependency tracking...")
    if($Definition.Options.ParentLogAnalyticsDefinition){
        Write-Verbose("It has a parent definition dependency: $($Definition.Options.ResourceGroupDefinition.Options.Name)")
        $Definition.Dependencies.Add($Definition.Options.ResourceGroupDefinition)
    } 
}