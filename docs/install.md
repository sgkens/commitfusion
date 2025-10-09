---
layout: default
title: Installation
nav_order: 2
description: "Installation Methods"
permalink: /install
has_children: false
---

# Installation

---

The **CommitFusion** module can be installed in a number of ways:

 - Powershell Gallery
 - Chocolatey
 - Git Clone
 - GitLab Packages
 - Manual download and installation

### Source

1. Clone the repository from GitHub `git clone https://gitlab.com/phellams/commitfusion.git`
2. Open a *PowerShell* session and navigate to the cloned repository directory. \
3. `Run` the Module Import via the command below:

```powershell
# Clone the repository
git clone https://github.com/phellams/commitfusion.git

# Change Directory to the cloned repository
cd commitfusion

# Run Import the module
Import-Module -Name commitfusion

# Check the module is imported
Get-Module -Name commitFustion

# Check imported Module Functions & Aliases
Get-Module -Name commitfusion | Select-Object -expand ExportedFunctions,ExportedAliases
```

### Releases
Download the latest release from the [**Releases**](https://github.com/phellams/commitfusion/releases) page.

### Package Repositories

[<img src="https://img.shields.io/powershellgallery/v/commitfusion?include_prereleases&style=for-the-badge&logo=powershell"/>](https://www.powershellgallery.com/packages/commitfusion/0.4.3) <img src="https://img.shields.io/powershellgallery/dt/commitfusion?label=Downloads&style=for-the-badge">

```powershell
# Install The Module from the PsGal
Install-Module -Name commitfusion -MinimumVersion 0.3.1

# Import Module into you powershell session
Import-Module -Name commitfusion
```

{: .info }
You may need to `Set-ExecutionPolicy` to `RemoteSigned` or `Unrestricted` to install from the Powershell Gallery.


[<img src="https://img.shields.io/chocolatey/v/commitfusion?style=for-the-badge&logo=chocolatey"/>](https://Chocolatory.org/phellams/commitfusion) <img src="https://img.shields.io/chocolatey/dt/commitfusion?label=Downloads&style=for-the-badge">


```powershell
# Install The Module from the PsGal
choco install davilion.commitfusion --version 0.3.1

# Import Module into you powershell session
Import-Module -Name commitfusion
```

{: .info }
> *How-to install `choco.exe`!* \
> Installing *Chocolatey* Package Repository
[**How to Install**](https)[🧷https://chocolatey.org/install](https://chocolatey.org/install)

[Back to top](#){: .btn .btn-purple} [See Features](/features){: .btn .btn-purple} 

<div align="right">

  {% if site.custom.prod %}
  <a href="/cmdlets"> Using Commitfusion > </a>
  {% endif %}
  {% if site.custom.dev %}
  <a href="/cmdlets"> Using Commitfusion > </a>
  {% endif %}

</div>