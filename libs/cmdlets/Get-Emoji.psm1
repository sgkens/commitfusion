<#
.SYNOPSIS
Get Emojis from gitmojis or miscmojis json file
.DESCRIPTION
This cmdlet returns the emoji object from the gitmojis or miscmojis json file
.EXAMPLE
Get-Emoji -Type gitmojis -name art
Get-Emoji -Type miscmojis -name puzzle_piece
Get-Emoji -Type miscmojis -name "toolbox"
.INPUTS
Type: gitmojis or miscmojis
name: name of the emoji
.OUTPUTS
PSObject
.NOTES
- 
.LINK
CommitFusion (Module): https://github.com/sgkens/Commitfusion/main/readme.md#Get-CiSet
#>
Function Get-Emoji(){
    [CmdletBinding()]
    [OutputType([PSObject])]
    param (
        [Parameter(Mandatory)]
        [validateset("gitmojis", "miscmojis")]
        [string]$Type,
        [Parameter(Mandatory)]
        [string]$name
    )
    try {
        # Return the CommitFusion object
        return (Get-CommitFusionModuleInstance).GetEmoji($Type, $name)
    }
    catch [System.Exception] {
        Write-Host "An error occurred while creating CommitFusion: $_.Exception.Message"
        # You can handle the exception here or rethrow it if needed
    }
}
Export-ModuleMember -Function Get-Emoji