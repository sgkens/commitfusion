---
layout: default
title: Get-ReleaseNotes
description: "Generates and return SemVer Version number and return it as a Pscustomobject"
permalink: /cmdlets/get-releasenotes
nav_order: 5
parent: Cmdlets
---

# **Get-ReleaseNotes**

---


Parses the git log and returns the release notes in markdown format.

🟢 Syntax

```pre
Get-ReleaseNotes [-Notes] <switch> [-FeaturesNotes] <switch>
                 [-BreakingChanges] <switch> [-FeatureAdditions] <switch>
                 [-CommitLink] <switch> [-CommitLinkPrefix] <string> 
                 [-NameSpace] <string> [-AsObject] <switch>
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*

{: .info }
🔴Required Parameter
🔘Optional Parameter

| Required | Parameter Name| Type         | Description |
| --- | --- | --- | -- |
| 🔘 | **Notes**            | `[string]`   | The Scope of the commit, User specified, placed between brackets after the `Type`          |
| 🔘 | **FeaturesNotes**   | `[string]`   | The Commit Description, User specified, placed after the `scope`.                          |
| 🔘 | **BreakingChanges**  | `[string]`   | Array of text and will ouput under the `NOTES:` area inside the body.                      |
| 🔘 | **FeatureAdditions**  | `[string]`   | Array of text and will ouput under the `BUG FIXES:` area inside the body.                  |
| 🔘 | **CommitLink**      | `[string]`   | Use with footer and the generated commit link when using `Format-FustionMD` *cmdlet*.      |
| 🔘 | **CommitLinkPrefix**  | `[string]`   | Use with footer and the generated commit link when using `Format-FustionMD` *cmdlet*.      |
| 🔘 | **NameSpace**        | `[string]`   | Use with footer and the generated commit link when using `Format-FustionMD` *cmdlet*.      |
| 🔘 | **AsObject**         | `[switch]`   | Display SemVer if specified will output **SemVer**.                                        |

> #### 🟣 For Example:

```powershell
Get-ReleaseNotes -Notes -FeaturesNotes -BreakingChanges -FeatureAdditions -CommitLink -CommitLinkPrefix github.com/ -NameSpace GitUser
```

> #### 🟣 Will Ouput:


```markdown
## Notes:

  - Note 1
  - Note 2

## Feature Notes:

  - FeatureNotes 1
  - FeatureNotes 2

## Breaking Changes:

  - BreakingChanges 1
  - BreakingChanges 2

## Feature Additions:

  - FeatureAddtions 1
  - FeatureAddtions 2
```