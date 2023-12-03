<#
  Commit Fusion template file
  use to create large detailed commits
#>
$Params = @{
  Type = "improve";
  Scope = "Module";
  Description = "Core functionality";
  Notes = @(
    "Updated 'constructmessage' to set an additional class property styledbodyRaw as markdown is not required.",
    "Updated cmdlets to reflect changes in class logic.",
    "Created and added commit generate script - to test individual styling between GitLabSE, GitLab, GitHub, Bitbucket, Gitea.",
    "Updated description; if no description is provided, the default value is used. See `get-citsetfusion` to view the base type description values.",
    "Updated commit-fusion default types in the JSON file to reflect Gitmoji's base with some changes.",
    "Updated CI scripts; added Coveralls integration.",
    "Added Pester coverage report generation.",
    "Updated tests for cmdlets and class logic...",
    "Refactored final commit message, adjusted spacing, and positioning.",
    "Changed ``body` to ``notes` in class and cmdlet logic.",
    "Removed CommitFusion class lib for cmdlets that don't depend.",
    "Updated cmdlets header help information.",
    "Added GitHub action for Coveralls, configured.",
    "Added additional types to ``$`moduleroot/libs/commitfusion.Types.Json`.",
    "Changed output for cmdlets to consistent spacing when outputting types, emojis, cisets to console.",
    "Updated readme",
    "updated ci-build scripts"
    "updated .nupkg package Icon"
  );
  #Footer=$true
  GitUser = "sgkens";
  GitGroup = "powershell";
  # FeatureAddtions = @(
  #   "Exposes all methods and properties of the Table and Rule class"
  #   "``New-Object Spectre.Console.Table`` and ``New-Object Spectre.Console.Rule``"
  # );
  BugFixes = @(
    "- Emojis that were output to the console within a PSObject disrupt the alignment of the object, throwing other field alignments off.",
    "- FIX: `Select-Object` to manually output in order so that emoji is last; this fixed the alignment."
  );
  #BreakingChanges = @();
  #FeatureNotes = @();
  #AsString = $true #Default is $true
}

# ACTIONS
# -------

# ConventionalCommit with params sent commit
New-ConventionalCommit @params | set-commit

# ConventionalCommit with params sent commit
#New-ConventionalCommit @Params | Set-Commit

# ConventionalCommit with params, written to changelog and sent commit
#New-ConventionalCommit @Params | Format-FusionMD | Update-ChangeLog -logfile .\changelog.md | Set-Commit