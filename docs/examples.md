# Examples
There a number of methods to import or use this module. The most common is to import the module from the PowerShell Gallery or Chocolatey. The other methods are cloning the repository or embedding the module into your PowerShell profile.


## Sections
<div class="toc">
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> New-ConventionalCommit Examples</a></li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> Example 1 - Minimal Commit Message</a></li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> Example 2 - Documentation type Commit Message</a></li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> Example 3 - BugFix type Commit Message</a></li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> Example 4 - Feature type Commit Message</a></li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> Example 5 - Feature, type Commit Message</a></li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#new-conventionalcommit"> Example 6 - changes, type Commit Message</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#format-fusionmd"> Format-FustionMD</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#update-changelog"> Update-ChangeLog</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#set-commit"> Set-Commit</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-GitAutoVersion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-CiSet </a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-CiSetFusion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-Emoji</a></li>
</div>


## <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Importing the module

```powershell
# Import the CommitFusion module if from psgallary or choco
Import-Module CommitFusion

# OTHER IMPORT METHODS

# Import the module from the cloned repository
Import-Module -Name .\CommitFusion.psd1

# or use the .psm1 file
Import-Module -Name .\CommitFusion.psm1

# Embed the module into your powershell profile
using module CommitFusion.psm1
```

## New-ConventionalCommit Examples

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - *Minimal* Commit Message

> Generate a basic commit message with `2` *required* parameters `Type` and `Description`

```powershell
New-ConventionalCommit -Type feature -Description "My New Commit Message"
```

> #### *Will Ouput*

```text
✨ feature: My commit message

🧰 Build: minor

👤 @ 📅 12:16AM, Monday 31th July 2023
```

__ <i class="fa-solid fa-pen" style="color: #326dd2;"></i>

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - *Documentation* `type` Commit Message
> Generate a `docs` type commit message with the `Git User` and `notes` in  the body `docs` type doesn't have a `semver` property value and is omitted

```powershell
New-ConventionalCommit -Type docs -Description "Documentation" -Scope "add"  -Body "Note 1","Note 2"  -GitUser sgkens -Footer
```

> #### *Will Ouput*

```text
📝 docs(add): Documentation

📜 NOTES:

✏  Note 1
✏  Note 2

👤 @sgkens 📅 10:25AM, Monday 31th July 2023
```

__ <i class="fa-solid fa-pen" style="color: #326dd2;"></i>

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - *BugFix* `type` Commit Message
> Generate a *bug fix* commit message with *scope*. the bugfix type `semver` property is `patch` and is automatically included, include Git User

```powershell
New-ConventionalCommit -Type fix -Description "Fixed Bug" -Scope "#234" -BugFixes "Fixed Bug #234" -GitUser sgkens
```

##### Will Ouput

```text
🐛 fix(#234): Fixed Bug

🧰 Build: patch

🐛 BUGFIXES:

🦠 Fixed Bug #234 ..🖊

👤 @sgkens 📅 10:44AM, Monday 31th July 2023
```

__ <i class="fa-solid fa-pen" style="color: #326dd2;"></i>

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - *Feature* `type` Commit Message
> Generate a `feature` commit message with `scope`, `notes`, gituser with no footer and feature additions

```powershell
New-ConventionalCommit -Type feature -Description "Feature Addition" -scope "v0.1.0" -body "Note 1","Note 2"
```

> #### *Will Ouput*

```text
✨ feature(v0.1.0): Feature Addition

🧰 Build: minor

📜 NOTES:

✏  Note 1
✏  Note 2
```

__ <i class="fa-solid fa-pen" style="color: #326dd2;"></i>

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example 2 - *Feature*, `type` Commit Message
> Generate a Changes ***Type*** Commit Message with `scope`, `notes`, `feature addition`, `gituser` and `footer`

```powershell
New-ConventionalCommit -Type feature -Description "Feature Additions" -scope "v0.1.0"  -body "Note 1","Note 2"  -FeatureAdditions "Feature Addition 1","Feature Addition 2" -GitUser sgklens -Footer
```

> #### *Will Ouput*

```text
✨ feature(v0.1.0): Feature Additions

🧰 Build: minor

📜 NOTES:

✏  Note 1
✏  Note 2

🌟 FEATURE ADDTIONS:

🍠 Feature Addtion 1
🍠 Feature Addtion 2 ..🖊


👤 @sgklens 📅 12:16AM, Monday 31th July 2023
```

