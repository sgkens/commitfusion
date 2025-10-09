---
layout: default
title: Home
nav_order: 1
description: "CommitFusion - Generate Conventional Commit Messages with PowerShell"
permalink: /
---

# CommitFusion
{: .fs-9 }

A PowerShell module that simplifies generating Conventional Commit Messages for git repositories.
{: .fs-6 .fw-300 }

[Get Started](/install){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub][commitfusion-repo]{: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Overview

CommitFusion helps you create standardized commit messages that follow the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/). The module enhances the standard by including additional sections:

- 📝 Notes
- ✨ Feature Notes
- ➕ Feature Additions
- 🔧 Fixes
- 🐛 Bug Fixes
- ❗ Breaking Changes
- 👤 Footer (with GitUser and timestamp)

Additionally, CommitFusion integrates modified [gitmoji](https://gitmoji.dev) support to add visual context to your commits, if Emotocons are not your thing simply disable them, via `New-Commit -NoEmojis` paramete. or by use the dedicated cmdlets `Enable-CommitFusionEmojis` and `Disable-CommitFusionEmojis`. before using `New-Commit` or `Set-Commit` respectively.

## Quick Start

### 1. Installation

Install directly from the PowerShell Gallery:

```powershell
Install-Module -Name 'CommitFusion' -Scope CurrentUser
Import-Module CommitFusion
```

### 2. Basic Usage

View available commit types:
```powershell
Get-CommitTypes
```

Generate a commit message:
```powershell
New-Commit -Type 'feat' -Scope 'ui' -Description 'add new dashboard component' -Notes 'Implemented responsive design'
```

Commit changes with the generated message:
```powershell
New-Commit -Type 'fix' -Scope 'api' -Description 'resolve authentication issue' -Notes 'Fixed token validation' | Set-Commit -Confirm
```

## Documentation

For detailed usage instructions and examples, check out our [documentation pages](/commitfusion/docs).

[commitfusion-repo]: https://github.com/phellams/commitfusion