
#  Module Features

---

#### <i class="fa-regular fa-paper-plane" style="color: #63E6BE;"></i> Conventional Commit

Commit Messages follows the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) standard with added sections to the body that include ***Notes***, ***Feature Notes***, ***Feature Additions***, ***Fixes***, ***Bug Fixes***, ***Beaking Changes*** and ***Footer*** containing the `GitUser` and the log date. this module imployes the use of emoji's see: [🧷gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) and [🧷gitmoji.dev](https://gitmoji.dev).

#### <i class="fa-regular fa-paper-plane" style="color: #63E6BE;"></i> Gitmoji Custom Schema

Commits in CommitFusion utilize a modified version of the [🧷gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) see [🧷gitmoji.dev](https://gitmoji.dev).

#### <i class="fa-regular fa-paper-plane" style="color: #63E6BE;"></i> Customizable Commit Message

Generate fully customizable commit messages. The message is broken up into several subparts: ***Notes***, ***Feature Notes***, ***Feature Additions***, ***Fixes***, ***Bug Fixes***, ***Beaking Changes*** and ***Footer*** 

Commit Message can either be applied using : [*Set-Commit*](/commitfusion/cmdlets#set-commit) or formatted in markdown and added to a file ie `CHANGELOG.md` using See: [*Format-FusionMD*](/commitfusion/cmdlets#format-fusionmd), or simply output to the console.

🔹 **Commit Message Layout:**
> *[e]*=utf8-emotocon

  ```text
  [e] Type(Scope): Description

  [e] Build: Semver(Major|Minor|Patch)

  [e] Notes:
    - <Note>
    - <Note>  

  [e] Feature Notes: << Might change to Updates instead, dont need two notes
    - <feature>
    - <feature>

  [e] Feature Additions:
    - <additions>
    - <additions>

  [e] Feature Updates: << add to commitfition class
    - <updates>
    - <updates>

  [e] Bug Fixes:
    - <bugfix>
    - <bugfix>

  [e] Fixes: << add to commitfition class
    - <fix>
    - <fix>

  [e] GitUser @ [e] DateTime
  ```

#### <i class="fa-regular fa-paper-plane" style="color: #63E6BE;"></i> Output Commit Message as Markdown:

> 🥝Remove Note for production Note! 
> Change Format-FusionMD to Format-Markdown

> 🥝Remove Note for production Note! 
> Perhaps Decom Format-FusionMD and just use Get-ReleaseNotes, Format-FusionMD converts the Commit String to a markdown string, Get-ReleaseNotes convertts the gitlog to a string and joins the commits together, so perhaps keep format-fusionmd as the logic and function is different.

Commit messages are optionaly written to a template file see [*Format-FusionMD*](/cmdlets#format-fusionmd) and joined with the current contents of the `CHANGELOG.md` or **specified** file name if the `-LogFile` switch is used.

#### <i class="fa-regular fa-paper-plane" style="color: #63E6BE;"></i>   Semantic(***semver***) Version Generator:

`Get-GitAutoVersion` performs a reverse parse of `git log --pretty=format:"%s%n%b"` and using regular expressions to determine the appropriate version increment for your build. The possible increments are "**major**," "**minor**," "**patch**," or `0.1.0` if no suitable increment is found.

> #### 🥏 Function Logic
  - If "*patch*" is parsed, `Get-GiAutoVersion` increments the patch number (***++patch***), or if already at the latest patch, it resets the patch to `0`.
  - If "*minor*" is parsed, the minor number is incremented (***++minor***), and the patch and minor numbers are reset to `0`.
  - If "*major*" is parsed, the major number is incremented (***++major***), and it never resets back to `0`.

#### Gitmoji Index:

- Parses [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) icon set, returns `PSObject`, Miscellaneous function.

####  Unicode Emoji Index:

- Parses scraped version of [🧷unicode.org](https://unicode.org/emoji/charts/emoji-list.html) icon set, returns `PSObject`, Miscellaneous function.

<div align="right">
  <a href="/commitfusion/install"> Installing Commit Fusion </a>
</div>