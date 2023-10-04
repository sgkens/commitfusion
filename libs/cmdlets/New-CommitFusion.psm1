Using Module ..\CommitFusion_class.psm1
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
