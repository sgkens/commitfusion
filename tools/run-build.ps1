
$items = Get-ChildItem -Recurse .\dist | where-object  {$_.PSIsContainer -eq $true}
foreach($item in $items) {
    if($item.basename -eq "commitfusion"){
        [console]::writeline("Purge Dist Folder: $($item.FullName)")
        Remove-Item -Path $item.FullName -Recurse -Force
    }
    if($item.BaseName -eq "choco"){
        [console]::writeline("Purge Dist Folder: $($item.FullName)")
        Remove-Item -Path $item.FullName -Recurse -Force
    }
    if($item.BaseName -eq "nuget"){
        [console]::writeline("Purge Dist Folder: $($item.FullName)")
        Remove-Item -Path $item.FullName -Recurse -Force
    }
    if($item.BaseName -eq "psgal"){
        [console]::writeline("Purge Dist Folder: $($item.FullName)")
        Remove-Item -Path $item.FullName -Recurse -Force
    }
}
. "build\bt1-ci-build-module.ps1"
. "build\bt2-ci-create-packages.ps1" 