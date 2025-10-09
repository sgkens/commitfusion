---
layout: default
title: New-Commit
description: "Generates a new commit message and returns the commit message as a string."
permalink: /cmdlets/new-commit
nav_order: 1
parent: Cmdlets
---

# **New-Commit**

---


This cmdlet takes `11` **Parameters**, `2` of which are *Mandatory* `type` and `Description`.

🟢 Syntax

```pre
    New-Commit [-Type] <string> [-Scope] <string> [-Description] <string>   
               [-Notes] <string[]> [-BugFixes] <string[]> [-FeatureNotes] <string[]> 
               [-FeatureAddtions] <string[]> [-BreakingChanges] <string[]> [-Footer] <switch> 
               [-GitUser] <string> [-GitGroup] <string> [-SemVer] <switch> [-NoEmoji] <switch>
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*

{: .note }
🔴Required Parameter
🔘Optional Parameter

| Required  |Parameter Name| Type         | Description                                                                                |
|  -------------| ------------ |     ------------------------------------------------------------------------------------------ |
| 🔴 | **Type**             | `[String]`   | Parameter values are imported from `$moduleroot/libs/CommitFustion.json` at module Import. |
| 🔘 | **Scope**            | `[string]`   | The Scope of the commit, User specified, placed between brackets after the `Type`          |
| 🔘 | **Description**      | `[string]`   | The Commit Description, User specified, placed after the `scope`.                          |
| 🔘 | **Notes**            | `[string[]]` | Array of text and will ouput under the `NOTES:` area inside the body.                      |
| 🔘 | **BugFixes**        | `[string[]]` | Array of text and will ouput under the `BUG FIXES:` area inside the body.                  |
| 🔘 | **FeatureNotes**    | `[string[]]` | Array of text and will ouput under the `FEATURE NOTES:` area inside the body.              |
| 🔘 | **BreakingChanges** | `[string[]]` | Array of text and will ouput under the `BREAKING CHANGES:` area inside the body.           |
| 🔘 | **FeatureAddtions** | `[string[]]` | Array of text and will ouput under the `FEATURE ADDTIONS:` area inside the body.           |
| 🔘 | **Footer**          | `[switch]`   | Display Footer if specified will output **GitUser** and **DateTime**.                      |
| 🔘 | **GitUser**         | `[String]`   | Use with footer and the generated commit link when using `Format-FustionMD` *cmdlet*.      |
| 🔘 | **GitGroup**      | `[string]`   | Use to generated commit link when using the `Format-FustionMD` *cmdlet* .                   |
| 🔘 | **SemVer**          | `[switch]`   | Display SemVer if specified will output **SemVer**.                                        |


{: .info}
Additional types can be added to `./moduleroot/libs/CommitFustion.types.json` file if needed. Schema follows [Gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json), [gitmoji.dev](https://gitmoji.dev) with additional `type` and `cfa` added to the object array items. 

> #### Example:

```powershell
# Minimal Required Parameters Example 
New-Commit -Type feat -Description "Added new feature"

# All Parameters Example
# Feat, Changes, Fix by default has semver added to commit
New-Commit -Type feat `
           -Description "Added new feature" `
           -Scope "add" `
           -Notes "Note 1","Note 2" `
           -BugFixes "BugFixes 1","BugFixes 2" `
           -FeatureNotes "FeatureNotes 1","FeatureNotes 2" `
           -FeatureAddtions "FeatureAddtions 1","FeatureAddtions 2" `
           -BreakingChanges "BreakingChanges 1","BreakingChanges 2" `
           -GitUser "GitUser" `
           -GitGroup "GitGroup" `
           -Footer
```

> #### *Will Ouput*

```text
 ## 🎯-✨ feat(add): Added new feature


> [🧰]» <kbd>MINOR</kbd>

🧳 Notes:

  - Note 1
  - Note 2


🌠 Feature Additions:

  - FeatureAddtions 1
  - FeatureAddtions 2


🦀 Bug Fixes:  |
|-|

  - BugFixes 1
  - BugFixes 2


🧶 Feature Notes:

  - FeatureNotes 1
  - FeatureNotes 2


⭕ Breaking Changes:  |
|-|

  - BreakingChanges 1
  - BreakingChanges 2

👤 @GitUser 📅 11:36PM, Thursday 9th October 2025
```

<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

----