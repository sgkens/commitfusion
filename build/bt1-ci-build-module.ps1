#---CONFIG----------------------------

# ModuleName
$moduleName  = "commitfusion"
# Include
$Files       = "commitfusion.psm1", "commitfusion.psd1", "LICENSE", "icon.png"
$folders     = "libs"
$exclude     = "Issue#1.txt"

#---CONFIG----------------------------

Find-Module -name 'psmpacker' -repository 'powershell' | install-Module -force
import-module -name 'psmpacker'

$AutoVersion = (Get-GitAutoVersion).Version

Remove-Item -Path .\dist\$moduleName -Recurse -Force -ErrorAction SilentlyContinue

Build-Module -SourcePath .\ `
             -DestinationPath .\dist `
             -Name $moduleName  `
             -IncrementVersion None `
             -FilesToCopy $Files `
             -ExcludedFiles $exclude `
             -FoldersToCopy $folders `
             -Manifest `
             -Version $AutoVersion