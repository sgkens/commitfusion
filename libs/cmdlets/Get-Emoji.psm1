using module ..\CommitFusion_class.psm1
Function Get-Emoji(){
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [validateset("gitmojis", "miscmojis")]
        [string]$Type,
        [Parameter(Mandatory)]
        [string]$name
    )
    try {
        # Return the CommitFusion object
        return $global:commitfusion.GetEmoji($Type, $name)
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Get-Emoji