<#
.SYNOPSIS
Get The Commitfusion Ci Type Set base on gitmojis
.DESCRIPTION
Returns Commitfusion Ci Type Set as a PSObject
.EXAMPLE
Get-CiSet
.INPUTS
none.
.OUTPUTS
PSObject
.NOTES
- 
.LINK
CommitFusion (Module): https://github.com/sgkens/Commitfusion/main/readme.md#Get-CiSet
#>
Function Get-CiSet(){
    [CmdletBinding()]
    [OutputType([PSObject])]
    param()
    process {
        return (Get-CommitFusionModuleInstance).GetCiSet()
    }

}
Export-ModuleMember -Function Get-CiSet