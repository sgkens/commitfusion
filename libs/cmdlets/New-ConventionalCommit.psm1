<#
.SYNOPSIS
This function returns a string representing a conventional commit.

.DESCRIPTION
This function returns a string representing a conventional commit.

.EXAMPLE
New-ConventionalCommit -Type "feat" -Scope "myScope" -Description "myDescription" -Body "myBody" -Footer -GitUser "myGitUser" -GitGroup "myGitGroup" -FeatureAddtions "myFeatureAddtions" -BugFixes "myBugFixes" -FeatureNotes "myFeatureNotes" -BreakingChanges "myBreakingChanges"

.INPUTS
Type: string
Scope: string
Description: string
Body: string
Footer: switch
GitUser: string
GitGroup: string
FeatureAddtions: string
BugFixes: string
FeatureNotes: string
BreakingChanges: string

.OUTPUTS
string

.NOTES
- 

.LINK
CommitFusion (Module): https://github.com/sgkens/Commitfusion/readme.md#New-ConventionalCommit
#>

Function New-ConventionalCommit {
    [CmdletBinding()]
    [OutputType([string])]
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

        [Parameter(Mandatory = $false)]
        [string]$Scope,

        [Parameter(Mandatory = $false)]
        [string]$Description,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string[]]$Body,

        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [switch]$Footer = $false,

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
        if($Body.count -eq 0){
            $Body = $null
        }
        if($description.length -eq 0){
            $description = $null
        }
        if($FeatureAddtions.count -eq 0){
            $FeatureAddtions = $null
        }
        if($BugFixes.count -eq 0){
            $BugFixes = $null
        }
        if($FeatureNotes.count -eq 0){
            $FeatureNotes = $null
        }
        if($BreakingChanges.count -eq 0){
            $BreakingChanges = $null
        }
        if($GitUser.length -eq 0){
            $GitUser = $null
        }
        if($GitGroup.length -eq 0){
            $GitGroup = $null
        }
        if($Scope.length -eq 0){
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
            return (Get-CommitFusionModuleInstance).AsObject() #TODO: For some reason this is returned as an hashtable, not a PSObject
                                                               #TODO: may need its only cmdlet with explicit return type [PSObject
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