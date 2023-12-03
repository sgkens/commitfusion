*CommitFusion* is a PowerShell module crafted to streamline the creation of well-organized and uniform commit messages in adherence to the [🧷Conventional Commits specification](https://www.onventionalcommits.org/en/v1.0.0/) for your `git` repository.

A custom version of the [🧷carloscuesta gitmojis Schema](https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json) (accessible at [🧷gitmoji.dev](https://gitmoji.dev)) is used to define the emojis, scope, and default description of the commit string.

### Features

- Conventional Commit specification.
- Custom commit Types.
- Customizable Commit Messages.
- Changelog auto-updater.
- Semver(*Semantic Versioning specification*).
- Emoji parser.
- Gitmoji parser.
- Auto Commit

## Example 1

Minimal **Paramaters** to compose a commit message.

```powershell
# Feature commit message returns a string
New-ConventionalCommit -Type improve

```

Ouput

<pre>

improve: Improve structure / format of the code.

🧰 Build: patch
</pre>

## Example 2
```powershell
# Get the available commit types with semver value of patch
Get-CiSetFusion
```

Output

<pre>

Type    description                 semver cfs emoji
----    -----------                 ------ --- -----
changes Introduce breaking changes. major      💥
</pre>


### Example 2

Parameters for the module *all params* Compose a commit message with the following parameters:

```powershell
New-ConventionalCommit -type improve `
                       -Description "Fixed Output and emoji displayed" `
                       -Scope "Module" `
                       -Body "Added a new cmdlet called Get-Emoji" `
                       -Footer "Added a new cmdlet called Get-Emoji" `
                       -GitUser "sgkens" `
                       -GitGroup "ccharp" ` 
                       -FeatureAddtions "Exposes all methods and properties of the Table and Rule class" `
                       -BugFixes "Fixed Output and emoji displayed" `
                       -BreakingChanges "Fixed Output and emoji displayed" `
                       -FeatureNotes "Fixed Output and emoji displayed" `
                       -AsString $true
```
