Enum PfPlatform{
    Azure = 0
    AWS = 1
    VMWare = 2
}

Class PfConfigObject{
    [string]$Name
    [string]$Abbreviation
}

Class PfConfigCompany : PfConfigObject{}

Class PfConfigEnvironment: PfConfigObject{
    [string]$Letter
}

Class PfConfigGroup : PfConfigObject{}

Class PfConfigLabel : PfConfigObject{}

Class PfConfigRegion : PfConfigObject{}

Class PfDependency{
    [string]$Key
    [object]$Resource

    PfDependency(){}
}

Class PfState{
    [string]$Id
    [string]$Name
    [string]$Scope
    [object]$CurrentStateBaseObject
    [object]$CurrentStateObject
    
    PfState(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("State","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}

Class PfOptions{
    [string]$Name
    [bool]$PersistState=$true
    PfOptions(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("Options","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}

Class PfDefinition{
    [PfOptions]$Options
    [System.Collections.ArrayList]$Dependencies=@()
    
    PfDefinition(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("Definition","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}

Class PfStateCollection{
    [System.Collections.ArrayList]$States=@()
    
    PfStateCollection(){}

    [PfState]GetByName([string]$Name){
        #todo:  Just an example for now, but this could return an arraylist if multiple with same name.  Need to handle
        $resourceState = $this.States | Where { $_.Name -eq $Name } | Select-Object -First 1
        return $resourceState
    }
    [void]Add([PfState]$ResourceState){
        $this.States.Add($ResourceState)
    }
}