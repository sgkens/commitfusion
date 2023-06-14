using module ..\CommitFusion_class.psm1
Function New-CommitFusion() {
    [cmdletbinding()]
    param()

    Begin { }

    process {  Return New-Object CommitFusion }

    end { }
}

Export-Modulemember -Function New-CommitFusion
