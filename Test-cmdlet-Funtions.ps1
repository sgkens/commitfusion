Using module .\CommitFusion.psm1
# Example usage
#$commit = New-Object ConventionalCommit("feat", "users", "add the ability to change passwords", "Users can now change their passwords from the profile settings page. The password change functionality includes basic password validation and secure password storage.", "Fixes #123")
#Write-Host $commit.AsString()

#$randomname = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count 5 | % {$_}
#new-item -Type file -name "$randomname`_customfile" -value "$randomname`_customfile value for testing"

Write-host -ForegroundColor green "####################### TESTS #######################"
Write-host -ForegroundColor green "####################### ##### #######################"

Write-host -ForegroundColor green "#######################| Get-CiSet |#######################"
Get-CiSet

Write-host -ForegroundColor green "#######################| Get-CiSetFusion |#######################"
Get-CiSetFusion

Write-host -ForegroundColor green "#######################| Get-EmojiIndex->gitmojis |#######################"
Get-EmojiIndex "gitmojis" | Select-Object -First 100 | Format-Table -AutoSize -wrap

Write-host -ForegroundColor green "#######################| Get-EmojiIndex->miscmojis |#######################"
Get-EmojiIndex "miscmojis" | Select-Object -First 100 | Format-Table -AutoSize -wrap

Write-host -ForegroundColor green "#######################| Get-Emoji |#######################"
Get-Emoji -type "gitmojis" -name "art" 
Get-Emoji -type "miscmojis" -name "puzzle_piece"
Get-Emoji -type "gitmojis" -name "zap"

Write-host -ForegroundColor green "#######################| Get-GitAutoVersion |#######################"
Get-GitAutoVersion

Write-host -ForegroundColor green "#######################| New-CommitFusion |#######################"
$myCF = New-CommitFusion

#----------------------------#
#! EXAMPLE CC FULL ALL OPTIONS
#----------------------------#
Write-host -ForegroundColor green "#######################| New-ConventionalCommit as String |#######################"
$convenc_string = New-ConventionalCommit       -type "changes" `
                                        -scope "``UserAdmin``" `
                                        -description "CommitFusion PowerShell class library1" `
                                        -body @(
                                                        "Generate Conventionl Commit messages, with the ability to add custom messages",
                                                        "Return string with or without markdown tags",
                                                        "Return object commit string with commit components",
                                                        "Write commit message to template file",
                                                        "Prepend commit message to changelog file",
                                                        "Append Changelog contents inbetween costom markers in the readme.md file",
                                                        "Return Emoji Index as object array",
                                                        "Return Gitmoji Index as object array",
                                                        "Search gitMoji index for emoji by name return EmojiCon Icon",
                                                        "Random feature note: create a random string of characters to use as a filename",
                                                        "Random"
                                                ) `
                                        -footer "Made with love!" `
                                        -GitUser "snoonx" `
                                        -GitGroup "Powershell" `
                                        -BreakingChanges @("breakingnotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher breaking change") `
                                        -FeatureNotes @("Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: ***create*** a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name", 
                                        "Random feature note: create a random string of characters to use as a Directory name") `
                                        -String
$convenc_string

Write-host -ForegroundColor green "#######################| convenc_object returned as object |#######################"
$convenc_object = New-ConventionalCommit       -type "changes" `
        -scope "``UserAdmin``" `
        -description "CommitFusion PowerShell class library1" `
        -body @(
        "Generate Conventionl Commit messages, with the ability to add custom messages",
        "Return string with or without markdown tags",
        "Return object commit string with commit components",
        "Write commit message to template file",
        "Prepend commit message to changelog file",
        "Append Changelog contents inbetween costom markers in the readme.md file",
        "Return Emoji Index as object array",
        "Return Gitmoji Index as object array",
        "Search gitMoji index for emoji by name return EmojiCon Icon",
        "Random feature note: create a random string of characters to use as a filename",
        "Random"
) `
        -footer "Made with love!" `
        -GitUser "snoonx" `
        -GitGroup "Powershell" `
        -BreakingChanges @("breakingnotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher breaking change") `
        -FeatureNotes @("Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: ***create*** a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name", 
        "Random feature note: create a random string of characters to use as a Directory name") `
        -Object
$convenc_object

Write-host -ForegroundColor green "#######################| Format-FusionMD |#######################"
$FusionMD = $convenc_string | Format-FusionMD
$FusionMD
Write-host -ForegroundColor green "#######################| Format-FusionMD | Update-ChangeLog |#######################"
$ChangeLog = $convenc_string | Format-FusionMD | Update-ChangeLog -logfile ".\CHANGELOG-CF.md"
$ChangeLog
# Write-host -ForegroundColor green "#######################| Out-Object |#######################"
# $Object = $convenc | Out-Object
# $Object
# Write-host -ForegroundColor green "#######################| Out-String |#######################"
# $String = $convenc | Out-String
# $String 