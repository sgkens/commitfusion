Function Write-GLIPParagraph {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory = $false)]
        [int]$Length = 100
    )
    begin {
    $loremIpsum = @"
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eleifend orci eu ligula consequat hendrerit. Sed sed semper magna, sit amet pulvinar velit. Vestibulum congue, dolor vitae dignissim tristique, mi lacus vulputate est, a iaculis odio felis a neque. Nunc ultricies iaculis eros vitae convallis. Vivamus eleifend augue felis, sed sagittis sem tincidunt ac. Sed dignissim mi ac libero suscipit, ac consectetur metus varius. Mauris tincidunt placerat fermentum. Sed vel suscipit ante, eu pulvinar dolor. Integer a facilisis nibh. Nunc rutrum euismod pulvinar. Etiam fringilla, lectus nec vestibulum venenatis, nisl leo pellentesque sapien, at rhoncus lectus dolor id nunc. Morbi efficitur interdum faucibus. Mauris porttitor magna a sollicitudin consectetur.

Duis eu magna eget elit gravida lobortis et a ex. Donec ornare nisl vel tempor dignissim. In consequat dolor ut ipsum faucibus fringilla. Maecenas semper, metus sit amet scelerisque tempus, lectus metus iaculis elit, id aliquet mi dolor eget mauris. Nullam ut ante vitae quam tristique elementum. Integer sit amet odio non nunc aliquam iaculis. Praesent convallis felis auctor laoreet eleifend. Phasellus fringilla est ac ligula cursus, et feugiat orci elementum. Fusce id nibh sed lacus euismod congue. Ut congue lacinia iaculis. Proin a sapien diam. Nam nec lacus consequat, volutpat sapien non, tempor leo.

Sed non finibus risus. Etiam nec laoreet enim. Maecenas aliquam lectus a nisi laoreet, eu ultricies ex aliquet. Mauris tristique ante nec libero ultricies blandit. Ut fringilla eros at aliquet fringilla. Quisque vitae rhoncus arcu. Cras pellentesque augue non sapien elementum, in scelerisque ligula ultricies. Vestibulum tempor mollis libero vitae semper. Integer tempor mi sed tellus ultricies, a aliquam dui lacinia. Phasellus aliquet, turpis vitae fermentum suscipit, augue ligula tempus lacus, vitae finibus nisl nibh et ligula. Aenean auctor semper leo, vitae lobortis tortor bibendum a. Aliquam ut metus finibus, consectetur nulla id, scelerisque mauris. Nullam gravida semper fringilla. Mauris quis dapibus lectus.
"@
    }
    process {
        $words = $loremIpsum -split '\s+'
        $output = $words | Get-Random -Count $Length
        $paragraph = $output -join ' '

        return $paragraph
    }
    end {
        $loremIpsum = $null
        $words = $null
        $output = $null
        $paragraph = $null
    }
}
Export-ModuleMember -Function Write-GLIPParagraph

