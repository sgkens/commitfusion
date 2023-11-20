$ModuleManifest = Test-ModuleManifest -path .\dist\commitfusion\commitfusion.psd1
$ModuleName = "commitfusion"
$SemVerVersion = $ModuleManifest.Version -replace "\.\d+$",""
$GITLAB_NUGET_PROJECT_TOKEN = 'QuKeQXyos8vHSpGzT6rE'
$Gitlab_Username = "sgkens"
$Gitlab_uri = "https://gitlab.lab.davilion.online"
$NugetProjectPath = "api/v4/projects/182/packages/nuget/index.json"

try{
  Write-host -foregroundcolor yellow "Attempting to Register Gitlab: $gitlab_uri@$Gitlab_Username"
  dotnet nuget add source $gitlab_uri/$NugetProjectPath --name gitlab --username $GitLab_Username --password $GITLAB_NUGET_PROJECT_TOKEN
  Write-host -foregroundcolor green "Complete"
}catch [system.exception]{
  Write-Host "Failed to push to gitlab"
  Write-Host $_
}
try{
    Write-host -foregroundcolor yellow "Attempting to push $modulename to Gitlab: $gitlab_uri"
    dotnet nuget push .\dist\nuget\$($ModuleManifest.CompanyName).$modulename.$SemVerVersion.nupkg --source gitlab
}
catch [system.exception] {
    Write-Host "Failed to push to gitlab"
    Write-Host $_
}
dotnet nuget remove source gitlab