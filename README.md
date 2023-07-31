<div align="center" >
 <!--Logo-->
    <img src="./ccommits-logo.svg"/>
</div>
 <!--Project Name-->
<div align="center">
    <img src="./CommitFusion-title.png"><br>
</div>
<div align="center" >
    <img src="./llline_v2-800x53.svg"> 
</div>

<div align="center">
  <!--Name+Version-->
  <a href="https://gitlab.snowlab.tk/snoonx">
    <img src="https://img.shields.io/badge/-Snoonx-lightblue??&stype=flat&logo=Personio&logoColor=blue">
  </a>
  <!--License-->
  <a href="https://gitlab.snowlab.tk/snoonx">
    <img src="https://img.shields.io/gitlab/license/43?gitlab_url=https%3a%2f%2fgitlab.snowlab.tk&logo=unlicense">
  </a>
  <!--Pipline-->
  <a href="https://gitlab.snowlab.tk/powershell/ccommits/-/commits/main">
    <img src="https://gitlab.snowlab.tk/powershell/ccommits/badges/main/pipeline.svg">
  </a>
  <!--Code Coverage-->
  <a href="https://gitlab.snowlab.tk/powershell/ccommits/-/commits/main">
    <img src="https://gitlab.snowlab.tk/powershell/ccommits/badgesmain/coverage.svg">
  </a>
  <!--Release-->
  <a href="https://gitlab.snowlab.tk/powershell/ccommits/-/releases">
    <img src="https://gitlab.snowlab.tk/powershell/ccommits/-/badges/release.svg">
  </a>
  
</div>



---
CommitFusion is a PowerShell module designed to streamline the process of handling conventional commits in Git for your Git repository. Commit fusion follows the [The Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/) standard.

# 🟩 Features

🏐 **Conventional Commits:** CommitFusion adheres to [🧷The Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/) , ensuring consistency and clarity in your commit messages.

🏐 **Customizable Commit Messages:** `New-ConventionalCommit` *cmdlet* takes several parameters generating a customizable commit message, the commit message is broken up into several main parts: Type, Scope, Description, **Body**(_notes,featurenotes,featureaddtions,bugfixes,breakingchanges_), and Footer

### 🥏 **Parameters** `New-ConventionalCommit`

