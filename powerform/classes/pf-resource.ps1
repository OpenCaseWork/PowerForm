Class PfResource{
    PfResource(){
        $this | Add-Member -MemberType ScriptProperty -Name "ClassPrefix" -Value {
            # Getter
            return ($this.GetType()).Name.Replace("BuildState","").Replace("CloudState","").Replace("Access","").Replace("Definition","").Replace("Options","")
        } -SecondValue {
            # Setter
            Write-Warning 'This is a readonly property!'
        }
    }
}