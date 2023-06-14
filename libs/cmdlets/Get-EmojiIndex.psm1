using module ..\CommitFusion_class.psm1
Function Get-EmojiIndex(){
    [CmdletBinding()]
    [OutputType([PSObject])]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [validateset("gitmojis", "miscmojis")]
        [string]$emojiType
    )
    try {
        # Return the CommitFusion object
        return $global:commitfusion.GetEmojiIndex($emojiType)
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Get-EmojiIndex