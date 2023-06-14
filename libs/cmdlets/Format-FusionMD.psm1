using module ..\CommitFusion_class.psm1

Function Format-FusionMD () {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipeline = $true,
            Position = 1, 
            HelpMessage = "Pipeline for class command {CommitFusion}")]
        [string]$WriteTemplateFile
    )
    process {
        $global:commitfusion.WriteTemplateFile()
    }
    end {}
}
Export-ModuleMember -Function Format-FusionMD