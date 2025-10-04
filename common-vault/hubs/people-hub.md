---
aliases: [People Hub]
created: 2025-06-30 20:15
status: active
title: People Hub
type: hub
updated: 2025-09-26 21:56
---

up:: [Master Dashboard](master-dashboard.md)

# People Hub

```meta-bind-button
label: New Person
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
    templateFile: templates/people-template.md
    folderPath: people
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

---

## People Notes

```dataview
LIST WITHOUT ID
    link(file.path, title)
from "people"
WHERE file.name != "0-hub-people"
sort file.name asc
```

## Readme - People Management in Obsidian

A system in [Obsidian](obsidian.md) to do people management like CRM.

- Use [people-template](people-template.md) to create new person.
