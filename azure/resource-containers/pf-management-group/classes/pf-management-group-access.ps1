Class PfManagementGroupAccess : PfAccess{
    [PfManagementGroupDefinition]$ManagementGroupDefinition
    
    PfManagementGroupAccess(){}
    PfManagementGroupAccess([PfManagementGroupDefinition]$ManagementGroupDefinition){
        $this.ManagementGroupDefinition=$ManagementGroupDefinition
    }

    [PfManagementGroupState]GetOrSet(){
        Write-Host("Creating or Getting ManagementGroup: $($this.ManagementGroupDefinition.Options.Name)")
        
        $options = $this.ManagementGroupDefinition.Options | ConvertTo-Json
        Write-Host("Options that would have been deployed for ManagementGroup: $options ")

        $state = [PfManagementGroupState]::new()
        $state.Name=$this.ManagementGroupDefinition.Options.Name
        return $state
    }
    [PfManagementGroupState]GetState([string]$Name){
        Write-Host("Getting ManagementGroup Cloud State: $($Name)")
        $state = [PfManagementGroupState]::new()
        $state.Name=$Name
        return $state
    }
}