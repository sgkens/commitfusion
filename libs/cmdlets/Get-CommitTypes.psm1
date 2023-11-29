<#
.SYNOPSIS
Returns Commitfusion Types json file converted to psobject output to console

.DESCRIPTION
Returns Commitfusion Types json file converted to psobject output to console

.EXAMPLE
Get-CommitTypes -NoSemVer
Get-CommitTypes -Major
Get-CommitTypes -Minor
Get-CommitTypes -Patch

This example returns object array of commitfusion gitmojis types

.INPUTS
- NoSemVer - filter commitfusion types with SemVer Value of none
- Major    - filter commitfusion types with SemVer Value of Major
- Minor    - filter commitfusion types with SemVer Value of Minor
- Patch    - filter commitfusion types with SemVer Value of Patch

.OUTPUTS
[Psobject]

.NOTES
- 

.LINK
#>
Function Get-CommitTypes() {
    [CmdletBinding()]
    [OutputType([psobject])]
    [Alias("gcsf")]
    param (
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            HelpMessage = "Will Return all CiSets that do not a semver type"
        )]
        [switch]$NoSemver,
        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline = $true,
            HelpMessage = "Will Return all CiSets that have a semver of Patch"
        )]
        [switch]$Patch,
        [parameter(
            Mandatory = $false,
            Position = 2,
            ValueFromPipeline = $true,
            HelpMessage = "Will Return all CiSets that have a semver of Minor"
        )]
        [switch]$Minor,
        [parameter(
            Mandatory = $false,
            Position = 3,
            ValueFromPipeline = $true,
            HelpMessage = "Will Return all CiSets that have a semver of Major"
        )]
        [switch]$Major,
        [parameter(
            Mandatory = $false,
            Position = 4,
            ValueFromPipeline = $true,
            HelpMessage = "Will Return return psobject unformatted"
        )]
        [switch]$Raw
    )
    process {
        if (!$noSEMVer -and !$Patch -and !$Minor -and !$major -and !$raw) {
            (Get-CommitFusionModuleInstance).GetCiSetFusion() | 
                Select-Object Type, Description, Semver, cfa, emoji | 
                    format-table -autosize -wrap
        }elseif($Raw){
            (Get-CommitFusionModuleInstance).GetCiSetFusion()
        }else {
            if ($noSEMVer) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | 
                    Where-Object { $_.semver.length -eq 0 -or $_.semver -eq "" } | 
                        Select-Object Type, Description, Semver, cfa, emoji | 
                            format-table -autosize -wrap
            }
            if ($Patch) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | 
                    Where-Object { $_.semver.length -ne 0 -and $_.semver.trim() -match "patch" } | 
                        Select-Object Type, Description, Semver, cfa, emoji | 
                            format-table -autosize -wrap
            }
            if ($Minor) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | 
                    Where-Object { $_.semver.length -ne 0 -and $_.semver.trim() -match "Minor" } | 
                        Select-Object Type, Description, Semver, cfs, emoji | 
                            format-table -autosize -wrap
            }
            if ($major) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | 
                    Where-Object { $_.semver.length -ne 0 -and $_.semver.trim() -match "major" } | 
                        Select-Object Type, Description, Semver, cfs, emoji | 
                            format-table -autosize -wrap
            }
        }
    }
}
Export-ModuleMember -Function Get-CommitTypes
