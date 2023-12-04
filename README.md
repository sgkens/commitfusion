# <img width="25" src="https://raw.githubusercontent.com/sgkens/resources/main/modules/CommitFusion/dist/v2/commitfusion-icon-x128.png"/> **CommitFusion**

<!--license-->
<a href="https://github.com/sgkens/commitfusion/">
  <img src="https://img.shields.io/badge/MIT-License-blue?style=&logo=unlicense&color=%23004481"></a>
<!--coverage-->
<a href="https://coveralls.io/github/sgkens/commitfusion">
  <img src="https://img.shields.io/coverallsCoverage/github/sgkens/commitfusion?branch=main"></a>
<!--Code Factor-->
<a href="https://www.codefactor.io/repository/github/sgkens/commitfusion/">
  <img src="https://www.codefactor.io/repository/github/sgkens/commitfusion/badge"></a>
<!--Choco-->
<a href="https://community.chocolatey.org/packages/davilion.commitfusion">
  <img src="https://img.shields.io/chocolatey/dt/davilion.commitfusion?label=Choco"></a>
<!--[psgallary]-->
<a href="https://www.powershellgallery.com/packages/commitfusion">
  <img src="https://img.shields.io/powershellgallery/dt/commitfusion?label=psgallary"></a>

***CommitFusion*** is a **PowerShell** module designed to streamline the process of generating *Conventional Commits Messages* in `git`. Commit messages are constructed using the 🧷[Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) standard, and uses 🧷[gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) see 🧷[gitmoji.dev](https://gitmoji.dev), The module allows the construction of a custimized commit message with a number of options.

## 📒 Documentaiton

#### 🔗[https://sgkens.github.io/commitfusion](https://sgkens.github.io/commitfusion/)

<!--Pipline-->
<a href="https://gitlab.lab.davilion.online/powershell/commitfusion/-/pipelines">
  <img src="https://img.shields.io/gitlab/pipeline-status/powershell%2Fcommitfusion?gitlab_url=https%3A%2F%2Fgitlab.lab.davilion.online%2F&branch=main&logo=gitlab&label=pipeline
"></a>
<!--Release-->
<a href="https://gitlab.lab.davilion.online/powershell/ccommits/-/releases">
  <img src="https://gitlab.lab.davilion.online/powershell/commitfusion/-/badges/release.svg"></a>

## 🚀 Module Features
🪶 Conventional Commits Standard - Streamlined commit messages for better collaboration. \
🪶 Customizable Commit Message - Tailor your messages to fit your project's unique needs. \
🪶 Semver Versioning Generator - Automate versioning with semantic versioning for clear releases. \
🪶 Changelog Auto-update with Markdown Auto-format - Maintain an organized and formatted changelog.\
🪶 Gitmoji Custom Schema - Add a touch of personality with custom Gitmoji schemes.

## 🎾 Using Commitfusion

Retrive list of available commit types

```powershell
Get-CommitTypes
```

Retrive list of available commit types.

```powershell
Get-CommitTypes -Semver patch
Get-CommitTypes -Semver minor
Get-CommitTypes -Semver major
Get-CommitTypes -Semver nosemver
```

Creating a new `feature` commit.

```powershell
# Default Returns ]string]
New-Commit -Type feat -Body "Updated module logic", "updated readme" -FeatureAddtions "Provided new module gunctionally via new cmdlet"
```

Assuming you have staged files, you can use the following to commit the changes:

```powershell
# Apply Commit
New-Commit @params | Set-Commit -Confirm
# Apply Commit and write to changelog file 
New-Commit @params | Format-FusionMD | Update-Changelog -logfile path\to\file | Set-Commit -Confirm
```

Generate Semver version base on you commits

```powershell
# generate SemVer Version returns psobject
Get-GitAutoVersion | select version
# only string
(Get-GitAutoVersion).Version
# in string
$version = "v_$((Get-GitAutoVersion).Version)"
```

### Default avaliable commit types

> Types are found at`$moduleroot/libs/commitfusion.types.json