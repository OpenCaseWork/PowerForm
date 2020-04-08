Class PfResourceState{
    [string]$Id
    [string]$Name
    [string]$Scope
    [object]$CurrentStateBaseObject
    [object]$CurrentStateObject
    
    PfResourceState(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("State","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}