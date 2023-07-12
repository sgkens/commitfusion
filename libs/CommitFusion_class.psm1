using module .\difs.psm1
using module .\PowerUnicode.psm1


#Reequiress -PSEdition desktop
#Reeeuiress -Version 5.0

# ns.utilies.commitfusion
class CommitFusion {
        [String]   $Type
        [String]   $Scope
        [String]   $Description
        [string[]] $Body
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
        # hidden [psobject] $puc # Hide this from the user
        # hidden [psobject] $gmo # Hide this from the user
        # CONSTRACTOR BASE ------
        CommitFusion( ) {

                $this.DateNow = (Get-Date).ToString('h:mmtt, dddd d\t\h MMMM yyyy')
                $this.ModuleRoot = (Get-Item -Path $PSScriptRoot).FullName
                $OutputEncoding = [System.Text.Encoding]::UTF8
                try{
                        $content_GitMojiIndex = Get-Content -path "$PSScriptroot\gitmojis.json" -Raw
                        $content_EmojiIndex   = Get-Content -Path "$PSScriptroot\Unicode-Index.json" -Raw
                        $content_CFConfig     = Get-Content -Path "$PSScriptroot\CommitFustion.json" -Raw
                        # $cc.StringCleaner() # This still returns igredular white spaces with-in object with output to console
                        # Not a breaking issue but kinda annoying
                        # TODO: Fix this issue
                        # implimented .net lib json parser to fix this issue
                        $this.GitMojiIndex = $content_GitMojiIndex | ConvertFrom-Json
                        $this.EmojiIndex   = $content_EmojiIndex | ConvertFrom-Json
                        $this.CFConfig     = $content_CFConfig | ConvertFrom-Json

                        #$this.EmojiIndex = Get-Content -Path "$($this.ModuleRoot)\Unicode-Index.json" -Raw | ConvertFrom-Json
                        #$this.CFConfig = Get-Content -Path "$($this.ModuleRoot)\CommitFustion.json" -Raw | ConvertFrom-Json
                } catch [system.exception]{
                        Write-Host "Error: $($_.exception.message)" -ForegroundColor Red
                        exit
                }
        }

        # CONSTRUCTOR OVERLOAD 1 Custom Config Path
        CommitFusion($configFile) {

                $this.DateNow = (Get-Date).ToString('h:mmtt, dddd d\t\ MMMM yyyy')
                $this.ModuleRoot = (Get-Item -Path $PSScriptRoot).FullName
                $OutputEncoding = [System.Text.Encoding]::UTF8

                try{
                        $ConfigFilePath       = (Get-item -path $configFile -ErrorAction Stop).FullName
                        $content_GitMojiIndex = Get-Content -path "$PSScriptroot\gitmojis.json" -Raw
                        $content_EmojiIndex   = Get-Content -Path "$PSScriptroot\Unicode-Index.json" -Raw
                        $content_CFConfig     = Get-Content -Path $ConfigFilePath -Raw

                        $this.GitMojiIndex = $content_GitMojiIndex | ConvertFrom-Json
                        $this.EmojiIndex   = $content_EmojiIndex | ConvertFrom-Json
                        $this.CFConfig     = $content_CFConfig | ConvertFrom-Json

                } catch [system.exception]{

                        Write-Host "Error: $($_.exception.message)" -ForegroundColor Red
                        exit
                }
        }

        ConventionalCommit(

                [String]    $Type,
                [String]    $Scope,
                [String]    $Description,
                [string[]]  $Body,
                [String]    $Footer = $null,
                [String]    $GitUser = $Null,
                [String]    $GitGroup = $null,
                [string[]]  $FeatureAddtions = $null,
                [string[]]  $bugfixes = $null,
                [string[]]  $FeatureNotes = $null,
                [string[]]  $BreakingChanges = $null

                ) {

                # CONSTRUCTOR -------------------------------------------------------------------

                $this.type = $type
                $this.scope = $scope
                $this.description = $description
                $this.body = $body
                $this.footer = $footer
                $this.breakingchanges = $breakingchanges
                $this.featurenotes = $featurenotes
                $this.gituser = $gituser
                $this.gitgroup   = $gitgroup
                $this.FeatureAddtions = $FeatureAddtions
                $this.bugfixes = $bugfixes
                #$this.puc = [powerunicode]::new()
                #$this.gmo = [gmo]::new()
                #$this.BodyIndention = " " * 5 # number of spaces to use for body indention

                if( $null -eq $this.gituser ){
                        Throw  [System.Exception]::new("GitUser is Required, please supply a git user name and try again")
                        exit
                }
                if( $null -ne $this.footer ){
                        $this.Footer = "> $($this.footer)"
                }
                else {
                        $this.Footer = ""
                }
                if($null -ne $this.gitgroup){
                        $this.gitgroup = "$($this.gitgroup)"
                        $this.GitNameSpace = $this.gitgroup
                }else{
                        $this.GitNameSpace = $this.GitUser
                }
                $this.ConstructMessage();
        }

