#
# Module manifest for module 'CommitFUsion'
#
# Generated by: gsnow / snoonx
#
# Generated on: 12/02/2023
#

@{

# Script module or binary module file associated with this manifest.
RootModule    = 'CommitFusion.psm1'

# Version number of this module.
ModuleVersion = '0.1.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'c7e7262e-8c66-4c0d-9454-9927449c2927'

# Author of this module
Author = 'snoonx'

# Company or vendor of this module
CompanyName = 'CobaShell'

# Copyright statement for this module
Copyright = '2023 snoonx. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Commit Fusion is a PowerShell module that allows you to create conventional commits with ease.'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.3.2'

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
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    'Get-CiSet',
    'Get-CiSetFusion',
    'Get-CommitAsObject',
    'Get-CommitString',
    'Get-Emoji',
    'Get-EmojiIndex',
    'New-CommitFusion',
    'New-ConventionalCommit',
    'Write-FusionMD'
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
        Tags = 'automation'

        # A URL to the license for this module.
        LicenseUri = 'https://choosealicense.com/licenses/mit'

        # A URL to the main website for this project.
        ProjectUri = 'https://gitlab.snowlab.tk/powershell/ccommits.git'

        # A URL to an icon representing this module.
        IconUri = 'https://gitlab.snowlab.tk/powershell/ccommits/-/blob/main/logo.svg'

        # ReleaseNotes of this module
        ReleaseNotes = 'https://gitlab.snowlab.tk/powershell/ccommits/-/blob/main/Releases.md'

        # Prerelease string of this module
        #Prerelease = 'alpha1'

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

