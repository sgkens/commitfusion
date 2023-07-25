using module libs\CommitFusion_class.psm1
using module libs\cmdlets\Get-CommitFusionModuleInstance.psm1
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
using module libs\cmdlets\Update-ChangeLog.psm1
using module libs\cmdlets\Set-Commit.psm1


Export-ModuleMember -Function New-CommitFusion,
                              Get-CommitFusionModuleInstance,
                              New-ConventionalCommit,
                              Get-CiSet,Get-CiSetFusion,
                              Get-Emoji,Get-EmojiIndex,
                              Get-CommitAsObject,
                              Get-CommitAsString,
                              Get-GitAutoVersion,
                              Format-FusionMD,
                              Update-Changelog,
                              Set-Commit


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