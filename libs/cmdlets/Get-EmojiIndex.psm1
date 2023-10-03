<#
.SYNOPSIS
Returns the emoji object array from the gitmojis or miscmojis json file
.DESCRIPTION
This cmdlet returns the emoji object array from the gitmojis or miscmojis json file
.EXAMPLE
Get-EmojiIndex -Type gitmojis
Get-EmojiIndex -Type miscmojis
.INPUTS
Type: gitmojis or miscmojis
.OUTPUTS
PSObject
.NOTES
- 
.LINK
CommitFusion (Module): https://github.com/sgkens/Commitfusion/main/readme.md#Get-CiSet
#>
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
        return (Get-CommitFusionModuleInstance).GetEmojiIndex($emojiType)
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Get-EmojiIndex