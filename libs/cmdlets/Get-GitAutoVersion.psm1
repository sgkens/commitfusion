Function Get-GitAutoVersion(){
    [CmdletBinding()]
    [OutputType([String])]
    param ()
    process{
        try {
            # Return the CommitFusion object
            return (Get-CommitFusionModuleInstance).GitAutoVersion()
        }
        catch [System.Exception] {
            Write-Host "An error occurred while creating CommitFusion: $($_.Exception.Message)"
            # You can handle the exception here or rethrow it if needed
        }
    }
}
Export-ModuleMember -Function Get-GitAutoVersion