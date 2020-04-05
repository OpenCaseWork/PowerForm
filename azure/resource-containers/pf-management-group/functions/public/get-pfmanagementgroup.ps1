Function Get-PfManagementGroup{
    Param (
        [Parameter(Mandatory = $false)] 
        [string] $Name
    )

    $contextManagementGroupName = Get-PfAzureContextManagementGroupName -Name $Name
    $access = (New-Object -TypeName "PfManagementGroupAccess")
    return $access.GetState($contextManagementGroupName)
}

