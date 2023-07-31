Function New-ConventionalCommit {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        # valuedateset Dynamic values
        [ValidateScript({
            if($_ -in (Get-CiSetFusion).type){
                $true
            }else{
                throw "Invalid Type '$($_)', please use one of the following values: $((Get-CiSetFusion).type -join ',')"
            }
        })]
        [string]$Type,

        [Parameter(Mandatory = $false, Position = 1)]
        [string]$Scope,

        [Parameter(Mandatory = $true, Position = 2)]
        [string]$Description,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string[]]$Body,

        [Parameter(Mandatory = $false)]
        [string]$Footer,

        [Parameter(Mandatory = $false)]
        [string]$GitUser,

        [Parameter(Mandatory = $false)]
        [string]$GitGroup,

        [Parameter(Mandatory = $false)]
        [string[]]$FeatureAddtions,
            
        [Parameter(Mandatory = $false)]
        [string[]]$BugFixes,

        [Parameter(Mandatory = $false)]
        [string[]]$FeatureNotes,

        [Parameter(Mandatory = $false)]
        [string[]]$BreakingChanges,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$AsString,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$AsObject,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$AsJson,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$AsXml
    )

    process {
        if($null -eq $Body){
            $Body = $null
        }
        if($null -eq $FeatureAddtions){
            $FeatureAddtions = $null
        }
        if($null -eq $BugFixes){
            $BugFixes = $null
        }
        if($null -eq $FeatureNotes){
            $FeatureNotes = $null
        }
        if($null -eq $BreakingChanges){
            $BreakingChanges = $null
        }
        if($Footer -eq $null -or $Footer -eq ""){
            $Footer = $null
        }
        if($GitUser -eq $null){
            $GitUser = $null
        }
        if($GitGroup -eq $null){
            $GitGroup = $null
        }
        if($Scope -eq $null){
            $Scope = $null
        }
        if($AsString -and $AsObject){
            throw "Cannot use both -AsString and -AsObject"
        }
        if($AsString -and $AsJson){
            throw "Cannot use both -AsString and -AsJson"
        }
        if($AsString -and $AsXml){
            throw "Cannot use both -AsString and -AsXml"
        }
        if($AsObject -and $AsJson){
            throw "Cannot use both -AsObject and -AsJson"
        }
        
        (Get-CommitFusionModuleInstance).ConventionalCommit(
            $Type,
            $Scope,
            $Description,
            $Body,
            $Footer,
            $GitUser,
            $GitGroup,
            $FeatureAddtions,
            $BugFixes,
            $FeatureNotes,
            $BreakingChanges);

        if($AsString){
            return (Get-CommitFusionModuleInstance).AsStringForCommit()
        }
        if($AsObject){
            return (Get-CommitFusionModuleInstance).AsObject()
        }
        if($AsJson){
            return (Get-CommitFusionModuleInstance).AsObject() | ConvertTo-Json
        }
        if($AsXml){
            return (Get-CommitFusionModuleInstance).AsObject() | ConvertTo-Xml
        }
        if(-not $AsString -and -not $AsObject -and -not $AsJson -and -not $AsXml){
            return (Get-CommitFusionModuleInstance).AsStringForCommit()
        }
    }
    end {
        # Clean up any resources if needed
    }
}
Export-ModuleMember -Function New-ConventionalCommit