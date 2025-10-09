<div align="center">
  <img width="128" src="https://raw.githubusercontent.com/phellams/phellams-general-resources/main/logos/commitfusion/dist/png/commitfusion-logo-128x128.png" alt="Phellams Logo" /> 
  <h1><strong>Commitfusion</strong></h1>
</div>

<a href="https://gitlab.com/phellams/commitfusion/-/blob/main/readme.md"><img src="https://img.shields.io/badge/License-_mit-License?style=flat-square&labelColor=%23383838&color=%237A5ACF23CD5C5C" alt="MIT License" /></a> <a href="https://gitlab.com/phellams/commitfusion/-/pipelines"><img src="https://img.shields.io/gitlab/pipeline-status/phellams%2Fcommitfusion?style=flat-square&logo=Gitlab&logoColor=%233478BD&labelColor=%232D2D34" alt="Build Status"></a> <a href="https://codecov.io/gh/phellams/commitfusion"><img src="https://img.shields.io/codecov/c/gitlab/phellams/commitfusion?style=flat-square&logo=codecov&logoColor=%23E6746B&logoSize=auto&labelColor=%234A7A82" alt="Build Status"></a> <a href="https://gitlab.com/phellams/commitfusion/-/issues"><img src="https://img.shields.io/gitlab/issues/open/phellams%2Fcommitfusion?style=flat-square&logo=gitlab&logoColor=red&labelColor=%23ffffff&color=%236B8D29" alt="gitlab issues"></a> <a href="https://www.codefactor.io/repository/github/phellams/commitfusion"><img src="https://img.shields.io/codefactor/grade/github/phellams/commitfusion?style=flat&logo=codefactor&label=codefactor&logoColor=white&color=%236B8D29" alt="codefactor"></a><!--coverage-->


CommitFusion helps you create standardized commit messages that follow the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/). The module enhances the standard by including additional sections:



