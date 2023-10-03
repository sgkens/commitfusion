Function Set-Commit(){
  [CmdletBinding()]
  [OutputType([void])]
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
        
        try{
          $commit = (Get-CommitFusionModuleInstance).AsStringForCommit()
          get-command git -erroraction stop | out-null
          git commit -m $commit
          git log -1
        }
        catch [system.exception] {
            write-error $_.Exception.Message
        }
  }
}
Export-ModuleMember -Function Set-Commit