using module ..\tools\GLIPParagraph\Write-GLIPParagraph.psm1
Import-Module -Name ..\
# Example usage
#$commit = New-Object ConventionalCommit("feat", "users", "add the ability to change passwords", "Users can now change their passwords from the profile settings page. The password change functionality includes basic password validation and secure password storage.", "Fixes #123")
#Write-Host $commit.AsString()

#$randomname = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count 5 | % {$_}
#new-item -Type file -name "$randomname`_customfile" -value "$randomname`_customfile value for testing"

$randomNotes = get-random -minimum 1 -maximum 10
$Description = Write-GLIPParagraph -Length (get-random -minimum 3 -maximum 10)

$notes = @()
for ($x = -1; $x -lt $randomNotes; $x++) {
    $notes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
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

$commitData = @{
    Type = "Deadcode"
    Scope = "removed"
    Description = $Description
    Notes = $notes
    Footer = $true
    GitUser = "sgkens"
    GitGroup = "PowerShell"
    FeatureAdditions = $FeatureAddtions
    BugFixes = $BugFixes
    FeatureNotes = $FeatureNotes
    BreakingChanges = $BreakingChanges
    ForMarkdown = $false
}
[string[]]$types = (Get-Committypes -Raw).type -join '","'

foreach($type in $types){
    
    New-Commit @commitData | Set-commit -confirm
}
