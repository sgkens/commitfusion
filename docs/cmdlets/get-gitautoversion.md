---
layout: default
title: Get-GitAutoVersion
description: "Generates and return SemVer Version number and return it as a Pscustomobject"
permalink: /cmdlets/get-gitautoversion
nav_order: 4
parent: Cmdlets
---


# **Get-GitAutoVersion**

---


This function takes `0` **Parameters**, it will parse the git log see [**semver-version-generator**](/index#semver-version-generator) for more information on the logic of function.

🟢 Syntax

```pre
Get-GitAutoVersion
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*

 - None

> #### 🟣 For Example:

```powershell
# Object
Get-GitAutoVersion

# just property 
Get-GitAutoVersion | Select-Object -Property Version

# or just method 
(Get-GitAutoVersion).Version
```

> #### 🟣 *Will Ouput:*

```bash
# object
Version Parsedlines
------- -----------
0.1.0   3

# string
0.1.0

# string
0.1.0

```