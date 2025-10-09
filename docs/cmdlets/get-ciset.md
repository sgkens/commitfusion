---
layout: default
title: Get-CiSet
description: "Returns gitmojis json file converted to psobject output to console"
permalink: /cmdlets/get-ciset
parent: Cmdlets
---

# **Get-CiSet**

---

**Get-CiSet** parses [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) JSON file and return as a PSObject, making it helpful if you wish to utilize custom types in your commit messages. The `$moduleroot/libs/Gitmojis.json` file serves as a reference, but you have the flexibility to customize it according to your preferences, as long as the schema remains consistent. Additionally, it's worth noting that the `type` and `cfa` additions are the same as those found in the `$moduleroot/libs/CommitFusion.types.json` file.

🟢 Syntax

```pre
Get-CiSet
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*

 - None

> #### 🟣 For Example:

```powershell
Get-CiSet | Select-Object -First 10 | FT -Wrap
```

> #### 🟣 Will Output:

```bash
name                      description                                                   semver code                        entity    emoji
----                      -----------                                                   ------ ----                        ------    -----
art                       Improve structure / format of the code.                              :art:                       &#x1f3a8; 🎨
zap                       Improve performance.                                          patch  :zap:                       &#x26a1;  ⚡️
fire                      Remove code or files.                                                :fire:                      &#x1f525; 🔥
bug                       Fix a bug.                                                    patch  :bug:                       &#x1f41b; 🐛
ambulance                 Critical hotfix.                                              patch  :ambulance:                 &#128657; 🚑️
sparkles                  Introduce new features.                                       minor  :sparkles:                  &#x2728;  ✨
memo                      Add or update documentation.                                         :memo:                      &#x1f4dd; 📝
rocket                    Deploy stuff.                                                        :rocket:                    &#x1f680; 🚀
lipstick                  Add or update the UI and style files.                         patch  :lipstick:                  &#ff99cc; 💄
tada                      Begin a project.                                                     :tada:                      &#127881; 🎉
```