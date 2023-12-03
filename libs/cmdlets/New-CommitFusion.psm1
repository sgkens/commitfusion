using module ..\CommitFusion_class.psm1

<#
.SYNOPSIS
Returns a new instance of the commit fusion class, if you would like to use the class directly

NOTE! 
You can include the class file from $moduleroot/libs/commitfusion_class.psm1
using module $moduleroot/libs/commitfusion_class.psm1
.DESCRIPTION
Returns a new instance of the commit fusion class, if you would like to use the class directly

.EXAMPLE
$CCI = New-CommitFusion
$CCI.ConventionalCommit(...

.INPUTS
- Type
- Name

.OUTPUTS
[System.Object] Type CommitFusion

.NOTES
- 

.LINK
#>
Function New-CommitFusion() {
    [cmdletbinding()]
    [OutputType([object])]
    [Alias("ncf")]
    param()

    Begin { }

    process {  Return New-Object CommitFusion }

    end { }
}

Export-Modulemember -Function New-CommitFusion
