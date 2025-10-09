---
layout: default
title: New-CommitFusion
description: "Initializes a new instance of the commit fusion class."
permalink: /cmdlets/new-commitfusion
parent: Cmdlets
---

# **New-CommitFusion**

---


**New-CommitFusion** `0` **Parameters** it will return a new instance of the commit fusion class.

{: .note }
> if you want to use the `commitfusion_class.psm1` lib directly see `$moduleroot/libs/commitfusion_class.lib` for more information.

🟢 Syntax

```pre
New-CommitFusion
```
{: .fs-5 .fw-300 }

*🟠 Parameter List*
 - None

> #### 🟣 For Example

```powershell
$commitfusion = New-CommitFusion

$commitfusion | Get-Member

Name                   MemberType Definition
----                   ---------- ----------
AsObject               Method     psobject AsObject()
AsRawString            Method     string AsRawString()
CleanEmojis            Method     string CleanEmojis(string string)
ConventionalCommit     Method     void ConventionalCommit(string Type, string Scope, string Description, string[] Notes, bool Footer, string GitUser, string GitGrou… 
DisableEmojis          Method     void DisableEmojis()
EnableEmojis           Method     void EnableEmojis()
Equals                 Method     bool Equals(System.Object obj)
GetCiSet               Method     psobject[] GetCiSet()
GetCiSetFusion         Method     psobject[] GetCiSetFusion()
GetEmoji               Method     string GetEmoji(string set, string name)
GetEmojiIndex          Method     psobject GetEmojiIndex(string set)
GetHashCode            Method     int GetHashCode()
GetType                Method     type GetType()
ToString               Method     string ToString()
WriteClMessage         Method     string WriteClMessage(string file)
WriteTemplateFile      Method     string WriteTemplateFile()
BodyBullet             Property   string BodyBullet {get;set;}
BodyIndention          Property   string BodyIndention {get;set;}
Breakingchanges        Property   string[] Breakingchanges {get;set;}
Bugfixes               Property   string[] Bugfixes {get;set;}
CFConfig               Property   psobject CFConfig {get;set;}
ConstructMessageObject Property   psobject ConstructMessageObject {get;set;}
Description            Property   string Description {get;set;}
EmojiEnabled           Property   bool EmojiEnabled {get;set;}
EmojiIndex             Property   psobject EmojiIndex {get;set;}
FeatureAdditions       Property   string[] FeatureAdditions {get;set;}
Featurenotes           Property   string[] Featurenotes {get;set;}
Footer                 Property   string Footer {get;set;}
ForMarkDown            Property   bool ForMarkDown {get;set;}
FusionConfigPath       Property   string FusionConfigPath {get;set;}
GitGroup               Property   string GitGroup {get;set;}
GitMojiIndex           Property   psobject GitMojiIndex {get;set;}
GitNameSpace           Property   string GitNameSpace {get;set;}
GitSource              Property   string GitSource {get;set;}
GitUser                Property   string GitUser {get;set;}
IconSet                Property   psobject IconSet {get;set;}
MessageStringFormatted Property   string MessageStringFormatted {get;set;}
ModuleRoot             Property   string ModuleRoot {get;set;}
Notes                  Property   string[] Notes {get;set;}
Scope                  Property   string Scope {get;set;}
SemanticVersion        Property   string SemanticVersion {get;set;}
Styledbody             Property   string Styledbody {get;set;}
Type                   Property   string Type {get;set;}
```

