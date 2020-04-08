Class PfResourceOptions{
    [string]$Name
    [bool]$PersistState=$true
    PfResourceOptions(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("Options","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}