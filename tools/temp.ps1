$myhash = @{
    strippedLine = [string]
    commitid = [string]
    entry = [string[]]
}

$myhashHolder = @{}

$myhash['strippedLine'] = "Notes:"
$myhash['commitid'] = "1234567890"
$myhash['entry'] = @("This is a test entry")

$myhash['strippedLine'] = "Feature Notes:"
$myhash['commitid'] = "1234567890"
$myhash['entry'] = @("This is a test entry")

$myhash['strippedLine'] = "Breaking Changes:"
$myhash['commitid'] = "1234567890"
$myhash['entry'] = @("This is a test entry")

$myhashHolder[$myhash['strippedLine']] = $myhash

# $myhash['strippedLine'] = "Feature Additions:"
# $myhash['commitid'] = "1234567890"
# $myhash['entry'] = @("This is a test entry")