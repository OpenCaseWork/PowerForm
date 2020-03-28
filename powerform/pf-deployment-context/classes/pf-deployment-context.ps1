Class PfDeploymentContext{
    [System.Collections.ArrayList]$Resources=@()

    PfDeploymentContext(){}

    [void]Deploy(){
        Foreach($resource in $this.Resources){
            $access = (New-Object -TypeName "$($resource.AzResourceType.ClassPrefix)Access" -ArgumentList $resource)
            $access.GetOrSet()
        }
    }
}