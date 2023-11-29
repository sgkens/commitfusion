# <i class="fa-solid fa-window-maximize" style="color: #d07711;"></i> Installation Methods

---

### 💾 Source

🎫 Clone the repository from GitHub `git clone https://github.com/sgkens/commitfusion.git` \
🎫 Open a *PowerShell* session and navigate to the cloned repository directory. \
🎫 **Run** the *Module Import* via the command below:

```powershell
# Import the module
git clone https://github.com/sgkens/commitfusion.git
cd commitfusion
Import-Module -Name commitfusion
```

### 💼 Releases
Download the latest release from the [**Releases**](https://github.com/sgkens/commitfusion/releases) page.
### 📦 Package Repositories

[<img src="https://img.shields.io/badge/PowershellGet-v0.4.3-yellow?style=for-the-badge&logo=Powershell&labelColor=blue&color=gray"/>](https://www.powershellgallery.com/packages/commitfusion/0.4.3)

```powershell
# Install The Module from the PsGal
Install-Module -Name commitfusion -MinimumVersion 0.1.0

# Import Module into you powershell session
Import-Module -Name commitfusion
```

> *Note!*  
> You may need to `Set-ExecutionPolicy` to `RemoteSigned` or `Unrestricted` to install from the PSGallary.

[<img src="https://img.shields.io/badge/Chocolatey-v0.4.3-yellow?style=for-the-badge&logo=Chocolatey&labelColor=darkmagenta&color=gray"/>](https://Chocolatory.org/sgkens/commitfusion)

```powershell
# Install The Module from the PsGal
choco install commitfusion --version 0.4.3

# Import Module into you powershell session
Import-Module -Name commitfusion
```
> *How-to!* \
> Installing *Chocolatey* Package Repository
[**How to Install**](https)  [🧷https://chocolatey.org/install](https://chocolatey.org/install)


<div align="right">
  <a href="cmdlets"> Using Commitfusion's cmdlets </a>
</div>