__ <i class="fa-solid fa-pen" style="color: #326dd2;"></i>

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example 2 - *changes*, `type` Commit Message
> Generate a Commit message with type `changes` with `scope`, `notes`, `feature addition`, `Feature Updates`, `Bracking Changes`, `gituser` and `footer`, changes type is a `Major` and will have a semver value of `major`

```powershell
New-ConventionalCommit -Type feature -Description "My New Commit Message" -Scope "v0.1.0"  -Body "Note 1","Note 2"  -FeatureAdditions "Feature Addtion 1","Feature Addtion 2" -FeatureNotes "Feature Note 1","Feature Note 2" -BugFixes "bugFix #234", "fixes #23" -BreakingChanges "Breaking Change 1" -GitUser sgkens -Footer
```

> #### *Will Ouput*

```text
✨ feature(v0.1.0): My New Commit Message

🧰 Build: major

📜 NOTES:

✏  Note 1
✏  Note 2

🌟 FEATURE ADDITIONS:

🍠 Feature Addition 1
🍠 Feature Addition 2 ..🖊


🐛 BUGFIXES:

🦠 bugFix #234
🦠 fixes #23 ..🖊


🧪 FEATURE UPDATES:

🔨 Feature Note 1
🔨 Feature Note 2 ..🖊


💢 BREAKING CHANGES:

🧨 Breaking Change 1 ..🖊

👤 @sgkens 📅 10:44AM, Monday 31th July 2023

```

#### Set-Commit

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Set-Commit - Apply Commit Message
> Apply Commit Message, you can **PIPE** `New-ConventionalCommit` into `Set-Commit` wich just run `git commit -m $message`, `New-ConventionalCommit` will return a `string` that can be piped into `Set-Commit`

```powershell
New-ConventionalCommit @params | Set-Commit
```

## Format-FusionMD

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Format-FusionMD - Format in Markdown
> Format in Markdown, you can **PIPE** `New-ConventionalCommit` into `Format-FusionMD`

```powershell
New-ConventionalCommit @params | Format-FusionMD
```

## Update-Changelog

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Update-Changelog - Adding Commit Message to changelog
> Adding Commit Message to changelog, you can **PIPE** `New-ConventionalCommit` into `Format-FusionMD` into `Update-ChangeLog -logfile $file` by default the file is `changelog.md` if you want to change the file name you can use the `-logfile` parameter. Message is pre-pended to the file

```powershell
New-ConventionalCommit @params | Format-FusionMD | Update-Changelog -logfile .\changelog.md
```


## Get-CISetFusion

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-CISetFusion - Retreiving the `CI-SET` List `Git Mojis` 
> Retreiving the *Types* from the `CommistFusion.json` file, you can use the `-NoSemVer`, `-Major`, `-Minor`, `-Patch` parameters to filter the list

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-CISetFusion `Types` with `semver` **None**
```powershell
Get-CISetFusion -NoSemVer # Returns Types that have no Semver value
```

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-CISetFusion `Types` with `semver` **Major**
```powershell
Get-CISetFusion -Major # Returns Types that have a Semver value of Major
```

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-CISetFusion `Types` with `semver` **Minor**
```powershell
Get-CISetFusion -Minor # Returns Types that have a Semver value of Minor
```

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-CISetFusion `Types` with `semver` **patch**
```powershell
Get-CISetFusion -Patch # Returns Types that have a Semver value of Patch
```

## Git-Emoji

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-Emoji `🐛` from the `GitMojis.json` file.
```powershell
Get-Emoji -Type gitmojis -name bug
```

> #### *Will Ouput*

```text
🐛
```

##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-Emoji `🧑` the `miscmojis.json` file.
```powershell
 Get-Emoji -Type miscmojis -name person
```

> #### *Will Ouput*

```text
🧑
```


##### <i class="fa-solid fa-layer-group" style="color: #d3660d;"></i> Example - Get-Emoji from the `GitMojis.json` file with

## Get-GitAutoVersion 

```powershell
Get-GitAutoVersion
```

## Using all *cmdlets* with **PIPES**

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
                       -Footer | Format-FusionMD | Update-Changelog -logfile .\changelog.md | Set-Commit
```