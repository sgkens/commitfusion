@{

    RootModule             = "commitfusion.psm1"
    ModuleVersion          = '0.9.0'
    CompatiblePSEditions   = @()
    GUID                   = 'c7e7262e-8c66-4c0d-9454-9927449c2927'
    Author                 = 'Garvey k. Snow'
    CompanyName            = 'phellams'
    Copyright              = '2023 Garvey k. Snow. All rights reserved.'
    Description            = 'Conventional Commit Message Generator'
    PowerShellVersion      = '7.0'
    PowerShellHostName     = ''
    PowerShellHostVersion  = ''
    DotNetFrameworkVersion = ''
    ClrVersion             = ''
    ProcessorArchitecture  = ''
    RequiredModules        = @()
    RequiredAssemblies     = @()
    ScriptsToProcess       = @()
    TypesToProcess         = @()
    FormatsToProcess       = @()
    NestedModules          = @()
    FunctionsToExport      = @( 
        'Get-CommitFusionModuleInstance',
        'Get-CiSet',
        'Get-CommitTypes',
        'Get-Emoji',
        'Get-EmojiIndex',
        'New-CommitFusion',
        'New-Commit',
        'Format-FusionMD',
        'Update-Changelog',
        'Get-GitAutoVersion',
        'Set-Commit',
        'Get-ReleaseNotes',
        'Enable-CommitFusionEmojis',
        'Disable-CommitFusionEmojis'
    )
    CmdletsToExport        = @()
    VariablesToExport      = @()
    AliasesToExport        = @()
    DscResourcesToExport   = @()
    ModuleList             = @()
    FileList               = @()
    PrivateData            = @{
        PSData = @{
            Tags                       = @('automation', 'git', 'conventional-commit', 'conventional', 'commit', 'free', 'free-ware', 'module', 'powershell', 'powershellcore', 'tool', 'utility', 'utility-module')
            LicenseUrl                 = 'https://choosealicense.com/licenses/mit'
            ProjectUrl                 = 'https://gitlab.com/phellams/commitfusion'
            IconUrl                    = 'https://raw.githubusercontent.com/phellams/phellams-general-resources/main/logos/commitfusion/dist/png/commitfusion-logo-512x512.png'
            ReleaseNotes               = 'https://gitlab.com/phellams/commitfusion'
            Prerelease                 = 'beta'
            RequireLicenseAcceptance   = $false
            ExternalModuleDependencies = @()
            Docsurl                    = 'https://pages.gitlab.io/phellams/commitfusion'
            MailingListUrl             = 'https://gitlab.com/phellams/commitfusion/issues'
            projectSourceUrl           = 'https://gitlab.com/phellams/commitfusion'
            bugTrackerUrl              = 'https://gitlab.com/phellams/commitfusion/issues'
            Summary                    = 'Commitfusion generates a conventional commit message based on the commit type and the scope of the commit.'
            chocodescription           = @"
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
"@
        }
    }
    HelpInfoURI            = 'https://gitlab.com/phellams/commitfusion/blob/main/README.md'
    DefaultCommandPrefix   = ''
}

