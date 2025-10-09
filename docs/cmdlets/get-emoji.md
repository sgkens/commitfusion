---
layout: default
title: Get-Emoji
description: "Gets emoji from the `GitMojis.json` or `miscmojis.json` file."
permalink: /cmdlets/get-emoji
parent: Cmdlets
---

# Get-Emoji

## Overview
Gets emojis from either the `GitMojis.json` or `miscmojis.json` configuration files. You can retrieve all emojis of a specific type or search for a particular emoji by name.

## Syntax

```pre
Get-Emoji [ -t|Type ] <string(gitmojis|miscmojis)> [-n|Name] <string>
```
{: .fs-5 .fw-300 }

## Parameters

| Parameter | Type     | Required | Description |
|-----------|----------|:--------:|-------------|
| `-Type`   | String   | Yes      | Specifies the emoji collection to use: either `miscmojis` or `gitmojis` |
| `-Name`   | String   | No       | The name of the specific emoji to return. If omitted, returns all emojis of the specified type |

## Examples

### Example 1: Get a specific Git emoji
```powershell
Get-Emoji -Type gitmojis -Name bug
```
Returns the bug emoji from the gitmojis collection.

### Example 2: List all miscellaneous emojis
```powershell
Get-Emoji -Type miscmojis
```
Returns all emojis from the miscmojis collection.

## Notes
- The emoji collections are stored in JSON format
- Case-insensitive search is supported for the `-Name` parameter
- Returns `$null` if no matching emoji is found