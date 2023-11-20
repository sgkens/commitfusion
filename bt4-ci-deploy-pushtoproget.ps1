# --CONFIG--
$apikey               = "c47b5f976dfaf9275d0bbbb7b671c81b78a70ff0"
$ModuleName           = "commitfusion"
$ProGet_chocInstance  = "https://proget.lab.davilion.online/nuget/Choco"
$ProGet_nugetInstace  = "https://proget.lab.davilion.online/nuget/nuget"
$ProGet_PSGalInstance = 'pscore'
$ModuleManifest       = Test-ModuleManifest -path ".\dist\$ModuleName\$ModuleName`.psd1"
#$semver               = $ModuleInfo.version.Major.ToString() + "." + $ModuleInfo.version.Minor.ToString() + "." + $ModuleInfo.version.Build.ToString()
$SemVerVersion        = $ModuleManifest.Version -replace "\.\d+$",""
# Output FileNames
$nupkgFileName        = "$($ModuleManifest.CompanyName).$ModuleName.$SemVerVersion.nupkg"
$zipFileName          = "$($ModuleName).zip"
# Force Tls12
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


# --CONFIG--

# # @ https://stackoverflow.com/questions/35296482/invalid-web-uri-error-on-register-psrepository/35296483#35296483
# !NOTE Extract this function as new install of windows fix this issue
# !NOTE could be related to chcolatey install will test later
# Function Register-PSRepositoryFix {
#     [CmdletBinding()]
#     Param (
#         [Parameter(Mandatory=$true)]
#         [String]
#         $Name,

#         [Parameter(Mandatory=$true)]
#         [Uri]
#         $SourceLocation,

#         [ValidateSet('Trusted', 'Untrusted')]
#         $InstallationPolicy = 'Trusted'
#     )

#     $ErrorActionPreference = 'Stop'

#     Try {
#         Write-Verbose 'Trying to register via ​Register-PSRepository'
#         if(get-repository -Name pscore){
#             write-host "Repository already exists, skipping add"
#         }
#         ​Register-PSRepository -Name $Name -SourceLocation $SourceLocation -InstallationPolicy $InstallationPolicy
#         Write-Verbose 'Registered via Register-PSRepository'
#     } Catch {
#         Write-Verbose 'Register-PSRepository failed, registering via workaround'

#         # Adding PSRepository directly to file
#         Register-PSRepository -name $Name -SourceLocation $env:TEMP -InstallationPolicy $InstallationPolicy
#         $PSRepositoriesXmlPath = "$env:LOCALAPPDATA\Microsoft\Windows\PowerShell\PowerShellGet\PSRepositories.xml"
#         $repos = Import-Clixml -Path $PSRepositoriesXmlPath
#         $repos[$Name].SourceLocation = $SourceLocation.AbsoluteUri
#         $repos[$Name].PublishLocation = (New-Object -TypeName Uri -ArgumentList $SourceLocation, 'package/').AbsoluteUri
#         $repos[$Name].ScriptSourceLocation = ''
#         $repos[$Name].ScriptPublishLocation = ''
#         $repos | Export-Clixml -Path $PSRepositoriesXmlPath

#         # Reloading PSRepository list
#         Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted
#         Write-Verbose 'Registered via workaround'
#     }
# }

if($ModuleManifest){

  # Push to ProGet Chocolatey
  if(Get-command choco){
    write-host "Checking if Chocolatey is installed, skipping install"
    write-host "Pushing to chocolatey: .\dist\choco\$nupkgFileName"
    choco push ".\dist\choco\$nupkgFileName" --source $ProGet_chocInstance --apikey $apikey
    write-host "Pushed to chocolatey $nupkgFileName - Complete"
  }
  else{
    write-host "Chocolatey is not installed, installing Chocolatey"
    break;
  }

  # Push to ProGet Nuget
  if(Get-command nuget.exe){
    write-host "Checking if Nuget is installed, skipping install"
    write-host "Pushing to Nuget: .\dist\nuget\$nupkgFileName"
    nuget push ".\dist\nuget\$nupkgFileName" -source $ProGet_nugetInstace -apikey $apikey
    write-host "Pushed to Nuget $nupkgFileName - Complete"
  }
  else{
    write-host "Nuget is not installed, installing Nuget"
    break;
  }
  # # Push to ProGet PSGallery
  write-host "Pushing to Powershell-Nuget-Proget: .\dist\psgal\$zipFileName"

  # puish to proget pscore repo 'powershell gallery'
  # Publish-Module -Path ".\dist\$zipFileName" -Repository pscore -NuGetApiKey $apikey
  # Example of trusting the certificate (not recommended for production)
  [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
  Register-PSRepository -name 'pscore_Local_instance' `
                        -SourceLocation "https://proget.lab.davilion.online/nuget/pscore/" `
                        -PublishLocation (New-Object -TypeName Uri -ArgumentList "https://proget.lab.davilion.online/nuget/pscore/", 'package/').AbsoluteUri `
                        -InstallationPolicy "Trusted"
  
  publish-Module `
    -path ".\dist\$ModuleName" `
    -Repository $ProGet_PSGalInstance `
    -NuGetApiKey $apikey `
    -projecturi $ModuleManifest.ProjectUri `
    -licenseuri $ModuleManifest.LicenseUri `
    -IconUri 'https://gitlab.snowlab.tk/sgkens/resources/-/blob/raw/modules/CommitFusion/dist/v1/ccommits-logo_GitIcon_51.20dpi.png' `
    -ReleaseNotes $ModuleManifest.ReleaseNotes `
    -Tags $ModuleManifest.Tags `
    -Verbose
  Unregister-PSRepository -Name 'pscore_Local_instance'
}



