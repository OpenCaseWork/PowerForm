Function Get-CurrentPfAzureContext
{
    if($global:_currentPfAzureContext){
        return $global:_currentPfAzureContext
    }
    else {
        return $null
    }
}

