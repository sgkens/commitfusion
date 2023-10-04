<#
  Commit Fusion template file
  use to create large detailed commits
#>
using module g:\devspace\projects\powershell\_repos\CommitFusion\CommitFusion.psm1

$Params = @{
  Type = "refactor";
  Scope = "``Module``";
  Description = "Updated the CommitFusion module to include a new ``cmdlet`` called ``Send-Commit``";
  Body = @(
    "Changed spacing for ``bodyvar``",
    "AsStringForCommit now returns a clean spaced string for git commit",
    "Updated psd1 module file",
    "Updated psm1 module root file",
    "Updated Git-AutoVersion ``cmdlet``",
    "Refactored Send-Commit ``cmdlet``",
    "purged template.md and template_final.md file contents",
    "Removed Write-FusionToLog ``cmdlet``",
    "Adding Commit-Helper script file",
    "Changed ``Send-Commit`` to ``Set-Commit``"
  );
  #Footer = "";
  GitUser = "sgkens";
  GitGroup = "ccharp";
  # FeatureAddtions = @(
  #   "Exposes all methods and properties of the Table and Rule class"
  #   "``New-Object Spectre.Console.Table`` and ``New-Object Spectre.Console.Rule``"
  # );
  #BugFixes = @();
  #BreakingChanges = @();
  #FeatureNotes = @();
  #AsString = $true #Default is $true
}

# ACTIONS
# -------

# ConventionalCommit with params sent commit
New-ConventionalCommit @Params

# ConventionalCommit with params sent commit
#New-ConventionalCommit @Params | Set-Commit

# ConventionalCommit with params, written to changelog and sent commit
#New-ConventionalCommit @Params | Format-FusionMD | Update-ChangeLog -logfile .\changelog.md | Set-Commit