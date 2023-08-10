# <i class="fa-solid fa-code" style="color: #04376a;"></i> Cmdlets/Functions
Commit fusion provides number cmdlets to help with the creation of conventional commits, changelog updates and semver version generator.

---

# <i class="fa-solid fa-book" style="color: #5e5911;"></i> **Sections**
<div class="toc">
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> New-ConventionalCommit</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#format-fusionmd"> Format-FustionMD</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#update-changelog"> Update-ChangeLog</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#set-commit"> Set-Commit</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-gitautoversion"> Get-GitAutoVersion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-ciset"> Get-CiSet </a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-cisetfusion"> Get-CiSetFusion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> Get-EmojiIndex</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> Get-Emoji</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> New-CommitFusion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#get-emoji"> New-CommitFusionModuleInstance</a></li>
</div>

## New-ConventionalCommit
This function takes `11` **parameters**, `2` of which are mandatory: `type` and `Description`.

##### 🥏 **Parameter List**

1. **Type** `[String]` Parameter values are imported from `$moduleroot/libs/CommitFustion.json` at module Import, additional types can be added to the `CommitFustion.json` file if needed. It follows the [🧷 Carlos Cuesta Gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) @ [🧷 gitmoji.dev](https://gitmoji.dev) with additional `type` and `cfa` added to the object array items - <span style="color:magenta;">PARAMETER REQUIRED</span>
2. **Scope** `[String]` The Scope of the commit, User specified, placed between brackets after the `Type` - <span style="color:green;">OPTIONAL</span>
3.🔸**Description** `[String]` The Commit Description, User specified, placed after the `scope` - <span style="color:magenta;">PARAMERTER REQUIRED</span>
4. **Body** `[String[]]` Array of text and will ouput under the `NOTES:` area inside the body - <span style="color:green;">OPTIONAL</span>
5. **BugFixes** `[String[]]` Array of text and will ouput under the `BUG FIXES:` area inside the body - <span style="color:green;">OPTIONAL</span>
6. **FeatureNotes** `[String[]]` Array of text and will ouput under the `FEATURE NOTES:` area inside the body, - <span style="color:green;">OPTIONAL</span>
7. **FeatureAddtions** `[String[]]` Array of text and will ouput under the `FEATURE ADDTIONS:` area inside the body - <span style="color:green;">OPTIONAL</span>
8. **BreakingChanges** `[String[]]` Array of text and will ouput under the `BREAKING CHANGES:` area inside the body - <span style="color:green;">OPTIONAL</span>
9. **Footer** `[switch]` Display Footer if specified will output **GitUser** and **DateTime**  <span style="color:green;">OPTIONAL</span>
10. **GitUser** `[String]` Use with footer and the generated commit link when using `Format-FustionMD` *cmdlet* - <span style="color:green;">OPTIONAL</span>
11. **GitGroup** `[String]` Use to generated commit link when using the `Format-FustionMD` *cmdlet* - <span style="color:green;">OPTIONAL</span>

> #### For Example:

```powershell
New-ConventionalCommit -Type feat `
                       -Description "Added new feature" `
                       -Scope "add" `
                       -Body "Note 1","Note 2" `
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

<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>

----

## Format-FusionMD
The function currently takes `4` *optional* *parameters*, default **github** commit link is used if no parameters are specified.

##### 🥏 **Parameter List**

1. **Group** `[Switch]` The repository namespace either *GitUsername*, *org*, or *groupname* - <span style="color:green;">OPTIONAL</span>
2. **Gitlab** `[Switch]` Sets the Commit link to *Gitlab* e.g. 
```
https://gitlab.com/($user|$group)/$project/-/commit/$commitid
```
3. **Github** - `[Switch]` Sets the Commit link to *Github* e.g. 
```
https://github.com/($user|$group)/$project/-/commit/$commitid
```
4. **GitLabSelfHosted** - `[String]` Sets the Commit link to *GitlabSE* e.g. 
```
https://($SelfHostedUrl)/($user|$group)/$project/-/commit/$commitid
```


> #### For Example:

```powershell
New-ConventionalCommit @params | Format-FusionMD
```

> #### *Will Ouput*

```text
##  🎯-✨ feat(add): Added new feature

> [🆔]» [75fc3c7656](https://($giturl))/$($GitGroup)/$($reponame)/-/commit/$($commidid))

> [🧰]» <kbd>MINOR</kbd>

📜 NOTES:

✏  Note 1
✏  Note 2

|🌟 FEATURE ADDTIONS:  |
|-|

🍠 FeatureAddtions 1
🍠 FeatureAddtions 2 ..🖊


|🐛 BUGFIXES:   |
|-|

🦠 BugFixes 1  |
|-|
🦠 BugFixes 2 ..🖊 |
|-|


|🧪 FEATURE UPDATES:  |
|-|

🔨 FeatureNotes 1
🔨 FeatureNotes 2 ..🖊


|💢 BREAKING CHANGES:  |
|-|

🧨 BreakingChanges 1
🧨 BreakingChanges 2 ..🖊

*👤 @GitUser 📅 1:48AM, Saturday 5th August 2023*
```

<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>

---

## Update-ChangeLog
This function takes `1` **Parameter**:

1. `logfile`: (optional) Specifies the relative path to the changelog file. If not specified, it will look for `CHANGELOG.md` in the current directory. If the file is not found, it will create one. The function will attempt to pre-pend the output from `Format-FusionMD` to the file.

> #### For Example:

```powershell
New-ConventionalCommit @params | Format-FusionMD | Update-ChangeLog -logfile "CHANGELOG.md"
```
<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>

---

## Set-Commit
This function takes `0` **Parameters**, will simple run `git commit -m $commitmessage` and will use the output from `New-ConventionalCommit` as the commit message.

> Asummptions:
> - You are in a git repository
> - You have staged files

#### Get-GitAutoVersion
This function takes `0` **Parameters**, it will parse the git log see [**semver-version-generator**](/index#semver-version-generator) for more information on the logic of function.

> #### For Example:
git log with no `semver` tags in the git log

```powershell
Get-GitAutoVersion

# just property 
Get-GitAutoVersion | Select-Object -Property Version

# or just method 
(Get-GitAutoVersion).Version
```

> #### *Will Ouput*

```bash
Version Parsedlines
------- -----------
0.1.0   3
```
<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>

---

## Get-CiSet
This function simplifies the [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) JSON file as a PSObject, making it helpful if you wish to utilize custom types in your commit messages. The `$moduleroot/libs/Gitmojis.json` file serves as a reference, but you have the flexibility to customize it according to your preferences, as long as the schema remains consistent. Additionally, it's worth noting that the `type` and `cfa` additions are the same as those found in the `$moduleroot/libs/CommitFusion.json` file.


```powershell
Get-CiSet | Select-Object -First 10 | FT -Wrap
```

```bash
emoji entity    code        description                             name      semver
----- ------    ----        -----------                             ----      ------
🎨    &#x1f3a8; :art:       Improve structure / format of the code. art
⚡️    &#x26a1;  :zap:       Improve performance.                    zap       patch
🔥    &#x1f525; :fire:      Remove code or files.                   fire
🐛    &#x1f41b; :bug:       Fix a bug.                              bug       patch
🚑️   &#128657; :ambulance: Critical hotfix.                        ambulance patch
✨     &#x2728;  :sparkles:  Introduce new features.                 sparkles  minor
📝    &#x1f4dd; :memo:      Add or update documentation.            memo
🚀    &#x1f680; :rocket:    Deploy stuff.                           rocket
💄    &#ff99cc; :lipstick:  Add or update the UI and style files.   lipstick  patch
🎉    &#127881; :tada:      Begin a project.                        tada
```

<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>

---

## Get-CiSetFusion
Takes 4 optional **Parameters** and will return PSObject, it will parse and return the types from the `$moduleroot/libs/CommitFusion.json` file. The types can be further filtered by the following parameters:

1. `-NoSemver`: Filters types without semantic versioning.
2. `-Major`: Filters types of major version changes.
3. `-Minor`: Filters types of minor version changes.
4. `-Patch`: Filters types of patch version changes.

If no parameters are specified, it will return all the types.

If you would like to return the PSObject as this function renders the result using Spectre.Console via SimpleSpectreWrapper, you can use the `-NoRender` parameter to return the PSObject instead.

**Note!** You can modify the `$moduleroot/libs/CommitFusion.json` file to add your own types, using the GitMojis. See [New-ConventionalCommit](/cmdlets#new-conventionalcommit) **Types** for more information.

```powershell
Get-CiSetFusion -NoSemver -NoRender | Select-Object -First 10 | FT -Wrap
```

<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>

---

## Get-Emoji
Takes `2` **Parameters**:

1. `-Type`: Specify either **miscmojis** or **gitmojis** to select the desired type. 
2. `-Name` (optional): If specified, it will return the emoji with the specified name. If not specified, it will return all the emojis of the specified type.

---

## Get-EmojiIndex *Pending Removal* `Git-Emoji` Replaces
Takes `0` **Parameters**, it will parse the `$moduleroot/libs/Emoji.json` file and return a PSObject, which can be piped into `Format-Table` or `Out-GridView` for example, default is rendered using *Spectre.Console* via *SimpleSpectreWrapper*.

---

## New-CommitFusion
Takes `0` **Parameters** it will return a new instance of the commit fusion class.

> **Note!** if you want to use the `commitfusion_class.psm1` lib directly see `$moduleroot/libs/commitfusion_class.lib` for more information.

---

## Get-CommitFusionModuleInstance
This function takes `0` Parameters and will return the module instance initiated at module import. See `$moduleroot/libs/cmdlets/Get-CommitFusionModuleInstance.psm1`.

<a href="/cmdlets#-sections"><i class="fa-solid fa-circle-up"></i></a>