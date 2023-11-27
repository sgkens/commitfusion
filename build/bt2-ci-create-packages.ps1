#---CONFIG----------------------------

$ModuleName = "commitfusion"
$nupsforge_v = "0.2.0"

#---CONFIG----------------------------




#------------------------------------
if (Get-Module -ListAvailable -name 'nupsforge' | Where-Object { $_.version -eq "$nupsforge_v.0" }) {
  install-module -name psmpacker -repository powershell -MinimumVersion 0.1.5
}
import-module -name 'nupsforge' -MinimumVersion $nupsforge_v

#----Special Config Choco --------------------------------
# Choco supports markdown nuget and psgallary done
$Additional_descriptions = @"
*CommitFusion* is a PowerShell module crafted to streamline the creation of well-organized and uniform commit messages in adherence to the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) for your `git` repository.

A custom version of the [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) (accessible at [🧷gitmoji.dev](https://gitmoji.dev)) is used to define the emojis, scope, and default description of the commit string.

### Features

- Conventional Commit specification.
- Custom commit Types.
- Customizable Commit Messages.
- Changelog auto-updater.
- Semver(*Semantic Versioning specification*).
- Emoji parser.
- Gitmoji parser.
- Auto Commit

## Example 1

Minimal **Paramaters** to compose a commit message.

```powershell
# Feature commit message returns a string
New-ConventionalCommit -Type improve

```

Ouput

<pre>

improve: Improve structure / format of the code.

🧰 Build: patch
</pre>

## Example 2
```powershell
# Get the available commit types with semver value of patch
Get-CiSetFusion
```

Output

<pre>

Type    description                 semver cfs emoji
----    -----------                 ------ --- -----
changes Introduce breaking changes. major      💥
</pre>


### Example 2

Parameters for the module *all params* Compose a commit message with the following parameters:

```powershell
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
#----Special Config Choco --------------------------------
$ModuleManifest = Test-ModuleManifest -path ..\dist\$modulename\$modulename.psd1
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

# Create
New-NuspecPacakgeFile @NuSpecParams
Start-sleep -Seconds 1 # Wait for file to be created
New-NupkgPacakge -path ..\dist\$ModuleName  -outpath .\dist\nuget

# Chocolatey Supports markdown in the description field so create a new nuspec file with additional descriptions in markdown
New-NuspecPacakgeFile @NuSpecParamsChoco
Start-sleep -Seconds 1 # Wait for file to be created
New-NupkgPacakge -path ..\dist\$ModuleName  -outpath .\dist\choco

