using module ..\CommitFusion_class.psm1
Function Update-ChangeLog(){
    [CmdletBinding()]
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
        $global:commitfusion.WriteClMessage($logfile)
    }
    end {

    }
}
Export-ModuleMember -Function Update-ChangeLog