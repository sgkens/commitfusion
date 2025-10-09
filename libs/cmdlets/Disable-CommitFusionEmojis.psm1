<#
.SYNOPSIS


.DESCRIPTION


.PARAMETER WriteTemplateFile


.EXAMPLE


.NOTES

#>

function Disable-CommitFusionEmojis {
    [CmdletBinding()]
    param()
    process{ (Get-CommitFusionModuleInstance).DisableEmojis() }
    end {}
}