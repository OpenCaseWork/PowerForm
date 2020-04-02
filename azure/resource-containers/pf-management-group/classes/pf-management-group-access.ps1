Class PfManagementGroupAccess : PfResourceContainer{
    [PfManagementGroupBuildState]$ManagementGroupBuildState
    
    PfManagementGroupAccess(){}
    PfManagementGroupAccess([PfManagementGroupBuildState]$ManagementGroupBuildState){
        $this.ManagementGroupBuildState=$ManagementGroupBuildState
    }

    [PfManagementGroupCloudState]GetOrSet(){
        Write-Host("Creating or Getting ManagementGroup: $($this.ManagementGroupBuildState.Options.Name)")
        
        $options = $this.ManagementGroupBuildState.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for ManagementGroup: $options ")

        $cloudState = [PfManagementGroupCloudState]::new()
        $cloudState.Name=$this.ManagementGroupBuildState.Options.Name
        return $cloudState
    }
    [PfManagementGroupCloudState]GetCloudState([string]$Name){
        Write-Host("Getting ManagementGroup Cloud State: $($Name)")
        $cloudState = [PfManagementGroupCloudState]::new()
        $cloudState.Name=$Name
        return $cloudState
    }
}