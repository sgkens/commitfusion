<#
  Commit Fusion template file
  use to create large detailed commits
#>
$Params = @{
  Type = "feat";
  Scope = "cmdlet";
  Description = "Get-ReleaseNotes";
  GitUser = "sgkens";
  GitGroup = "phellams";
  Notes            = @(
    "ADD: New cmdlet `Get-ReleaseNotes` that includes parameters to filter release notes based on commit message body, notes, feature additions, feature updates, and breaking changes.",
    "ADD: Additional parameters to output the generated release notes as Markdown, Hashtable, or as a String array containing commit message headers only.",
    "ADD: Logic to parse commit body notes starting with '-' and dynamically add them to commit message category arrays based on cmdlet parameters.",
    "ADD: logic to parse `git log` from `origin/main` or `origin/master` and generate an exclusion array of commit hashes, with dynamic generation based on the current branch name.",
    "ADD: New parameters to include a commit link prefix for each commit message category, with the prefix supporting GitHub, GitLab, Gitea, or a custom value.",
    "ADD: Parameter to specify a custom prefix for commit links.",
    "ADD: Debug output via `[CmdletBinding]` inheritance, enabling the `-Debug` parameter.",
    "ADD: New private cmdlet Remove-Emojis to remove emojis from commit message strings.",
    "UPDATE: Module manifest to include `Get-ReleaseNotes`.",
    "UPDATE: Module Root to include `Get-CommitFusionModuleInstance`.",
    "FIX: string output spacing for message categories."
  );

  FeatureAdditions = @(
    "Generate release notes from Git log commit message headers as a Markdown bullet point list using the `Get-ReleaseNotes -OnlyMessageHead` cmdlet.",
    "Generate release notes from Git log commit message bodies grouped by type (Notes, Feature Notes, Breaking Changes, Feature Additions, or Feature Updates) using the corresponding parameters: `-Notes`, `-FeaturesNotes`, `-BreakingChanges`, `-FeatureAdditions`, or `-FeatureUpdates`.",
    "Generate release notes with commit links for each commit message category using the `-CommitLink` and `-CommitLinkPrefix` parameters.",
    "Output release notes as `[System.Object[]]` or an array `@()` using the `-AsObject` parameter switch."
  );

  # BugFixes = @(
  #   "- Emojis that were output to the console within a PSObject disrupt the alignment of the object, throwing other field alignments off.",
  #   "- FIX: `Select-Object` to manually output in order so that emoji is last; this fixed the alignment."
  # );
  #BreakingChanges = @();
  # FeatureNotes = @(
  #   "Package available on PowerShell Gallery.",
  #   "Package available on chocolatey.org."
  #   "package available on gitlab.com"
  #   "Documentation hosting provided by GitLab Pages: https://sgkens.gitlab.io/commitfusion/"
  # );
  #AsString = $true #Default is $true
  footer = $true
}

# ACTIONS
# -------

# ConventionalCommit with params sent commit
New-Commit @Params

# ConventionalCommit with params sent commit
#New-Commit @Params | Set-Commit

# ConventionalCommit with params, written to changelog and sent commit
#New-Commit @Params | Format-FusionMD | Update-ChangeLog -logfile .\changelog.md | Set-Commit