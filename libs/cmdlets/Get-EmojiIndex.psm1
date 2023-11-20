<#
.SYNOPSIS
Return Gitmojis or miscmojis json array as a psoject

.DESCRIPTION
Return Gitmojis or miscmojis json array as a psoject

.EXAMPLE
# From the json File miscmojis.json
Get-Emojiindex -Type miscmojis

# From the json file gitmojis.json
Get-Emojiindex -Type gitmojis
.INPUTS
- Type
- Name

.OUTPUTS
[PsCustomObject]

.NOTES
- 

.LINK
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
        switch($emojitype){
            "gitmojis" {
                $EmojiObject = (Get-CommitFusionModuleInstance).GetEmojiIndex("gitmojis") | Select-Object Name,Description,Semver,Emoji
            }
            "miscmojis" {
                $EmojiObject = (Get-CommitFusionModuleInstance).GetEmojiIndex("miscmojis")
            }
        }
        return $EmojiObject
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Get-EmojiIndex