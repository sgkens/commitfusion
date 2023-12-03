# <i class="fa-solid fa-code" style="color: #04376a;"></i> Cmdlets
Commitfusion provides a number cmdlets to help with the creation of conventional commits, changelog updates and semver version generator.

---

<div id ="toc" class="toc">
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#New-Commit"> New-Commit</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#format-fusionmd"> Format-FustionMD</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#update-changelog"> Update-ChangeLog</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#set-commit"> Set-Commit</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-gitautoversion"> Get-GitAutoVersion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-ciset"> Get-CiSet </a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#Get-CommitTypes">Get-CommitTypes</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> Get-Emoji</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> New-CommitFusion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> New-CommitFusionModuleInstance</a></li>
</div>

## New-Commit
`New-Commit` takes `11` **Parameters**, `2` of which are *Mandatory* `type` and `Description`.

*🥏 Parameter List*

1. **Type** `[String]` Parameter values are imported from `$moduleroot/libs/CommitFustion.json` at module Import.
  > *Note!* \
  > ♦ - Additional types can be added to `CommitFustion.json` file if needed. Schema follows [🧷 Carlos Cuesta Gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) @ [🧷 gitmoji.dev](https://gitmoji.dev) with additional `type` and `cfa` added to the object array items. \
  > <span style="color:magenta;">PARAMETER REQUIRED</span>

2. **Scope** `[string]` The Scope of the commit, User specified, placed between brackets after the `Type` - <span style="color:green;">OPTIONAL</span>
3. **Description** `[string]` The Commit Description, User specified, placed after the `scope` - <span style="color:magenta;">PARAMERTER REQUIRED</span>
4. **Notes** `[string[]]` Array of text and will ouput under the `NOTES:` area inside the body - <span style="color:green;">OPTIONAL</span>
5. **BugFixes** `[string[]]` Array of text and will ouput under the `BUG FIXES:` area inside the body - <span style="color:green;">OPTIONAL</span>
6. **FeatureNotes** `[string[]]` Array of text and will ouput under the `FEATURE NOTES:` area inside the body, - <span style="color:green;">OPTIONAL</span>
7. **FeatureAddtions** `[string[]]` Array of text and will ouput under the `FEATURE ADDTIONS:` area inside the body - <span style="color:green;">OPTIONAL</span>
8. **BreakingChanges** `[string[]]` Array of text and will ouput under the `BREAKING CHANGES:` area inside the body - <span style="color:green;">OPTIONAL</span>
9. **Footer** `[switch]` Display Footer if specified will output **GitUser** and **DateTime**  <span style="color:green;">OPTIONAL</span>
10. **GitUser** `[String]` Use with footer and the generated commit link when using `Format-FustionMD` *cmdlet* - <span style="color:green;">OPTIONAL</span>
11. **GitGroup** `[string]` Use to generated commit link when using the `Format-FustionMD` *cmdlet* - <span style="color:green;">OPTIONAL</span>

> #### For Example:

```powershell

# Minimal Required Parameters Example 
New-Commit -Type feat -Description "Added new feature"

# All Parameters Example
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
✨ feat(add): Added new feature

🧰 Build: minor

📜 NOTES:

✏  Note 1
✏  Note 2

🌟 FEATURE ADDTIONS:

🍠 FeatureAddtions 1
🍠 FeatureAddtions 2 ..🖊


🐛 BUGFIXES:

🦠 BugFixes 1
🦠 BugFixes 2 ..🖊


🧪 FEATURE UPDATES:

🔨 FeatureNotes 1
🔨 FeatureNotes 2 ..🖊


💢 BREAKING CHANGES:

🧨 BreakingChanges 1
🧨 BreakingChanges 2 ..🖊

👤 @GitUser 📅 9:41PM, Friday 4th August 2023
```

<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

----

## Format-FusionMD
The function currently takes `0` parameters. It reads the output from `New-Commit` and formats it into Markdown format ready for documentation or changelog updates.

> #### For Example:

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
                       -Footer | Format-FusionMD
```

> #### *Will Ouput*

```text
## 🎯-✨ feat(add):Added new feature


> [🧰]» <kbd>MINOR</kbd>

📜 NOTES:

✏  Note 1 \
✏  Note 2 ..🖊

🌟 FEATURE ADDTIONS:  |
|-|

🍠 FeatureAddtions 1 \
🍠 FeatureAddtions 2 ..🖊


🐛 BUG FIXES:  |
|-|

🦠 BugFixes 1 \
🦠 BugFixes 2 ..🖊


🧪 FEATURE UPDATES:  |
|-|

🔨 FeatureNotes 1 \
🔨 FeatureNotes 2 ..🖊


💢 BREAKING CHANGES:  |
|-|

🧨 BreakingChanges 1 \
🧨 BreakingChanges 2 ..🖊

👤 @GitUser 📅 8:28AM, Monday 14th August 2023
```

<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

## Update-ChangeLog
**Update-ChangeLog** takes `1` **Optional** Parameter:

*🥏 Parameter List*

1. `logfile`: (*optional*) Specifies the relative path to the changelog file. If not specified, it will look for `CHANGELOG.md` in the current directory. If the file is not found, it will create one. The function will attempt to pre-pend the output from `Format-FusionMD` to the file.

> #### For Example:

```powershell
New-Commit New-Commit -Type feat `
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
<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

## Set-Commit
**Set-Commit** takes `0` **Parameters**, will simple run `git commit -m $commitmessage` and will use the output from `New-Commit` as the commit message.

> Asummptions:
> - You are in a git repository
> - You have staged files

## Get-GitAutoVersion
This function takes `0` **Parameters**, it will parse the git log see [**semver-version-generator**](/index#semver-version-generator) for more information on the logic of function.

> #### For Example:
git log with no `semver` tags in the git log

```powershell
# Object
Get-GitAutoVersion

# just property 
Get-GitAutoVersion | Select-Object -Property Version

# or just method 
(Get-GitAutoVersion).Version
```

> #### *Will Ouput*

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
<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

## Get-CiSet
**Get-CiSet** parses [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) JSON file and return as a PSObject, making it helpful if you wish to utilize custom types in your commit messages. The `$moduleroot/libs/Gitmojis.json` file serves as a reference, but you have the flexibility to customize it according to your preferences, as long as the schema remains consistent. Additionally, it's worth noting that the `type` and `cfa` additions are the same as those found in the `$moduleroot/libs/CommitFusion.json` file.


```powershell
Get-CiSet | Select-Object -First 10 | FT -Wrap
```

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

<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

## Get-CommitTypes
*Get-CiSetFusion* Takes `4` optional **Parameters**, it will parse and write to console the types from the `$moduleroot/libs/CommitFusion.json` file. The types can be further filtered by the following parameters:

*🥏 Parameter List*

1. `-NoSemver`: Filters types without semantic versioning.
2. `-Major`: Filters types of major version changes.
3. `-Minor`: Filters types of minor version changes.
4. `-Patch`: Filters types of patch version changes.
4. `-Patch`: returns `psobject`

If no parameters are specified, it will return all the types.

If you would like to return the PSObject as this function renders the result using Spectre.Console via SimpleSpectreWrapper, you can use the `-raw` parameter to return the PSObject instead.

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

```powershell
Get-CiSetFusion -NoSemver -NoRender | Select-Object -First 10 | FT -Wrap
```

<a href="/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>

## Get-Emoji
**Get-Emoji** take `2` optional Parameters:

*🥏 Parameter List*
1. `-Type`: Specify either **miscmojis** or **gitmojis** to select the desired type. 
2. `-Name` (optional): If specified, it will return the emoji with the specified name. If not specified, it will return all the emojis of the specified type.

## New-CommitFusion
**New-CommitFusion** `0` **Parameters** it will return a new instance of the commit fusion class.

> **Note!** if you want to use the `commitfusion_class.psm1` lib directly see `$moduleroot/libs/commitfusion_class.lib` for more information.

## Get-CommitFusionModuleInstance
**Get-CommitFusionModuleInstance** takes `0` Parameters and will return the module instance initiated at module import. See `$moduleroot/libs/cmdlets/Get-CommitFusionModuleInstance.psm1`, used by all the cmdlets to interact with the class instance.

<a href="commitfusion/cmdlets#toc"><i class="fa-solid fa-circle-up"></i></a>
