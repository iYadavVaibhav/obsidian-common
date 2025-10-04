---
aliases: [Physical Objects Hub]
created: 2025-07-07 16:02
status: active
title: Physical Objects Hub
type: hub
updated: 2025-09-26 21:47
---

up:: [Master Dashboard](master-dashboard.md)

# Physical Objects Hub

```meta-bind-button
label: New Object
icon: ""
style: primary
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
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

---

_below is automated_

## Physical Objects Notes

```dataview
TABLE WITHOUT ID
link(file.path, title) as Title,
purchased as Purchased,
price as Price
from "physical-objects"
SORT file.cday DESC
```

## Readme - Physical Objects Management in Obsidian

- Ways to create new note:
	- Using button above
	- Creating new note in `physical-objects` folder
	- Use command: `Templater: Create new note from template`, then pick [physical-object-template](physical-object-template.md).