> 🔸**Type** - Parameter values are imported from `$moduleroot/libs/CommitFustion.json` at module Import, addtionional types can be added to the `CommitFustion.json` if needed, follows [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) @ [🧷gitmoji.dev](https://gitmoji.dev) with addtional `type` and `cfa` added to the object array items - <span style="color:magenta;">**REQUIRED**</span> 

```json
[
  {
      "type": "feature",
      "emoji": "✨",
      "entity": "&#x2728;",
      "code": ":sparkles:",
      "description": "Introduce new features.",
      "name": "sparkles",
      "semver": "minor",
      "cfa": [
          {
              "action": ""
          }
      ]
  },
]
```
> 🔸**Scope** - The Scope of the commit, User Specified, placed between brackets after the `Type` - <span style="color:magenta;">*OPTIONAL*</span>
> 
> 🔸**Description** - The Commit Description, User Specified, placed after the `scope` - <span style="color:magenta;">**REQUIRED**</span> 
> 
> 🔸**Body** - Receives an array of text and will ouput under the `NOTES:` area inside the body - <span style="color:magenta;">*OPTIONAL*</span> 
> 
> 🔸**BugFixes**  - Receives an array of text and will ouput under the `BUG FIXES:` area inside the body - <span style="color:magenta;">*OPTIONAL*</span>
> 
> 🔸**FeatureNotes**- Receives an array of text and will ouput under the `FEATURE NOTES:` area inside the body, - <span style="color:magenta;">*OPTIONAL*</span>
> 
> 🔸**FeatureAddtions** - Receives an array of text and will ouput under the `FEATURE ADDTIONS:` area inside the body - <span style="color:magenta;">*OPTIONAL*</span>
> 
> 🔸**BreakingChanges**- Receives an array of text and will ouput under the `BREAKING CHANGES:` area inside the body - <span style="color:magenta;">*OPTIONAL*</span>
> 
> 🔸**Footer** <span style="color:magenta;"> Display Footer if specified - *OPTIONAL*</span>

### 🥏 Template Example

    ### Layout [e]=emoji
    ```
    [e] Type ( Scope ): Description

    [e] Build: Semver(Major|minor|patch)
    
    NOTES [e]:
    [e] Note
    [e] Note
    
    [e] BREAKING CHANGES
     [e] Change
     [e] Change ...[e]
    [e] FEATURE ADDTIONS
     [e] Addtion
     [e] Addtion ...[e]
    [e] FEATURE NOTES
     [e] Note
     [e] Note ...[e]
    [e] BUGFIXES
     [e] Fix
     [e] Fix ...[e]

    [e] GitUser @ [e] DateTime
    ```

🏐 **SemVer:** `semver` is added into the body if specified `type` has an `semver` property value

🏐 **Markdown Formatting:** CommitFusion parses commit messages and adds Markdown formatting to them. Usefull if you would like to add the commit message to the change log

```powershell
#Return commit message as string with MarkDown formatting
New-ConventionalCommit @params | Format_FustionMD
```
    
🏐 **Changelog Integration:** Commit messages are written to a template file and joined with the current contents of the `CHANGELOG.md` file. This allows for easy management and tracking of changes over time.

🏐 **Gitmoji Standard Schema:** Commits in CommitFusion utilize the Gitmoji standard schema, making it easy to visually identify the purpose of each commit.

🏐 **Version Incrementation:** The module parses Gitmoji's JSON file to determine the appropriate version increment for your build (minor, major, or 0.0.0). This version information can be used with GitLab CI/CD to automate release and build processes based on your Git history.

🏐 **Advanced Commit Manipulation:** CommitFusion provides additional manipulation options for the commit body. This includes multi-line listing and styling within the commit message, which can differ from the markdown written to the `template.md` file.

## 🥏 Additional Module Functionality

- **Gitmoji List Retrieval:** CommitFusion allows you to retrieve a list of Gitmoji from the JSON file, returning a PSObject that can be further manipulated as needed.

- **Unicode Emoji List:** The module also offers a feature to retrieve a list of Unicode emojis based on a custom Unicode list. This list is compiled from an external website and contains almost all Unicode emojis, excluding those that don't render correctly.

# 🟨 Installation
### 💾 Clone source

🎫 Clone the repository from GitHub \
🎫 Open a PowerShell(pwsh) session and navigate to the cloned repository directory. \
🎫 Run the installation via the command below: 

```powershell
# Import the module
git clone https://github/sgkens/commitfusion.git
cd commitfusion
Import-Module -Name commitfusion
```

### 💼 Release

### 📦 Package Repository
[<img src="https://img.shields.io/badge/PSGallary-v0.1.0-yellow?style=for-the-badge&logo=Powershell&labelColor=blue&color=gray"/>](https://psgallary.com/sgkens/commitfusion)

```Powershell
# Install The Module from the PsGal
Install-Module -Name commitfusion -MinimumVersion 0.1.0

# Import Module into you powershell session
Import-Module -Name commitfusion

# Note! You May Need to change your `ExecutionPolicy`
# Set-ExecutionPolicy
```
[<img src="https://img.shields.io/badge/Choco-v0.1.0-yellow?style=for-the-badge&logo=Chocolatey&labelColor=darkmagenta&color=gray"/>](https://Chocolatory.org/sgkens/commitfusion)

```Powershell
# Install The Module from the PsGal
choco install commitfusion --version 0.1.0

# Import Module into you powershell session
Import-Module -Name commitfusion
```

> Installing Chocolate Package Repositoy
[How to Install Choloc](https) `choco.com/packages`

# 🟪 Using  CommitFusion's cmdlets/functions

🟣 Import the CommitFusion module
```powershell
Import-Module CommitFusion
```

🟣 Generate a basic Commit Message
```powershell
New-ConventionalCommit -Type feature -Description "My New Commit Message"

# output
✨ feature(): My commit message

🧰 Build: minor

👤 @ 📅 12:16AM, Monday 31th July 2023
```

🟣 Generate a docs Commit Message with `username` and `notes` in  the body `docs` type doesnt have a `semver` property value and is ommited
```Powershell
New-ConventionalCommit -Type docs -Description "My New Commit Message" -Scope "add"  -Body "Note 1","Note 2"  -GitUser sgkens

# Ouput
📝 docs(add): My New Commit Message

📜 NOTES:

✏  Note 1
✏  Note 2

👤 @sgkens 📅 10:25AM, Monday 31th July 2023
```


🟣 Generate a `bugfix` Commit Message with `scope` and some `notes` 
```powershell
New-ConventionalCommit -Type fix -Description "Fixed Bug" -Scope "#234" -BugFixes "Fixed Bug #234"

# output
🐛 fix(`#234): Fixed Bug

🧰 Build: patch

🐛 BUGFIXES:

🦠 Fixed Bug #234 ..🖊

👤 @ 📅 10:44AM, Monday 31th July 2023
```

🟣 Generate a Commit Message with `scope`, `notes`, and a `feature addtion` 
```powershell
New-ConventionalCommit -Type feature -Description "My New Commit Message" -Scope "v0.1.0"  -Body "Note 1","Note 2  -FeatureAddtions "Feature Addtion 1","Feature Addtion 2"

# output
✨ feature(v0.1.0): My New Commit Message

🧰 Build: minor

📜 NOTES:

✏  Note 1
✏  Note 2

🌟 FEATURE ADDTIONS:

🍠 Feature Addtion 1
🍠 Feature Addtion 2 ..🖊


👤 @ 📅 12:16AM, Monday 31th July 2023
```

🟣 Generate a Commit Message with `scope`, `notes`, `feature addtions`, `Feature Notes`, `Breaking Changes`,`Bug Fix` 
```powershell
New-ConventionalCommit -Type feature -Description "My New Commit Message" -Scope "v0.1.0"  -Body "Note 1","Note 2"  -FeatureAddtions "Feature Addtion 1","Feature Addtion 2" -FeatureNotes "Feature Note 1","Feature Note 2" -BugFixes "bugFix #234", "fixes #23" -BreakingChanges "Breaking Change 1"

#Output
✨ feature(v0.1.0): My New Commit Message

🧰 Build: minor

📜 NOTES:

✏  Note 1
✏  Note 2

🌟 FEATURE ADDTIONS:

🍠 Feature Addtion 1
🍠 Feature Addtion 2 ..🖊


🐛 BUGFIXES:

🦠 bugFix #234
🦠 fixes #23 ..🖊


🧪 FEATURE UPDATES:

🔨 Feature Note 1
🔨 Feature Note 2 ..🖊


💢 BREAKING CHANGES:

🧨 Breaking Change 1 ..🖊

👤 @ 📅 10:44AM, Monday 31th July 2023

```
🟣 Apply Commit Message, you can **PIPE** `New-ConventionalCommit` into `Set-Commit` wich just run `git commit -m $message`

```Powershell
New-ConventionalCommit @params | Set-Commit
```

🟣 Format in Markdown, you can **PIPE** `New-ConventionalCommit` into `Format-FusionMD`
```Powershell
New-ConventionalCommit @params | Format-FusionMD
```

🟣 Adding Commit Message to changelog, you can **PIPE** `New-ConventionalCommit` into `Format-FusionMD` into `Update-ChangeLog -logfile $file`
```Powershell
New-ConventionalCommit @params | Format-FusionMD | Update-Changelog -logfile .\changelog.md
```
🟣 Using all **PIPES**
```Powershell
New-ConventionalCommit @params | Format-FusionMD | Update-Changelog -logfile .\changelog.md | Set-Commite
```

🟡 Retreiving the CI-SET List `Git Mojis`

```Powershell
Get-CISetFusion -NoSemVer # Returns Types that have no Semver value
Get-CISetFusion -Major # Returns Types that have a Semver value of Major
Get-CISetFusion -Minor # Returns Types that have a Semver value of Minor
Get-CISetFusion -Patch # Returns Types that have a Semver value of Patch
```

🟡 Retreiving the CI-SET FUSION List `Git Mojis`
  
```Powershell
Get-CISet # Returns PSObject of all Git Mojis
```

### Parameter List `New-ConventionalCommit`
```powershell
Write-LTMessage
  [[alias -T]-Type [String]]
  [[alias -S]-Scope [String]]
  [[alias -T]-Description [String]]
  [[alias -uc]-Body [String]"#code"]
  [[alias -sm ]-FeatureNotes [String]]
  [[alias -ndt]-NoDatTime [Switch]]
  [[alias -nli]-NoLogIcon [Switch]]
```

For more information on the available functions and their parameters, please refer to the module documentation.

## 📑 License
CommitFusion is released under the MIT License. See LICENSE for more details. [MIT License]()