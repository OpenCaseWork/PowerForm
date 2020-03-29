$global:_PfAzureContext
Function Set-PfAzureContextProperty
{
    Param (
        [Parameter(Mandatory = $true)] 
        [System.Management.Automation.PSVariable] $Variable
    )   

    if(-not [string]::IsNullOrEmpty($Variable.Value))
    {
        if([string]::IsNullOrEmpty($global:_PfAzureContext.$($Variable.Name))){
            Write-Error("Cannot change context of $($Variable.Name) because it was never initially set.")
        }
        else {
            $global:_PfAzureContext.$($Variable.Name)=$Variable.Value
        }
    }
}