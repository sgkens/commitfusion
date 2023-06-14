Using Module ..\CommitFusion_class.psm1
Function New-ConventionalCommit {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        # valuedateset Dynamic values
        [validateset('build','ci','chore','docs','feat','fix','perf','refactor','revert','style','test','wip','gitmoji','changes','release','hotfix')]
        [string]$Type,

        [Parameter(Mandatory = $true, Position = 1)]
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
        [string[]]$FeatureNotes,

        [Parameter(Mandatory = $false)]
        [string[]]$BreakingChanges,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$String,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$Object,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$Json,

        [Parameter(Mandatory = $false, valuefrompipeline=$true)]
        [switch]$Xml
    )

    process {
        
        $global:commitfusion.ConventionalCommit(
                    $Type,
                    $Scope,
                    $Description,
                    $Body,
                    $Footer,
                    $GitUser,
                    $GitGroup,
                    $FeatureNotes,
                    $BreakingChanges
        )
        if($string){
            return $Global:commitfusion.AsStringForCommit()
        }
        if($Object){
            return $Global:commitfusion.AsObject()
        }
        if($Json){
            return $Global:commitfusion.AsObject() | ConvertTo-Json
        }
        if($Xml){
            return $Global:commitfusion.AsObject() | ConvertTo-Xml
        }
        if(-not $string -and -not $Object -and -not $Json -and -not $Xml){
            return $Global:commitfusion.AsString()
        }
    }
    end {
        # Clean up any resources if needed
    }
}
Export-ModuleMember -Function New-ConventionalCommit