Class PfDeploymentBuild {
    [string]$Name
    [PfConfigRegion]$Region
    [PfConfigLabel]$Label
    [PfConfigCompany]$Company
    [PfConfigGroup]$Group
    [PfConfigEnvironment]$Environment

    PfDeploymentBuild(){}
}

Class PfDeployment{
    [string]$Name
    [System.Collections.ArrayList]$Builds=@()
    [System.Collections.ArrayList]$Definitions=@()
    [PfDeploymentBuild]$CurrentBuild
    PfDeployment(){}
}
