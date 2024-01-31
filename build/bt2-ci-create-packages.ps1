
#---CONFIG----------------------------

$ModuleName = "commitfusion"

$ModuleManifest = Test-ModuleManifest -path ".\dist\$modulename\$modulename.psd1"
#---CONFIG----------------------------


# Choco supports markdown nuget and psgallary done
$Choco_description = @'
***CommitFusion*** is a **PowerShell** module designed to streamline the process of generating *Conventional Commits Messages* in `git`. Commit messages are constructed using the 🧷[Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) standard, and uses 🧷[gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) see 🧷[gitmoji.dev](https://gitmoji.dev), The module allows the construction of a custimized commit message with a number of options.

|📓 Documentaiton|[https://sgkens.github.io/commitfusion](https://sgkens.github.io/commitfusion/)|
|-|-|

## 🟪 Module Features

  - Conventional Commits Standard
  - Customizable Commit Messages with a variaty of options:
      - » Type (***CommitType***) eg:`feat: `
      - » Scope (***Scope in brackets***) eg: `✨feat(scope): `
      - » Descrption (***Default|Custom***).
      - » Build (***Based on CommitType***) eg: `🧰 Build: patch` 
          - Git messages can be parsed with `Get-GitAutoVersion` to generate *Samantic Version Number*(**semver**) based on git commit history.
      - » Notes (***Array of strings***)
      - » Feature Additions (***Array of strings***)
      - » Feature Notes (***Array of strings***)
      - » BugFixes (***Array of strings***)
      - » GitUser (***GitUser Account Name***)
      - » GitGroup (***if your repository sits in `/group/repo.git`***)
      - » Footer (**Custom footer**)
  - Semantic Versioning(**Semver**) Version Generator
  - Changelog Auto updater with Markdown Auto-format
  - Gitmoji Custom Schema (miscellaneous functions cmdlets)
  - Unicode Emoticons (miscellaneous cmdlets)

🔻**Conventional Commit Template**🔻
```
  [e] Type(Scope): Description

  [e] Build: Semver(Major|Minor|Patch)

  NOTES [e]:
    [e] Note 1
    [e] Note 2
    ...

  [e] BREAKING CHANGES
    [e] Change 1
    [e] Change 2 
    ...

  [e] FEATURE ADDTIONS
    [e] Addtion 1
    [e] Addtion 2...[e]

  [e] FEATURE NOTES
    [e] Feature Note 1
    [e] Feature Note 2
    ...

  [e] BUG FIXES
    [e] Fix 1
    [e] Fix 2
    ...

  [e] GitUser @ [e] DateTime
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
'@


if (!(Test-Path -path ".\dist\nuget")) { mkdir ".\dist\nuget" }
if (!(Test-Path -path ".\dist\choco")) { mkdir ".\dist\choco" }
if (!(Test-Path -path ".\dist\psgal")) { mkdir ".\dist\psgal" }


# ===========================================
#             PowerShell Gallery
# ===========================================
[console]::write( "Creating Zip File for PSGallery `n" )
[console]::write( "Source: .\dist\$($ModuleName)\* `n" )
[console]::write( "output: .\dist\psgal\$($zipFileName) `n" )
$zipFileName = "$($NuSpecParams.ModuleName).zip"
# Create Zip With .nuspec file for PSGallery
compress-archive -path ".\dist\$ModuleName\*" `
  -destinationpath ".\dist\psgal\$zipFileName" `
  -compressionlevel optimal `
  -update


# ===========================================
#                NUGET
# ===========================================
$NuSpecParams = @{
  path          = ".\dist\$ModuleName"
  ModuleName    = $ModuleName
  ModuleVersion = $ModuleManifest.Version -replace "\.\d+$", ""
  Author        = $ModuleManifest.Author
  Description   = $ModuleManifest.Description
  ProjectUrl    = $ModuleManifest.PrivateData.PSData.ProjectUrl
  License       = "MIT"
  company       = $ModuleManifest.CompanyName
  Tags          = $ModuleManifest.Tags
  dependencies  = $ModuleManifest.ExternalModuleDependencies
}
# Copy Custom Readme base on repository destination
Copy-item -Path ".\tools\readme-dist\nuget\readme.md"  `
          -Destination ".\dist\$ModuleName\readme.md" `
          -Force `
          -Verbose
# Create Nuget nuspec, Proget, gitlab, PSGallery
New-NuspecPackageFile @NuSpecParams
# Create New Verification CheckSums
New-VerificationFile -Path ".\dist\$modulename"  -OutputFile ".\dist\$modulename\tools"
Start-sleep -Seconds 2 # Wait for file to be created
New-NupkgPackage -path ".\dist\$ModuleName"  -outpath ".\dist\nuget"


# ===========================================
#                CHOCOLATEY
# ===========================================
$NuSpecParamsChoco = @{
  path              = ".\dist\$ModuleName"
  ModuleName        = $ModuleName
  ModuleVersion     = $ModuleManifest.Version -replace "\.\d+$", "" # remove the extra .0 as semver has 0.0.0 and powershell 0.0.0.0
  Author            = $ModuleManifest.Author
  Description       = $Choco_description #-replace '```', '```' -replace '\`', '``'
  Summary           = $ModuleManifest.Description
  ProjectUrl        = $ModuleManifest.PrivateData.PSData.ProjectUrl
  IconUrl           = $ModuleManifest.PrivateData.PSData.IconUrl
  docsUrl           = $ModuleManifest.PrivateData.PSData.docsUrl
  projectSourceUrl  = $ModuleManifest.PrivateData.PSData.projectSourceUrl 
  MailingListUrl    = $ModuleManifest.PrivateData.PSData.MailingListUrl
  bugTrackerUrl     = $ModuleManifest.PrivateData.PSData.BugTrackerUrl
  LicenseUrl        = $ModuleManifest.PrivateData.PSData.LicenseUrl
  ReleaseNotes      = $ModuleManifest.PrivateData.PSData.ReleaseNotes
  # License           = "MIT"
  company           = $ModuleManifest.CompanyName
  Tags              = $ModuleManifest.Tags
  dependencies      = $ModuleManifest.ExternalModuleDependencies
  LicenseAcceptance = $false
}

# Copy Custom Readme base on repository destination
Copy-item -Path ".\tools\readme-dist\choco\readme.md"  `
          -Destination ".\dist\$ModuleName\readme.md" `
          -Force `
          -Verbose

# Create Choco nuspec
New-ChocoNuspecFile @NuSpecParamsChoco
# Create New Verification CheckSums
New-VerificationFile -Path ".\dist\$modulename" -OutputFile ".\dist\$modulename\tools"
Start-sleep -Seconds 2 # Wait for file to be created
New-ChocoPackage -path ".\dist\$ModuleName"  -outpath ".\dist\choco"