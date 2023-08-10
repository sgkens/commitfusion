
# <i class="fa-solid fa-cubes" style="color: #d07711;"></i> Module Features

#### Conventional Commit:

CommitFusion adheres to The [🧷Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/), ensuring consistency and clarity in your commit messages.

#### Gitmoji Standard Schema:

Commits in CommitFusion utilize the Gitmoji standard schema, making it easy to visually identify the purpose of each commit.

#### Customizable Commit Message

The `New-ConventionalCommit` *cmdlet* takes several parameters generating a customizable commit message. The commit message is broken up into several main parts: *Type*, *Scope*, *Description*, *Body* ( **Notes**, **FeatureNotes**, **FeatureAddtions**, **BugFixes**, **BreakingChanges** ), and *Footer* all customizable by the user.

Commit Message Layout *[e]* (gitmoji)

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

Commit messages are optionaly written to a template file and joined with the current contents of the `CHANGELOG.md` file. This allows for easy management and tracking of changes over time.

#### Semver Version Generator:

The `Get-GitAutoVersion` function performs a reverse parse of the `git log --pretty=format:"%s%n%b"` command using regular expressions to determine the appropriate version increment for your build. The possible increments are "**major**," "**minor**," "**patch**," or `0.1.0` if no suitable increment is found.

> #### 🥏 Logic
  - If "*patch*" is parsed, `Get-GiAutoVersion` increments the patch number (***++patch***), or if already at the latest patch, it resets the patch to `0`.
  - If "*minor*" is parsed, the minor number is incremented (***++minor***), and the patch and minor numbers are reset to `0`.
  - If "*major*" is parsed, the major number is incremented (***++major***), and it never resets back to `0`.

#### Gitmoji Index:

Parse [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) icon set, returns PSObject, Miscellaneous function is there because I wanted to see all the emojis in the console.

####  Unicode Emoji Index:

*NOT COMPLETE* The module also offers a feature to retrieve a list of Unicode emojis based on a custom Unicode list. originally parsed from [🧷unicode.org](https://unicode.org/emoji/charts/emoji-list.html)

<div align="right">
  <a href="installation"> Installing Commit Fusion </a>
</div>