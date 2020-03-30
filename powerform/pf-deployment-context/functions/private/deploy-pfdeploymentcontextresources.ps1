Function Deploy-PfDeploymentContextResources
{
    $resultSet = [PfResultSet]::new()

    Foreach($resource in $global:_PfDeploymentContext.Resources){
        $access = (New-Object -TypeName "$($resource.ClassPrefix)Access" -ArgumentList $resource)
        $cloudState = $access.GetOrSet()

        $resourceDef = (New-Object -TypeName "$($resource.ClassPrefix)Definition" -ArgumentList $resource,$cloudState)
        $resourceDef.BuildState=$resource
        $resourceDef.CloudState=$cloudState
        
        $resultSet.Add($resourceDef)
    }
    return $resultSet
}

