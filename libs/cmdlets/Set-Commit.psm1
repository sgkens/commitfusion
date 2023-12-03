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
New-Commit @params | set-commit

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
      Position = 0, 
      ValueFromPipeline=$true,
      HelpMessage = "Pipeline for class command {CommitFusion.AsStringForCommit}")]
    [string]$AsStringForCommit,

    [parameter(
      Mandatory = $false,
      #Position = 1, 
      #ValueFromPipeline = $false,
      HelpMessage = "Test commit - for pester use mainly")]
    [switch]$Test =  $false,

    [parameter(
      Mandatory = $false,
      #Position = 2, 
      #ValueFromPipeline = $false,
      HelpMessage = "Confirm commit before git commit message in executed")]
    [switch]$Confirm = $false
  )

  process{
      #TODO: Put shelldock here to perform the execute, not need but wont harm
      
    if($test){
      return $AsStringForCommit
      break;
    }
    
    if($Confirm) {
      try{
        $commit = (Get-CommitFusionModuleInstance).AsStringForCommit()
        get-command git -erroraction stop | out-null
        git commit -m $commit
        git log -1
      }
      catch [system.exception] {
          throw $_.Exception.Message
      }
    }else{
      return "Please use -Confirm to apply commit message"
    }
  }
}
Export-ModuleMember -Function Set-Commit