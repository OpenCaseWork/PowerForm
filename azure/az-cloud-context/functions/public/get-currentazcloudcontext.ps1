Function Get-CurrentAzCloudContext
{
    if($global:_currentAzCloudContext){
        return $global:_currentAzCloudContext
    }
    else {
        return $null
    }
}

