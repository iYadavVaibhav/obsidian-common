---
aliases: [Meetings Hub]
created: 2025-06-30 20:15
status: active
title: Meetings Hub
type: hub
updated: 2025-12-02 12:21
---

up:: [Master Dashboard](master-dashboard.md)

# Meetings Hub

```meta-bind-button
label: New Meeting
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
    templateFile: templates/meeting-template.md
    folderPath: meeting-notes
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

---

_below is automated_

## Meetings Notes

```base
filters:
  and:
    - file.inFolder("meeting-notes")
formulas:
  Title: link(file.asLink(), title)
views:
  - type: table
    name: Table
    order:
      - formula.Title
    sort:
      - property: file.ctime
        direction: DESC
```

## Inline Meetings

```dataview
LIST 
	L.text
FROM #type/meeting
FLATTEN file.lists as L
WHERE contains(L.text, "#type/meeting")
SORT file.ctime DESC
Limit 100
```

## Recurring Meetings

```base
filters:
  and:
    - type == "recurring_meeting"
formulas:
  Title: link(file.asLink(), title)
views:
  - type: table
    name: Table
    order:
      - formula.Title

```

## Readme - Meetings Management in Obsidian

- Uses the [meeting-template](meeting-template.md) for meeting notes
	- Automatically moves to correct folder, adds Slug, Title.

- Recurring Meetings
	- Has dedicated page, with `type::recurring_meeting`
	- can have log of occurrence on the page, or on daily-notes.

- Ways to create new note:
	- Using button above, OR
	- Creating new note in `meeting-notes` folder, OR
	- Use command: `Templater: Create new note from template`, then pick [meeting-template](meeting-template.md).

- Project Linking
	- Add `project` as _key_ in **FrontMatter**, then add **link to project-hub** as value.
