#region Public Functions
$FunctionList = Get-ChildItem -Path $PSScriptRoot\functions\public
foreach ($Function in $FunctionList) {
    Write-Verbose -Message ('Importing function file: {0}' -f $Function.FullName)
	. $Function.FullName
}
#endregion Public Functions

#region Private Functions
$FunctionList = Get-ChildItem -Path $PSScriptRoot\functions\private
foreach ($Function in $FunctionList) {
    Write-Verbose -Message ('Importing function file: {0}' -f $Function.FullName)
	. $Function.FullName
}
#endregion Private Functions