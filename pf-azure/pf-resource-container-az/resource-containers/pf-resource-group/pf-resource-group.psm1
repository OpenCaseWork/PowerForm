$Public  = @( Get-ChildItem -Path $PSScriptRoot\functions\public\*.ps1 -Recurse)
$Private = @( Get-ChildItem -Path $PSScriptRoot\functions\private\*.ps1 -Recurse)

[System.Collections.ArrayList]$publicFunctions = @()

foreach($import in $Private)
{
    try
    {
        . $import.fullname
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}
foreach($import in $Public)
{
    try
    {
        . $import.fullname
        $publicFunctions.Add(($import.Name.Replace($import.Extension,"")))
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}


Export-ModuleMember -Function $publicFunctions