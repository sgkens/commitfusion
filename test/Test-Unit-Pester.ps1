import-module -name .\commitfusion.psd1
import-module -name .\tools\GLIPParagraph\Write-GLIPParagraph.psm1


BeforeAll {
  $Notes = @()
  for ($x = -1; $x -lt $randomNotes; $x++) {
    $Notes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
  }
  $FeatureAddtions = @()
  for ($x = -1; $x -lt $randomNotes; $x++) {
    $FeatureAddtions += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
  }
  $BugFixes = @()
  for ($x = -1; $x -lt $randomNotes; $x++) {
    $BugFixes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
  }
  $BreakingChanges = @()
  for ($x = -1; $x -lt $randomNotes; $x++) {
    $BreakingChanges += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
  }
  $FeatureNotes = @()
  for ($x = -1; $x -lt $randomNotes; $x++) {
    $FeatureNotes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
  }
  $params = @{
    Type            = "feat"
    Scope           = "test"
    Description     = "test"
    Notes           = "test"
    FeatureAddtions = $FeatureAddtions
    BugFixes        = $BugFixes
    FeatureNotes    = $FeatureNotes
    BreakingChanges = $BreakingChanges
    gituser         = "sgkens"
    gitgroup        = "PowerShell"
  }
}

Describe "cmdlets" {
  
  it "Get-CommitFusionModuleInstance Should be Object of TypeName CommitFusion" {
    (Get-CommitFusionModuleInstance).GetType().Name | should -be "CommitFusion"
  }
  
  it "New-Commit Should Return multi-line string" {
    New-Commit @params | should -match "(✨ feat\(test\): test)"
  }
  
  it "Format-FusionMD Should Return multi-line string with markdown styling" {
    New-Commit @params | 
    Format-FusionMD | should -match "(## 🎯-✨ feat\(test\): test)"
  }
  
  it "New-Commit default description - Should Return string" {
    New-Commit -type "feat" -scope "test" -Notes "test" | should -match "(✨ feat\(test\): Introduce new features.)"
  }

  it "New-Commit default description no scope - Should Return string" {
    New-Commit -type "feat" -Notes "test" | should -match "(✨ feat: Introduce new features.)"
  }
  
  it "New-Commit -AsObject - Should Return Object" {
    (New-Commit -type "feat" -Description "test" -Notes "test" -AsObject).gettype().name | should -be Hashtable
  }
  
  it "New-Commit -AsString - Should Return String" {
    (New-Commit -type "feat" -Notes "safas" -description "test" -AsString).gettype().name   | should -be String
  }

  it "Update-Changelog - Should Return [string] match 'response: success'" {
    #TODO: Unsure if this function is needed, but it is here for now
    New-Commit @params | 
    Format-FusionMD | 
    Update-Changelog -logfile .\tools\CHANGELOG-Test.md | should -match "{'response':'success','message':'(.*?)'}"
  }

  it "Set-commit - Should Return [String]" {
    #TODO: NOTE! Unsure if this function is needed, but it is here for now
    New-Commit @params | Set-commit -Test | should -match "✨ feat\(test\): test`n`n🧰 Build: minor`n`n.*"
  }

  it "Get-CommitTypes Should Return System.Object[]" {
    (Get-CommitTypes).gettype() | should -be System.Object[]
    (Get-CommitTypes -nosemver).gettype() | should -be System.Object[]
    (Get-CommitTypes -major).gettype() | should -be System.Object[]
    (Get-CommitTypes -minor).gettype() | should -be System.Object[]
    (Get-CommitTypes -patch).gettype() | should -be System.Object[]
  }

  it "Get-CiSet Should Return System.Object[]" {
    (get-CiSet).gettype() | should -be System.Object[]
  }

  it "Get-EmojiIndex 'Type'='miscmojis|gitmojis' Should Return System.Object[]" {
    (Get-EmojiIndex -emojiType miscmojis).gettype() | should -be System.Object[]
    (Get-EmojiIndex -emojiType gitmojis).gettype() | should -be System.Object[]
  }

  it "Get-Emoji 'Type'='gitmojis' Should Return [System.String]" {
    (Get-Emoji -type gitmojis -name bug).gettype() | should -be string
    (Get-Emoji -type miscmojis -name bug).gettype() | should -be string
  }

  it "get-gitAutoVersion Should Return [PSCustomObject]" {
    (get-gitAutoVersion).gettype() | should -be PSCustomObject
  }

  it "New-CommitFusion Should return [CommitFusiont]" {
    (New-CommitFusion).GetType() | should -be "CommitFusion"
  }
}
