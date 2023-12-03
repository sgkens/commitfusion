
# <i class="fa-solid fa-cubes" style="color: #d07711;"></i> Module Features

---

#### Conventional Commit

- CommitFusion adheres to The [🧷Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/).

#### Gitmoji Custom Schema

- Commits in CommitFusion utilize a slightly modified version of the [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) see [🧷gitmoji.dev](https://gitmoji.dev).

#### Customizable Commit Message

- Generate fully customizable commit messages. The message is broken up into several subparts: *Type*, *Scope*, *Description*, *Body* ( **Notes**, **FeatureNotes**, **FeatureAddtions**, **BugFixes**, **BreakingChanges** ), and *Footer*.

- Commit Message can either be applied using See: [*Set-Commit*](/cmdlets#set-commit) or formatted in markdown and added to a file ie `CHANGELOG.md` using See: [*Format-FusionMD*](/cmdlets#format-fusionmd), or simply output to the console.

  > Commit Message Layout *[e]*=(gitmoji)

  ```text
  [e] Type(Scope): Description

  [e] Build: Semver(Major|Minor|Patch)

  NOTES [e]:
    [e] Note 1
    [e] Note 2

  [e] BREAKING CHANGES
    [e] Change 1
    [e] Change 2 ...[e]
  [e] FEATURE ADDTIONS
    [e] Addtion 1
    [e] Addtion 2...[e]
  [e] FEATURE NOTES
    [e] Note 1
    [e] Note 2...[e]
  [e] BUG FIXES
    [e] Fix 1
    [e] Fix 2...[e]

  [e] GitUser @ [e] DateTime
  ```

####  Changelog Auto-Update:

- Commit messages are optionaly written to a template file see [*Format-FusionMD*](/cmdlets#format-fusionmd) and joined with the current contents of the `CHANGELOG.md` or **specified** file name if the `-LogFile` switch is used.

#### Semver Version Generator:

- The `GitAutoVersion` function performs a reverse parse of `git log --pretty=format:"%s%n%b"` and using regular expressions to determine the appropriate version increment for your build. The possible increments are "**major**," "**minor**," "**patch**," or `0.1.0` if no suitable increment is found.

  > #### 🥏 Function Logic
    - If "*patch*" is parsed, `Get-GiAutoVersion` increments the patch number (***++patch***), or if already at the latest patch, it resets the patch to `0`.
    - If "*minor*" is parsed, the minor number is incremented (***++minor***), and the patch and minor numbers are reset to `0`.
    - If "*major*" is parsed, the major number is incremented (***++major***), and it never resets back to `0`.

#### Gitmoji Index:

- Parses [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) icon set, returns `PSObject`, Miscellaneous function.

####  Unicode Emoji Index:

- Parses scraped version of [🧷unicode.org](https://unicode.org/emoji/charts/emoji-list.html) icon set, returns `PSObject`, Miscellaneous function.

<div align="right">
  <a href="/install"> Installing Commit Fusion </a>
</div>