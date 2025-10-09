# use on a repository that has commits following the conventional commit format with extra notes.
import-module G:\devspace\projects\powershell\_repos\commitfusion
$notes = get-releasenotes -Notes -AsObject -CommitLink -CommitLinkPrefix custom -namespace 'phellams' -debug -customprefix 'gitlab.kenscloud.online'

[console]::write("`n---------------------`n")
[console]::write("The Catagories Object`n")
[console]::write("---------------------`n")
$notes['Notes:']

[console]::write("`n------------------`n")
[console]::write("The Entries Array`n")
[console]::write("------------------`n")
$notes['Notes:']['entry']

[console]::write("`n---------------------`n")
[console]::write("Only Commits Message Header`n")
[console]::write("---------------------`n")
get-releasenotes -OnlyMessageHead -debug

[console]::write("`n---------------------`n")
[console]::write("Markdown Output With Headings`n")
[console]::write("---------------------`n")
get-releasenotes -Notes