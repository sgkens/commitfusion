Function Get-CiSetFusion() {
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
        [switch]$Major
    )
    process {
        if (!$noSEMVer -and !$Patch -and !$Minor -and !$major) {
            (Get-CommitFusionModuleInstance).GetCiSetFusion() ## Format-table returns a different object type so we can't use it here
        }
        else {
            if ($noSEMVer) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | Where-Object { $_.semver.length -eq 0 -or $_.semver -eq "" } | Format-Table -Wrap -AutoSize
            }
            if ($Patch) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | Where-Object { $_.semver.length -ne 0 -and $_.semver.trim() -match "patch" } | Format-Table -Wrap -AutoSize
            }
            if ($Minor) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | Where-Object { $_.semver.length -ne 0 -and $_.semver.trim() -match "Minor" } | Format-Table -Wrap -AutoSize
            }
            if ($major) {
                (Get-CommitFusionModuleInstance).GetCiSetFusion() | Where-Object { $_.semver.length -ne 0 -and $_.semver.trim() -match "major" } | Format-Table -Wrap -AutoSize
            }
        }
    }
}
Export-ModuleMember -Function Get-CiSetFusion
