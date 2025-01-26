# <i class="fa-solid fa-window-maximize" style="color: #d07711;"></i> How to install

### 💾 Source

- ***Step 1*** Clone the repository from GitHub `git clone https://github.com/sgkens/commitfusion.git`
- ***Step 2*** Open a *PowerShell* session and navigate to the cloned repository directory. \
- ***Step 3*** `Run` the Module Import via the command below:

```powershell
# Clone the repository
git clone https://github.com/sgkens/commitfusion.git
# Change Directory to the cloned repository
cd commitfusion
# Run Import the module
Import-Module -Name commitfusion
# Check the module is imported
Get-Module -Name CommitFustion

# Check imported Module Functions & Aliases
Get-Module -Name commitfusion | Select-Object -expand ExportedFunctions,ExportedAliases
```

### 💼 Releases
Download the latest release from the [**Releases**](https://github.com/sgkens/commitfusion/releases) page.
### 📦 Package Repositories

[<img src="https://img.shields.io/powershellgallery/v/commitfusion?include_prereleases&style=for-the-badge&logo=powershell"/>](https://www.powershellgallery.com/packages/commitfusion/0.4.3) <img src="https://img.shields.io/powershellgallery/dt/commitfusion?label=Downloads&style=for-the-badge">

```powershell
# Install The Module from the PsGal
Install-Module -Name commitfusion -MinimumVersion 0.3.1

# Import Module into you powershell session
Import-Module -Name commitfusion
```

> *Note!*  
> You may need to `Set-ExecutionPolicy` to `RemoteSigned` or `Unrestricted` to install from the PSGallary.

[<img src="https://img.shields.io/chocolatey/v/commitfusion?style=for-the-badge&logo=chocolatey"/>](https://Chocolatory.org/sgkens/commitfusion) <img src="https://img.shields.io/chocolatey/dt/commitfusion?label=Downloads&style=for-the-badge">


```powershell
# Install The Module from the PsGal
choco install davilion.commitfusion --version 0.3.1

# Import Module into you powershell session
Import-Module -Name commitfusion
```
> *How-to!* \
> Installing *Chocolatey* Package Repository
[**How to Install**](https)  [🧷https://chocolatey.org/install](https://chocolatey.org/install)


<div align="right">

  {% if site.custom.prod %}
  <a href="/commitfusion/cmdlets"> Using Commitfusion > </a>
  {% endif %}
  {% if site.custom.dev %}
  <a href="/cmdlets"> Using Commitfusion > </a>
  {% endif %}

</div>