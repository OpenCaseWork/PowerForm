Class PfResource{
    PfResource(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("Definition","").Replace("State","").Replace("Access","").Replace("Definition","").Replace("Options","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}