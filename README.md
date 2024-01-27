# <img width="25" src="https://raw.githubusercontent.com/sgkens/resources/main/modules/CommitFusion/dist/v2/commitfusion-logo-x128.png"/> **CommitFusion** *Powerhell Module*

<!--license-->
<a href="https://github.com/sgkens/commitfusion/">
  <img src="https://img.shields.io/badge/MIT-License-blue?style=&logo=unlicense&color=%23004481"></a>
<!--coverage-->
<a href="https://coveralls.io/github/sgkens/commitfusion">
  <img src="https://img.shields.io/coverallsCoverage/github/sgkens/commitfusion?branch=main"></a>
<!--Code Factor-->
<a href="https://www.codefactor.io/repository/github/sgkens/commitfusion/">
  <img src="https://www.codefactor.io/repository/github/sgkens/commitfusion/badge"></a>

***CommitFusion*** is a **PowerShell** module designed to streamline the process of generating *Conventional Commits Messages* in `git`. Commit messages are constructed using the 🧷[Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) standard, and uses 🧷[gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) see 🧷[gitmoji.dev](https://gitmoji.dev), The module allows the construction of a custimized commit message with a number of options.

[toc]

## 🟪 Documentaiton

#### 🌐[https://sgkens.github.io/commitfusion](https://sgkens.github.io/commitfusion/)

<!--Pipline-->
<a href="https://gitlab.lab.davilion.online/powershelvl/commitfusion/-/pipelines">
  <img src="https://gitlab.lab.davilion.online/powershell/commitfusion/badges/main/pipeline.svg
"></a>
<!--Release-->
<a href="https://gitlab.lab.davilion.online/powershell/ccommits/-/releases">
  <img src="https://gitlab.lab.davilion.online/powershell/commitfusion/-/badges/release.svg"></a>

## 🟩 Module Features

  - Conventional Commits Standard
  - Customizable Commit Message with a number of options:
      - Types (***CommitType***) eg:`feat: `
      - Scope (***Scope in brackets***) eg: `✨feat(scope): `
      - Descrption (***Default|Custom***).
      - Build (***Based on CommitType***) eg: `🧰 Build: patch` 
          - Git messages can be parsed with `Get-GitAutoVersion` to generate *Samantic Version Number*(**semver**)
      - Notes (***Array of strings***)
      - Feature Additions (***Array of strings***)
      - Feature Notes (***Array of strings***)
      - BugFixes (***Array of strings***)
      - GitUser (***GitUser Account Name***)
      - GitGroup (***if your repository sites in `/group/repo.git`***)
      - Footer (**Custom footer**)
  - Semver Versioning Generator
  - Changelog Auto-update with Markdown Auto-format
  - Gitmoji Custom Schema (misc)

🔻**Conventional Commit Template**🔻
<pre>
  [e] Type(Scope): Description

  [e] Build: Semver(Major|Minor|Patch)

  NOTES [e]:
    [e] Note 1
    [e] Note 2
    [e] ...

  [e] BREAKING CHANGES
    [e] Change 1
    [e] Change 2 ...[e]

  [e] FEATURE ADDTIONS
    [e] Addtion 1
    [e] Addtion 2...[e]

  [e] FEATURE NOTES
    [e] Feature Note 1
    [e] Feature Note 2...[e]

  [e] BUG FIXES
    [e] Fix 1
    [e] Fix 2...[e]

  [e] GitUser @ [e] DateTime
</pre>

## 🟦 Cmdlets
|Command |--|
|-|-|
|🔸 **`New-Commit`** | The primary `cmdlet` to interact with this module |
|🔸 **`New-CommitFusion`** | Returns an instance of CommitFusion |
|🔸 **`Get-Emoji`** | The primary `cmdlet` to interact with this module |
|🔸 **`Get-EmojiInex`** | The primary `cmdlet` to interact with this module |
|🔸 **`Get-CiSet`** | The primary `cmdlet` to interact with this module |
|🔸`Get-CiSetFustion`| The primary `cmdlet` to interact with this module |
|🔸`New-Commit`| The primary `cmdlet` to interact with this module |



## 🟦 Using Commit Fusion.'''''

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

# All params [string]
New-Commit -[Type [String]]
           -[Scope [String]]
           -[Description [String]]
           -[Notes [String[]]] `
           -[FeatureAddtions [String[]]]
           -[FeatureNotes [String[]]]
           -[BugFixes [String[]]]
           -[GitUser [String]]
           -[GitGroup [String]]
           -[Footer[Switch|Bool]]
           -[AsString [Switch|Bool]] # Default
           -[AsObject [Switch|Bool]]
```

🔹 Assuming you have staged files, you can use the following to commit the changes:

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


## 🟦 Changing default Commit Types
> If you would like to change the default `types`, `description`, and `emotocons`:
> Types `.json` file are found at `$moduleroot/libs/commitfusion.types.json`\
> 

🔸**Example** : 

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

### Todo's
  - [ ] 💠 Add support for importing custom commits types from a specified json file.
  - [ ] 💠 Implement `SimpleSpectreWrapper` to parse and format psobject to spectre table.
  - [ ] 💠 Add support for **no-emojis**. only `ascii`.