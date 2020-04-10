Function Deploy-PfDeployment
{
    $stateCollection = [PfStateCollection]::new()
    
    $stateCollection.States = Deploy-PfDefinitions -PfDefinitions $global:_PfDeployment.Definitions

    return $stateCollection 
}

