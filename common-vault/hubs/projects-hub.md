---
aliases:
  - Projects Hub
created: 2025-06-02 17:07
title: Projects Hub
type: hub
updated: 2025-09-26 21:34
---

up:: [Master Dashboard](master-dashboard.md)

# Projects Hub

```meta-bind-button
label: New Project
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
    templateFile: templates/project-automation.md
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

## 🚀 All Active & Planned Projects

```base
filters:
  and:
    - file.inFolder("projects")
    - type == "project_hub"
formulas:
  Link: link(file.asLink(), title)
  Started: file.ctime.format("D MMM, YY")
views:
  - type: table
    name: Projects
    order:
      - formula.Link
      - status
      - context
      - formula.Started
    sort:
      - property: created
        direction: DESC
    columnSize:
      note.status: 79

```

## Tasks by Project

```dataview
TASK
FROM "projects"
WHERE project
GROUP BY project 
```

## Readme - Project Management in Obsidian

_about project, tasks, meetings, docs, notes management in Obsidian_

### Structure

Each project has its own folder with three core files:

- `hub-{slug}.md` - Dashboard with project **overview**, **index** and **dynamic** content
- `doc-{slug}.md` - Notepad for **notes**, **ideas**, **tasks**, and mind **dump** (like a **inbox**).
- `docs/` - for **docs**, **backlink** to `hub`, build **index** on `hub`.

### How to Use

- Use **Meta Button** at top of this note.
- Using template
	1. Open Command Pallet `cmd shift P`.
	2. `Templater: Create new note from template` choose `project-automation`

### Task Format

- Tasks can be at any place, within `projects/slug/`.
- Or any where in vault with a tag for slug. Eg: `- [ ] Task description #project/slug`

### Meetings

- Create a new meeting from [Meetings Hub](meetings-hub.md) and add `project` in **properties**.
- Or add anywhere in vault with `#type/meeting #project/slug`

### Best Practices

- Create tasks where they naturally arise in your notes.
- Link related notes to each other, avoid orphan notes.
