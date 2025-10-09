class commitypes {
    static [string[]]$typeValues
    static commitypes() {
        [commitypes]::typeValues = (Get-CommitTypes -Raw).type -join '","'
    }
}