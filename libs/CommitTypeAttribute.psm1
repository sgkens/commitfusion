<#
    Description:
        This attribute is used to validate the commit type argument.
        It is used in the New-Commit function.
#>
class CommitTypeAttribute : System.Management.Automation.ArgumentTransformationAttribute {
    [object] Transform([System.Management.Automation.EngineIntrinsics] $engineIntrinsics, [object] $inputData) {
        $validValues = (Get-CommitTypes -Raw).type

        if ($validValues -contains $inputData) {
            return $inputData
        }
        else {
            throw "Invalid commit type. Valid types are: $($validValues -join ', ')"
        }
    }
}