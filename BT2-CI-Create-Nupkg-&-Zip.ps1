using module ..\NuPSForge\libs\New-NuspecPacakgeFile.psm1
using module ..\NuPSForge\libs\New-NupkgPacakge.psm1

# Powershell Gallery Description Does not support markdown indenting
# ? But Nuget and CHoc Does
$Additional_descriptions = @"
♦- Conventional Commits: CommitFusion adheres to the Conventional Commits specification, ensuring consistency and clarity in your commit messages.
♦- Customizable Commit Messages: `New-ConventionalCommit` *cmdlet* takes several parameters generating a customizable commit message, the commit message is broken up into several main parts: Type, Scope, Description, **Body**(_notes,featurenotes,featureaddtions,bugfixes,breakingchanges_), and Footer
 Commit Messages: The module takes server parameters and generates commit messages that can be customized by the user or automatically created by the module itself.
♦- Markdown Formatting: CommitFusion parses commit messages and adds Markdown formatting to them. This enables easy integration with GitLab and enhances the readability of your commit history.
♦- Changelog Integration: Commit messages are written to a template file and joined with the current contents of the CHANGELOG.md file. This allows for easy management and tracking of changes over time.
♦- Gitmoji Standard Schema: Commits in CommitFusion utilize the Gitmoji standard schema, making it easy to visually identify the purpose of each commit.

# Parameters
Parameters for the module *minmal params*
Compose a commit message with the following parameters:
New-ConventionalCommit -type improve `
                       -Description "Fixed Output and emoji displayed" `
# Parameters
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
```
"@

# --Config--
$ModuleManifest = Test-ModuleManifest -path .\dist\CommitFusion\CommitFusion.psd1

$NuSpecParams = @{
  path=".\dist\CommitFusion"
  ModuleName = "CommitFusion"
  ModuleVersion = $ModuleManifest.Version
  Author = $ModuleManifest.Author
  Description = "$($ModuleManifest.Description)`n`n$Additional_descriptions"
  ProjectUrl = $ModuleManifest.PrivateData.PSData.ProjectUri
  License = "MIT"
  company = $ModuleManifest.CompanyName
  Tags = $ModuleManifest.Tags
  dependencies = $ModuleManifest.ExternalModuleDependencies
}
$NuSpecParamsChoco = @{
  path=".\dist\CommitFusion"
  ModuleName = "CommitFusion"
  ModuleVersion = $ModuleManifest.Version
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
compress-archive -path '.\dist\CommitFusion\*' -destinationpath .\dist\psgal\$zipFileName -compressionlevel optimal -update

New-NuspecPacakgeFile @NuSpecParams
Start-sleep -Seconds 1 # Wait for file to be created
New-NupkgPacakge -path .\dist\CommitFusion  -outpath .\dist\nuget

# Chocolatey Supports markdown in the description field so create a new nuspec file with additional descriptions in markdown
New-NuspecPacakgeFile @NuSpecParamsChoco
Start-sleep -Seconds 1 # Wait for file to be created
New-NupkgPacakge -path .\dist\CommitFusion  -outpath .\dist\choco


