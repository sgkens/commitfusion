# <i class="fa-solid fa-code" style="color: #04376a;"></i> Examples

<div class="toc">
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
    <a href="#new-conventionalcommit-examples"> New-ConventionalCommit Examples</a>
  </li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
    <a href="#new-conventionalcommit"> Example - Minimal chore Commit Message</a>
  </li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
  <a href="#new-conventionalcommit"> Example 2 - Documentation type Commit Message</a>
  </li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
  <a href="#new-conventionalcommit"> Example 3 - BugFix type Commit Message</a>
  </li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
  <a href="#new-conventionalcommit"> Example 4 - Feature type Commit Message</a>
  </li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
  <a href="#new-conventionalcommit"> Example 5 - Feature, type Commit Message</a>
  </li>
  <li class="smtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> 
  <a href="#new-conventionalcommit"> Example 6 - changes, type Commit Message</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#format-fusionmd"> Format-FustionMD</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#update-changelog"> Update-ChangeLog</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#set-commit"> Set-Commit</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-GitAutoVersion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-CiSet </a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-CiSetFusion</a></li>
  <li class="mtoc"><i class="fa-solid fa-gears" style="color: #2c5caf;"></i> <a href="#"> Get-Emoji</a></li>
</div>


## Importing the module

```powershell
# Import the CommitFusion module if from PSGallary or chocolatey
Import-Module CommitFusion

# OTHER IMPORT METHODS

# Import the module from the cloned repository
Import-Module -Name .\CommitFusion.psd1

# or use the .psm1 file
Import-Module -Name .\CommitFusion.psm1

# Embed the module into your powershell profile
using module .\CommitFusion.psm1
```

## New-ConventionalCommit Examples

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> *chore* Commit Message **Minimum Parameters**

> Generate a *chore* commit message with the `2` *required* parameters `Type` and `Description`

```powershell
New-ConventionalCommit -Type chore -Description "Performing a chore"
```

#### Will Ouput

```text
🔧 chore(update):Documentation
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> *docs* `type` Commit Message
> Generate a *docs* type commit message add `notes` in the body. The `docs` type doesn't have a `semver` property value and is omitted

> **Note:** The `-Footer` switch is used to include the footer, use `-GitUser` to include the git user in the footer after `@`

```powershell
New-ConventionalCommit -Type docs -Description "Documentation" -Scope "add"  -Body "Note 1","Note 2"  -GitUser sgkens -Footer
```

#### Will Ouput

```text
📝 docs(add): Documentation

📜 NOTES:

✏  Note 1
✏  Note 2

👤 @sgkens 📅 10:25AM, Monday 31th July 2023
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> *BugFix* `type` Commit Message
> Generate a *bugfix* commit message with `scope`. the bugfix type `semver` property is `patch` and is automatically included.

```powershell
New-ConventionalCommit -Type fix -Description "Fixed Bug" -Scope "#234" -BugFixes "Fixed Bug #234"
```

#### Will Ouput

```text
🐛 fix(#234): Fixed Bug

🧰 Build: patch

🐛 BUGFIXES:

🦠 Fixed Bug #234 ..🖊
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> *Feat* `type` Commit Message 1
> Generate a *feat* commit message with `scope`, `notes`, `bugfixes`

```powershell
New-ConventionalCommit -Type feat -Description "Feature Addition" -scope "v0.1.0" -body "Note 1","Note 2"
```

#### Will Ouput

```text
✨ feature(v0.1.0): Feature Addition

🧰 Build: minor

📜 NOTES:

✏  Note 1
✏  Note 2
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> *Feat*, `type` Commit Message 2
> Generate a Changes ***Type*** Commit Message with `scope`, `notes`, `feature addition`, `gituser` and `footer`

```powershell
New-ConventionalCommit -Type feat -Description "Feature Additions" -scope "v0.1.0"  -body "Note 1","Note 2"  -FeatureAdditions "Feature Addition 1","Feature Addition 2" -GitUser sgkens -Footer
```

#### Will Ouput

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

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i>  *changes*, `type` Commit Message
> Generate a *changes* Commit message with type `changes` with `scope`, `notes`, `feature addition`, `Feature Updates`, `Bracking Changes`, `gituser` and `footer`, changes type is a `Major` and will have a semver value of `major`

```powershell
New-ConventionalCommit -Type feature -Description "My New Commit Message" -Scope "v0.1.0"  -Body "Note 1","Note 2"  -FeatureAdditions "Feature Addtion 1","Feature Addtion 2" -FeatureNotes "Feature Note 1","Feature Note 2" -BugFixes "bugFix #234", "fixes #23" -BreakingChanges "Breaking Change 1" -GitUser sgkens -Footer
```

#### Will Ouput

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

## Set-Commit Example

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i>  Example - Appling Commit Message
> To Apply Commit Message, you can **PIPE** `New-ConventionalCommit` into `Set-Commit` wich just run `git commit -m $message`, `New-ConventionalCommit` will return a `string` that can be piped into `Set-Commit`

```powershell
New-ConventionalCommit @params | Set-Commit
```

## Format-FusionMD Example

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i>  Example - Format-FusionMD - Format in Markdown
> Format in Markdown, you can **PIPE** `New-ConventionalCommit` into `Format-FusionMD`

```powershell
New-ConventionalCommit @params | Format-FusionMD
```

## Update-Changelog Example

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i>  Example - Update-Changelog - Adding Commit Message to changelog
> Adding Commit Message to changelog, you can **PIPE** `New-ConventionalCommit` into `Format-FusionMD` into `Update-ChangeLog -logfile $file` by default the file is `changelog.md` if you want to change the file name you can use the `-logfile` parameter. Message is pre-pended to the file

```powershell
New-ConventionalCommit @params | Format-FusionMD | Update-Changelog -logfile .\changelog.md
```


## Get-CISetFusion Example

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-CISetFusion - Retreiving the `CI-SET` List `Git Mojis` 
> Retreiving the *Types* from the `CommistFusion.json` file, you can use the `-NoSemVer`, `-Major`, `-Minor`, `-Patch` parameters to filter the list

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-CISetFusion `Types` with `semver` **None**
```powershell
Get-CISetFusion -NoSemVer # Returns Types that have no Semver value
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-CISetFusion `Types` with `semver` **Major**
```powershell
Get-CISetFusion -Major # Returns Types that have a Semver value of Major
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-CISetFusion `Types` with `semver` **Minor**
```powershell
Get-CISetFusion -Minor # Returns Types that have a Semver value of Minor
```
### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-CISetFusion `Types` with `semver` **patch**
```powershell
Get-CISetFusion -Patch # Returns Types that have a Semver value of Patch
```

## Git-Emoji Example

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-Emoji `🐛` from the `GitMojis.json` file.
```powershell
Get-Emoji -Type gitmojis -name bug
```

#### Will Ouput

```text
🐛
```

### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-Emoji `🧑` the `miscmojis.json` file.
```powershell
 Get-Emoji -Type miscmojis -name person
```

#### Will Ouput

```text
🧑
```


### <i class="fa-solid fa-terminal" style="color: #fcc43f;"></i> Get-Emoji
Get-Emoji from the `GitMojis.json` or `miscmojis.json` file.

```powershell
Get-Emoji -Type gitmojis -name bug
```

#### Will Ouput

```text
🐛
```


## Get-GitAutoVersion 
```powershell
Get-GitAutoVersion
```

#### Will Ouput EG:
```text
Version ParsedLines
------- -----------
0.1.4   105
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