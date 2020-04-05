Function Deploy-PfDeploymentContext
{
    $stateCollection = [PfStateCollection]::new()
    
    $stateCollection.States = Deploy-PfDefinitions -PfDefinitions $global:_PfDeploymentContext.Definitions

    return $stateCollection 
}

