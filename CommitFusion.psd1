@{

    RootModule             = "commitfusion.psm1"
    ModuleVersion          = '0.8.0.0'
    CompatiblePSEditions   = @()
    GUID                   = 'c7e7262e-8c66-4c0d-9454-9927449c2927'
    Author                 = 'Garvey k. Snow'
    CompanyName            = 'phellams'
    Copyright              = '2023 Garvey k. Snow. All rights reserved.'
    Description            = 'Conventional Commit Message Generator'
    PowerShellVersion      = '7.0'
    PowerShellHostName     = ''
    PowerShellHostVersion  = ''
    DotNetFrameworkVersion = ''
    ClrVersion             = ''
    ProcessorArchitecture  = ''
    RequiredModules        = @()
    RequiredAssemblies     = @()
    ScriptsToProcess       = @()
    TypesToProcess         = @()
    FormatsToProcess       = @()
    NestedModules          = @()
    FunctionsToExport      = @( 
        'Get-CommitFusionModuleInstance',
        'Get-CiSet',
        'Get-CommitTypes',
        'Get-Emoji',
        'Get-EmojiIndex',
        'New-CommitFusion',
        'New-Commit',
        'Format-FusionMD',
        'Update-Changelog',
        'Get-GitAutoVersion',
        'Set-Commit',
        'Get-ReleaseNotes'
    )
    CmdletsToExport        = @()
    VariablesToExport      = @()
    AliasesToExport        = @()
    DscResourcesToExport   = @()
    ModuleList             = @()
    FileList               = @()
    PrivateData            = @{
        PSData = @{
            Tags                       = @('automation', 'git', 'conventional-commit', 'conventional', 'commit', 'free', 'free-ware', 'module', 'powershell', 'powershellcore', 'tool', 'utility', 'utility-module')
            LicenseUrl                 = 'https://choosealicense.com/licenses/mit'
            ProjectUrl                 = 'https://github.com/phellams/commitfusion'
            IconUrl                    = 'https://raw.githubusercontent.com/phellams/phellams-general-resources/main/modules/CommitFusion/dist/svg/commitfusion-icon-x128.svg'
            ReleaseNotes               = 'https://github.com/phellams/commitfusion'
            Prerelease                 = 'beta'
            RequireLicenseAcceptance   = $false
            ExternalModuleDependencies = @()
            Docsurl                    = 'https://pages.gitlab.io/phellams/commitfusion'
            MailingListUrl             = 'https://github.com/phellams/commitfusion/issues'
            projectSourceUrl           = 'https://github.com/phellams/commitfusion'
            bugTrackerUrl              = 'https://github.com/phellams/commitfusion/issues'
            Summary                    = 'Commitfusion generates a conventional commit message based on the commit type and the scope of the commit.'
        }
    }
    HelpInfoURI            = 'https://github.com/phellams/commitfusion/blob/main/README.md'
    DefaultCommandPrefix   = ''
}

