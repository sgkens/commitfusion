# Nupkgs

### 📦*nuget*  
➡ 🧉[commitfusion.v0.5.3.nupkg]()

```powershell
# Install from nuget nupkg file
# -------

# powershell
Install-Package -Name $reponame `
                -RequiredVersion $version `
                -Source '\path\to\download' `
                -Destination "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\$reponame" `
                -Force
# nuget
nuget install $reponame -Version $version

# Extract the nupkg and import the module
Expand-Archive -Path "\path\to\download\$reponame.$version.nupkg" `
               -DestinationPath "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\$reponame"

# Import the module
Import-Module $reponame -Force
```
### 📦*chocolatey*  
➡ 🧉[commitfusion.v0.5.3.nupkg]()

```powershell
# Install from chocolatey nupkg file
# -------

# Elevated privileges required - install froms local source
choco install $reponame --version="$version" --source="/download/path"

# import the module
Import-Module "C:\ProgramData\chocolatey\lib\$reponame" -Force

# Expand the nupkg and import the module
Expand-Archive -Path "\path\to\download\$reponame.$version.nupkg" `
               -DestinationPath "C:\ProgramData\chocolatey\lib\$reponame"

# Import the module
Import-Module $reponame -Force
```

### 💼*PowerShell Gallary*
➡ 🧉[commitfusion.v0.5.3.zip]()

```powershell
# Install from powershell gallary zip file
# -------
Invoke-WebRequest -Uri "https://github.com/$gitug/$reponame/releases/download/$version/$reponame.$version.7z" `
                  -OutFile "$env:USERPROFILE\downloads\$reponame.$version.zip"

# Expand the nupkg and import the module
Expand-Archive -Path "\download\path\$reponame.$version.zip" `
               -DestinationPath "\path\to\Destination"

# Import the module
Import-Module $reponame -Force
```

### 💼*7zip*   
➡ [$reponame.$version.7z]()

```powershell
# Get from GitHub
Invoke-WebRequest -Uri "https://github.com/$gitug/$reponame/releases/download/$version/$reponame.$version.7z" `
                  -OutFile "$env:USERPROFILE\downloads\$reponame.$version.7z"

# Expand the nupkg and import the module
Expand-Archive -Path "\download\path\$reponame.$version.zip" `
               -DestinationPath "\path\to\Destination"

# Import the module
Import-Module $reponame -Force
```