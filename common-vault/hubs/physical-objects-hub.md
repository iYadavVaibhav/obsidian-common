---
aliases: [Physical Objects Hub]
created: 2025-07-07 16:02
status: active
title: Physical Objects Hub
type: hub
updated: 2025-07-07 16:02
---

up:: [Master Dashboard](master-dashboard.md)

# Physical Objects Hub

```meta-bind-button
label: New Object
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
    templateFile: templates/physical-object-template.md
    folderPath: physical-objects
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

A system in [Obsidian](obsidian.md) to do physical objects management.

- Uses the [physical-object-template](physical-object-template.md) for notes
	- Automatically moves to correct folder, adds Slug, Title.

- Ways to create new note:
	- Using button above
	- Creating new note in `physical-objects` folder
	- Use command: `Templater: Create new note from template`, then pick [physical-object-template](physical-object-template.md).

---

_below is automated_

## Physical Objects Notes

```dataview
TABLE WITHOUT ID
link(file.path, title) as Title,
file.cday as Created,
price as Price
from "physical-objects"
SORT file.cday DESC
```

