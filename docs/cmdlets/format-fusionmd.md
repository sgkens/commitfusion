---
layout: default
title: Format-FusionMD
description: "Formats the string piped from New-Commit to FusionMD(markdown)"
permalink: /cmdlets/format-fusionmd
parent: Cmdlets
---

# **Format-FusionMD**

---

The function currently takes `0` parameters. It reads the output from `New-Commit` and formats it into Markdown format ready for documentation or changelog updates.

🟢 Syntax

```pre
    Format-FusionMD [-WriteTemplateFile] <switch>
```
{: .fs-5 .fw-300 }


> #### 🟣 *For Example:*

```powershell
New-Commit -Type feat `
           -Description "Added new feature" `
           -Scope "add" `
           -Notes "Note 1","Note 2" `
           -BugFixes "BugFixes 1","BugFixes 2" `
           -FeatureNotes "FeatureNotes 1","FeatureNotes 2" `
           -FeatureAdditions "FeatureAddtions 1","FeatureAddtions 2" `
           -BreakingChanges "BreakingChanges 1","BreakingChanges 2" `
           -GitUser "GitUser" `
           -GitGroup "GitGroup" `
           -Footer | Format-FusionMD
```

> #### 🟣 *Will Ouput*

```text
## 🎯-✨ feat(add): Added new feature


> [🧰]» <kbd>MINOR</kbd>

🧳 Notes:

  - Note 1
  - Note 2


🌠 Feature Additions:

  - FeatureAddtions 1
  - FeatureAddtions 2


| 🦀 Bug Fixes: |
| ------------ |

  - BugFixes 1
  - BugFixes 2


🧶 Feature Notes:

  - FeatureNotes 1
  - FeatureNotes 2


| ⭕ Breaking Changes: |
| ------------------- |

  - BreakingChanges 1
  - BreakingChanges 2

👤 @GitUser 📅 5:05PM, Thursday 2th October 2025
```
