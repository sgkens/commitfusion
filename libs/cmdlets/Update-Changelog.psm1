Function Update-ChangeLog(){
    [CmdletBinding()]
    [OutputType([Void])]
    param(
        [Parameter(Mandatory)]
        [string]$logfile = "CHANGELOG-CF.md",
        [Parameter(
            Mandatory,
            ValueFromPipeline = $true,
            Position = 1,
            HelpMessage = "Pipeline for class command {CommitFusion.WriteClMessage}"
            )]
        [string]$WriteClMessage
    )
    process{
        (Get-CommitFusionModuleInstance).WriteClMessage($logfile)
    }
    end {

    }
}
Export-ModuleMember -Function Update-ChangeLog