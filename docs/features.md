---
layout: default
title: Features
nav_order: 3
description: "Module Features"
permalink: /features
---

# CommitFusion Features

CommitFusion implements the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/) with enhanced features including notes, feature tracking, and emoji support via [gitmoji](https://gitmoji.dev).

## Core Features

### 🔄 Git Integration
- Seamless commit application with `Set-Commit`
- Automatic Git user information retrieval
- Repository state validation
- Changelog management

### ⚡ PowerShell Integration
- Rich tab completion for commit types
- Strict parameter validation
- Full pipeline support
- PSScriptAnalyzer compliance

### 🎨 Enhanced Commit Messages

CommitFusion generates structured commit messages with the following components:

```text
📝 type(scope): description

🏗️ Build: semver

📋 Notes:
  - Note details
  - Additional information

✨ Feature Additions:
  - New feature 1
  - New feature 2

🐛 Bug Fixes:
  - Fix description
  - Issue resolution

⚠️ Breaking Changes:
  - Major change 1
  - Migration notes

👤 @username 📅 timestamp
```

### 📊 Version Management

Automatic semantic versioning based on commit types:

| Type | Version Bump | Example |
|------|--------------|---------|
| breaking | major | 1.0.0 → 2.0.0 |
| feat | minor | 1.0.0 → 1.1.0 |
| fix | patch | 1.0.0 → 1.0.1 |

## Advanced Features

### 📝 Markdown Integration

- Convert commits to Markdown format
- Automatic changelog updates
- Custom template support
- Pipeline-friendly formatting

### 🎯 Semantic Version Analysis

`Get-GitAutoVersion` analyzes commit history to determine version increments:

- **Major**: Breaking changes (resets minor & patch)
- **Minor**: New features (resets patch)
- **Patch**: Bug fixes and small changes

### 🎨 Emoji Support

Two comprehensive emoji collections:

1. **Gitmoji Integration**
   - Standard git-specific emojis
   - Based on [gitmojis schema](https://github.com/carloscuesta/gitmoji)

2. **Unicode Emoji Support**
   - Full unicode emoji catalog
   - Sourced from [unicode.org](https://unicode.org/emoji/charts/emoji-list.html)

## Usage Example

```powershell
New-Commit -Type feat -Description "Add OAuth support" `
          -Scope auth `
          -Notes "Requires API key" `
          -FeatureAdditions @(
              "OAuth 2.0 flow",
              "Token refresh"
           ) |
Format-FusionMD |
Update-Changelog
```

[Back to top](#){: .btn .btn-purple} [Installing CommitFusion](/install){: .btn .btn-purple}