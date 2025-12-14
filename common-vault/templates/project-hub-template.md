---
aliases:
  - <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project Hub
area: 
context: build
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
description: ""
priority: medium
project: <% tp.file.folder(true).split('/').pop() %>
status: inprogress
title: <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project Hub
type: project_hub
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project Hub

up:: [Projects Dashboard](projects-hub.md)

## Overview

**Description**:
**Goal**:

## Documents

- [Notes - <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %>](doc-<% tp.file.folder(true).split('/').pop() %>.md) - Notes, ideas, tasks and mind dump.

---

_below is automated_

## Recent Updates

_last few files updated in this project_

```base
filters:
  and:
    - file.inFolder("projects/<% tp.file.folder(true).split('/').pop() %>")
    - file.name != "hub-<% tp.file.folder(true).split('/').pop() %>"
    - file.name != "doc-<% tp.file.folder(true).split('/').pop() %>"
formulas:
  Title: link(file.asLink(), title)
  Created: file.ctime.format("h:mm a - ddd, D MMM yyyy")
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - formula.Created
    sort:
      - property: file.mtime
        direction: DESC
    columnSize:
      formula.Title: 400

```

## Active Tasks

_project folder only_

```tasks
not done
path includes projects/<% tp.file.folder(true).split('/').pop() %>
sort by due desc
sort by start desc
hide backlink
limit 50
```

---

## Linked or Tagged

### Daily Note Mentions

_inline tagged or linked, excludes ~~type/meeting~~_

```dataview
LIST
    L.text
FROM "daily-notes"
FLATTEN file.lists as L
WHERE (contains(L.text, "#project/<% tp.file.folder(true).split('/').pop() %>") OR contains(L.text, "hub-<% tp.file.folder(true).split('/').pop() %>")) AND !contains(L.text, "#type/meeting")
SORT file.cday DESC
LIMIT 50
```

### Other Notes Mentions

_linked or tagged, excludes ~~daily notes~~_

```base
filters:
  and:
    - '!file.inFolder("daily-notes")'
    - '!file.inFolder("meeting-notes")'
    - or:
        - file.hasLink(this.file)
        - file.tags == ["project/<% tp.file.folder(true).split('/').pop() %>"]
formulas:
  Title: link(file.asLink(), title)
  Created: file.ctime.format("h:mm a - ddd, D MMM yyyy")
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - formula.Created
    sort:
      - property: file.ctime
        direction: DESC
    columnSize:
      formula.Title: 400

```

---

## Meetings

### Inline Meeting Notes

_use `type/meeting` and project link or tag_

```dataview
LIST
    L.text
FROM #type/meeting
FLATTEN file.lists as L
WHERE
	contains(L.text, "#type/meeting") AND (
		contains(L.text, "#project/<% tp.file.folder(true).split('/').pop() %>") OR
		contains(L.text, "hub-<% tp.file.folder(true).split('/').pop() %>")
	)

SORT file.cday DESC
LIMIT 10
```

### Dedicated Meeting Notes

_use meeting note with `project` key_

```base
filters:
  and:
    - file.inFolder("meeting-notes")
    - file.hasLink(this.file)
formulas:
  Title: link(file.asLink(), title)
  Created: file.ctime.format("h:mm a - ddd, D MMM yyyy")
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - formula.Created
    sort:
      - property: file.ctime
        direction: DESC
    limit: 10
    columnSize:
      formula.Title: 400
```
