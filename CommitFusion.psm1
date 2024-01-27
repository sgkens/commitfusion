<#
* Root module for NuPSForge
#>
using module libs\cmdlets\New-CommitFusion.psm1
using module libs\cmdlets\Get-CommitFusionModuleInstance.psm1
using module libs\cmdlets\New-Commit.psm1
using module libs\cmdlets\Get-CiSet.psm1
using module libs\cmdlets\Get-CommitTypes.psm1
using module libs\cmdlets\Get-Emoji.psm1
using module libs\cmdlets\Get-EmojiIndex.psm1
using module libs\cmdlets\Get-GitAutoVersion.psm1
using module libs\cmdlets\Format-FusionMD.psm1
using module libs\cmdlets\Update-ChangeLog.psm1
using module libs\cmdlets\Set-Commit.psm1

<#
* Exported Functions Object -> array 
#>
$ExortModuleMember = @{
    function = @(
        "New-CommitFusion",
        "Get-CommitFusionModuleInstance",
        "New-Commit",
        "Get-CiSet",
        "Get-CommitTypes",
        "Get-Emoji",
        "Get-EmojiIndex",
        "Get-GitAutoVersion",
        "Format-FusionMD",
        "Update-Changelog",
        "Set-Commit"
    )
}

<#
* Exported Functions
#>
Export-ModuleMember @ExortModuleMember


<#
---------------------------------------------------------------------------------------------------------------------------------------
!    ___                              _)  |    ____|           _) 
?  |       _  \  __ `__ \   __ `__ \   |  __|  |   |   |   __|  |   _ \  __ \  
? |      (    | |   |   |  |   |   |  |  |    __| |   | \__ \  |  (   | |   | 
! \____| \___/ _|  _|  _| _|  _|  _| _| \__| _|  \__,_| ____/ _| \___/ _|  _| 

---------------------------------------------------------------------------------------------------------------------------------------

? NOTES
@Colorful comments vscode url: 
- #? https://marketplace.visualstudio.com/items?itemName=bierner.colorful-comments

& CLASS: [CommitFusion]
* DESCRIPTION:   
    ^_Conventional Commits 
    is a specification that defines a standard convention 
    for structuring commit messages in software development. It provides a 
    consistent format and semantic meaning to commit messages, making it 
    easier to understand the purpose and impact of each commit. Here are the 
    main properties defined by Conventional Commits:
    &VALUES
        ^- Type parameter input validation parsed from commitfusion.json allows dynamic updating of the commit types
        ^- Scope (UserDefined) - Allows for user defined scopes
        ^- Description Default(commitfusion.json > DesCription or (user defined) - Allows for user defined descriptions))
        ^- Body(Notes)
            ^- Notes(Default Body) - Change body to Notes
            ^- Breaking Changes
            ^- FeatureNotes
            ^- BugFixes
            ^- FeatureAddtions
        ^- Footer (gituser|user @ DateTime)
    ? DEPENDANCIES:
        ~ ColorTune - Embedded in this module
        ~ Write-Inexco #? Colortune Replaces this #TODO: Replace and use SimpleSpectreWrapper and ColorTune
        ? powerunicode - Embedded in this module - Not used at this time
        ! SimpleSpectreWrapper - Embedded in this module - pending implementation
    ^ BUILD ENV---: BUILD: Powershellcore 7.4.0 - Windows 11, Pester 5.5.0, PSScriptAnalyzer(LATEST) 1.21.1
    ^ SUPPORTED VERSIONS
        Powerhshell 5.1^ - Pending Test
    *   Powershell 7.^
        Powershellcore(linux) 7.^ - Pending Test
#>