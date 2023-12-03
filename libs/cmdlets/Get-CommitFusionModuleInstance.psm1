using module ..\CommitFusion_class.psm1
<#
.SYNOPSIS
Returns and instance of the Commitfusion class.

.DESCRIPTION
Returns and instance of the Commitfusion class, providing access to the Commitfusion methods.

.EXAMPLE
$commitfusion = Get-CommitfusionModuleInstance

This example returns an instance of the Commitfusion class.

.INPUTS
None.

.OUTPUTS
none.

.NOTES
- 

.LINK
#>

$commitfusion_instance = New-Object CommitFusion

Function Get-CommitFusionModuleInstance() {
  [alias("gcfmi")]
  [CmdletBinding()]
  [OutPutType([object])]
  param()
  process {
    return $commitfusion_instance
  }
}
Export-ModuleMember -Function Get-CommitFusionModuleInstance
