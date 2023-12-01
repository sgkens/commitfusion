find-module -name PSScriptAnalyzer -Repository PSGallery | install-module -Scope CurrentUser -Force -SkipPublisherCheck
Import-Module -Name PSScriptAnalyzer   
Invoke-ScriptAnalyzer -Path '.\dist\CommitFusion' -Recurse -severity warning -excluderule PSUseBOMForUnicodeEncodedFile,PSAvoidUsingWriteHost