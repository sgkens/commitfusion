using namespace System.Text.RegularExpressions
Function Get-GitAutoVersion {
    [CmdletBinding()]
    [OutputType([Pscustomobject])]
    param ()
    process {
        [int]$major = 0
        [int]$minor = 0
        [int]$patch = 0

        try {
            # Check for git installation
            if ($null -eq (Get-Command git -ErrorAction SilentlyContinue)) {
                throw "Git is not installed, please install git and try again"
            }
            else {
                $gitCommits = git log -p
                $MajorNotation = [regex]::Matches($gitCommits, "Build: Major", [RegexOptions]::IgnoreCase)
                $MinorNotation = [regex]::Matches($gitCommits, "Build: Minor", [RegexOptions]::IgnoreCase)
                $PatchNotation = [regex]::Matches($gitCommits, "Build: Patch", [RegexOptions]::IgnoreCase)

                $majorTags = $MajorNotation.Count
                $minorTags = $MinorNotation.Count
                $patchTags = $PatchNotation.Count
                if ($major -eq 0 -and $minor -eq 0 -and $patch -eq 0) {
                    $minor = 1
                }
                if ($MajorNotation.count -gt 0) {
                    foreach($tag in $MajorNotation){
                        $major++
                    }
                }
                if ($MinorNotation.count -gt 0) {
                    foreach($tag in $MinorNotation){
                        $minor++
                    }
                }
                if ($PatchNotation.count -gt 0) {
                    foreach($tag in $PatchNotation){
                        $patch++
                    }
                }
                return [PSCustomObject]@{ 
                    NewVersion="$major.$minor.$patch";
                    PreVersion="$($majorTags.tostring()).$($minorTags.tostring()).$($patchTags.tostring())" 
                }
            }
        }
        catch [System.Exception] {
            Write-Host "An error occurred while creating AutoVersion Number: $($_.Exception.Message)"
            # You can handle the exception here or rethrow it if needed
        }
    }
}

Export-ModuleMember -Function Get-GitAutoVersion
