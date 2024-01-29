<#
.SYNOPSIS
New-Commit is used to generate a new Conventional Commit message and return it as and object, string, or string with markdown syntax
.DESCRIPTION
New-Commit is used to generate a new Conventional Commit message and return it as and object, string, or string with markdown syntax

.EXAMPLE
New-Commit -Type feat -Description "CommitFusion PowerShell class library"
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx"
New-Commit -Type build -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell"
New-Commit -Type bookmark -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note")
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note") -Scope "UserAdmin"
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random")
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note")
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note") -BreakingChanges @("breakingchanges 1", "another breaking change note")
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note") -BreakingChanges @("breakingchanges 1", "another breaking change note")
New-Commit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAdditions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note") -BreakingChanges @("breakingchanges 1", "another breaking change note")

.INPUTS
- Type
- Scope
- Description
- Notes
- FeatureAdditions
- FeatureNotes
- BugFixes
- Footer
- Gituser
- Gitgroup
- ForMarkdown

.OUTPUTS
psobject or String

.NOTES
- 
.LINK
#>
Function New-Commit {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        # valuedateset Dynamic values
        [ValidateScript({
                if ($_ -in (Get-CommitTypes -Raw).type) {
                    $true
                }
                else {
                    throw "Invalid Type '$($_)', please use one of the following values: $((Get-CommitTypes -Raw).type -join ',')"
                }
            })]
        [string]$Type,

        [Parameter(Mandatory = $false, Position = 1)]
        [string]$Scope,

        [Parameter(Mandatory = $false, Position = 2)]
        [string]$Description,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string[]]$Notes,

        [Parameter(Mandatory = $false, valuefrompipeline = $true)]
        [switch]$Footer,

        [Parameter(Mandatory = $false)]
        [string]$GitUser,

        [Parameter(Mandatory = $false)]
        [string]$GitGroup,

        [Parameter(Mandatory = $false)]
        [string[]]$FeatureAdditions,
            
        [Parameter(Mandatory = $false)]
        [string[]]$BugFixes,

        [Parameter(Mandatory = $false)]
        [string[]]$FeatureNotes,

        [Parameter(Mandatory = $false)]
        [string[]]$BreakingChanges,

        [Parameter(Mandatory = $false)]
        [switch]$AsString,

        [Parameter(Mandatory = $false)]
        [switch]$AsObject,

        [Parameter(Mandatory = $false)]
        [switch]$ForMarkdown

    )

    process {
        if ($null -eq $Notes) {
            $Notes = $null
        }
        if ($null -eq $FeatureAdditions) {
            $FeatureAdditions = $null
        }
        if ($null -eq $BugFixes) {
            $BugFixes = $null
        }
        if ($null -eq $FeatureNotes) {
            $FeatureNotes = $null
        }
        if ($null -eq $BreakingChanges) {
            $BreakingChanges = $null
        }
        if ($Footer -ne $true) {
            $Footer = $null
        }
        if ($null -eq $GitUser) {
            $GitUser = $null
        }
        if ($null -eq $GitGroup) {
            $GitGroup = $null
        }
        if ($null -eq $Scope) {
            $Scope = $null
        }
        if ($AsString -and $AsObject) {
            throw "Cannot use both -AsString and -AsObject"
        }

        if($ForMarkdown -eq $true) {
            $forMarkDown = $true
        }
        else {
            $forMarkDown = $null
        }

        (Get-CommitFusionModuleInstance).ConventionalCommit(
            $Type,
            $Scope,
            $Description,
            $Notes,
            $Footer,
            $GitUser,
            $GitGroup,
            $FeatureAdditions,
            $BugFixes,
            $FeatureNotes,
            $BreakingChanges,
            $forMarkDown
            );

        if ($AsString) {
            return (Get-CommitFusionModuleInstance).AsStringForCommit()
        }
        if ($AsObject) {
            return (Get-CommitFusionModuleInstance).AsObject()
        }
        if (-not $AsString -and -not $AsObject) {
            return (Get-CommitFusionModuleInstance).AsStringForCommit()
        }
    }
    end {
        # Clean up any resources if needed
    }
}
Export-ModuleMember -Function New-Commit