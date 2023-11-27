#---CONFIG----------------------------

# ModuleName
$moduleName  = "commitfusion"
$psmpacker_v = '0.1.5'
# Include
$Files       = "commitfusion.psm1", "commitfusion.psd1", "LICENSE", "icon.png"
$folders     = "libs"
$exclude     = "Issue#1.txt"

#---CONFIG----------------------------


if (Get-Module -ListAvailable -name 'psmpacker' | Where-Object { $_.version -eq "$psmpacker_v.0" }) {
    install-module -name psmpacker -repository powershell -MinimumVersion 0.1.5
}
import-module -name psmpacker -MinimumVersion $psmpacker_v

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