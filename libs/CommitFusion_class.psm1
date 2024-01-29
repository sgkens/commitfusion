using module psparagraph/psparagraph.psm1 # for indenting the notes section
class CommitFusion {

    [String]   $Type # valuedateset Dynamic values
    [String]   $Scope
    [String]   $Description
    [string[]] $Notes
    [String]   $Styledbody
    [String]   $Footer
    [string[]] $FeatureAdditions
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
    [bool]     $ForMarkDown


    <# .--eeeeeeeeeeeeeeeee----------inf------------.
       - Constructor
       -------------
       - Initialize CommitFusion class with constructor method
       - @param none
       .--------------------------. #>
    CommitFusion(){
        # CONSTRUCTOR -------------------------------------------------------------------
        $this.DateNow = (Get-Date).ToString('h:mmtt, dddd d\t\h MMMM yyyy')
        $this.ModuleRoot = (Get-Item -Path $PSScriptRoot).FullName
        $OutputEncoding = [System.Text.Encoding]::UTF8
        try{
            $content_GitMojiIndex = Get-Content -path "$PSScriptroot\gitmojis.json" -Raw
            $content_EmojiIndex = Get-Content -Path "$PSScriptroot\Unicode-Index.json" -Raw
            $content_CFConfig = Get-Content -Path "$PSScriptroot\CommitFustion.types.json" -Raw
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
    <# .------------inf------------.
        - Constructor
        -------------
        - Generate a commit message object
        - @param Type [String] - Type of commit
        - @param Scope [String] - Scope of commit
        - @param Description [String] - Description of commit
        - @param Notes [String[]] - Notes of commit
        - @param Footer [Bool] - Footer of commit
        - @param GitUser [String] - Git user name
        - @param GitGroup [String] - Git group name
        - @param FeatureAdditions [String[]] - Feature additions
        - @param Bugfixes [String[]] - Bug fixes
        - @param FeatureNotes [String[]] - Feature notes
        - @param BreakingChanges [String[]] - Breaking changes
        - @param ForMarkdown [Bool] - For markdown
        - @return [string]
    .--------------------------. #>
    [void]ConventionalCommit(
        [String]    $Type, 
        [String]    $Scope = $null, 
        [String]    $Description = $null,
        [string[]]  $Notes = $null,
        [Bool]      $Footer = $false,
        [String]    $GitUser = $Null,
        [String]    $GitGroup = $null,
        [string[]]  $FeatureAdditions = $null,
        [string[]]  $bugfixes = $null,
        [string[]]  $FeatureNotes = $null,
        [string[]]  $BreakingChanges = $null,
        [bool]      $ForMarkdown = $false ){

        $this.type = $type
        $this.scope = $scope
        $this.Notes = $Notes
        $this.footer = $footer
        $this.description = $description
        $this.breakingchanges = $breakingchanges
        $this.featurenotes = $featurenotes
        $this.gituser = $gituser
        $this.gitgroup = $gitgroup
        $this.FeatureAdditions = $FeatureAdditions
        $this.bugfixes = $bugfixes
        $this.ForMarkDown = $ForMarkdown

        # char count seems to work better than $null, i dont really like null
        if($Description.length -eq 0){ 
            $this.description = ( 
                $this.CFConfig.ciset | Where-object {
                    $_.type -eq "$($this.type)"
                }
            ).description
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
        

        # populate the commit message object
        $this.ConstructMessage();
    }
    <# .------------inf------------.
       - ConstructMessage
       ------------------
       - Generates the commit message object and sets the object properties
       - @param none
       - @return none
       .--------------------------. #>
    hidden [void] ConstructMessage(){
        
        [int]$indent = 7 <# indent for notes/feature notes/bug fixes/breaking changes #>
        [int]$paragraph_length = 80 # position for notes/feature notes/bug fixes/breaking changes
        [string]$separator = "─" <# separator for notes/feature notes/bug fixes/breaking changes #>
        [string]$note_bullet = $this.GetEmoji("miscmojis", "small_blue_diamond") <# bullet for notes/feature notes/bug fixes/breaking changes #>
        [string]$feat_bullet = $this.GetEmoji("miscmojis", "yellow_circle") <# bullet for notes/feature notes/bug fixes/breaking changes #>
        [string]$bugfix_bullet = $this.GetEmoji("miscmojis", "bug") <# bullet for notes/feature notes/bug fixes/breaking changes #>
        [string]$bChanges_bullet = $this.GetEmoji("miscmojis", "small_orange_diamond") <# bullet for notes/feature notes/bug fixes/breaking changes #>
        <#- |--- Feature Addtions Block ---|
            Contain logic for adding feature additions to the commit message
        -#>
        if($null -ne $this.FeatureAdditions){
            # Add if branch is not null
            $FeatureAdditionsBody = "$($this.GetEmoji("miscmojis","glowing_star")) Feature Additions: `n`n"
            [int]$index = 1
            foreach ($faddtion in $this.FeatureAdditions) {
                $indented_feat = new-paragraph -Position $paragraph_length -Indent $indent -String "$faddtion" # indent the string block
                # all bugfixes except the last one
                if($this.FeatureAdditions.count -ne $index -and $this.FeatureAdditions.count -ne 1){
                    $FeatureAdditions_content = "$(" " * $indent)$feat_bullet$separator$indented_feat $(if($this.ForMarkDown){'\'}else{''})`n"
                    $FeatureAdditions_content_formatted = $FeatureAdditions_content -replace "$feat_bullet(\s{$indent})", "$feat_bullet"
                    $FeatureAdditionsBody += "$FeatureAdditions_content_formatted"
                }
                else{
                    $FeatureAdditions_content = "$(" " * $indent)$feat_bullet$separator$indented_feat `n"
                    $FeatureAdditions_content_formatted = $FeatureAdditions_content -replace "$feat_bullet(\s{$indent})", "$feat_bullet"
                    $FeatureAdditionsBody += "$FeatureAdditions_content_formatted"
                }
                $index++
            }
            $index = $null
            $FeatureAdditionsBody = $FeatureAdditionsBody -replace "$(" "*$indent)$($feat_bullet)$separator$(" "*$indent)", "$(" "*($indent-4))$($feat_bullet)$separator$(' ')"
            $this.FeatureAdditions = "`n$FeatureAdditionsBody`n"
        }
        else{ $this.FeatureAdditions = "" }

        <#- |--- bugfixes Block ---| 
            Contain logic for adding bug fixes to the commit message
        -#>
        if($null -ne $this.bugfixes){
            # Add if branch is not null
            $bugfixesBody = "$($this.GetEmoji("miscmojis","lady_beetle")) Bug Fixes: `n`n"
            [int]$index = 1
            foreach($bfixes in $this.bugfixes){
                $indented_bugfix = new-paragraph -Position $paragraph_length -Indent $indent -String "$bfixes" # indent the string block
                # all bugfixes except the last one
                if($this.bugfixes.count -ne $index -and $this.bugfixes.count -ne 1){
                   # $bugfixessBody += "   $($this.GetEmoji("miscmojis","yellow_green")) $bfixes $(if($this.ForMarkDown){'\'}else{''})`n"
                    $bugfixes_content = "$(" " * $indent)$bugfix_bullet$separator$indented_bugfix $(if($this.ForMarkDown){'\'}else{''})`n"
                    $breakingChanges_content_formatted = $bugfixes_content -replace "$bugfix_bullet(\s{$indent})", "$bugfix_bullet"
                    $bugfixesBody += "$breakingChanges_content_formatted"
                }
                # last bugfix
                else{
                    $bugfixes_content = "$(" " * $indent)$bugfix_bullet$separator$indented_bugfix `n"
                    $bugfixes_content_formatted = $bugfixes_content -replace "$bugfix_bullet(\s{$indent})", "$bugfix_bullet"
                    $bugfixesBody += "$bugfixes_content_formatted"
                }
                $index++
            }
            $index = $null
            $bugfixesBody = $bugfixesBody -replace "$(" "*$indent)$($bugfix_bullet)$separator$(" "*$indent)", "$(" "*($indent-4))$($bugfix_bullet)$separator$(' ')"
            $this.bugfixes = "`n$bugfixesBody`n"
        }
        else{$this.bugfixes = ""}

        <#- 
           |--- BREAKING CHANGES ---|
            Contain logic for adding breaking changes to the commit message 
        -#>
        if($null -ne $this.breakingChanges){
            # Add if branch is not null
            $breakingChangesBody = "$($this.GetEmoji("miscmojis","hollow_red_circle")) Breaking Changes: `n`n"
            [int]$index = 1
            foreach ($bchange in $this.breakingChanges) {
                $indented_bchange = new-paragraph -Position $paragraph_length -Indent $indent -String "$bchange" # indent the string block
                # all breakingChanges except the last one
                if($this.breakingChanges.count -ne $index -and $this.breakingChanges.count -ne 1){
                    $breakingChanges_content = "$(" " * $indent)$note_bullet$separator$indented_bchange $(if($this.ForMarkDown){'\'}else{''})`n"
                    $breakingChanges_content_formatted = $breakingChanges_content -replace "$note_bullet(\s{$indent})", "$note_bullet"
                    $breakingChangesBody += "$breakingChanges_content_formatted"
                }
                # last breakingChanges
                else{
                    $breakingChanges_content = "$(" " * $indent)$bChanges_bullet$separator$indented_bchange `n"
                    $breakingChanges_content_formatted = $breakingChanges_content -replace "$bChanges_bullet(\s{$indent})", "$bChanges_bullet"
                    $breakingChangesBody += "$breakingChanges_content_formatted"
                }
                $index++
            }
            $index = $null
            $breakingChangesBody = $breakingChangesBody -replace "$(" "*$indent)$($bChanges_bullet)$separator$(" "*$indent)", "$(" "*($indent-4))$($bChanges_bullet)$separator$(' ')"
            $this.BreakingChanges = "`n$breakingChangesBody`n"
        }else{ $this.BreakingChanges = "" }
                
        <#- |--- FEATURE CHANGES ---| 
            Contain logic for adding feature notes to the commit message
        -#>
        if($null -ne $this.featurenotes){
            $featurenotesBody = "$($this.GetEmoji("miscmojis","blue_book")) Feature Notes: `n`n"
            [int]$index = 1
            foreach($fnote in $this.FeatureNotes){ 
                $indented_fnote = new-paragraph -Position $paragraph_length -Indent $indent -String "$fnote" # indent the string block
                # all FeatureNotes except the last one
                if($this.FeatureNotes.count -ne $index -and $this.FeatureNotes.count -ne 1){
                    $featurenote_content = "$(" " * $indent)$note_bullet$separator$indented_fnote $(if($this.ForMarkDown){'\'}else{''})`n"
                    $featurenote_content_formatted = $featurenote_content -replace "$note_bullet(\s{$indent})", "$note_bullet"
                    $featurenotesBody += "$featurenote_content_formatted"
                }
                # last FeatureNote
                else{
                    $featurenote_content = "$(" " * $indent)$note_bullet$separator$indented_fnote `n"
                    $featurenote_content_formatted = $featurenote_content -replace "$note_bullet(\s{$indent})", "$note_bullet"
                    $featurenotesBody += "$featurenote_content_formatted"
                }
                $index++
            }
            $index = $null
            
            $featurenotesBody = $featurenotesBody -replace "$(" "*$indent)$($note_bullet)$separator$(" "*$indent)", "$(" "*($indent-4))$($note_bullet)$separator$(' ')"
            $this.featurenotes = "`n$featurenotesBody`n"
        }
        else{ $this.featurenotes = "" }

        <# BUILD SEMVER TYPE #>
        if($null -ne $this.CFConfig.ciset.where({$_.type -match "^($($this.type))"}).semver){
            $AutoBuildState = "`n$($this.GetEmoji("miscmojis","toolbox")) Build: $($this.CFConfig.ciset.where({$_.type -eq $this.type}).semver)`n"
        }else{ 
            $AutoBuildState = ""
        }

        <#- |--- NOTES ---| 
            Contain logic for adding notes to the commit message
        -#>
        [string]$bodyvar = "$AutoBuildState" # pre append the auto build state
        if ($null -ne $this.notes -and $this.notes.count -ne 0) {
            $bodyvar += "`n$($this.GetEmoji("miscmojis","memo")) Notes: `n`n" # pre append the notes header
        } 
        [int]$index = 1
        foreach($Note in $this.Notes){
            $indented_note = new-paragraph -Position $paragraph_length -Indent $indent -String "$note" # indent the string block
            # all notes except the last one
            if($this.Body.count -ne $index -and $this.Notes.count -ne 1) {

                $bodyvar_body = "$(" " * $indent)$note_bullet$separator$indented_note $(if($this.ForMarkDown){'\'}else{''})`n"
                $bodyvar_formatted = $bodyvar_body -replace "$note_bullet(\s{$indent})", "$note_bullet"
                $bodyvar += "$bodyvar_formatted"
            }
            # last note
            else{
                $bodyvar_body = "$(" " * $indent)$note_bullet$separator$indented_note`n"
                $bodyvar_formatted = $bodyvar_body -replace "$note_bullet(\s{$indent})", "$note_bullet"
                $bodyvar += "$bodyvar_formatted"
            }
            $index++
        }
        # Remove the first 3 spaces from the body so paragraphs are not indented with emoji
        $bodyvar = $bodyvar -replace "$(" "*$indent)$($note_bullet)$separator$(" "*$indent)", "$(" "*($indent-4))$($note_bullet)$separator$(' ')"
        $this.styledbody = $bodyvar
                
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
            BreakingChanges = "`n$($this.FeatureAdditions)$($this.BugFixes)$($this.FeatureNotes)$($this.BreakingChanges)`n"
        }
        $this.ConstructMessageObject = $StringParts

    }

    <# .------------inf------------.
       - AsString private method
       -------------------------
       - Generates the commit message as a string from the 'ConstructMessageObject' object
         default return for New-Commit cmdlet
       - @param none
       - @return [string]
       .--------------------------. #>                                                            #>
    hidden [String] AsString(){

        $ConstructMessage = $this.ConstructMessageObject
        $ConstructMessage_contruct = "## $($this.GetEmoji("miscmojis",'bullseye'))-$($ConstructMessage.Type)$($ConstructMessage.Scope)"
        $ConstructMessage_contruct += "$($ConstructMessage.Description)`n--------commit-id--------`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Body.TrimEnd())`n"
        $ConstructMessage_contruct += "$($ConstructMessage.BreakingChanges.TrimEnd())`n`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Footer.TrimEnd())"

        return $ConstructMessage_contruct.TrimEnd()
    }

    <# .------------inf------------.
       - AsStringForCommit private method
       - Returns the commit string without emojis and added formatting.
       - @param none
       - @return [string]
       .--------------------------. #>                                                            #>
    hidden [String] AsStringForCommit(){

        $ConstructMessage = $this.ConstructMessageObject
        $ConstructMessage_contruct = "$($ConstructMessage.Type)$($ConstructMessage.Scope)"
        $ConstructMessage_contruct += "$($ConstructMessage.Description)`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Body.TrimEnd())`n"
        $ConstructMessage_contruct += "$($ConstructMessage.BreakingChanges.TrimEnd())`n`n"
        $ConstructMessage_contruct += "$($ConstructMessage.Footer.TrimEnd())"
                
        return $ConstructMessage_contruct.TrimEnd()
    }

    <#  .------------inf------------.
        - AsRawString
        -----------
        - Description: Returns the commit string join by newline
        - @param none
        - @Return: [String] 
        .---------------------------.#>
    [string] AsRawString() {

        return $this.ConstructMessageObject.ToString() -join "`n"

    }

    <# .------------inf------------.
        - AsObject
        ----------
        - Description: Returns the commit message as an object.
        - @param none
        - @Return: [PSObject] 
       .--------------------------. #>
    [PSObject] AsObject(){

        return $this.ConstructMessageObject

    }

    <#  .------------inf------------.
        - GetEmoji
        --------
        - Description: Return the imported getmojis or miscmojis as a 
                     psobject frome getmojis.json or miscmojis.json
                     based on the provided emoji name.
        - @Params: [String] $set, [String] $name
        - @Return: [String]
        .--------------------------. #>
    [String] GetEmoji([String]$set, [String]$name){

        [String]$SetHolder = ""
        switch ($set) {
            "miscmojis" { $SetHolder = $this.EmojiIndex.where({ $_.label -eq $name }).char }
            "gitmojis" { $SetHolder = $this.gitmojiIndex.gitmojis.where({ $_.name -eq $name }).emoji }
            default { $SetHolder = "null use 'miscmojis' or 'gitmojis'" }
        }

        return $SetHolder

    }

    <#  .------------inf------------.
        - GetEmojiIndex
        - Description: Return the imported getmojis or miscmojis as a 
                     psobject from getmojis.json or miscmojis.json.
        - @Params: [String] $set
        - @Return: [PSObject]
        .--------------------------. #>
    [PSObject] GetEmojiIndex([String]$set){

        [PSObject]$IndexHolder = $null
        switch ($set) {
            "miscmojis" { $IndexHolder = $this.EmojiIndex }
            "gitmojis" { $IndexHolder = $this.gitmojiIndex.gitmojis }
            default { $IndexHolder = $this.EmojiIndex }
        }
        return $IndexHolder

    }

    <#  .------------inf------------.
        - GetCiSet
        ----------
        - Description: Returns list of gitmojis from gitmoji.json as an object.
        - @param none
        - @Return: [pscustomobject]
       .--------------------------. #>
    [pscustomobject[]] GetCiSet(){ 
                
        return $this.GitMojiIndex.gitmojis
        
    }

    <#  .------------inf------------.
        - GetCiSetFusion
        - Description: Returns the CommitFusion Ci-Set as an object
        - @param none
        - @Return: [pscustomobject]
        .--------------------------. #>
    [pscustomobject[]] GetCiSetFusion(){ 
                
        return $this.CFConfig.ciset
        
    }

    <#  .------------inf------------.
        Method: WriteTemplateFile
        Description: Write commit template to .md template file, 
                     returns json string when complete
        Return: [String]
        .--------------------------. #>
    [String] WriteTemplateFile(){

        $this.ForMarkDown = $true
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
            ~ instead use $varibale in memory*
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

            return "{'response':'success','message':'$changelogfile'}"

        }catch [system.exception]{

            [Console]::WriteLine("Error: $($_.exception.message)")
            return "{'response':'error','message':'$($_.exception.message)'}"
            exit

        }
    }
}
