import-module -name ../githubreadmehelper

<# RUNNER #>

$Config = @{
    projectname = 'CommitFusion'
    user = 'sgkens'
    projectdescription = 'Generate a readme.md file for gitlab repositories, with custom shields.io badges, project description, and project name and logo.'
    #group = 'powershell'
    branch = "main"
    gitlaburl = "https://gitlab.lab.davilion.online"
    #gitlabuser = 'sgkens'
    gitlabgroup = 'powershell'
    buildpackages = $true
    randomcolorstyle = $false
    ShieldIoBagdeType= 'for-the-badge'
    ShieldIOLabelcolor = 'BlueViolet'
    ShieldIoLogoColor = 'Indigo'
    ShieldIoColor = 'SlateBlue'
    license = 'MIT'
}


# Example
Build-GithubReadme @Config
    
