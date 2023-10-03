$ModuleManifest = Test-ModuleManifest -path .\dist\logtastic\logtastic.psd1
$GITLAB_NUGET_PROJECT_TOKEN
$GitLab_Username = "sgkens"
$gitlab_Group = "powershell"
$gitlab_uri = "https://gitlab.snowlab.tk"
if(!$global:gitlab_token){
  $GITLAB_NUGET_PROJECT_TOKEN
}

try{
  dotnet nuget add source $gitlab_uri/api/v4/projects/182/packages/nuget/index.json --name gitlab --username $GitLab_Username --password $GITLAB_NUGET_PROJECT_TOKEN
}catch{
  Write-Host "Failed to push to gitlab"
  Write-Host $_
}
try{
    dotnet nuget push .\dist\$($ModuleManifest.CompanyName).logtastic.$($ModuleManifest.Version).nupkg --source gitlab
}
catch{
    Write-Host "Failed to push to gitlab"
    Write-Host $_
}