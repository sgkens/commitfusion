<#
.SYNOPSIS
Returns gitmojis json file converted to psobject output to console

.DESCRIPTION
Returns gitmojis json file converted to psobject output to console

.EXAMPLE
Get-CiSet

This example returns object array of gitmojis

.INPUTS
None.

.OUTPUTS
none.

.NOTES
- 

.LINK
#>
Function Get-CiSet(){
    [CmdletBinding()]
    [OutputType([psobject])]
    [Alias("gcs")]
    param()
    process {
        return (Get-CommitFusionModuleInstance).GetCiSet() |
            Select-Object Name, Description,Semver,Code,Entity,Emoji |
                Format-Table -autosize -wrap
    }

}
Export-ModuleMember -Function Get-CiSet