$global:_PfDeploymentContext

Function New-PfDeploymentContext
{
    $global:_PfDeploymentContext=[PfDeploymentContext]::New()
    return $global:_PfDeploymentContext
}

