# Function Get-ModuleDistribution(){
#     param(
#         [cmdletbinding]
#         [validateset("nuget","powershell","choco","gitlab","psgallary")]
#         [parameter(mandatory=$false)]$type
#     )
#     process {
#         $CommandArray = @( { Ping Google.com.au }, { ping github.com})
#         # Create Run space with a Pool of 5
#         $runspacePool = [runspacefactory]::CreateRunspacePool(1, 5)
#         # Open RunSpace 
#         $runspacePool.open()
        
#         # Create Powershell Object
       
#         foreach($command in $commandArray){
#             $pwsh = [powershell]::Create()
#             $pwsh.RunspacePool = $runspacePool
#             $pwsh.AddScript($command) | Out-Null
#             $pwsh.AddArgument($Arguments) | out-null
#         }
#         $Response = $pwsh.BeginInvoke()
#         # Store the PowerShell instance in an array for later retrieval
#         $powershellJobs += [PSCustomObject]@{
#             PowerShell = $pwsh
#             Result = $Response
#         }
#         $powershellJobs.Result
#     }






#         # $RunSpace = [RunSpacefactory]::CreateRunSpace()
        
#         # $runspace.OpenAsync();
#         # $pwsh = [powershell]::Create()
#         # $pwsh.RunSpace = $ShellDock
#         # $pwsh.AddScript({ping google.com.au}) | out-null
#         # $pwsh.AddArgument($Arguments) | out-null
#         # $Response = $pwsh.BeginInvoke()
#         # $output = $pwsh.EndInvoke($Response)
# }
# Get-ModuleDistribution




#=======================


$CommandArray = @( [scriptblock]{ Ping Google.com.au }, [scriptblock]{ ping github.com})
# Create Run space with a Pool of 5
$runspacePool = [runspacefactory]::CreateRunspacePool(1, 5)
# Open RunSpace 
$runspacePool.open()

# Create Powershell Object
$powershellJobs = @()
foreach($command in $commandArray){
    $pwsh = [powershell]::Create()
    $pwsh.RunspacePool = $runspacePool
    $pwsh.AddScript($command) | Out-Null
    $pwsh.AddArgument($Arguments) | out-null
    $Response = $pwsh.BeginInvoke()
    # Store the PowerShell instance in an array for later retrieval
    $powershellJobs += [PSCustomObject]@{
        pwsh     = $pwsh
        Response = $Response
    }
}

$powershellJobs.Response
$runspacePool.RunspacePoolAvailability

# Close the runspace pool
$runspacePool.Close()
$runspacePool.Dispose()