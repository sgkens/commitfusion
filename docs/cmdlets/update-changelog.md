---
layout: default
title: Update-ChangeLog
nav_order: 4
description: "Update-ChangeLog takes the output of Format-FustionMD and appends it to the ChangelogFile "
permalink: /cmdlets/Update-ChangeLog
parent: Cmdlets
---

# **Update-ChangeLog**

---


Takes the output of Format-FustionMD and appends it to the Changelog File.

🟢 Syntax

```pre
    Update-ChangeLog [-logfile] <string>
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*


{: .info }
🔴Required Parameter
🔘Optional Parameter

| Required |Parameter Name | Type | Description                                                                                |
|--- | --- | --- | --- |
| 🔴 | **logfile**         | `[string]`   | The relative path to the changelog file. If not specified, it will look for `CHANGELOG.md` in the current directory. If the file is not found, it will create one. The function will attempt to pre-pend the output from `Format-FusionMD` to the file.                                                  |

> #### 🟣 For Example:

```powershell
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
           -Footer | Format-FusionMD | Update-ChangeLog -logfile "CHANGELOG.md"
```

