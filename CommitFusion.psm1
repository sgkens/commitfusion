using module libs\CommitFusion_class.psm1
using module libs\cmdlets\New-CommitFusion.psm1
using module libs\cmdlets\New-ConventionalCommit.psm1
using module libs\cmdlets\Get-CiSet.psm1
using module libs\cmdlets\Get-CiSetFusion.psm1
using module libs\cmdlets\Get-Emoji.psm1
using module libs\cmdlets\Get-EmojiIndex.psm1
using module libs\cmdlets\Format-FusionMD.psm1
using module libs\cmdlets\Get-CommitAsObject.psm1
using module libs\cmdlets\Get-CommitAsString.psm1
using module libs\cmdlets\Get-GitAutoVersion.psm1
# using module libs\cmdlets\Out-Object.psm1
# using module libs\cmdlets\Out-String.psm1
using module libs\cmdlets\Update-ChangeLog.psm1


<#
 * Set global instance for all cmdlets New-CommitFusion 
 * can be used to create a new instance outside of the global instance
#>
$global:commitfusion = New-Object CommitFusion
#$global:commitfusion = New-Object CommitFusion -Argumentlist $pathtocustomconfigfile

# Set the module root path
$global:CommitFusionBaseModuleRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
write-host -ForegroundColor Green "Module CommitFuison loaded: ModuleRoot: $global:BaseModuleRoot"


Export-ModuleMember -Function New-CommitFusion
Export-ModuleMember -Function New-ConventionalCommit
Export-ModuleMember -Function Get-CiSet
Export-ModuleMember -Function Get-CiSetFusion
Export-ModuleMember -Function Get-Emoji
Export-ModuleMember -Function Get-EmojiIndex
Export-ModuleMember -Function Get-CommitAsObject
Export-ModuleMember -Function Get-CommitAsString
Export-ModuleMember -Function Get-GitAutoVersion
Export-ModuleMember -Function Format-FusionMD
Export-ModuleMember -Function Update-Changelog
# Export-ModuleMember -Function Out-Object
# Export-ModuleMember -Function Out-String


<#
---------------------------------------------------------------------------------------------------------------------------------------
!    ___                              _)  |    ____|           _) 
?  |       _ \  __ `__ \   __ `__ \   |  __|  |   |   |   __|  |   _ \  __ \  
? |      (   | |   |   |  |   |   |  |  |    __| |   | \__ \  |  (   | |   | 
! \____| \___/ _|  _|  _| _|  _|  _| _| \__| _|  \__,_| ____/ _| \___/ _|  _| 

---------------------------------------------------------------------------------------------------------------------------------------

? NOTES
This class is still in development and is not ready for production use.
@Colorful comments vscode url: 
- #? https://marketplace.visualstudio.com/items?itemName=bierner.colorful-comments

& CLASS: [CommitFusion]
~ VERSION: 0.1.0
- AUTHOR: snoonx
- LICENSE: MIT   
* DESCRIPTION:   
    ^_Conventional Commits 
    is a specification that defines a standard convention 
    for structuring commit messages in software development. It provides a 
    consistent format and semantic meaning to commit messages, making it 
    easier to understand the purpose and impact of each commit. Here are the 
    main properties defined by Conventional Commits:
    &VALUES
        ^- Type
        ^- Scope
        ^- Description
        ^- Body
        ^- Footer
    This module provides a class that can be used to create Conventional 
    Commits. It also provides a cmdlet that can be used to create Conventional
    Commits from the command line. it them parses the commit message and injecting 
    the commit message into the commit template, m before returning the commit message
    ! * * NOTE**
    TODO - Add support for the commit template
    TODO - Add Support for just generating and return commit string
    ? DEPENDANCIES:
        ~ ColorTune
        ~ Write-Inexco #? Colortune Replaces this
        ~ powerunicode
    ^ BUILD ENV---: BUILD: Powershellcore 7.3.1
    ^ SUPPORTED VERSIONS
        Powerhshell 5.1^
        Powershell 7.^
        Powershellcore(linux) 7.^
#>