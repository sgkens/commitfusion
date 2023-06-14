# Constructor

```Powershell
LogFusion(
    [String]$type, 
    [String]$scope, 
    [String]$description,
    [string]$body, 
```
- $logFile (string): The path to the log file that will be processed by LogFusion. It should be a valid file path or a URL pointing to a log file.

- $logFormat (string): The format of the log file. Specify the format according to the log file's structure or the expected format for parsing. It could be a regular expression pattern, a specific log format name, or a predefined format identifier.

- $enableDebug (switch): Optional. Enables debug mode if specified. Debug mode provides additional logging and diagnostic information during the log processing. By default, debug mode is disabled ($false).


                [string]  $type, 
                [string]  $scope, 
                [string]  $description, 
                [string[]]$body, 
                [string]  $footer = $null, 
                [string]  $GitUser = $Null,
                [string]  $GitGroup = $null,
                [string[]]  $featurenotes = $null,
                [string[]]  $breakingchanges = $null 
