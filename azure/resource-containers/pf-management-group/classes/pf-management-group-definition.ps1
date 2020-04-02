Class PfManagementGroupDefinition : PfResourceContainer{
    [PfManagementGroupBuildState]$BuildState
    [PfManagementGroupCloudState]$CloudState

    PfManagementGroupDefinition(){}
    PfManagementGroupDefinition([PfManagementGroupBuildState]$BuildState,[PfManagementGroupCloudState]$CloudState){
        $this.BuildState=$BuildState
        $this.CloudState=$CloudState
    }
}