Using module libs\CommitFusion_class.psm1
using module libs\modules\GLIPParagraph\Write-GLIPParagraph.psm1
# Example usage
#$commit = New-Object ConventionalCommit("feat", "users", "add the ability to change passwords", "Users can now change their passwords from the profile settings page. The password change functionality includes basic password validation and secure password storage.", "Fixes #123")
#Write-Host $commit.AsString()

#$randomname = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count 5 | % {$_}
#new-item -Type file -name "$randomname`_customfile" -value "$randomname`_customfile value for testing"
$cc = New-Object CommitFusion

$randomNotes = get-random -minimum 1 -maximum 10
$Description = Write-GLIPParagraph -Length (get-random -minimum 3 -maximum 10)

$body = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $body += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
$BreakingChanges = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $BreakingChanges += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}
$FeatureNotes = @()
for($x=-1;$x -lt $randomNotes;$x++){
        $FeatureNotes += Write-GLIPParagraph -Length (get-random -minimum 10 -maximum 20)
}

$cc.ConventionalCommit(
        "feature", # Specifies the purpose or nature of the commit,
        "v0.1.0", # Specifies the scope of the commit,
        $Description, # Provides a succinct description of the change
        $body,
        "Made with love!", # Footer is optional
        "snoonx", # Specifies the author of the commit
        "PowerShell",  # Specifies gitlab|github group for use with commit string url generation
        $FeatureNotes,
        $BreakingChanges
)

# Get the emoji for the commit type
$cc.GetEmoji("miscmojis", "puzzle_piece")
$cc.GetEmoji("gitmojis", "art")

# Get emojiindex from jsonfile
#$cc.GetEmojiIndex("gitmojis") | Format-Table -AutoSize -wrap # gitmojis
# Get emojiindex from jsonfile
#$cc.GetEmojiIndex("miscmojis") | Format-Table -AutoSize -wrap # miscmojis

# Retrieve parsed git ci set from gitmojis.json File
Write-host -ForegroundColor green "###########################################################"
Write-host -ForegroundColor green "##########------------[GetCiSet]------#############"
Write-host                        "########## Returns the CommitFusion Config Json Object as a PSObject"
Write-host -ForegroundColor green "------------------------[Output]--------------------------"
$cc.GetCiSet() | Format-Table -AutoSize -wrap
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"
# Retrieve parsed git ci set from CommitFusion.json File
Write-host -ForegroundColor green "###########################################################"
Write-host -ForegroundColor green "##########------------[GetCiSet]------#############"
Write-host                        "########## Returns the CommitFusion Config Json Object as a PSObject"
Write-host -ForegroundColor green "------------------------[Output]--------------------------"
$cc.GetCiSetFusion() | Format-Table -AutoSize -wrap
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"
# Return the object as a PSObject
Write-host -ForegroundColor green "###########################################################"
Write-host -ForegroundColor green "##########------------[AsObject]------#############"
Write-host                        "########## Returns the CommitFusion ConventionalCommit object as a PSObject"
Write-host -ForegroundColor green "------------------------[Output]--------------------------"
$cc.AsObject() | Format-Table -AutoSize -wrap
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

Write-host -ForegroundColor green "##########################################################"
Write-host -ForegroundColor green "##########------------[AsString]------############"
Write-host                        "########## Calls the AsString() Method string without markdown tags"
Write-host -ForegroundColor green "------------------------[Output]--------------------------"
# Commit Message to use for the Git Commit
$cc.AsString()
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

Write-host -ForegroundColor green "##########################################################"
Write-host -ForegroundColor green "##########------------[AsStringForCommit]------############"
Write-host                        "########## Calls the AsStringForCommit() Method string without markdown tags"
Write-host -ForegroundColor green "------------------------[Output]--------------------------"
# Commit Message to use for the Git Commit
$cc.AsStringForCommit()
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

Write-host -ForegroundColor green "##########################################################"
Write-host -ForegroundColor green "##########------------[WriteTemplateFile]------###########"
Write-host                        "########## Writes the template.md file to changelog-cf.md file"
Write-host -ForegroundColor green "------------------------[Output]--------------------------"
$cc.WriteTemplateFile()
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

# write-templated message to file
Write-host -ForegroundColor green "##########################################################"
Write-host -ForegroundColor green "##########------------[WriteClMessage]------##############"
Write-host                        "########## Pe-prend the changelog.md file with the template.md file with the commit message"
$cc.WriteClMessage("C:\users\gsnow\Desktop\changelog.md")
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

write-host "----|"-ForegroundColor yellow
write-host "----|" -ForegroundColor yellow

# Git Auto Version Generation Base on git messages major.minor.patch
# write-templated message to file
Write-host -ForegroundColor green "##########################################################"
Write-host -ForegroundColor green "##########------------[GitAutoVersion]------###########"
Write-host                        "########## Calls the GitAutoVersion() Method"
$cc.GitAutoVersion()
Write-host -ForegroundColor green "##########--------------[End-Output]----------------------"

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