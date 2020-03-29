Function Deploy-PfDeploymentContextResources
{
    $resultSet = [PfResultSet]::new()

    Foreach($resource in $global:_PfDeploymentContext.Resources){
        $access = (New-Object -TypeName "$($resource.AzResourceType.ClassPrefix)Access" -ArgumentList $resource)
        $cloudState = $access.GetOrSet()

        $resourceDef = (New-Object -TypeName "$($resource.AzResourceType.ClassPrefix)Definition" -ArgumentList $resource,$cloudState)
        $resourceDef.BuildState=$resource
        $resourceDef.CloudState=$cloudState
        
        $resultSet.Add($resourceDef)
    }
    return $resultSet
}

