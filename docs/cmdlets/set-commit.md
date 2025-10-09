---
layout: default
title: Set-Commit
description: "Sets the commit message, it Takes the value from commitfuction.AsStringForCommit and applys it ie git commit -m $Message"
permalink: /cmdlets/set-commit
nav_order: 2
parent: Cmdlets
---

# **Set-Commit**

---


**Set-Commit** takes `2` Optional **Parameters**, will simple run `git commit -m $commitmessage` and will use the output from `New-Commit` as the commit message.

{: .assumpstion}
> - You are in a git repository
> - You have staged files

🟢 Syntax

```pre
Set-commit [-AsStringForCommit <string>] [-Test] <switch> [-Confirm] <switch>
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*

{: .info }
🔴Required Parameter
🔘Optional Parameter

| Required |Parameter Name | Type         | Description                                                                                |
| --- |--- | --- | --- |                                               |
| 🔘 |**Test**             | `[switch]`   | Display Test if specified will output **Test**.                                            |
| 🔘 | **Confirm**       | `[switch]`   | Display Confirm if specified will output **Confirm**.                                      |


> #### 🟣 For Example:

```powershell
New-Commit -Type feat -Description "Updated module logic" | Set-Commit -Confirm -confirm
```