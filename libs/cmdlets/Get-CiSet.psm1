Function Get-CiSet(){
    [CmdletBinding()]
    [OutputType([psobject])]
    [Alias("gcs")]
    param()
    process {
        return (Get-CommitFusionModuleInstance).GetCiSet()
    }

}
Export-ModuleMember -Function Get-CiSet