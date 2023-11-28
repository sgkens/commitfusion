using module .\Write-GLIPParagraph.psm1
$paragraph  = Write-GLIPParagraph -Length 20
$paragraph1 = Write-GLIPParagraph -Length 50
$paragraph2 = Write-GLIPParagraph -Length 200
$paragraph3 = Write-GLIPParagraph -Length 60
$paragraph4 = Write-GLIPParagraph -Length 20
Write-host -ForegroundColor Green "Paragragh"
Write-Host $paragraph
write-host "---------------------"
Write-Host $paragraph1
Write-host -ForegroundColor Green "Paragragh"
write-host "---------------------"
Write-Host $paragraph2
Write-host -ForegroundColor Green "Paragragh"
write-host "---------------------"
Write-Host $paragraph3
Write-host -ForegroundColor Green "Paragragh"
write-host "---------------------"
Write-Host $paragraph4
Write-host -ForegroundColor Green "Paragragh"