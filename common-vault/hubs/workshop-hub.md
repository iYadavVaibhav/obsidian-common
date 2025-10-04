---
aliases:
  - Workshops Hub
created: 2025-09-17 10:17
title: Workshops Hub
type: hub
updated: 2025-09-26 21:54
---

up:: [Master Dashboard](master-dashboard.md)

# Workshops Hub

```meta-bind-button
label: New Workshop
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
    templateFile: templates/workshop-automation.md
    folderPath: workshops
    fileName: ""
    openNote: true
    openIfAlreadyExists: true
```

## Workshops

```base
filters:
  and:
    - type == "workshop_hub"
    - '!file.inFolder("templates")'
formulas:
  Link: link(file.asLink(), title)
  Started: file.ctime.format("D MMM, YY")
properties:
  formula.Link:
    displayName: Workshop Title
  formula.Started:
    displayName: Started
views:
  - type: table
    name: Workshops Table
    order:
      - formula.Link
      - status
      - formula.Started
    sort:
      - property: file.ctime
        direction: DESC
    columnSize:
      formula.Link: 505
      note.status: 93

```

## Readme - Workshop Management in Obsidian

- Create new workshop
	- using button in [Workshops Hub](workshop-hub.md), or
	- using template [workshop-automation](workshop-automation.md)

**Folder Structure**

```sh
workshops/
  slug/
    0-slug.md
```

**Workflow**
- You get the dedicated folder for workshop with `0-slug.md` as starting doc.
- In the same folder you can add more notes and link them in `0-slug.md` as a hub.
- The doc automatically links to this Hub.

**Status**
- todo
- inprogress
- done
- review - you have done but need to review it.

TODO:

- [ ] if a note is created in `workshops/slug/*` then auto link it to `0-slug.md` with `up::` key.
