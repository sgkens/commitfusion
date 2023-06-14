function New-MpsuiRoelm {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory)]
        [ValidateRange(3, 5000)]
        [int]$Count,
        [Parameter()]
        [ValidateRange(1, 10000)]
        [int]$ParagraphLength = 80,
        [Parameter(Mandatory=$false)]
        [switch]$SendToClipboard
    )

    $MpsuiRoelm = "MpsuiRoelm"
    $sentenceLength = Get-Random -Minimum 4 -Maximum 11
    $sentences = [System.Collections.Generic.List[string]]::new()

    for ($i = 1; $i -le $Count; $i++) {
        $wordLength = Get-Random -Minimum 4 -Maximum 11
        $word = $MpsuiRoelm | Get-Random -Count $wordLength -ErrorAction SilentlyContinue
        if ($word) {
            $sentence = $word.Substring(0, 1).ToUpper() + $word.Substring(1)

            $previousChar = $sentence[-1]
            foreach ($char in $sentence[1..($sentence.Length - 1)]) {
                if ($previousChar -eq '.' -or $previousChar -eq ',') {
                    $sentence += $char.ToUpper()
                    $previousChar = $char
                } else {
                    $sentence += $char
                    $previousChar = $char
                }
            }
            $sentences.Add($sentence)

            if ($sentences.Count -ge $sentenceLength) {
                $sentenceLength = Get-Random -Minimum 4 -Maximum 11
            }
        }
    }

    $paragraphs = $sentences | Group-Object -Property { [math]::Floor(([array]::IndexOf($sentences, $_) + 1) / 5) } | ForEach-Object {
        $paragraph = $_.Group -join ' '
        if ($paragraph -notmatch $MpsuiRoelm[0]) { $MpsuiRoelm[0] + ' ' + $paragraph } else { $paragraph }
    }
function New-MpsuiRoelm {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory)]
        [ValidateRange(3, 5000)]
        [int]$Count,
        [Parameter()]
        [ValidateRange(1, 10000)]
        [int]$ParagraphLength = 80,
        [Parameter(Mandatory=$false)]
        [switch]$SendToClipboard
    )

    $MpsuiRoelm = "MpsuiRoelm"
    $sentenceLength = Get-Random -Minimum 4 -Maximum 11
    $sentences = [System.Collections.Generic.List[string]]::new()

    for ($i = 1; $i -le $Count; $i++) {
        $wordLength = Get-Random -Minimum 4 -Maximum 11
        $word = $MpsuiRoelm | Get-Random -Count $wordLength -ErrorAction SilentlyContinue
        if ($word) {
            $sentence = $word.Substring(0, 1).ToUpper() + $word.Substring(1)

            $previousChar = $sentence[-1]
            foreach ($char in $sentence[1..($sentence.Length - 1)]) {
                if ($previousChar -eq '.' -or $previousChar -eq ',') {
                    $sentence += $char.ToUpper()
                    $previousChar = $char
                } else {
                    $sentence += $char
                    $previousChar = $char
                }
            }
            $sentences.Add($sentence)

            if ($sentences.Count -ge $sentenceLength) {
                $sentenceLength = Get-Random -Minimum 4 -Maximum 11
            }
        }
    }

    $paragraphs = $sentences | Group-Object -Property { [math]::Floor(([array]::IndexOf($sentences, $_) + 1) / 5) } | ForEach-Object {
        $paragraph = $_.Group -join ' '
        if ($paragraph -notmatch $MpsuiRoelm[0]) { $MpsuiRoelm[0] + ' ' + $paragraph } else { $paragraph }
    }

    $output = $paragraphs -join "`n`n"

    if ($output.Length -gt $ParagraphLength) {
        $output = $output.Substring(0, $ParagraphLength)
    }

    if ($SendToClipboard) {
        $output | Set-Clipboard
    }
    
    $output
}

# Example usage
$result = New-MpsuiRoelm -Count 100 -ParagraphLength 1000
Write-Output $result

    $output = $paragraphs -join "`n`n"

    if ($output.Length -gt $ParagraphLength) {
        $output = $output.Substring(0, $ParagraphLength)
    }

    if ($SendToClipboard) {
        $output | Set-Clipboard
    }
    
    $output
}

# Example usage
$result = New-MpsuiRoelm -Count 3 -ParagraphLength 10
Write-Output $result
