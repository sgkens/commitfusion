Function Get-CommitAsObject(){
    [CmdletBinding()]
    param ()
    try {
        # Return the CommitFusion object
        return(Get-CommitFusionModuleInstance).AsObject()
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Get-CommitAsObject