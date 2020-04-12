Class PfLogAnalyticsDefinition : PfResourceDefinitionAz{
    PfLogAnalyticsDefinition() : base() {}
    PfLogAnalyticsDefinition([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}

    [PfLogAnalyticsState]Deploy(){
        $state = Deploy-PfLogAnalytics -Definition $this
        return $state
    }
}

Class PfLogAnalyticsOptions : PfResourceOptionsAz {
    PfLogAnalyticsOptions(){}
    PfLogAnalyticsOptions([PfDeploymentBuild]$PfDeploymentBuild) : base([PfDeploymentBuild]$PfDeploymentBuild){}
}

Class PfLogAnalyticsState : PfResourceStateAz{

    PfLogAnalyticsState(){}
}