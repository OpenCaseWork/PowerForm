Class PfDefinition{
    [PfOptions]$Options
    [PfDependency[]]$Dependencies

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