        hidden [void] ConstructMessage( ) {

                <#& FEATURE ADDTIONS #>
                if ($null -ne $this.FeatureAddtions ) {

                        # Add if branch is not null
                        $FeatureAddtionsVar = "$($this.GetEmoji("miscmojis","glowing_star")) FEATURE ADDTIONS: `n"
                        $FeatureAddtionsVar += "`n"
                        [int]$index = 1
                        foreach ($faddtion in $this.FeatureAddtions){
                                if($this.FeatureAddtions.count -ne $index -and $this.FeatureAddtions.count -ne 1){ 
                                        $FeatureAddtionsVar += "$($this.GetEmoji("miscmojis","roasted_sweet_potato")) $faddtion `n"
                                }
                                else{
                                        $FeatureAddtionsVar += "$($this.GetEmoji("miscmojis","roasted_sweet_potato")) $faddtion ..🖊"
                                }
                                $index++
                        }
                        $index = $null
                        $FeatureAddtionsVar += "`n"
                        $this.FeatureAddtions = $FeatureAddtionsVar
                }
                else { $this.FeatureAddtions = "" }

                <#& BUGFIXES #>
                if ($null -ne $this.bugfixes ) {

                        # Add if branch is not null
                        $bugfixessVar = "$($this.GetEmoji("miscmojis","bug")) BUGFIXES:  `n"
                        $bugfixessVar += "`n"
                        [int]$index = 1
                        foreach ($bfixes in $this.bugfixes){
                                if($this.bugfixes.count -ne $index -and $this.bugfixes.count -ne 1){ 
                                        $bugfixessVar += "$($this.GetEmoji("miscmojis","microbe")) $bfixes `n"
                                }
                                else{
                                        $bugfixessVar += "$($this.GetEmoji("miscmojis","microbe")) $bfixes ..🖊"
                                }
                                $index++
                        }
                        $index = $null
                        $bugfixessVar += "`n"
                        $this.bugfixes = $bugfixessVar
                }
                else { $this.bugfixes = "" }

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
                <#& BREAKING CHANGES #>
                if ($null -ne $this.breakingChanges ) {

                        # Add if branch is not null
                        $breakingChangesVar = "$($this.GetEmoji("miscmojis","anger_symbol")) BREAKING CHANGES: `n"
                        $breakingChangesVar += "`n"
                        [int]$index = 1
                        foreach ($bchange in $this.breakingChanges){
                                if($this.breakingChanges.count -ne $index -and $this.breakingChanges.count -ne 1){ 
                                        $breakingChangesVar += "$($this.GetEmoji("miscmojis","firecracker")) $bchange `n"
                                }
                                else{
                                        $breakingChangesVar += "$($this.GetEmoji("miscmojis","firecracker")) $bchange ..🖊"
                                }
                                $index++
                        }
                        $index = $null
                        $breakingChangesVar += "`n"
                        $this.BreakingChanges = $breakingChangesVar
                }
                else { $this.BreakingChanges = "" }
                
                <#& FEATURE CHANGES #>
                if ($null -ne $this.featurenotes ) {

                        $featurenotesBody = "$($this.GetEmoji("miscmojis","test_tube")) FEATURE UPDATES: `n"
                        $featurenotesBody += "`n"
                        [int]$index = 1
                        foreach ($fnote in $this.FeatureNotes){
                                if($this.FeatureNotes.count -ne $index -and $this.FeatureNotes.count -ne 1){ 
                                        $featurenotesBody += "$($this.GetEmoji("miscmojis","hammer")) $fnote `n"
                                }
                                else{
                                        $featurenotesBody += "$($this.GetEmoji("miscmojis","hammer")) $fnote ..🖊"
                                }
                                $index++
                        }
                        $index = $null
                        $featurenotesBody += "`n"
                        $this.featurenotes = $featurenotesBody
                }
                else { $this.BreakingChanges = "" }

                <#& INJECT LIST NOTES INTO COMMIT BODY #> 
                $bodyvar = "| Notes: $($this.EmojiIndex.where({$_.label -eq "speaking_head"}).char) |`n|----------|`n`n"
                #$bodyvar += "$($this.GetEmoji("miscmojis","memo"))_______ `r`n" 

                foreach ($Note in $this.Body) {

                        $bodyvar += "> $($this.GetEmoji("miscmojis","pencil")) $Note `n"
                }
                $this.styledbody = "$bodyvar"

                # Message object to be returned
                #  $($this.emojiinex.where({$_.label -eq "cyclone"}).char)— #? Start Tag
                [PSObject]$StringParts=@{

                        Type            = "$($this.CFConfig.ciset.where({$_.Type -eq $this.type}).emoji) $($this.Type)"
                        Scope           = " ( $($this.Scope) ):"
                        Description     = $this.Description
                        Body            = $this.styledbody
                        Footer          = "$('`')$($this.EmojiIndex.where({$_.label -eq "bust_in_silhouette"}).char) @$($this.gituser) $($this.EmojiIndex.where({$_.label -eq "calendar"}).char) $($this.DateNow)$('`') `n$($this.Footer)"
                        BreakingChanges = "`n$($this.FeatureAddtions)`n`n$($this.BugFixes)`n`n$($this.FeatureNotes)`n`n$($this.BreakingChanges)"
                }
                $this.ConstructMessageObject = $StringParts

        }

