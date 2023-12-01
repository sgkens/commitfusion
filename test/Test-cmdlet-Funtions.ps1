Using module ..\CommitFusion.psm1
# Example usage
#$commit = New-Object ConventionalCommit("feat", "users", "add the ability to change passwords", "Users can now change their passwords from the profile settings page. The password change functionality includes basic password validation and secure password storage.", "Fixes #123")
#Write-Host $commit.AsString()

#$randomname = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count 5 | % {$_}
#new-item -Type file -name "$randomname`_customfile" -value "$randomname`_customfile value for testing"

Write-host -ForegroundColor green "####################### TESTS #######################"
Write-host -ForegroundColor green "------------------------------------------------------"
Write-host -ForegroundColor green "####################### Get-CommitFusionModuleInstance #######################"

Get-CommitFusionModuleInstance

Write-host -ForegroundColor green "#######################| Get-CiSet |#######################"
Get-CiSet | Select-Object -First 100 | Format-Table -AutoSize -wrap

Write-host -ForegroundColor green "#######################| Get-CiSetFusion |#######################"
Get-CiSetFusion | Select-Object -First 100 | Format-Table -AutoSize -wrap

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
$myCF

# Simple test New-ConventionalCommit switch parameters
Write-host -ForegroundColor green "#######################| New-ConventionalCommit as Switch |#######################"
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library"
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx"
New-ConventionalCommit -Type build -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell"
New-ConventionalCommit -Type bookmark -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note")
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note") -Scope "UserAdmin"
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random")
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note")
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note") -BreakingChanges @("breakingchanges 1", "another breaking change note")
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note") -BreakingChanges @("breakingchanges 1", "another breaking change note")
New-ConventionalCommit -Type feat -Description "CommitFusion PowerShell class library" -Footer -GitUser "snoonx" -GitGroup "Powershell" -FeatureAddtions @("featurenotes 1", "another feature note") -Scope "UserAdmin" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages", "Return string with or without markdown tags", "Return object commit string with commit components", "Write commit message to template file", "Prepend commit message to changelog file", "Append Changelog contents inbetween costom markers in the readme.md file", "Return Emoji Index as object array", "Return Gitmoji Index as object array", "Search gitMoji index for emoji by name return EmojiCon Icon", "Random feature note: create a random string of characters to use as a filename", "Random") -BugFixes @("bugfixnotes 1", "another bugfix note") -BreakingChanges @("breakingchanges 1", "another breaking change note")
#----------------------------#
#! EXAMPLE CC FULL ALL OPTIONS
#----------------------------#
Write-host -ForegroundColor green "#######################| New-ConventionalCommit as String |#######################"
New-ConventionalCommit -type "feat" `
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
                                        -footer `
                                        -GitUser "snoonx" `
                                        -GitGroup "Powershell" `
                                        -FeatureAddtions @("featurenotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher feature") `
                                        -BugFixes @("bugfixnotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher bugfix") `
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
                                        -AsString

Write-host -ForegroundColor green "#######################| convenc_object returned as object |#######################"
New-ConventionalCommit  -type "changes" `
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
        "Random") `
        -footer `
        -GitUser "snoonx" `
        -GitGroup "Powershell" `
        -FeatureAddtions @("featurenotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher feature") `
        -BugFixes @("bugfixnotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher bugfix") `
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
        -AsObject


Write-host -ForegroundColor green "#######################| convenc_object returned as String Minimal Params |#######################"
New-ConventionalCommit -Type "docs" -Scope "``Updated Readme``" -Description "CommitFusion PowerShell class library1" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages") -AsString
New-ConventionalCommit -Type "feat" -Scope "``Updated Readme``" -Description "CommitFusion PowerShell class library1" -Body @("Generate Conventionl Commit messages, with the ability to add custom messages") -AsString

New-ConventionalCommit -Type "docs" -Scope "``Updated Readme``" -Description "CommitFusion PowerShell class library1" 

Write-host -ForegroundColor green "#######################| Format-FusionMD |#######################"
New-ConventionalCommit  -type "changes" `
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
        "Random") `
        -footer `
        -GitUser "snoonx" `
        -GitGroup "Powershell" `
        -FeatureAddtions @("featurenotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher feature") `
        -BugFixes @("bugfixnotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher bugfix") `
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
        -AsString | Format-FusionMD
Write-host -ForegroundColor green "#######################| Format-FusionMD | Update-ChangeLog |#######################"
New-ConventionalCommit  -type "changes" `
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
        "Random") `
        -footer `
        -GitUser "snoonx" `
        -GitGroup "Powershell" `
        -FeatureAddtions @("featurenotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher feature") `
        -BugFixes @("bugfixnotes 1 Build Test Field agains modules versions older than 2.1.9", "anotsaafher bugfix") `
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
        -AsString | Format-FusionMD | Update-ChangeLog -logfile '.\test\changelog.md'


# Write-host -ForegroundColor green "#######################| Out-Object |#######################"
# $Object = $convenc | Out-Object
# $Object
# Write-host -ForegroundColor green "#######################| Out-String |#######################"
# $String = $convenc | Out-String
# $String 