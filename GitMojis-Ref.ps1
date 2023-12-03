$gmo = New-Object -TypeName gmo
$gmo.jsonData = Get-Content -path "$PSScriptRoot\libs\gitmojis.json" | ConvertFrom-Json
$gmo_template = @{Name = $null; emoji = $null; code = $null; entity = $null; description = $null; semver = $null }

#& CONFIG ------------------------------------------------------------------------
$gmo.feature = $gmo.jsonData.gitmojis | where-object { $_.name -eq "sparkles" }
$gmo.fix = $gmo.jsonData.gitmojis | where-object { $_.name -eq "bug" }
$gmo.docs = $gmo.jsonData.gitmojis | where-object { $_.name -eq "memo" }
$gmo.chore = $gmo.jsonData.gitmojis | where-object { $_.name -eq "wrench" }
$gmo.refactor = $gmo.jsonData.gitmojis | where-object { $_.name -eq "art" }
$gmo.build = $gmo.jsonData.gitmojis | where-object { $_.name -eq "hammer" }
$gmo.ci = $gmo.jsonData.gitmojis | where-object { $_.name -eq "green_heart" }
$gmo.perf = $gmo.jsonData.gitmojis | where-object { $_.name -eq "zap" }
$gmo.test = $gmo.jsonData.gitmojis | where-object { $_.name -eq "white_check_mark" }
$gmo.style = $gmo.jsonData.gitmojis | where-object { $_.name -eq "lipstick" }
$gmo.revert = $gmo.jsonData.gitmojis | where-object { $_.name -eq "rewind" }
$gmo.deps = $gmo.jsonData.gitmojis | where-object { $_.name -eq "arrow_up" }
$gmo.config = $gmo.jsonData.gitmojis | where-object { $_.name -eq "wrench" }
$gmo.merge = $gmo.jsonData.gitmojis | where-object { $_.name -eq "twisted_rightwards_arrows" }
$gmo.deploy = $gmo.jsonData.gitmojis | where-object { $_.name -eq "rocket" }
$gmo.release = $gmo.jsonData.gitmojis | where-object { $_.name -eq "tada" }
$gmo.security = $gmo.jsonData.gitmojis | where-object { $_.name -eq "lock" }
$gmo.other = $gmo.jsonData.gitmojis | where-object { $_.name -eq "package" }
#&-ADD TO
#* ADDING NEW **[ Type ]**
#~  Add new types by adding a new object to the $gmo.jsonData.gitmojis array
$gmo | Add-Member -MemberType NoteProperty -Name "MyNewFeature" -Value $gmo_template                                                                                                                                                
# then pupulate it with data from gitmojis.json
$gmo.MyNewFeature = $gmo.jsonData.gitmojis | where-object { $_.name -eq "sparkles" }
$gmo
#& CONFIG ------------------------------------------------------------------------
<#
---------------------------------------------------------------------------------------------------------------------------------------------------------/*
@URL: https://github.com/carloscuesta/gitmoji/blob/master/packages/gitmojis/src/gitmojis.json #!----------------------------------------------------------|
----------------------------------------------------------------------------------------------------------------------------------------------------------*
~Name                     emoji code                        entity                    description                                                   semver
~----                     a----- ----                       ------                    -----------                                                   ------
art                       🎨    :art:                       &#x1f3a8;                 Improve structure / format of the code.
zap                       ⚡️     :zap:                       &#x26a1;                  Improve performance.                                          patch
fire                      🔥    :fire:                      &#x1f525;                 Remove code or files.
bug                       🐛    :bug:                       &#x1f41b;                 Fix a bug.                                                    patch
ambulance                 🚑️    :ambulance:                 &#128657;                 Critical hotfix.                                              patch
sparkles                  ✨    :sparkles:                  &#x2728;                  Introduce new features.                                       minor
memo                      📝    :memo:                      &#x1f4dd;                 Add or update documentation.
rocket                    🚀    :rocket:                    &#x1f680;                 Deploy stuff.
lipstick                  💄    :lipstick:                  &#ff99cc;                 Add or update the UI and style files.                         patch
tada                      🎉    :tada:                      &#127881;                 Begin a project.
white-check-mark          ✅    :white_check_mark:          &#x2705;                  Add, update, or pass tests.
lock                      🔒️    :lock:                      &#x1f512;                 Fix security issues.                                          patch
closed-lock-with-key      🔐    :closed_lock_with_key:      &#x1f510;                 Add or update secrets.
bookmark                  🔖    :bookmark:                  &#x1f516;                 Release / Version tags.
rotating-light            🚨    :rotating_light:            &#x1f6a8;                 Fix compiler / linter warnings.
construction              🚧    :construction:              &#x1f6a7;                 Work in progress.
green-heart               💚    :green_heart:               &#x1f49a;                 Fix CI Build.
arrow-down                ⬇️    :arrow_down:                ⬇️                        Downgrade dependencies.                                       patch
arrow-up                  ⬆️    :arrow_up:                  ⬆️                        Upgrade dependencies.                                         patch
!pushpin                   📌    :pushpin:                   &#x1F4CC;                 Pin dependencies to specific versions.                        patch
!construction-worker       👷    :construction_worker:       &#x1f477;                 Add or update CI build system.
chart-with-upwards-trend  📈    :chart_with_upwards_trend:  &#x1F4C8;                 Add or update analytics or track code.                        patch
recycle                   ♻️    :recycle:                   &#x267b;                  Refactor code.
heavy-plus-sign           ➕    :heavy_plus_sign:           &#10133;                  Add a dependency.                                             patch
heavy-minus-sign          ➖    :heavy_minus_sign:          &#10134;                  Remove a dependency.                                          patch
wrench                    🔧    :wrench:                    &#x1f527;                 Add or update configuration files.                            patch
!hammer                    🔨    :hammer:                    &#128296;                 Add or update development scripts.
globe-with-meridians      🌐    :globe_with_meridians:      &#127760;                 Internationalization and localization.                        patch
!pencil2                   ✏️    :pencil2:                   &#59161;                  Fix typos.                                                    patch
poop                      💩    :poop:                      &#58613;                  Write bad code that needs to be improved.
!rewind                    ⏪️    :rewind:                    &#9194;                   Revert changes.                                               patch
!twisted-rightwards-arrows 🔀    :twisted_rightwards_arrows: &#128256;                 Merge branches.
package                   📦️    :package:                   &#1F4E6;                  Add or update compiled files or packages.                     patch
alien                     👽️    :alien:                     &#1F47D;                  Update code due to external API changes.                      patch
!truck                     🚚    :truck:                     &#1F69A;                  Move or rename resources (e.g.: files, paths, routes).
page-facing-up            📄    :page_facing_up:            &#1F4C4;                  Add or update license.
!boom                      💥    :boom:                      &#x1f4a5;                 Introduce breaking changes.                                   major
bento                     🍱    :bento:                     &#1F371                   Add or update assets.                                         patch
wheelchair                ♿️    :wheelchair:                &#9855;                   Improve accessibility.                                        patch
bulb                      💡    :bulb:                      &#128161;                 Add or update comments in source code.
beers                     🍻    :beers:                     &#x1f37b;                 Write code drunkenly.
speech-balloon            💬    :speech_balloon:            &#128172;                 Add or update text and literals.                              patch
card-file-box             🗃️    :card_file_box:             &#128451;                 Perform database related changes.                             patch
loud-sound                🔊    :loud_sound:                &#128266;                 Add or update logs.
mute                      🔇    :mute:                      &#128263;                 Remove logs.
busts-in-silhouette       👥    :busts_in_silhouette:       &#128101;                 Add or update contributor(s).
children-crossing         🚸    :children_crossing:         &#128696;                 Improve user experience / usability.                          patch
building-construction     🏗️    :building_construction:     &#1f3d7;                  Make architectural changes.
iphone                    📱    :iphone:                    &#128241;                 Work on responsive design.                                    patch
clown-face                🤡    :clown_face:                &#129313;                 Mock things.
egg                       🥚    :egg:                       &#129370;                 Add or update an easter egg.                                  patch
see-no-evil               🙈    :see_no_evil:               &#8bdfe7;                 Add or update a .gitignore file.
camera-flash              📸    :camera_flash:              &#128248;                 Add or update snapshots.
alembic                   ⚗️    :alembic:                   &#x2697;                  Perform experiments.                                          patch
mag                       🔍️    :mag:                       &#128269;                 Improve SEO.                                                  patch
label                     🏷️    :label:                     &#127991;                 Add or update types.                                          patch
seedling                  🌱    :seedling:                  &#127793;                 Add or update seed files.
triangular-flag-on-post   🚩    :triangular_flag_on_post:   &#x1F6A9;                 Add, update, or remove feature flags.                         patch
goal-net                  🥅    :goal_net:                  &#x1F945;                 Catch errors.                                                 patch
animation                 💫    :dizzy:                     &#x1f4ab;                 Add or update animations and transitions.                     patch
wastebasket               🗑️    :wastebasket:               &#x1F5D1;                 Deprecate code that needs to be cleaned up.                   patch
passport-control          🛂    :passport_control:          &#x1F6C2;                 Work on code related to authorization, roles and permissions. patch
adhesive-bandage          🩹    :adhesive_bandage:          &#x1FA79;                 Simple fix for a non-critical issue.                          patch
monocle-face              🧐    :monocle_face:              &#x1F9D0;                 Data exploration/inspection.
coffin                    ⚰️    :coffin:                    &#x26B0;                  Remove dead code.
test-tube                 🧪    :test_tube:                 &#x1F9EA;                 Add a failing test.
necktie                   👔    :necktie:                   &#128084;                 Add or update business logic.                                 patch
stethoscope               🩺    :stethoscope:               &#x1FA7A;                 Add or update healthcheck.
bricks                    🧱    :bricks:                    &#x1f9f1;                 Infrastructure related changes.
technologist              🧑‍💻    :technologist:              &#129489;&#8205;&#128187; Improve developer experience.
money-with-wings          💸    :money_with_wings:          &#x1F4B8;                 Add sponsorships or money related infrastructure.
thread                    🧵    :thread:                    &#x1F9F5;                 Add or update code related to multithreading or concurrency.
safety-vest               🦺    :safety_vest:               &#x1F9BA;                 Add or update code related to validation.
-----------------------------------------------------
#>e