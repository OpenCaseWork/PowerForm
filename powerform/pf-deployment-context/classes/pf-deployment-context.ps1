Class PfDeploymentContext{
    [string]$Name
    [System.Collections.ArrayList]$BuildContexts=@()
    [System.Collections.ArrayList]$Definitions=@()
    [PfBuildContext]$CurrentBuildContext
    PfDeploymentContext(){}
}