        # Returns the commit message as a string
        # ? Get-CommitMessage Returns a clean commit message
        # ? for use with git commit -m
        hidden [String] AsString( ) {
                $ConstructMessage = $this.ConstructMessageObject
                $ConstructMessage_contruct = " $($this.GetEmoji("miscmojis",'bullseye'))-$($ConstructMessage.Type)$($ConstructMessage.Scope) "
                $ConstructMessage_contruct += "$($ConstructMessage.Description)`n--------commit-id--------`n"
                $ConstructMessage_contruct += "$($ConstructMessage.Body)`n"
                $ConstructMessage_contruct += "$($ConstructMessage.BreakingChanges)`n`n"
                $ConstructMessage_contruct += "$($ConstructMessage.Footer)`n----`n"

                return $ConstructMessage_contruct

        }

        hidden [String] AsStringForCommit( ) {
                $ConstructMessage = $this.ConstructMessageObject
                $ConstructMessage_contruct = "$($ConstructMessage.Type)$($ConstructMessage.Scope) "
                $ConstructMessage_contruct += "$($ConstructMessage.Description)`n"
                $ConstructMessage_contruct += "$($ConstructMessage.Body)`n"
                $ConstructMessage_contruct += "$($ConstructMessage.BreakingChanges)`n`n"
                $ConstructMessage_contruct += "$($ConstructMessage.Footer)"
                
                return $ConstructMessage_contruct

        }
        [string] AsRawString(){
                return $this.ConstructMessageObject.ToString() -join "`n"
        }
        # Returns the commit message as an object
        [PSObject] AsObject() { 
                return $this.ConstructMessageObject
        }

        [String] GetEmoji([String]$set, [String]$name) {
                [String]$SetHolder = ""
                switch ($set) {
                        "miscmojis" { $SetHolder = $this.EmojiIndex.where({ $_.label -eq $name }).char }
                        "gitmojis"  { $SetHolder = $this.gitmojiIndex.gitmojis.where({ $_.name -eq $name }).emoji }
                           default  { $SetHolder = "null use 'miscmojis' or 'gitmojis'" }
                }

                return $SetHolder
        }
        
