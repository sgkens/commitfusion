---
layout: default
title: Get-CommitTypes
description: "Returns Commitfusion Types json file converted to psobject output to console"
permalink: /cmdlets/get-committypes
nav_order: 3
parent: Cmdlets
---

# **Get-CommitTypes**

---


Get-CommitTypes* Takes `4` optional **Parameters**, it will parse and write to console the types from the `$moduleroot/libs/commitFusion.types.json` file. The types can be further filtered by the following parameters:

🟢 Syntax

```pre
Get-CommitTypes [-NoSemver] [-Major] <switch> [-Minor] <switch> [-Patch] <switch>
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*

{: .info }
🔴Required Parameter
🔘Optional Parameter

| Required |Parameter Name| Type         | Description|
| --- | --- | --- |
| 🔘 |**NoSemver**         | `[switch]`   | Filters types without semantic versioning.                                                  |
| 🔘 |**Major**             | `[switch]`   | Filters types of major version changes.                                                     |
| 🔘 |**Minor**             | `[switch]`   | Filters types of minor version changes.                                                     |
| 🔘 |**Patch**             | `[switch]`   | Filters types of patch version changes.                                                     |

{: .note}
> If no parameters are specified, it will return all the types.
>
> If you would like to return the PSObject as this function renders the result using Spectre.Console via SimpleSpectreWrapper, you can use the `-raw` parameter to return the PSObject instead.

```
Type        description                                                  semver cfa          emoji
----        -----------                                                  ------ ---          -----
changes     Introduce breaking changes.                                  major  {@{action=}} 💥
feat        Introduce new features.                                      minor  {@{action=}} ✨
fix         Fixed bugs.                                                  patch  {@{action=}} 🐛
docs        Update Documentation.                                               {@{action=}} 📝
style       Update style.                                                patch  {@{action=}} 💄
perf        Improve performance.                                         patch  {@{action=}} ⚡️
test        Add tests.                                                          {@{action=}} ✅
build       Build.                                                       patch  {@{action=}} 📦
ci          Continuous integration.                                             {@{action=}} 👷
chore       Tooling, Generic commit                                             {@{action=}} 🔧
revert      Revert changes.                                              patch  {@{action=}} ⏪
bookmark    Release / Version tags.                                             {@{action=}} 🔖
wip         Work in progress.                                                   {@{action=}} 🚧
gitignore   Add or update a .gitignore file.                                    {@{action=}} 🙈
flag        Add, update, or remove feature flags.                               {@{action=}} 🚩
improve     Improve structure / format of the code.                      patch  {@{action=}} 🎨
hotfix      Critical hotfix.                                             patch  {@{action=}} 🚑️
deploy      Deploy stuff.                                                       {@{action=}} 🚀
project     Begin a project.                                                    {@{action=}} 🎉
security    Fix security issues.                                         patch  {@{action=}} 🔒️
refactor    Refactor code.                                                      {@{action=}} ♻️
depadd      Add a dependency.                                            patch  {@{action=}} ➕
depdell     Remove a dependency.                                         patch  {@{action=}} ➖
config      Add or update configuration files.                           patch  {@{action=}} 🔧
typos       Fix typos.                                                   patch  {@{action=}} ✏️
resources   Move or rename resources (e.g.: files, paths, routes).              {@{action=}} 🚚
fix-s       Simple fix for a non-critical issue.                         patch  {@{action=}} 🩹
deadcode    Remove dead code.                                                   {@{action=}} ⚰️
Depre       Remove deprecate code.                                              {@{action=}} 🗑️
concurrency Add or update code related to multithreading or concurrency.        {@{action=}} 🧵
Infra       Infrastructure related changes.                              patch  {@{action=}} 🧱
```

**Note!** You can modify the `$moduleroot/libs/CommitFusion.json` file to add your own types, using the GitMojis. See [New-Commit](/cmdlets#New-Commit) **Types** for more information.
