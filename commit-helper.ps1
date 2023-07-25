using module g:\devspace\projects\powershell\_repos\CommitFusion\CommitFusion.psm1

$Params = @{
  Type = "refactor";
  Scope = "``Main Class``";
  Description = "Fix spacing and newlines ouput";
  Body = @(
    "Changed spacing for ``bodyvar``",
    "AsStringForCommit now returns a clean spaced string for git commit",
    "Updated psd1 module file",
    "Updated psm1 module root file",
    "Updated Git-AutoVersion ``cmdlet``",
    "Refactored Send-Commit ``cmdlet``",
    "purged template.md and template_final.md file contents",
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


New-ConventionalCommit @Params #| Format-FusionMD | Update-ChangeLog -logfile .\changelog.md | send-commit