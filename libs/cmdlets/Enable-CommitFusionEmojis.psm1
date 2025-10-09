<#
.SYNOPSIS


.DESCRIPTION


.PARAMETER WriteTemplateFile


.EXAMPLE


.NOTES

#>

function Enable-CommitFusionEmojis {
    [CmdletBinding()]
    param()
    process{ (Get-CommitFusionModuleInstance).EnableEmojis() }
    end {}
}