        # Returns the emoji index as an object
        [PSObject] GetEmojiIndex ( [String]$set ) { 
                [PSObject]$IndexHolder = $null
                switch($set){
                        "miscmojis" { $IndexHolder = $this.EmojiIndex }
                        "gitmojis" { $IndexHolder =  $this.gitmojiIndex.gitmojis }
                        default { $IndexHolder =  $this.EmojiIndex }
                }
                return $IndexHolder
        }
        # Returns the commit template
        [pscustomobject[]] GetCiSet( ) { 
                
                return $this.GitMojiIndex.gitmojis
        
        }
        <# -----------------------------------------------\
           Returns a String with the \t \n \r \s+ removed
           So ConvertFrom-Json can parse and return a PSObject without
                ♦ Extra white spaces (`t), 
                ♦ newline characters (`n), 
                ♦ carriage return characters (`r)
                ♦ (one or more white spaces) (`s) 
        ?-KB: 
        - https://github.com/PowerShell/PowerShell/issues/8604
                + Stephanevg
        TODO: Extract and add this method the CFO C# code base for general use 
        TODO: #! Remove from codebase     
        #>
        [String] StringCleaner($json){
                $json = $json -replace '\s+','' -replace '`t','' -replace '`n','' -replace '`r',''
                return $json.trim()
        }
        # Returns the CommitFusion config
        [pscustomobject[]] GetCiSetFusion( ) { 
                
                return $this.CFConfig.ciset
        
        }
        # returns the commit message as a string
        # ? without the markdown tags and other styling elements
        [String] GetCommitMessage( ){
               return $this.AsStringForCommit()
        }
        # Returns git version base on on the number of major, minor and patch commits
        [String] GitAutoVersion() {
                
                [int]$major = 0
                [int]$minor = 0
                [int]$patch = 0
                #[String]$version = ""

                # Check for git installation
                if ($null -eq (Get-Command git -ErrorAction SilentlyContinue)) {
                        throw "Git is not installed, please install git and try again"
                }
                else {
                        $gitCommits = git log -oneline
                        Foreach ($commit in $gitcommits) {
                                if ($commit.contains("<kbd>major</kbd>")){
                                        $major++
                                }
                                if ($commit.contains("<kbd>minor</kbd>")){
                                        $minor++
                                }
                                if ($commit.contains("<kbd>patch</kbd>")){
                                        $patch++
                                }
                        }
                         
                        return "$major.$minor.$patch"
                }
        }
        # Returns The Commit String and along with the commit template
        [String] WriteTemplateFile() {

                # Check for git installation
                if ($null -eq (Get-Command git -ErrorAction SilentlyContinue)) {


                        Write-Host "Git is not installed, please install git and try again"
                        exit
                }
                else {

                        try{
                                [String]$RepoName = $Null
                                [String]$CommitId = $Null
                                $CommitId = git log -1 --pretty=%H
                                $ShortedCommitid = $CommitId.Substring(0, 10)
                                $Repository = git rev-parse --show-toplevel
                                $RepoName = ($Repository -split '[/\\]')[-1]
                                # $CommitMessage = git log -1 --pretty=%B
                                # Specify the path to the changelog file
                        }catch [system.exception]{
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
                        }
                        catch [system.exception]{
                                Write-Error "Error: $($_.exception.message)"
                                exit
                        }
                        #~ MARDOWN INJECTION
                        #~ - Inject the markdown tags into the content
                        #~ - inject commit id and url link
                        #TODO: Add new parameter to specify the url of the repo
                        #TODO: Add auto checking feature like -gitlab -github -bitbucket -gitlabsh
                        $ExplotedContent = $existingContent -split "`n"
                        $MessageString   = ""
                        $ciset_list   = ($this.CFConfig.ciset.properties.name) -join "|"
                        #Catch the AB emoji and commit id emoji
                        $AutoBuildEmoji = $this.GetEmoji("miscmojis","ab_button_blood_type")
                        $CommitIdEmoji  = $this.GetEmoji("miscmojis","id_button")
                        for( $i=-1;$i -lt $ExplotedContent.count; $i++ ){

                                if ($ExplotedContent[$i] -match "($ciset_list)(.*\))") {
                                        $MessageString += "## "
                                }
                                if ( $ExplotedContent[$i] -match "(--------commit-id--------)" ) {
                                        if($this.CFConfig.ciset.where({$_.type -match $this.type}).semver -ne $null){
                                                $AutoBuildState = "[$AutoBuildEmoji]» <kbd>$($this.CFConfig.ciset.where({$_.type -match $this.type}).semver)</kbd>"
                                        }else{ 
                                                $AutoBuildState = ""
                                        }
                                        $ExplotedContent[$i] = ""
                                        # ! *NOTE*
                                        #   TODO:
                                        #      * Add surpport:
                                        #~       - gitlab https://gitlab.snowlab.tk/(name|group)/(repo-name)/-/commit/(commit-id)
                                        #~       - github https://github.com/(name|group)/(repo-name)/commit/(commit-id)
                                        #~       - bitbucket https://bitbucket.org/(name|group)/(repo-name)/commits/(commit-id)
                                        #~       - gitlab self hosted https://gitlab.(domain)/(name|group)/(repo-name)/-/commit/(commit-id)
                                        $MessageString += "`n### ``Commit:`` [$CommitIdEmoji]» [$ShortedCommitid](https://gitlab.snowlab.tk/$($this.GitNameSpace)/$RepoName/-/commit/$CommitId) "
                                        $MessageString += " $AutoBuildState"
                                }
                                if ( $ExplotedContent[$i] -match "(FEATURE UPDATES)" ) {
                                        $MessageString += "$($ExplotedContent[$i]) |`n|-|`n"
                                } elseif ( $ExplotedContent[$i] -match "(FEATURE ADDTIONS)" ) {
                                        $MessageString += "$($ExplotedContent[$i]) |`n|-|`n"
                                } elseif ( $ExplotedContent[$i] -match "(BREAKING CHANGES)" ) {
                                        $MessageString += "$($ExplotedContent[$i]) |`n|-|`n"
                                } elseif ( $ExplotedContent[$i] -match "(BUGFIXES)" ) {
                                        $MessageString += "$($ExplotedContent[$i]) |`n|-|`n"
                                } else{
                                        $MessageString += "$($ExplotedContent[$i]) `n"
                                }
                                
                        }
                        try{
                                $MessageString | Set-Content -Path "$($this.ModuleRoot)\template.md" -Encoding utf8
                        }
                        catch [system.exception]{
                                Write-Error "Error: $($_.exception.message)"
                                exit
                        }
                        # Set it to class var so it can be used by other functions
                        $this.MessageStringFormatted = $MessageString
                }
                # Return the message string
                #TODO: Return this from another class function, say GetChangelog
                #      for testing delete the return statement and see if the function still works
                return  $MessageString
        }
        
