@{

# Script module or binary module file associated with this manifest.
RootModule    = "commitfusion.psm1"

# Version number of this module.
ModuleVersion     = '0.5.1.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'c7e7262e-8c66-4c0d-9454-9927449c2927'

# Author of this module
Author = 'Garvey k. Snow'

# Company or vendor of this module
CompanyName = 'davilion'

# Copyright statement for this module
Copyright = '2023 Garvey k. Snow. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Conventional Commit Message Generator'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @("logtastic")

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# Using module in individual cmdlets instead
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
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
    'Set-Commit'
    )

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = ''

# Variables to export from this module
VariablesToExport = ''

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = ''
# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'automation', 'git', 'conventional-commit', 'conventional', 'commit', 'free', 'free-ware','module','powershell','powershellcore', 'tool', 'utility', 'utility-module'

        # A URL to the license for this module.
        LicenseUrl = 'https://choosealicense.com/licenses/mit'

        # A URL to the main website for this project.
        ProjectUrl = 'https://github.com/sgkens/commitfusion'

        # A URL to an icon representing this module.
        IconUrl  = 'https://raw.githubusercontent.com/sgkens/resources/main/modules/CommitFusion/dist/v2/commitfusion-icon-x128.png'

        # ReleaseNotes of this module
        ReleaseNotes = 'https://github.com/sgkens/commitfusion'

        # Prerelease string of this module
        # Prerelease = 'beta'

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

        Docsurl          = 'https://pages.gitlab.io/sgkens/commitfusion'

        # MailingListUrl
        MailingListUrl   = 'https://github.com/sgkens/commitfusion/issues'
    
        # projectSourceUrl
        projectSourceUrl = 'https://github.com/sgkens/commitfusion'

        # bugTrackerUrl 
        bugTrackerUrl    = 'https://github.com/sgkens/commitfusion/issues'

        # Summary
        Summary          = 'Commitfusion generates a conventional commit message based on the commit type and the scope of the commit.'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/sgkens/commitfusion/blob/main/README.md'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

