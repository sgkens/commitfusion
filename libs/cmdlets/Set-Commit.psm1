<#
.SYNOPSIS
Set-Commit is used to apply the commit message, it Takes the value from commitfuction.AsStringForCommit
and applys it ie git commit -m $Message
Pulls the last git log entry git log -1 and outputs to console
.DESCRIPTION
Set-Commit is used to apply the commit message, it Takes the value from commitfuction.AsStringForCommit
and applys it ie git commit -m $Message
Pulls the last git log entry git log -1 and outputs to console

.EXAMPLE
New-ConventionalCommit @params | set-commit

.INPUTS
none

.OUTPUTS
[void]

.NOTES
- 
.LINK
#>

Function Set-Commit(){
  [CmdletBinding()]
  param(
    [parameter(
      Mandatory=$true,
       Position=0, 
       ValueFromPipeline=$true,
       HelpMessage = "Pipeline for class command {CommitFusion.AsStringForCommit}"
       )]
    [string]$AsStringForCommit
  )
  Process{
        #TODO: Put shelldock here to perform the execute, not need but wont harm
        try{
          $commit = (Get-CommitFusionModuleInstance).AsStringForCommit()
          get-command git -erroraction stop | out-null
          git commit -m $commit
          git log -1
        }
        catch [system.exception] {
            throw $_.Exception.Message
        }
  }
}
Export-ModuleMember -Function Set-Commit