using module ..\PSMPacker\PSMPacker.psm1 
using module .\libs\cmdlets\Get-GitAutoVersion.psm1

$AutoVersion = (Get-GitAutoVersion).NewVersion

Build-Module -SourcePath .\ `
             -DestinationPath .\dist `
             -Name "commitfusion" `
             -IncrementVersion None `
             -FilesToCopy "commitfusion.psm1","commitfusion.psd1","LICENSE","icon.png" `
             -ExcludedFiles "Issue#1.txt" `
             -FoldersToCopy "libs" `
             -Manifest `
             -Version $AutoVersion