---
layout: default
sitemap: true
---

# <i class="fa-solid fa-circle-info" style="color: #d07712;"></i> Overview
---
*CommitFusion* is a **PowerShell** module designed to streamline the process of generating *Conventional Commits Messages* in `git`. Commit Messages follows the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) standard with added sections to the body that include ***Notes***, ***Feature Notes***, ***Feature Additions***, ***Fixes***, ***Bug Fixes***, ***Beaking Changes*** and ***Footer*** containing the `GitUser` and the log date. this module imployes the use of emoji's see: [🧷gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) and [🧷gitmoji.dev](https://gitmoji.dev).

The module allows the construction of a custimized commit message with a number of parameters with are all optional except `-t|-Type`. The `-t|-Type` parameter is used to specify the type of commit message. The module supports the following types, Types can be modif

```
Type         description                                                  semver cfa                           emoji
----         -----------                                                  ------ ---                           -----
changes      Introduce breaking changes.                                  major  {@{action=}}                  💥
feat         Introduce new features.                                      minor  {@{action=}}                  ✨
fix          Fixed bugs.                                                  patch  {@{action=}}                  🐛
remove       Remove code or files.                                               {@{action=}}                  🔥
docs         Update Documentation.                                               {@{action=}}                  📝
style        Update style.                                                patch  {@{action=}}                  💄
perf         Improve performance.                                         patch  {@{action=}}                  ⚡️
tests        Add tests.                                                          {@{action=}}                  ✅
build        Build.                                                       patch  {@{action=}}                  📦
cicd         Add / Update Continuous integration.                                {@{action=}}                  👷
chore        Add / Update Tooling, Generic commit                                {@{action=}}                  🔧
revert       Revert changes to previous commit                            patch  {@{action=}}                  ⏪
bookmark     Release / Version tags.                                             {@{action=make-bookmark-tag}} 🔖
wip          Work in progress.                                                   {@{action=}}                  🚧
gitignore    Add / Update a .gitignore file.                                     {@{action=}}                  🙈
gitsubmodule Add / Update git submodules                                         {@{action=}}                  🧮
flag         Add, update, or remove feature flags.                               {@{action=@flag-action}}      🚩
improve      Improve structure / format of the code.                      patch  {@{action=}}                  🛠️
hotfix       Critical hotfix.                                             patch  {@{action=}}                  🚑️
deploy       Deploy stuff.                                                       {@{action=}}                  🚀
project      Begin a project.                                                    {@{action=}}                  🎉
security     Fix security issues.                                         patch  {@{action=}}                  🔒️
refactor     Refactor code.                                                      {@{action=}}                  ♻️
depadd       Add a dependency.                                            patch  {@{action=}}                  ➕
depdell      Remove a dependency.                                         patch  {@{action=}}                  ➖
config       Add or update configuration files.                           patch  {@{action=}}                  🔧
typos        Fix typos.                                                   patch  {@{action=}}                  ✏️
resources    Move or rename                                                      {@{action=}}                  🚚
fix-s        Simple fix for a non-critical issue.                         patch  {@{action=}}                  🩹
deadcode     Remove dead code.                                                   {@{action=}}                  ⚰️
Depre        Remove deprecate code.                                              {@{action=}}                  🗑️
concurrency  Add or update code related to multithreading or concurrency.        {@{action=}}                  🧵
Infra        Infrastructure related changes.                              patch  {@{action=}}                  🧱
compiler     Fix compiler / linter warnings.                                     {@{action=}}                  🚨
cifix        Fix CI Build.                                                       {@{action=}}                  💚
depdown      Downgrade dependencies.                                      patch  {@{action=}}                  ⏬
depup        Upgrade dependencies.                                        patch  {@{action=}}                  ⏫
depfix       Pin dependencies to specific versions.                       patch  {@{action=}}                  📌
globloc      Internationalization and localization.                       patch  {@{action=}}                  🌐
init         Begin a project.                                                    {@{action=}}                  🎉
secrets      Add or update secrets.                                              {@{action=}}                  🔐
analytics    Add or update analytics or track code.                       patch  {@{action=}}                  📈
scripts      Add or update development scripts.                                  {@{action=}}                  🔨
merge        Merge branches.                                                     {@{action=}}                  🔀
api-update   Update code due to external API changes.                     patch  {@{action=}}                  👽️
license      Add or update license.                                              {@{action=}}                  📄
assets       Add or update assets.                                        patch  {@{action=}}                  🍱
Access       Improve accessibility.                                       patch  {@{action=}}                  ♿️
commets      Add or update comments in source code.                              {@{action=}}                  💡
db           Perform database related changes.                            patch  {@{action=}}                  🗃️
logAdd       Add or update logs.                                                 {@{action=}}                  🔊
logRemove    Remove logs.                                                        {@{action=}}                  🔇
contrib      Add or update contributor(s).                                       {@{action=}}                  👥
usability    Improve user experience / usability.                         patch  {@{action=}}                  🚸
mock         Mock things.                                                        {@{action=}}                  🤡
experiment   Perform experiments.                                         patch  {@{action=}}                  ⚗️
seo          Improve SEO.                                                 patch  {@{action=}}                  🔍️
types        Add or update types.                                         patch  {@{action=}}                  🏷️
idea         Implement / Test Idea                                               {@{action=}}                  🌱
animation    Add or update animations and transitions.                    patch  {@{action=}}                  💫
inspect      Data exploration/inspection.                                        {@{action=}}                  🧐
test-fail    Add a failing test.                                                 {@{action=}}                  🧪
Buslogic     Add or update business logic.                                patch  {@{action=}}                  👔
check        Add or update healthcheck.                                          {@{action=}}                  🩺
sponsor      Add sponsorships or money related infrastructure.                   {@{action=}}                  💸
validation   Add or update code related to validation.                           {@{action=}}                  🦺
```

