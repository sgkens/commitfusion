using module ..\CommitFusion_class.psm1
<#
.SYNOPSIS
Get The Commitfusion Module Instance
.DESCRIPTION
This Cmdlet returns the Commitfusion Module Instance for use in other Cmdlets
.EXAMPLE
Get-CommitFusionModuleInstance
.INPUTS
None.
.OUTPUTS
Object of type CommitFusion
.NOTES
- 
.LINK
CommitFusion (Module): https://github.com/sgkens/Commitfusion/main/readme.md#Get-CommitFusionModuleInstance
#>

$commitfusion_instance = New-Object CommitFusion

Function Get-CommitFusionModuleInstance() {
  [CmdletBinding()]
  [OutPutType([object])]
  param()
  process {
    return $commitfusion_instance
  }
}

Export-ModuleMember -Function Get-CommitFusionModuleInstance