        [string] WriteClMessage([String]$file){ 
                
                try{ 
                        Write-host "Checking for changelog file: $file"
                        $ChangeLogfile = (Get-itemproperty -Path $file).FullName
                        
                        # Call the WriteTemplateFile() to create and write to the template.md
                        
                        $this.WriteTemplateFile()

                        # Get the content of the template.md file
                        $TemplateContent = Get-Content -Path "$($this.ModuleRoot)\template.md" -raw
                        write-host "Fetching Template Contents: $($this.ModuleRoot)\template.md"

                        # get contents of changelog                9 file
                        $ExistingContent = Get-Content -Path $changelogfile -raw
                        Write-host "Fetching Changelog Contents: $changelogfile"

                        # Prepend the content of the template file to the changelog file
                        $AutoGenMessage += $TemplateContent + "`n`n" + $ExistingContent
                        write-host "Prepending Template Contents to Changelog: $changelogfile"

                        # Write the content to the template_final.md file
                        $AutoGenMessage | Set-Content -Path "$($this.ModuleRoot)\template_final.md" -Encoding utf8
                        write-host "Writing Template Contents to Template_final.md: $($this.ModuleRoot)\template_final.md"
                        
                        # # Get the content of the changelog file
                        $ChangeLogFinal = Get-Content -Path "$($this.ModuleRoot)\template_final.md" -raw
                        write-host "Fetching Template_final.md Contents: $($this.ModuleRoot)\template_final.md"
                        
                        # Write the content to the changelog file
                        write-host "Writing Template_final.md Contents to Changelog: $changelogfile"
                        $ChangeLogFinal | Set-Content -Path $changelogfile -Encoding utf8

                        return "Successfully Updated ChangeLog: $changelogfile"
                }
                catch [system.exception]{
                        Write-Host "File not found $($_.exception.message)"
                        exit
                }

        }
}