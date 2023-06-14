using module ..\CommitFusion_class.psm1
Function Get-CiSet(){
    [CmdletBinding()]
    param()
    process {
        return  $global:commitfusion.GetCiSet() | Format-Table -AutoSize -wrap
    }

}
Export-ModuleMember -Function Get-CiSet