<#
  Commit Fusion template file
  use to create large detailed commits
#>
$Params = @{
  Type = "feat";
  Scope = "cmdlet";
  Description = "New Cmdlets & Emoji Output Option Toggle";
  GitUser = "sgkens";
  GitGroup = "phellams";
  Notes            = @(

  );

  FeatureAdditions = @(
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