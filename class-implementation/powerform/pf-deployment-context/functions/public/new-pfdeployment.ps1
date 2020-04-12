$global:_PfDeployment

Function New-PfDeployment
{
    $global:_PfDeployment=[PfDeployment]::New()
    return $global:_PfDeployment
}

