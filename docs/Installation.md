# <i class="fa-solid fa-window-maximize" style="color: #d07711;"></i> Installation Methods

## 💾 Clone Source

🎫 Clone the repository from GitHub `git clone https://github.com/sgkens/commitfusion.git` \
🎫 Open a *PowerShell* session and navigate to the cloned repository directory. \
🎫 Run the installation via the command below:

```powershell
# Import the module
git clone https://github.com/sgkens/commitfusion.git
cd commitfusion
Import-Module -Name commitfusion
```

## 💼 Download Release
Download the latest release from the [**Releases**](https://github.com/sgkens/commitfusion/releases) page.
## 📦 Package Repositories

[<img src="https://img.shields.io/badge/PSGallary-v0.4.3-yellow?style=for-the-badge&logo=Powershell&labelColor=blue&color=gray"/>](https://psgallary.com/sgkens/commitfusion)

```powershell
# Install The Module from the PsGal
Install-Module -Name commitfusion -MinimumVersion 0.1.0

# Import Module into you powershell session
Import-Module -Name commitfusion

# Note! You May Need to change your `ExecutionPolicy`
# Set-ExecutionPolicy
```

[<img src="https://img.shields.io/badge/Chocolatey-v0.4.3-yellow?style=for-the-badge&logo=Chocolatey&labelColor=darkmagenta&color=gray"/>](https://Chocolatory.org/sgkens/commitfusion)

```powershell
# Install The Module from the PsGal
choco install commitfusion --version 0.4.3

# Import Module into you powershell session
Import-Module -Name commitfusion
```

> Installing *Chocolatey* Package Repository
[**How to Install**](https) `choco.com/packages`


<div align="right">
  <a href="cmdlets"> Using Commitfusion's cmdlets </a>
</div>