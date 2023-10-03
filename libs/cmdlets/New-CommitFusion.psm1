using module ..\CommitFusion_class.psm1
Function New-CommitFusion() {
    [cmdletbinding()]
    [OutputType([object])]
    param()

    Begin { }

    process {  Return New-Object CommitFusion }

    end { }
}

Export-Modulemember -Function New-CommitFusion
