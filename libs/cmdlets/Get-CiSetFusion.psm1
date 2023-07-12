Function Get-CiSetFusion() {
    [CmdletBinding()]
    [OutputType([psobject])]
    [Alias("gcsf")]
    param ()
    process{
        (Get-CommitFusionModuleInstance).GetCiSetFusion()
    }
}
Export-ModuleMember -Function Get-CiSetFusion