### Other features

- Updating the [changelog](/commitfusion/cmdlets#update-changelog)
- Generating [semver](/commitfusion/cmdlets#get-gitautoversion) version revisions
- Converting `git log` to changelog or release notes, extracts the ***Notes***, ***Feature Notes***, ***Feature Additions***, ***Fixes***, ***Bug Fixes***, ***Beaking Changes*** from git commits messages or git commit message headers(first line of commit message) for the current branch, which are extracted and added to the to an array by section type, the array is then joined by catagories and returned as a string in markdown format or as a hash `hashtable[section,array[]]`.
- Misceallaneous other features: parsing [gitmoji icons](/commitfusion/cmdlets#get-emoji), [unicode emojis](/commitfusion/cmdlets#get-emojiindex).

### How to use CommitFusion?

Simpliest way to install the module is from the [🧷PowerShell Gallery](https://www.powershellgallery.com/packages/commitfusion/0.4.3), See Install [🧷How to install](/commitfusion/install) for more details.

**Example:**


```powershell
# Install the module from the PowerShell Gallery and import it into your powershell session.
Find-Module 'commitfusion' | install-module | import-module

# Get the supported commit types
Get-CommitTypes -[NoSemver|minor|major|patch]

# Change Directory to the repository
cd <path-to-git-repo>

# Returns the commit message with commiting
New-Commit -Type '<type>' -Scope <scope> -Description <description> -Notes <Notes>

# Commit the message
New-Commit -Type <type> -Scope <scope> -Description <description> -Notes <Notes> | Set-Commit -Confirm
```

## *CMDLET Illustrations*

<div class="accordion">
   <details id="newcommit_wrapper">
     <summary><strong>New-Commit</strong></summary>
     <p> New-Commit is the main cmdlet used to generate a commit message. It accepts parameters for the Type, Scope, Description and optional Body content like Notes, FeatureAdditions etc. The message is formatted using the gitmoji schema.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="newcommit"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
   <details id="setcommit_wrapper">
     <summary><strong>Set-Commit</strong></summary>
     <p> Set-Commit is used to update the commit message for the current branch.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="setcommit"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
   <details id="getcommittypes_wrapper">
     <summary><strong>Get-CommitTypes</strong></summary>
     <p>Get-CommitTypes returns the supported commit types that can be used with New-Commit and Set-Commit. It returns the types as objects with properties like Name, Emoji, Description etc.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="getcommittypes"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
   <details id="formatfusionmd_wrapper">
     <summary><strong>Format-FusionMD</strong></summary>
     <p> Format-FusionMD is used to generate a markdown file with the changelog for the current branch.
      <!--typed block using rouge and base86.dark theming to match docs-->
      <div class="tabcontent typed language-text highlighter-rouge">
      - pwsh
        <pre class="highlight">
          <code id="formatfusionmd"></code>
        </pre>
        <div class="poweredby"> Powered by 🙉 <a href="https://mattboldt.github.io/typed.js/"><strong>typed.js</strong></a></div>
      </div>
     </p>
   </details>
  </div>
