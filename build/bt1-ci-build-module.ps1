#---CONFIG----------------------------

# ModuleName
$moduleName  = "commitfusion"
# Include
$Files       = "commitfusion.psm1", "commitfusion.psd1", "LICENSE", "icon.png"
$folders     = "libs"
$exclude     = "Issue#1.txt"

#---CONFIG----------------------------

$AutoVersion = (Get-GitAutoVersion).Version

Build-Module -SourcePath .\ `
             -DestinationPath .\dist `
             -Name $moduleName  `
             -IncrementVersion None `
             -FilesToCopy $Files `
             -ExcludedFiles $exclude `
             -FoldersToCopy $folders `
             -Manifest `
             -Version $AutoVersion