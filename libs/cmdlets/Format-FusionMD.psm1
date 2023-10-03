<#
.SYNOPSIS
    Formats the FusionMD.

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
Function Format-FusionMD () {
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string]$commitmessage,
        [Parameter(Mandatory = $false)]
        [switch]$Github = $false,
        [Parameter(Mandatory = $false)]
        [switch]$Gitlab = $false,
        [Parameter(Mandatory = $false)]
        [switch]$Bitbucket = $false

    )
    process {
        $GitNameSpace = (Get-CommitFusionModuleInstance).GitNameSpace
        if($null -ne $GitNameSpace){
            if($Gitlab -and $null -ne $GitNameSpace) {
                (Get-CommitFusionModuleInstance).GitSource = "gitlab"
            }elseif($Github -and $null -ne $GitNameSpace) {
                (Get-CommitFusionModuleInstance).GitSource = "github"
            }elseif($Bitbucket -and $null -ne $GitNameSpace) {
                (Get-CommitFusionModuleInstance).GitSource = "bitbucket"
            }else {
                 (Get-CommitFusionModuleInstance).GitSource = $null
            }
        }else{
            Write-Warning "GitNameSpace is not set, please add -GitUser or -GitGroup to Generate the correct link when using New-ConventionalCommit"
            break;
        }
        (Get-CommitFusionModuleInstance).WriteTemplateFile()
    }
    end {}
}
Export-ModuleMember -Function Format-FusionMD