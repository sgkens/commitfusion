<#
.SYNOPSIS
    Formarts the string pipped from New-ConventionalCommit to FusionMD(markdown), 
    then can be piped to Update-Changelog, Out-File, Set-Content, or Add-Content etc

.DESCRIPTION
    Formarts the string pipped from New-ConventionalCommit to FusionMD(markdown), 
    then can be piped to Update-Changelog, Out-File, Set-Content, or Add-Content etc

.PARAMETER WriteTemplateFile
    The Class Method WriteTemplateFile() is piped to Format-FusionMD, the return type is a single line string.

.EXAMPLE
    New-ComventionalCommit @params | Format-FusionMD 

.NOTES
    This will only work with the New-ConventionalCommit cmdlet as it is piped to Format-FusionMD.
    This is a hidden parameter and will not be shown in the help menu.
#>

Function Format-FusionMD(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string]$WriteTemplateFile
    )
    process{
        (Get-CommitFusionModuleInstance).WriteTemplateFile()
    }
    end {}
}
Export-ModuleMember -Function Format-FusionMD