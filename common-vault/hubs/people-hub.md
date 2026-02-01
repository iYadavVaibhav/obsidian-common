---
aliases: [People Hub]
created: 2025-06-30 20:15
status: active
title: People Hub
type: hub
updated: 2025-12-02 18:03
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

```base
filters:
  and:
    - file.inFolder("people")
    - file.name != "0-hub-people"
formulas:
  Title: link(file.asLink(), title)
  Created: file.ctime.format("h:mm a - ddd, D MMM yyyy")
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - formula.Created
      - role
      - manager_login
    sort: []
    columnSize:
      formula.Title: 289
      note.role: 152

```


## Readme - People Management in Obsidian

A system in [Obsidian](obsidian.md) to do people management like CRM.

- Use [people-template](people-template.md) to create new person.
