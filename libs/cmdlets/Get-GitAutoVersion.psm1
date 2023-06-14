using module ..\CommitFusion_class.psm1
Function Get-GitAutoVersion(){
    [CmdletBinding()]
    param ()
    process{
        try {
            # Return the CommitFusion object
            return $global:commitfusion.GitAutoVersion()
        }
        catch [System.Exception] {
            Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
            # You can handle the exception here or rethrow it if needed
        }
    }
}
Export-ModuleMember -Function Get-GitAutoVersion