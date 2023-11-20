<#
.SYNOPSIS
Update-Changelog takes the output of Format-FustionMD and appends it to the ChangelogFile 
.DESCRIPTION
Update-Changelog takes the output of Format-FustionMD and appends it to the ChangelogFile 

.EXAMPLE
New-ConventionalCommit @params | Set-Commit | Format-FusionMD | Update-Changelog -LogFile changelog.md

.INPUTS
None
.OUTPUTS
None
.NOTES
- 
.LINK
#>
Function Update-ChangeLog(){
    [CmdletBinding()]
    [OutputType([Void])]
    param(
        [Parameter(Mandatory)]
        [string]$logfile,
        [Parameter(
            Mandatory,
            ValueFromPipeline = $true,
            Position = 1,
            HelpMessage = "Pipeline for class command {CommitFusion.WriteClMessage}"
            )]
        [string]$WriteClMessage
    )
    process{
        if ($logfile.Length -eq 0) {$logfile="CHANGELOG-CF.md"}
        (Get-CommitFusionModuleInstance).WriteClMessage($logfile)
    }
    end {

    }
}
Export-ModuleMember -Function Update-ChangeLog