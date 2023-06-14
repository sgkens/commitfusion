using module ..\CommitFusion_class.psm1
Function Out-String(){
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(
            Mandatory = $true, 
            ValueFromPipeline = $true,
            Position = 1, 
            HelpMessage = "Pipeline for class command {CommitFusion.AsString}")]
        [string]$AsString
    )
    try {
        # Return the CommitFusion object
        return $global:commitfusion.AsString()
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Out-String