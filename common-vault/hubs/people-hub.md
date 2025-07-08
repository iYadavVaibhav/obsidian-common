---
aliases: [People Hub]
area: personal
created: 2025-06-30 20:15
status: active
title: People Hub
type: hub
updated: 2025-07-09 00:31
---

up:: [Master Dashboard](master-dashboard.md)

# People Hub

```meta-bind-button
label: New Person
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
    templateFile: templates/people-template.md
    folderPath: people
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

A system in [Obsidian](obsidian.md) to do people management like CRM.

---

## Inline People

- Saurav, Bihar
    - Work: Romodo
    - Son: Darshil

- [ ] Add recently contacted
- [ ] add person by type

---

## People Notes

```dataview
LIST WITHOUT ID
    link(file.path, title)
from "people"
WHERE file.name != "0-hub-people"
sort file.name asc
```
