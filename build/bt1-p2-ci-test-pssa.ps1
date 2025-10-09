#---CONFIG----------------------------
$modulename = "commitfusion"
#---CONFIG----------------------------

Invoke-ScriptAnalyzer -Path .\dist\$modulename `
                      -Recurse `
                      -severity warning `
                      -excluderule PSUseBOMForUnicodeEncodedFile,PSAvoidUsingWriteHost || exit 1