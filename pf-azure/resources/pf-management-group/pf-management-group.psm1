$Public  = @( Get-ChildItem -Path $PSScriptRoot\functions\public\*.ps1 -Recurse)
$Private = @( Get-ChildItem -Path $PSScriptRoot\functions\private\*.ps1 -Recurse )

foreach($import in @($Public + $Private))
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