using module ..\NuPSForge\libs\New-NuspecPacakgeFile.psm1
using module ..\NuPSForge\libs\New-NupkgPacakge.psm1

# Powershell Gallery Description Does not support markdown indenting
# ? But Nuget and CHoc Does
$Additional_descriptions = @"
♦- Conventional Commits: CommitFusion adheres to the Conventional Commits specification, ensuring consistency and clarity in your commit messages.
♦- Flexible Commit Messages: The module takes server parameters and generates commit messages that can be customized by the user or automatically created by the module itself.
♦- Markdown Formatting: CommitFusion parses commit messages and adds Markdown formatting to them. This enables easy integration with GitLab and enhances the readability of your commit history.
♦- Changelog Integration: Commit messages are written to a template file and joined with the current contents of the CHANGELOG.md file. This allows for easy management and tracking of changes over time.
♦- Gitmoji Standard Schema: Commits in CommitFusion utilize the Gitmoji standard schema, making it easy to visually identify the purpose of each commit.
♦- Version Incrementation: The module parses Gitmoji's JSON file to determine the appropriate version increment for your build (minor, major, or 0.0.0). This version information can be used with GitLab CI/CD to automate release and build processes based on your Git history.
♦- Advanced Commit Manipulation: CommitFusion provides additional manipulation options for the commit body. This includes multi-line listing and styling within the commit message, which can differ from the markdown written to the template.md file.

# Parameters
Parameters for the module
Compose a commit message with the following parameters:
new-ConventionalCommit -type improve `
                       -Scope "formatting" `
                       -Description "Fixed Output and emoji displayed" `
                       -GitUser sgkens `
                       -GitGroup powershell
```
"@

# --Config--
$ModuleManifest = Test-ModuleManifest -path .\dist\logtastic\logtastic.psd1

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