|📓 Documentaiton|[https://sgkens.github.io/commitfusion](https://sgkens.github.io/commitfusion/)|
|-|-|


# Module Features

  - Conventional Commits Standard
  - Customizable Commit Messages with a variaty of options:
      - » `Type` (***CommitType***) eg:`feat: `
      - » `Scope` (***Scope in brackets***) eg: `✨feat(scope): `
      - » `Descrption` (***Default|Custom***).
      - » `Notes` (***Array of strings***)
      - » `FeatureAdditions` (***Array of strings***)
      - » `FeatureNotes` (***Array of strings***)
      - » `BugFixes` (***Array of strings***)
      - » `GitUser` (***GitUser Account Name***)
      - » `GitGroup` (***if your repository sits in `/group/repo.git`***)
      - » `Footer` (**Custom footer**)
      - » `SemVer` (**Semantic Version Switch**)
  - Semantic Versioning(**Semver**) Version Generator
  - Changelog Auto updater with Markdown Auto-format
  - Gitmoji custom schema (miscellaneous functions cmdlets)
  - Unicode Emoticons (miscellaneous cmdlets)
  - Enable/Disable Emoticons using `Enable-CommitFusionEmoji` and `Disable-CommitFusionEmoji`
  - Generate Release Notes with `Get-ReleaseNotes`.

🔻**Conventional Commit Template**🔻

<pre>
  [e] Type(Scope): Description

  [e] Build: Semver(Major|Minor|Patch)

  NOTES [e]:
    [e] Note 1
    [e] Note 2

  [e] BREAKING CHANGES
    [e] Change 1
    [e] Change 2 

  [e] FEATURE ADDTIONS
    [e] Addtion 1
    [e] Addtion 2...[e]

  [e] FEATURE NOTES
    [e] Feature Note 1
    [e] Feature Note 2

  [e] BUG FIXES
    [e] Fix 1
    [e] Fix 2
    
  [e] GitUser @ [e] DateTime
</pre>


## Installation

Phellams modules are available from [**PowerShell Gallery**](https://www.powershellgallery.com/packages/commitfusion) and [**Chocolatey**](https://chocolatey.org/packages/commitfusion). you can access the raw assets via [**Gitlab Generic Assets**](https://gitlab.com/phellams/commitfusion/-/packages?orderBy=name&sort=desc&search[]=commitfusion) or nuget repository via [**Gitlab Packages**](https://gitlab.com/phellams/commitfusion/-/packages/?orderBy=name&sort=desc&search[]=commitfusion&type=NuGet).

|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|
|-|-|-|
| 📦 PSGallery  | <a href="https://www.powershellgallery.com/packages/commitfusion"> <img src="https://img.shields.io/powershellgallery/v/commitfusion?label=version&style=flat-square&logoColor=blue&labelColor=23CD5C5C&color=%231E3D59" alt="powershellgallery"></a>       | <img src="https://img.shields.io/powershellgallery/dt/commitfusion?style=flat-square&logoColor=blue&label=downloads&labelColor=23CD5C5C&color=%231E3D59" alt="powershellgallery-downloads">       |
| 📦 Chocolatey | <a href="https://community.chocolatey.org/packages/commitfusion/"><img src="https://img.shields.io/chocolatey/v/commitfusion?label=version&include_prereleases&style=flat-square&logoColor=blue&labelColor=23CD5C5C&color=%231E3D59" alt="chocolatey"/></a> | <img src="https://img.shields.io/chocolatey/dt/commitfusion?style=flat-square&logoColor=blue&label=downloads&include_prereleases&labelColor=23CD5C5C&color=%231E3D59" alt="chocolatey-downloads"> |

### Additinonal Installation Options:
 
|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|
|-|-|-|
| 💼 Releases/Tags | <a href="https://gitlab.com/phellams/commitfusion/-/releases"> <img src="https://img.shields.io/gitlab/v/release/phellams%2Fcommitfusion?include_prereleases&style=flat-square&logoColor=%2300B2A9&labelColor=%23CD5C5C&color=%231E3D59" alt="gitlab-release"></a> | <a href="https://gitlab.com/phellams/commitfusion/-/tags"> <img src="https://img.shields.io/gitlab/v/tag/phellams%2Fcommitfusion?include_prereleases&style=flat-square&logoColor=%&labelColor=%23CD5C5C&color=%231E3D59" alt="gitlab tags"></a> |

#### 📦 GitLab Packages

Using `nuget`: See the [**packages**](https://gitlab.com/phellams/commitfusion/-/packages?orderBy=name&sort=asc&search[]=commitfusion&type=NuGet) page for installation instructions.

> For instructions on adding `nuget` **sources** packages from *GitLab* see [**Releases**](https://github.com/sgkens/commitfusion/releases) artifacts or via the [**Packages**](https://gitlab.com/phellams/commitfusion/-/packages?orderBy=name&sort=asc&search[]=commitfusion&type=NuGet) page.

#### 🧺 Generic Asset

The latest release artifacts can be downloaded from the [**Generic Assets Artifacts**](https://gitlab.com/phellams/commitfusion/-/packages?orderBy=type&sort=desc&type=Generic) page.

#### 💾 Git Clone

```bash
# Clone the repository
git clone https://gitlab.com/phellams/commitfusion.git
cd commitfusion
import-module .\
```

## 🟪 Cmdlets
|Command |--|
|-|-|
|🔹 **`New-Commit`** | Build Commit string base on inputs and return *type* `[string]` |
|🔹 **`Set-Commit`** | Applies the commit messages `git commit $fusionmessage`|
|🔹 **`New-CommitFusion`** | Returns an instance of `[CommitFusion]` class |
|🔹 **`Get-Emoji`** | Get Emojis **filter** by `name` and `type` |
|🔹 **`Get-EmojiInex`** | Return Emoji index as a`[psobject]` or `table format` |
|🔹 **`Get-CiSet`** | Return CiSet from `$moduleroot\libs\gitmojis.json` |
|🔹 **`Get-CiSetFustion`** | Return CiSetFusion from `$moduleroot\libs\CommitFustion.types.json` |
|🔹 **`Format-FusionMD`** | Parses the commit string and adds markdown formatting |
|🔹 **`Update-ChangeLog`** | Writes commit message to specified file |
|🔹 **`Get-GitAutoversion`** | Generates `semver` version return as `[psobject]` |
|🔹 **`Get-CommitTypes`** | Returns Commit Types -Type (Gitmojis|miscmojis) |
|🔹 **`Get-ReleaseNotes`** | Generates Release Notes Base on branch and catagory type |
|🔹 **`Disable-CommitFusionEmojis`** | Sets EmojisEnabled calls var to false |
|🔹 **`Enable-CommitFusionEmojis`** | Sets EmojisEnabled calls var to true |



## 🟪 Using Commit Fusion.

🔹 Retrive list of available commit types.

```powershell
Get-CommitTypes -Patch
Get-CommitTypes -Minor
Get-CommitTypes -Major
Get-CommitTypes -NoSemver
```

🔹 Creating a new `feat` commit.

```powershell
# Create New Commit minimal params
New-Commit -Type Docs 

# Create Commit with Custom Description
New-Commit -Type Docs -Description "Updated module logic"

# Create Commit with Custom Description and Notes
New-Commit -Type Docs -Description "Updated module logic" -Notes "Updated module logic", "updated readme"
```

### **New-Commit** All Params

```Powershell
New-Commit -[t|Type]          <String>
           -[s|Scope]         <String> 
           -[d|Description]   <String> 
           -[n|Notes]         <String[]> 
           -[FeatureAddtions] <String[]> 
           -[FeatureNotes]    <String[]> 
           -[b|BugFixes]      <String[]> 
           -[GitUser]         <String> 
           -[GitGroup]        <String> 
           -[Footer]          <Switch> 
           -[AsString]        <Switch>  # Default
           -[AsObject]        <Switch> 
```

🔹 Assuming you have staged files, Use `Set-Commit -Confirm` to Apply the commit message.

```powershell
# Apply Commit
New-Commit -Type feat -Notes "note 1","note 2" | Set-Commit -Confirm
# Apply Commit format commit message to markdown and write to changelog file 
New-Commit -Type feat -Notes "note 1","note 2" | Format-FusionMD | Update-Changelog -logfile path\to\file | Set-Commit -Confirm
```

🔹 Generate *Semantic Version Number* (**Semver**) version base on you commit history

```powershell
# generate SemVer Version returns psobject
Get-GitAutoVersion | select version
# only string
(Get-GitAutoVersion).Version
# in string
$version = "v_$((Get-GitAutoVersion).Version)"
```


## 🟪 Changing default Commit Types
> If you would like to change the default `types`, `description`, and `emotocons`:
> Types `.json` file are found at `$moduleroot/libs/commitfusion.types.json`\
> 

🔹**Example** : 

```json
{
    "templateName": "default",
    "templateDescription": "commitfusion-ciset",
    "templateVersion": "1.0.0",
    "ciset": [
        {
            "Type": "changes",
            "emoji": "💥",
            "description": "Introduce breaking changes.",
            "name": "boom",
            "semver": "major",
            "cfa": [
                {
                    "action": ""
                }
            ]
        },
        ...
    ]
}     
```

<!-- ROADMAP -->
## Roadmap

🟡 **Task List**

- [ ] 💠 Add support for importing custom commits types from a specified json file.
- [ ] 💠 Implement `SimpleSpectreWrapper` to parse and format psobject to spectre table.
- [x] 💠 Add support for **no-emojis**. only `ascii`.

## Contributing

Feel free to contribute!  Fork the repo and submit a **merge request** with your improvements.  Or, open an **issue** with the `enhancement` tag to discuss your ideas.

1. Fork the Project from `git clone https://gitlab.com/phellams/commitfusion.git`
2. Create your Feature Branch check out the branch dev `git switch dev`.
   1. `git switch -c feature/AmazingFeature`
   2. or 
   3. `git checkout -b feature/AmazingFeature`
3. Commit your Changes `git commit -m 'Add some AmazingFeature'`
4. Push to the Branch `git push origin feature/AmazingFeature`
5. [Open a Merge Request](https://gitlab.com/phellams/commitfusion/-/merge_requests/new)

## LICENSE

This project is licensed under the terms of the [MIT License](https://github.com/sgkens/commitfusion/blob/main/LICENSE)