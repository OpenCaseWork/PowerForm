Class PfState{
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