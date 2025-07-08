---
aliases: [Meetings Hub]
area: office
created: 2025-06-30 20:15
status: active
title: Meetings Hub
type: hub
updated: 2025-07-07 16:02
---

up:: [Master Dashboard](master-dashboard.md)

# Meetings Hub

```meta-bind-button
label: New Meeting
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
style: primary
id: ""
hidden: false
actions:
  - type: templaterCreateNote
    templateFile: templates/meeting-template.md
    folderPath: meeting-notes
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

A system in [Obsidian](obsidian.md) to do meeting management.

- Uses the [meeting-template](meeting-template.md) for notes
	- Automatically moves to correct folder, adds Slug, Title.

- Ways to create new note:
	- Using button above
	- Creating new note in `meeting-notes` folder
	- Use command: `Templater: Create new note from template`, then pick [meeting-template](meeting-template.md).

- Project Linking
	- Add `project` as key in FrontMatter, then add **link to project-hub** as value.

---

_below is automated_

## Meetings Notes

```dataview
TABLE WITHOUT ID
link(file.path, title) as Title,
file.cday as Created,
summary as Summary
from "meeting-notes"
SORT file.cday DESC
```

## Inline Meetings

```dataview
LIST WITHOUT ID
	link(file.path, title)
FROM #type/meeting
SORT file.ctime DESC
LIMIT 50
```
