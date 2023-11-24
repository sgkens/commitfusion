using module ..\..\NuPSForge\libs\New-NuspecPacakgeFile.psm1
using module ..\..\NuPSForge\libs\New-NupkgPacakge.psm1

# ? Powershell Gallery Description Does not support markdown indenting
# ? But Nuget and Choco Does
$Additional_descriptions = @"

*CommitFusion* is a PowerShell module crafted to streamline the creation of well-organized and uniform commit messages in adherence to the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) for your `git` repository. 

A custom version of the [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) (accessible at [🧷gitmoji.dev](https://gitmoji.dev)) is used to define the emojis, scope, and default description of the commit string.

### Features
♦- Conventional Commit specification.
♦- Custom commit Types
♦- Fully Customizable Commit Messages.
♦- Update Changelog Automatictly.
♦- Version Generator using SemVer and git log --pretty

### Example 1
Parameters for the module *minimal paramaters*
Compose a commit message with the following parameters:
New-ConventionalCommit -type improve `
                       -Description "Fixed Output and emoji displayed" `
### Example 2
Parameters for the module *all params*
Compose a commit message with the following parameters:
New-ConventionalCommit -type improve `
                       -Description "Fixed Output and emoji displayed" `
                       -Scope "Module" `
                       -Body "Added a new cmdlet called Get-Emoji" `
                       -Footer "Added a new cmdlet called Get-Emoji" `
                       -GitUser "sgkens" `
                       -GitGroup "ccharp" `
                       -FeatureAddtions "Exposes all methods and properties of the Table and Rule class" `
                       -BugFixes "Fixed Output and emoji displayed" `
                       -BreakingChanges "Fixed Output and emoji displayed" `
                       -FeatureNotes "Fixed Output and emoji displayed" `
                       -AsString $true
"@

# --Config--
$ModuleName = "commitfusion"
$ModuleManifest = Test-ModuleManifest -path ..\dist\CommitFusion\CommitFusion.psd1

$NuSpecParams = @{
  path=".\dist\$ModuleName"
  ModuleName = $ModuleName
  ModuleVersion = $ModuleManifest.Version -replace "\.\d+$",""
  Author = $ModuleManifest.Author
  Description = "$($ModuleManifest.Description)`n`n$Additional_descriptions"
  ProjectUrl = $ModuleManifest.PrivateData.PSData.ProjectUri
  License = "MIT"
  company = $ModuleManifest.CompanyName
  Tags = $ModuleManifest.Tags
  dependencies = $ModuleManifest.ExternalModuleDependencies
}
$NuSpecParamsChoco = @{
  path=".\dist\$ModuleName"
  ModuleName = $ModuleName
  ModuleVersion = $ModuleManifest.Version -replace "\.\d+$",""
  Author = $ModuleManifest.Author
  Description = "$($ModuleManifest.Description)"
  ProjectUrl = $ModuleManifest.PrivateData.PSData.ProjectUri
  License = "MIT"
  company = $ModuleManifest.CompanyName
  Tags = $ModuleManifest.Tags
  dependencies = $ModuleManifest.ExternalModuleDependencies
}
# --Config--

if(!(Test-Path -path .\dist\nuget)){mkdir .\dist\nuget}
if(!(Test-Path -path .\dist\choco)){mkdir .\dist\choco}
if(!(Test-Path -path .\dist\psgal)){mkdir .\dist\psgal}

# Create Zip With .nuspec file for PSGallery
write-host -foregroundColor Yellow "Creating Zip File for PSGallery"
$zipFileName = "$($NuSpecParams.ModuleName).zip"
compress-archive -path ..\dist\$ModuleName\* -destinationpath ..\dist\psgal\$zipFileName -compressionlevel optimal -update

New-NuspecPacakgeFile @NuSpecParams
Start-sleep -Seconds 1 # Wait for file to be created
New-NupkgPacakge -path ..\dist\$ModuleName  -outpath .\dist\nuget

# Chocolatey Supports markdown in the description field so create a new nuspec file with additional descriptions in markdown
New-NuspecPacakgeFile @NuSpecParamsChoco
Start-sleep -Seconds 1 # Wait for file to be created
New-NupkgPacakge -path ..\dist\$ModuleName  -outpath .\dist\choco

