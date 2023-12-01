Using module ..\libs\CommitFusion_class.psm1
using module ..\tools\GLIPParagraph\Write-GLIPParagraph.psm1
# Example usage
#$commit = New-Object ConventionalCommit("feat", "users", "add the ability to change passwords", "Users can now change their passwords from the profile settings page. The password change functionality includes basic password validation and secure password storage.", "Fixes #123")
#Write-Host $commit.AsString()

#$randomname = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count 5 | % {$_}
#new-item -Type file -name "$randomname`_customfile" -value "$randomname`_customfile value for testing"
$cc = New-Object CommitFusion
$cs1 = New-Object CommitFusion
$randomNotes = get-random -minimum 1 -maximum 10
$Description = Write-GLIPParagraph -Length (get-random -minimum 3 -maximum 10)

$body = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $body += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
$FeatureAddtions = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $FeatureAddtions += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
$BugFixes = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $BugFixes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
$BreakingChanges = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $BreakingChanges += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
$FeatureNotes = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $FeatureNotes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
Write-host -ForegroundColor green "##########------------[All Options ]------#############"
$cc.ConventionalCommit(
        "Deadcode", # Specifies the purpose or nature of the commit, #! 1
        "removed", # Specifies the scope of the commit, #! 2
        $Description, # Provides a succinct description of the change #! 3
        $body, #! 4
        $true, # Footer is optional #! 5
        "sgkens", # Specifies the author of the commit #! 6
        "PowerShell",  # Specifies gitlab|github group for use with commit string url generation #! 7
        $FeatureAddtions, #! 8
        $BugFixes, #! 9
        $FeatureNotes, #! 10
        $BreakingChanges #! 11a
)

Write-host -ForegroundColor green "##########------------[No Feature BugFixes, Feature Addtions feature notes, Breaking Changes ]------#############"
$cs1.ConventionalCommit(
        "feature", # Specifies the purpose or nature of the commit, #! 1
        "New Feature", # Specifies the scope of the commit, #! 2
        $Description, # Provides a succinct description of the change #! 3
        $body, #! 4
        $false, # Footer is optional #! 5
        "sgkens", # Specifies the author of the commit #! 6
        "PowerShell", # Specifies gitlab|github group for use with commit string url generation #! 7
        $null,#$FeatureAddtions, #! 8
        $null, #$BugFixes, #! 9
        $null, #$FeatureNotes, #! 10
        $null #$BreakingChanges #! 11
)
$cs1.AsString()
$cs1.AsStringForCommit()
$cs1.AsObject()
# Return the object as a PSObject
Write-host -ForegroundColor green "##########------------[AsObject]------#############"
$cc.AsObject() | Format-Table -AutoSize -wrap

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

Write-host -ForegroundColor green "##########------------[AsString]------############" 
# Commit Message to use for the Git Commit
$cc.AsString()
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

Write-host -ForegroundColor green "##########------------[AsStringForCommit]------############"
# Commit Message to use for the Git Commit
$cc.AsStringForCommit()

Write-host -ForegroundColor green "##########------------[AsRawString]------############"
$cc.AsRawString()
write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow
# Get the emoji for the commit type
Write-host -ForegroundColor green "##########------------[GetEmojis]------############" 
$cc.GetEmoji("miscmojis", "puzzle_piece")
$cc.GetEmoji("gitmojis", "art")

# Get emojiindex from jsonfile
#$cc.GetEmojiIndex("gitmojis") | Format-Table -AutoSize -wrap # gitmojis
# Get emojiindex from jsonfile
#$cc.GetEmojiIndex("miscmojis") | Format-Table -AutoSize -wrap # miscmojis

# Retrieve parsed git ci set from gitmojis.json File
Write-host -ForegroundColor green "##########------------[GetCiSet]------#############"
$cc.GetCiSet() | Format-Table -AutoSize -wrap

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

# Retrieve parsed git ci set from CommitFusion.json File
Write-host -ForegroundColor green "##########------------[GetCiSet]------#############"
$cc.GetCiSetFusion() | Format-Table -AutoSize -wrap

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

Write-host -ForegroundColor green "##########------------[WriteTemplateFile]------###########"
$cc.WriteTemplateFile()

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

# write-templated message to file
Write-host -ForegroundColor green "##########------------[WriteClMessage]------##############"
$cc.WriteClMessage(".\test\changelog.md")

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

# Prases a string and remove unwated char for Json PSObject Conversion


#TODO: Create new.md file to hold the gendate AsString
#TODO: Create function to join template_final & autogen.md output and output to {path to changelog} after string "CHANGELOG"
#TODO    - if CHANGELOG is not found in {path to changelog}.md do not append to file
#TODO    - if CHANGELOG is found remove all text after CHANGELOG and append new text


# Write-host -ForegroundColor green "----------------------------------------------------------"
# Write-host -ForegroundColor green "**********------------[ConventionalCommit]------**********"
# Write-host -ForegroundColor green "----------------------------------------------------------"

# Write-host -ForegroundColor Yellow "----------------------------------------------------------"
# Write-host -ForegroundColor green "----------------------------------------------------------"