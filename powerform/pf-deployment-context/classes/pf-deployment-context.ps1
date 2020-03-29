Class PfDeploymentContext{
    [System.Collections.ArrayList]$Resources=@()
    
    PfDeploymentContext(){}

    [PfResultSet]Deploy(){
        $resultSet = [PfResultSet]::new()

        Foreach($resource in $this.Resources){
            $access = (New-Object -TypeName "$($resource.AzResourceType.ClassPrefix)Access" -ArgumentList $resource)
            $cloudState = $access.GetOrSet()

            $resourceDef = (New-Object -TypeName "$($resource.AzResourceType.ClassPrefix)Definition" -ArgumentList $resource,$cloudState)
            $resourceDef.BuildState=$resource
            $resourceDef.CloudState=$cloudState
            
            $resultSet.Add($resourceDef)
        }
        return $resultSet
    }
}