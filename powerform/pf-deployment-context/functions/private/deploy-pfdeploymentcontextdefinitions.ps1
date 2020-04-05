Function Deploy-PfDeploymentContextDefinitions
{
    $stateCollection = [PfStateCollection]::new()
    
    $stateCollection.ResourceContainerStates = Deploy-PfDefinitions -PfDefinitions $global:_PfDeploymentContext.ResourceContainers
    $stateCollection.ResourceStates = Deploy-PfDefinitions -PfDefinitions $global:_PfDeploymentContext.Resources

    return $stateCollection 
}

