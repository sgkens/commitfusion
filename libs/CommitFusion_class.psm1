class CommitFusion{
    [String]   $Type
    [String]   $Scope
    [String]   $Description
    [string[]] $Notes
    [String]   $Styledbody
    [String]   $Footer
    [string[]] $FeatureAddtions
    [string[]] $Bugfixes
    [string[]] $Breakingchanges
    [string[]] $Featurenotes
    [psobject] $EmojiIndex
    [psobject] $GitMojiIndex
    [String]   $BodyIndention
    [String]   $BodyBullet
    [String]   $GitUser
    [String]   $GitGroup
    [String]   $DateNow
    [String]   $MessageStringFormatted
    [String]   $GitNameSpace
    [PSObject] $CFConfig
    [PSObject] $ConstructMessageObject
    [String]   $ModuleRoot
    [String]   $FusionConfigPath
    [PSObject] $IconSet
    [string]   $GitSource
    # hidden [psobject] $puc # Hide this from the user
    # hidden [psobject] $gmo # Hide this from the user
    # CONSTRACTOR BASE ------
    CommitFusion(){
        # CONSTRUCTOR -------------------------------------------------------------------
        $this.DateNow = (Get-Date).ToString('h:mmtt, dddd d\t\h MMMM yyyy')
        $this.ModuleRoot = (Get-Item -Path $PSScriptRoot).FullName
        $OutputEncoding = [System.Text.Encoding]::UTF8
        try{
            $content_GitMojiIndex = Get-Content -path "$PSScriptroot\gitmojis.json" -Raw
            $content_EmojiIndex = Get-Content -Path "$PSScriptroot\Unicode-Index.json" -Raw
            $content_CFConfig = Get-Content -Path "$PSScriptroot\CommitFustion.types.json" -Raw
            # $cc.StringCleaner() # This still returns igredular white spaces with-in object with output to console
            # Not a breaking issue but kinda annoying
            # TODO: Fix these issue
            # TODO: implimented .net lib json parser to fix this issue
            # TODO: Use SimpleSpectreWrapper to fix this issue and .trim() the output
            $this.GitMojiIndex = $content_GitMojiIndex | ConvertFrom-Json
            $this.EmojiIndex = $content_EmojiIndex | ConvertFrom-Json
            $this.CFConfig = $content_CFConfig | ConvertFrom-Json

            #$this.EmojiIndex = Get-Content -Path "$($this.ModuleRoot)\Unicode-Index.json" -Raw | ConvertFrom-Json
            #$this.CFConfig = Get-Content -Path "$($this.ModuleRoot)\CommitFustion.json" -Raw | ConvertFrom-Json
        }
        catch [system.exception]{
            Write-Host "Error: $($_.exception.message)" -ForegroundColor Red
            exit
        }
    }

    #! CONSTRUCTOR OVERLOAD 1 Custom Config Path
    #* if for some reason you want to use a custom config file
    # CommitFusion($configFile) {
    #     # CONSTRUCTOR -------------------------------------------------------------------
    #     $this.DateNow = (Get-Date).ToString('h:mmtt, dddd d\t\ MMMM yyyy')
    #     $this.ModuleRoot = (Get-Item -Path $PSScriptRoot).FullName
    #     $OutputEncoding = [System.Text.Encoding]::UTF8

    #     try {
    #         $ConfigFilePath = (Get-item -path $configFile -ErrorAction Stop).FullName
    #         $content_GitMojiIndex = Get-Content -path "$PSScriptroot\gitmojis.json" -Raw
    #         $content_EmojiIndex = Get-Content -Path "$PSScriptroot\Unicode-Index.json" -Raw
    #         $content_CFConfig = Get-Content -Path $ConfigFilePath -Raw

    #         $this.GitMojiIndex = $content_GitMojiIndex | ConvertFrom-Json
    #         $this.EmojiIndex = $content_EmojiIndex | ConvertFrom-Json
    #         $this.CFConfig = $content_CFConfig | ConvertFrom-Json

    #     }
    #     catch [system.exception] {

    #         Write-Host "Error: $($_.exception.message)" -ForegroundColor Red
    #         exit
    #     }
    # }

    ConventionalCommit(
        [String]    $Type,
        [String]    $Scope = $null,
        [String]    $Description = $null,
        [string[]]  $Notes = $null,
        [Bool]      $Footer = $false,
        [String]    $GitUser = $Null,
        [String]    $GitGroup = $null,
        [string[]]  $FeatureAddtions = $null,
        [string[]]  $bugfixes = $null,
        [string[]]  $FeatureNotes = $null,
        [string[]]  $BreakingChanges = $null
    ){

        $this.type = $type
        $this.scope = $scope
        $this.Notes = $Notes
        $this.footer = $footer
        $this.description = $description
        $this.breakingchanges = $breakingchanges
        $this.featurenotes = $featurenotes
        $this.gituser = $gituser
        $this.gitgroup = $gitgroup
        $this.FeatureAddtions = $FeatureAddtions
        $this.bugfixes = $bugfixes

        if($Description.length -eq 0){# char count seems to work better than $null, i dont really like null
            $this.description = ($this.CFConfig.ciset | Where-object {$_.type -eq "$($this.type)"}).description
        }

        # checks if gituser is present if not use gitgroup
        # used with linking the commit url link
        # NOTE! If you dont use git rebase this can work unintended as in this scope the 
        #       the commits might be squished 
        # ! May need to remove this feature 
        # ! Need for this, not really needed
        if($null -ne $this.GitUser){
            $this.GitNameSpace = $this.GitUser
        }elseif($null -ne $this.gitgroup){
            $this.GitNameSpace = $this.gitgroup
        }else{
            $this.GitNameSpace = $null
        }

        # Add colon if scope is referenced
        if($null -eq $this.scope -or $this.scope.length -eq 0) {
            $this.scope = ":" # Todo: 
        }else{
            $this.scope = "($($this.scope)):"
        }
        

        # Call the ConstructMessage method to build the commit message object
        $this.ConstructMessage();
    }

    hidden [void] ConstructMessage(){

        <#- Feature Addtions-#>
        if($null -ne $this.FeatureAddtions){
            # Add if branch is not null
            $FeatureAddtionsVar = "$($this.GetEmoji("miscmojis","glowing_star")) FEATURE ADDTIONS: `n"
            $FeatureAddtionsVar += "`n"
            [int]$index = 1
            foreach ($faddtion in $this.FeatureAddtions) {
                if($this.FeatureAddtions.count -ne $index -and $this.FeatureAddtions.count -ne 1){
                    $FeatureAddtionsVar += "$($this.GetEmoji("miscmojis","roasted_sweet_potato")) $faddtion \`n"
                }
                else{
                    $FeatureAddtionsVar += "$($this.GetEmoji("miscmojis","roasted_sweet_potato")) $faddtion ..🖊"
                }
                $index++
            }
            $index = $null
            $FeatureAddtionsVar += "`n"
            $this.FeatureAddtions = "$FeatureAddtionsVar`n`n"
        }
        else{ $this.FeatureAddtions = "" }

        <# BUGFIXES #>
        if($null -ne $this.bugfixes){

            # Add if branch is not null
            $bugfixessVar = "$($this.GetEmoji("miscmojis","bug")) BUG FIXES: `n"
            $bugfixessVar += "`n"
            [int]$index = 1
            foreach($bfixes in $this.bugfixes){
                if($this.bugfixes.count -ne $index -and $this.bugfixes.count -ne 1){
                    $bugfixessVar += "$($this.GetEmoji("miscmojis","microbe")) $bfixes \`n"
                }else{
                    $bugfixessVar += "$($this.GetEmoji("miscmojis","microbe")) $bfixes ..🖊"
                }
                $index++
            }
            $index = $null
            $bugfixessVar += "`n"
            $this.bugfixes = "$bugfixessVar`n`n"
        }
        else{$this.bugfixes = ""}

        <# /**----------o
                ~breakingChanges     \
                ^--------------------/
                ♦-| Parses the breaking changes string & feature changes string
                    inject emoji's from jason file based on matched
                    !Later Will allow for theme support
                    !NOTE! - H tags are not removed but rendered in the git commit message
                             GitLab does not support H tags in commit messages but returnes it in the 
                             Commit page when viewing the commit
                             ~ Check and test with gitlab
                    */#>
        <# BREAKING CHANGES #>
        if($null -ne $this.breakingChanges){
            # Add if branch is not null
            $breakingChangesVar = "$($this.GetEmoji("miscmojis","anger_symbol")) BREAKING CHANGES: `n"
            $breakingChangesVar += "`n"
            [int]$index = 1
            foreach ($bchange in $this.breakingChanges) {
                if($this.breakingChanges.count -ne $index -and $this.breakingChanges.count -ne 1){
                    $breakingChangesVar += "$($this.GetEmoji("miscmojis","firecracker")) $bchange \`n"
                }
                else{
                    $breakingChangesVar += "$($this.GetEmoji("miscmojis","firecracker")) $bchange ..🖊"
                }
                $index++
            }
            $index = $null
            $breakingChangesVar += "`n"
            $this.BreakingChanges = "$breakingChangesVar`n`n"
        }else{$this.BreakingChanges = ""}
                
        <# FEATURE CHANGES #>
        if($null -ne $this.featurenotes){
            $featurenotesBody = "$($this.GetEmoji("miscmojis","test_tube")) FEATURE UPDATES: `n"
            $featurenotesBody += "`n"
            [int]$index = 1
            foreach($fnote in $this.FeatureNotes){
                if($this.FeatureNotes.count -ne $index -and $this.FeatureNotes.count -ne 1){ 
                    $featurenotesBody += "$($this.GetEmoji("miscmojis","hammer")) $fnote \`n"
                }else{
                    $featurenotesBody += "$($this.GetEmoji("miscmojis","hammer")) $fnote ..🖊"
                }
                $index++
            }
            $index = $null
            $featurenotesBody += "`n"
            $this.featurenotes = "$featurenotesBody`n`n"
        }
        else{$this.featurenotes = ""}

        <#& INJECT LIST NOTES INTO COMMIT BODY #> 

        if($null -ne $this.CFConfig.ciset.where({$_.type -match $this.type}).semver){
            $AutoBuildState = "`n$($this.GetEmoji("miscmojis","toolbox")) Build: $($this.CFConfig.ciset.where({$_.type -eq $this.type}).semver)`n"
        }else{ 
            $AutoBuildState = ""
        }
        [string]$bodyvar = "$AutoBuildState"
        if($null -ne $this.notes -and $this.notes.count -ne 0){
            $bodyvar += "`n$($this.GetEmoji("miscmojis","scroll")) NOTES: `n`n"
        }
        [int]$index = 1
        foreach($Note in $this.Notes){
            if($this.Body.count -ne $index -and $this.Notes.count -ne 1) {
                $bodyvar += "$($this.GetEmoji("miscmojis","pencil"))  $Note \`n"
                
            }else{
                $bodyvar += "$($this.GetEmoji("miscmojis","pencil"))  $Note ..🖊"
            }
            $index++
        }
        $this.styledbody = "$bodyvar"
                
        if($this.footer -ne $false){
            $this.footer = "$($this.EmojiIndex.where({$_.label -eq "bust_in_silhouette"}).char) @$($this.gituser) $($this.EmojiIndex.where({$_.label -eq "calendar"}).char) $($this.DateNow)"
        }else{
            $this.footer = ""
        }
        # Message object to be returned
        #  $($this.emojiinex.where({$_.label -eq "cyclone"}).char)— #? Start Tag
        [PSObject]$StringParts = @{

            Type            = "$($this.CFConfig.ciset.where({$_.Type -eq $this.type}).emoji) $($this.Type)"
            Scope           = "$($this.Scope)"
            Description     = " $($this.Description)"
            Body            = "$($this.styledbody)"
            Footer          = "$($this.footer)"
            BreakingChanges = "`n$($this.FeatureAddtions)$($this.BugFixes)$($this.FeatureNotes)$($this.BreakingChanges)`n"
        }
        $this.ConstructMessageObject = $StringParts

    }

    # Returns the commit message as a string
    # ? Get-CommitMessage raw commit message
    # ? for use with Format-FusionMD cmlet
    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: Private::AsStringForCommit
        Description: Returns the commit string without emojis and added formatting
        Return: [String] 
                                                                 #>
    hidden [String] AsString(){

        $ConstructMessage = $this.ConstructMessageObject
        $ConstructMessage_contruct = "## $($this.GetEmoji("miscmojis",'bullseye'))-$($ConstructMessage.Type)$($ConstructMessage.Scope)"
        $ConstructMessage_contruct += "$($ConstructMessage.Description)`n--------commit-id--------`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Body.TrimEnd())`n"
        $ConstructMessage_contruct += "$($ConstructMessage.BreakingChanges.TrimEnd())`n`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Footer.TrimEnd())"

        return $ConstructMessage_contruct.TrimEnd()
    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: Private::AsStringForCommit
        Description: Returns the commit string without emojis and added 
                     formatting.
        Return: [String] 
                                                                 #>
    hidden [String] AsStringForCommit(){

        $ConstructMessage = $this.ConstructMessageObject
        $ConstructMessage_contruct = "$($ConstructMessage.Type)$($ConstructMessage.Scope)"
        $ConstructMessage_contruct += "$($ConstructMessage.Description)`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Body.TrimEnd())`n"
        $ConstructMessage_contruct += "$($ConstructMessage.BreakingChanges.TrimEnd())`n`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Footer.TrimEnd())"
                
        return $ConstructMessage_contruct.TrimEnd()
    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: Private::AsRawString
        Description: Returns the commit string join by newline
        Return: [String] 
                                                                 #>
    [string] AsRawString() {

        return $this.ConstructMessageObject.ToString() -join "`n"

    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: AsObject
        Description: Returns the commit message as an object.
        Return: [PSObject] 
                                                                 #>
    [PSObject] AsObject(){

        return $this.ConstructMessageObject

    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: GetEmoji
        Description: Return the imported getmojis or miscmojis as a 
                     psobject from getmojis.json or miscmojis.json
                     based on the provided emoji name.
        Params: [String] $set, [String] $name
        Return: [String]
                                                                 #>
    [String] GetEmoji([String]$set, [String]$name){

        [String]$SetHolder = ""
        switch ($set) {
            "miscmojis" { $SetHolder = $this.EmojiIndex.where({ $_.label -eq $name }).char }
            "gitmojis" { $SetHolder = $this.gitmojiIndex.gitmojis.where({ $_.name -eq $name }).emoji }
            default { $SetHolder = "null use 'miscmojis' or 'gitmojis'" }
        }

        return $SetHolder

    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: GetEmojiIndex
        Description: Return the imported getmojis or miscmojis as a 
                     psobject from getmojis.json or miscmojis.json.
        Params: [String] $set
        Return: [PSObject]
                                                                 #>
    [PSObject] GetEmojiIndex([String]$set){

        [PSObject]$IndexHolder = $null
        switch ($set) {
            "miscmojis" { $IndexHolder = $this.EmojiIndex }
            "gitmojis" { $IndexHolder = $this.gitmojiIndex.gitmojis }
            default { $IndexHolder = $this.EmojiIndex }
        }
        return $IndexHolder

    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: GetCiSet
        Description: Returns list of gitmojis from gitmoji.json as 
                     an object.
        Return: [pscustomobject]
                                                                 #>
    [pscustomobject[]] GetCiSet(){ 
                
        return $this.GitMojiIndex.gitmojis
        
    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: GetCiSetFusion
        Description: Returns the CommitFusion Ci-Set as an object
        Return: [pscustomobject]
                                                                 #>
    [pscustomobject[]] GetCiSetFusion(){ 
                
        return $this.CFConfig.ciset
        
    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: WriteTemplateFile
        Description: Write commit template to .md template file, 
                     returns json string when complete
        Return: [String]
                                                                 #>
    [String] WriteTemplateFile(){

        # Check for git installation
        if ($null -eq (Get-Command git -ErrorAction SilentlyContinue)) {
            Write-Host "Git is not installed, please install git and try again"
            exit
        }else{
            try {
                [String]$RepoName = $Null
                [String]$CommitId = $Null
                $CommitId = git log -1 --pretty=%H
                $ShortedCommitid = $CommitId.Substring(0, 10)
                $Repository = git rev-parse --show-toplevel
                $RepoName = ($Repository -split '[/\\]')[-1]
                # $CommitMessage = git log -1 --pretty=%B
                # Specify the path to the changelog file
            }catch [system.exception] {
                Write-Error "Error: $($_.exception.message)"
                exit
            }
            <# 
                Thought pattern
            ? --------------
                Write the content to a .md file directory specified by the user
                read the contents back from the file and inject markdown tags
            ~ instead of using $varibale in memory*
                output the contents back to the file which can be then written to actual changelog file
                ! NOTE !

            #> 
            try{
                # Get the content of the template file 
                $this.AsString() | Out-File -FilePath "$($this.ModuleRoot)\template.md" -Encoding utf8
                # Read the content back from the file
                $ExistingContent = Get-Content -Path "$($this.ModuleRoot)\template.md" -raw
            }catch [system.exception] {
                Write-Error "Error: $($_.exception.message)"
                exit
            }
            #~ MARDOWN INJECTION
            #~ - Inject the markdown tags into the content
            #~ - inject commit id and url link
            #TODO: Add new parameter to specify the url of the repo
            #TODO: Add auto checking feature like -gitlab -github -bitbucket -gitlabsh
            $ExplodedContent = $existingContent -split "`n"
            $MessageString = ""
            # $ciset_list = ($this.CFConfig.ciset.properties.name) -join "|"
            #Catch the AB emoji and commit id emoji
            $AutoBuildEmoji = $this.GetEmoji("miscmojis", "toolbox")
            $CommitIdEmoji = $this.GetEmoji("miscmojis", "id_button")
            if($null -ne $this.GitNameSpace){ $namespace = $this.GitNameSpace}
            else{$namespace = ""}
            for($i = -1; $i -lt $ExplodedContent.count; $i++ ){
                if($ExplodedContent[$i] -match "(--------commit-id--------)"){
                    # if($null -ne $this.CFConfig.ciset.where({$_.type -match $this.type}).semver){
                    #         $AutoBuildState = "[$AutoBuildEmoji]» <kbd>$($this.CFConfig.ciset.where({$_.type -match $this.type}).semver)</kbd>"
                    # }else{ 
                    #         $AutoBuildState = ""
                    # }
                    $ExplodedContent[$i] = ""
                    # !NOTE - Update Documentation - Add to Obsidian Vault daynotes as reminder
                    #   TODO: -Done
                    #      * Added surpport:
                    #       - gitlab https://gitlab.snowlab.tk/(name|group)/(repo-name)/-/commit/(commit-id)
                    #       - github https://github.com/(name|group)/(repo-name)/commit/(commit-id)
                    #       - bitbucket https://bitbucket.org/(name|group)/(repo-name)/commits/(commit-id)
                    #       - gitlab self hosted https://gitlab.(domain)/(name|group)/(repo-name)/-/commit/(commit-id)
                    switch($this.gitsource){                           
                        'github' { 
                            $MessageString += "`n> [$CommitIdEmoji]» [$ShortedCommitid](https://github.com/$($namespace)/$RepoName/-/commit/$CommitId)"
                        }
                        'gitlab' { 
                            $MessageString += "`n> [$CommitIdEmoji]» [$ShortedCommitid](https://gitlab.com/$($namespace)/$RepoName/-/commit/$CommitId)"
                        }
                        'bitbucket' { 
                            $MessageString += "`n> [$CommitIdEmoji]» [$ShortedCommitid](https://bitbucket.org/$($namespace)/$RepoName/commits/$CommitId)"
                        }
                        default {
                            $MessageString += ""
                        }
                    }
                         
                }
                if($ExplodedContent[$i] -match "(Build: Major|Build: Minor|Build: Patch)") {
                    $ExplodedContent[$i] = $null 
                    $MessageString += "> [$AutoBuildEmoji]» <kbd>$($this.CFConfig.ciset.where({$_.type -match $this.type}).semver.ToUpper())</kbd>"
                }
                <#
                    Sections of the commit message
                #>
                if($ExplodedContent[$i] -match "(FEATURE UPDATES)"){
                    $MessageString += "$($ExplodedContent[$i]) |`n|-|`n"
                }elseif($ExplodedContent[$i] -match "(FEATURE ADDTIONS)") {
                    $MessageString += "$($ExplodedContent[$i]) |`n|-|`n"
                }elseif($ExplodedContent[$i] -match "(BREAKING CHANGES)") {
                    $MessageString += "$($ExplodedContent[$i]) |`n|-|`n"
                }elseif($ExplodedContent[$i] -match "(BUG FIXES)"){
                    $MessageString += "$($ExplodedContent[$i]) |`n|-|`n"
                }else {
                    $MessageString += "$($ExplodedContent[$i])`n"
                }
                                
            }
            try{
                $MessageString | Set-Content -Path "$($this.ModuleRoot)\template.md" -Encoding utf8
            }catch [system.exception] {
                Write-Error "Error: $($_.exception.message)"
                exit
            }

            $this.MessageStringFormatted = $MessageString
        }
        # Return the message string
        #TODO: Return this from another class function, say GetChangelog
        return  $MessageString
    }

    <#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Method: WriteClMessage
        Description: Write Template.md contents to specified changelog 
                     file.
        Return: [String]
                                                                 #>
    [string] WriteClMessage([String]$file){ 
        try{ 
            $ChangeLogfile = (Get-item -Path $file).FullName
            [Console]::WriteLine("Checking for changelog file: $ChangeLogfile")

            # Call the WriteTemplateFile() to create and write to the template.md
            [Console]::WriteLine("Attempting to Write to Changelog File")
            $this.WriteTemplateFile()

            # Get the content of the template.md file
            [Console]::WriteLine("Reading from Template File $($this.ModuleRoot)\template.md")
            $TemplateContent = Get-Content -Path "$($this.ModuleRoot)\template.md" -raw

            # get contents of changelog
            [Console]::WriteLine("Fetching Changelog Contents: $ChangeLogfile")
            $ExistingContent = Get-Content -Path $changelogfile -raw

            # Prepend the content of the template file to the changelog file
            [Console]::WriteLine("Prepending Template Contents to Changelog: $ChangeLogfile")
            $AutoGenMessage += $TemplateContent + "`n`n" + $ExistingContent

            # Write the content to the template_final.md file
            [Console]::WriteLine("Writing Template Contents to Template_final.md: $($this.ModuleRoot)\template_final.md")
            $AutoGenMessage | Set-Content -Path "$($this.ModuleRoot)\template_final.md" -Encoding utf8
                        
            # Get the content of the changelog file
            [Console]::WriteLine("Fetching Template_final.md Contents: $($this.ModuleRoot)\template_final.md")
            $ChangeLogFinal = Get-Content -Path "$($this.ModuleRoot)\template_final.md" -raw
                        
            # Write the content to the changelog file
            [Console]::WriteLine("Writing Template_final.md Contents to Changelog: $ChangeLogfile")
            $ChangeLogFinal | Set-Content -Path $changelogfile -Encoding utf8
            
            # Purge template.md files
            [Console]::WriteLine("Purging template.md files")
            Set-Content -Path "$($this.ModuleRoot)\template.md" -Value ""
            Set-Content -Path "$($this.ModuleRoot)\template_final.md" -Value ""
            [Console]::WriteLine("Done.")

            return "{'response':'success','file':'$changelogfile'}"

        }catch [system.exception]{

            [Console]::WriteLine("Error: $($_.exception.message)")
            return "{'response':'error','message':'$($_.exception.message)'}"
            exit

        }
    }
}
