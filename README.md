<div align="center" >
 <!--Logo-->
    <img src="./ccommits-logo.svg"/>
</div>
 <!--Project Name-->
<div align="center">
    <img src="./CommitFusion-title.png"><br>
</div>
<div align="center" >
    <img src="./llline_v2-800x53.svg"> 
</div>

<div align="center">
  <!--Name+Version-->
  <a href="https://gitlab.snowlab.tk/snoonx">
    <img src="https://img.shields.io/badge/-Snoonx-lightblue??&stype=flat&logo=Personio&logoColor=blue">
  </a>
  <!--License-->
  <a href="https://gitlab.snowlab.tk/snoonx">
    <img src="https://img.shields.io/gitlab/license/43?gitlab_url=https%3a%2f%2fgitlab.snowlab.tk&logo=unlicense">
  </a>
  <!--Pipline-->
  <a href="https://gitlab.snowlab.tk/powershell/ccommits/-/commits/main">
    <img src="https://gitlab.snowlab.tk/powershell/ccommits/badges/main/pipeline.svg">
  </a>
  <!--Code Coverage-->
  <a href="https://gitlab.snowlab.tk/powershell/ccommits/-/commits/main">
    <img src="https://gitlab.snowlab.tk/powershell/ccommits/badgesmain/coverage.svg">
  </a>
  <!--Release-->
  <a href="https://gitlab.snowlab.tk/powershell/ccommits/-/releases">
    <img src="https://gitlab.snowlab.tk/powershell/ccommits/-/badges/release.svg">
  </a>
  
</div>

---

CommitFusion is a PowerShell module designed to streamline the process of handling conventional commits in Git for your GitLab repository. By automating the generation and formatting of commit messages, CommitFusion allows you to focus more on your code and less on the intricacies of commit conventions.



## 🧩 Features

- **Conventional Commits:** CommitFusion adheres to the Conventional Commits specification, ensuring consistency and clarity in your commit messages.

- **Flexible Commit Messages:** The module takes server parameters and generates commit messages that can be customized by the user or automatically created by the module itself.
- **Markdown Formatting:** CommitFusion parses commit messages and adds Markdown formatting to them. This enables easy integration with GitLab and enhances the readability of your commit history.
- **Changelog Integration:** Commit messages are written to a template file and joined with the current contents of the `CHANGELOG.md` file. This allows for easy management and tracking of changes over time.
- **Gitmoji Standard Schema:** Commits in CommitFusion utilize the Gitmoji standard schema, making it easy to visually identify the purpose of each commit.
- **Version Incrementation:** The module parses Gitmoji's JSON file to determine the appropriate version increment for your build (minor, major, or 0.0.0). This version information can be used with GitLab CI/CD to automate release and build processes based on your Git history.
- **Advanced Commit Manipulation:** CommitFusion provides additional manipulation options for the commit body. This includes multi-line listing and styling within the commit message, which can differ from the markdown written to the `template.md` file.

## Additional Module Functionality

- **Gitmoji List Retrieval:** CommitFusion allows you to retrieve a list of Gitmoji from the JSON file, returning a PSObject that can be further manipulated as needed.

- **Unicode Emoji List:** The module also offers a feature to retrieve a list of Unicode emojis based on a custom Unicode list. This list is compiled from an external website and contains almost all Unicode emojis, excluding those that don't render correctly.

## 🥽 Installation

To install CommitFusion, follow these steps:

1. Clone the repository from GitLab or GitHub.
2. Open a PowerShell session and navigate to the cloned repository directory.
3. Run the installation command: `Install-Module -Name CommitFusion`.

## Usage

Once installed, you can start using CommitFusion in your GitLab repository. Below is an example of how to utilize the module:

```powershell
# Import the CommitFusion module
Import-Module CommitFusion

# Generate a commit message
$commitMessage = New-GitCommit -ServerParams "your server parameters"

# Optional: Customize the commit message
$commitMessage = "Your custom commit message"

# Add the commit message
Add-GitCommit -Message $commitMessage

# The commit message will be parsed and formatted with Markdown
# The resulting commit will be written to the template file and prepended to the README.md file
```

For more information on the available functions and their parameters, please refer to the module documentation.

## 📑 License
CommitFusion is released under the MIT License. See LICENSE for more details. [MIT License]()

## 👤 Author
CommitFusion is authored and maintained by @snoonx.

As a habbit i have a tendanciy to create script to automate arrbitru things