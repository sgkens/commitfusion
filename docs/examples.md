---
layout: default
title: Examples
nav_order: 6
description: "CommitFusion Cmdlet Examples"
permalink: /examples
---

# CommitFusion Examples

This guide provides practical examples for using CommitFusion cmdlets. All examples follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

## Table of Contents
{:.no_toc}

* TOC
{:toc}

## New-Commit Examples

### Basic Usage

Generate a simple chore commit:
```powershell
New-Commit -Type chore -Description "Update dependencies"
```
Output:
```
🔧 chore: Update dependencies
```

### Documentation Commits

Create a documentation commit with notes and footer:
```powershell
$params = @{
    Type = "docs"
    Description = "Update API documentation"
    Scope = "api"
    Notes = @("Added authentication examples", "Fixed typos")
    GitUser = "sgkens"
    Footer = $true
}
New-Commit @params
```
Output:
```
📝 docs(api): Update API documentation

🧳 Notes:
  - Added authentication examples
  - Fixed typos

👤 @sgkens 📅 7:48PM, Thursday 2th October 2025
```

### Bug Fix Commits

Create a bug fix commit with scope and fixes:
```powershell
New-Commit -Type fix -Description "Fix memory leak" -Scope "#234" -BugFixes "Memory leak in authentication handler"
```
Output:
```
🐛 fix(#234): Fix memory leak

🧰 Build: patch

🐛 BUGFIXES:
🦠 Memory leak in authentication handler ..🖊
```

### Feature Commits

Add a new feature with multiple components:
```powershell
$featureParams = @{
    Type = "feat"
    Description = "Add OAuth support"
    Scope = "auth"
    Notes = @("Requires API key", "Rate limited to 1000 requests/hour")
    FeatureAdditions = @(
        "OAuth 2.0 authentication flow",
        "Token refresh mechanism"
    )
    GitUser = "sgkens"
    Footer = $true
}
New-Commit @featureParams
```

## Working with Changelogs

### Update Changelog with New Commit

```powershell
# Create and update changelog in one pipeline
New-Commit @params | 
    Format-FusionMD | 
    Update-Changelog -LogFile changelog.md
```

### Commit Types and Versioning

List all major version change types:
```powershell
Get-CISetFusion -Major
```

List all patch version change types:
```powershell
Get-CISetFusion -Patch
```

## Working with Emojis

Get specific Git emoji:
```powershell
Get-Emoji -Type gitmojis -Name bug  # Returns: 🐛
```

Get specific miscellaneous emoji:
```powershell
Get-Emoji -Type miscmojis -Name person  # Returns: 🧑
```

## Release Notes

### Generate release notes with **notes**

```powershell
Get-ReleaseNotes -Notes
```

**Output:**

```
## Notes:

  - Note 1
  - Note 2

## Feature Notes:

  - FeatureNotes 1
  - FeatureNotes 2

## Breaking Changes:

  - BreakingChanges 1
  - BreakingChanges 2

## Feature Additions:

  - FeatureAddtions 1
  - FeatureAddtions 2
```

### Generate release notes with all params

```powershell
Get-ReleaseNotes -Notes -FeaturesNotes -BreakingChanges -FeatureAdditions -CommitLink -CommitLinkPrefix github.com/ -NameSpace GitUser
```

**Output:**

```
## Notes:

  - Note 1 [commidhash](github.com/sgkens/GitUser/commit/commidhash)
  - Note 2 [commidhash](github.com/sgkens/GitUser/commit/commidhash)

## Feature Notes:

  - FeatureNotes 1 [commidhash](github.com/sgkens/GitUser/commit/commidhash)
  - FeatureNotes 2 [commidhash](github.com/sgkens/GitUser/commit/commidhash)

## Breaking Changes:

  - BreakingChanges 1 [commidhash](github.com/sgkens/GitUser/commit/commidhash)
  - BreakingChanges 2 [commidhash](github.com/sgkens/GitUser/commit/commidhash)

## Feature Additions:

  - FeatureAddtions 1 [commidhash](github.com/sgkens/GitUser/commit/commidhash)
  - FeatureAddtions 2 [commidhash](github.com/sgkens/GitUser/commit/commidhash)

## Bug Fixes:

  - BugFixes 1 [commidhash](github.com/sgkens/GitUser/commit/commidhash)
  - BugFixes 2 [commidhash](github.com/sgkens/GitUser/commit/commidhash)

```

## Version Management

### Get current version info:

```powershell
Get-GitAutoVersion
```

Get version number only:
```powershell
(Get-GitAutoVersion).Version
```

## Complete Pipeline Example

Here's a complete example showing all features working together:

```powershell
$commitParams = @{
    Type = "feat"
    Description = "Implement OAuth2"
    Scope = "auth"
    Notes = @(
        "Requires environment configuration",
        "Updates security policy"
    )
    FeatureAdditions = @(
        "OAuth2 authentication flow",
        "Automatic token refresh"
    )
    GitUser = "sgkens"
    Footer = $true
}

New-Commit @commitParams | 
    Format-FusionMD | 
    Update-Changelog -LogFile changelog.md | 
    Set-Commit
```