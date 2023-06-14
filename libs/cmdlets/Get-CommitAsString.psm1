using module ..\CommitFusion_class.psm1

function Get-CommitAsString {
    [CmdletBinding()]
    param ()
    process{
        try {
            # Return the CommitFusion object
            return $global:commitfusion.AsString()
        }
        catch [System.Exception] {
            Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
            # You can handle the exception here or rethrow it if needed
        }
    }
}
Export-ModuleMember -Function Get-CommitString