<div align="center">
 <!--Logo-->
  <img width="200" src="https://github.com/sgkens/resources/raw/main/modules/CommitFusion/logo-v1-black.svg"/>
</div>

<div align="center">
  <!--Name+Version-->
  <!-- <a href="https://github.com/sgkens">
    <img src="https://img.shields.io/badge//-sgkens-orange?&stype=flat&logo=Personio&logoColor=blue">
  </a> -->
  <!--License-->
  <a href="https://github.com/sgkens/commitfusion/">
    <img src="https://img.shields.io/badge/MIT-License-blue?style=&logo=unlicense&color=%23004481">
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

<div style="font-weight:bold;" align="center" >
  <!--Module Build -->
  <img width="13" src="https://gitlab.snowlab.tk/sgkens/resources/-/raw/main/modules/logtastic/dist/Generic-powershell-24x23.png">
  PowerShell Module

  <!--Pipline-->
  <a href="https://gitlab.snowlab.tk/powershell/logtastic">
    <img src="https://img.shields.io/gitlab/pipeline-status/powershell%2Flogtastic?gitlab_url=https%3A%2F%2Fgitlab.snowlab.tk&branch=main&logo=gitlab&label=build">
  </a>

  <img src="https://raw.githubusercontent.com/sgkens/resources/main/modules/llline_v2-800x53.svg">
</div>

<div align="center"><h1><b>Commit Fusion</b></h1><em>Conventional Commit Message Generator</em></div>

---

*CommitFusion* is a **PowerShell** module designed to simplify the process of generating structured and consistent commit messages following the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) for your `git` repository. It leverages the [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) (available at [🧷gitmoji.dev](https://gitmoji.dev)).

#### You can read the full documention <img width="12px" src="https://raw.githubusercontent.com/sgkens/resources/main/modules/readme-1.png"> [Here]() 

### For Example
```powershell
New-ConventionalCommit -Type docs -Scope "update" -Description "Documentation"
```
*Ouput*
```text
📝 docs(update): Documentation
```

> Assuming you have staged files, you can use the following to commit the changes:

```powershell
New-ConventionalCommit -Type docs -Scope "update" -Description "Documentation" | Set-Commit
```

> Message can be piped into `Format-FusionMD` to generate a markdown version of the commit message

```powershell
New-ConventionalCommit -Type docs -Scope "update" -Description "Documentation" | Format-FusionMD
```

### What types can you use 
Retrieve the available list of `types` from `$moduleroot/libs/commitfusion.types.json` switchs `-NoSemVer`, `-Major`,`-Minor`,`-Patch`, providing no switch will return all types, as a `[PSObject]` unformatted, see documentation above for more information.

```powershell
# Types from `$moduleroot/libs/commitfusion.types.json` with no smver
Get-CiSetFusion -NoSemver
```

*Output*
```powershell
type      emoji entity    code                      description                                            name                    semver cfa
----      ----- ------    ----                      -----------                                            ----                    ------ ---
docs      📝    &#x1f4dd; :memo:                    Write docs.                                            memo                           {@{action=}}
test      ✅    &#x2705;  :white_check_mark:        Add tests.                                             white_check_mark               {@{action=}}
ci        👷    &#x1f477; :construction_worker:     Continuous integration.                                construction_worker            {@{action=}}
chore     🔧    &#x1f527; :wrench:                  Tooling, Generic commit                                wrench                         {@{action=}}
bookmark  🔖    &#x1f516; :bookmark:                Release / Version tags.                                bookmark                       {@{action=}}
wip       🚧    &#x1f6a7; :construction:            Work in progress.                                      construction                   {@{action=}}
gitignore 🙈    &#8bdfe7; :see_no_evil:             Add or update a .gitignore file.                       see-no-evil                    {@{action=}}
flag      🚩    &#x1F6A9; :triangular_flag_on_post: Add, update, or remove feature flags.                  triangular-flag-on-post        {@{action=}}
deploy    🚀    &#x1f680; :rocket:                  Deploy stuff.                                          rocket                         {@{action=}}
project   🎉    &#127881; :tada:                    Begin a project.                                       tada                           {@{action=}}
refactor  ♻️    &#x267b;  :recycle:                 Refactor code.                                         recycle                        {@{action=}}
resources 🚚    &#1F69A;  :truck:                   Move or rename resources (e.g.: files, paths, routes). truck                          {@{action=}}
deadcode  ⚰️    &#x26B0;  :coffin:                  Remove dead code.                                      coffin                         {@{action=}}
Depre     🗑️    &#x1F5D1; :wastebasket:             Remove deprecate code.                                 wastebasket                    {@{action=}}}
```


# 📌 Changelog

 
