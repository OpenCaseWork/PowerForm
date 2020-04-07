Class BaseAzResourceContainerOptions : PfOptions {
    BaseAzResourceContainerOptions() : base(){}
    BaseAzResourceContainerOptions([PfBuildContext]$PfBuildContext)  : base() {
        $this.Name = Get-PfAzResourceNameFromContext -ClassPrefix $this.ClassPrefix -PfBuildContext $PfBuildContext
    }
}