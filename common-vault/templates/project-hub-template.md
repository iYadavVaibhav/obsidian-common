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

## Recent Notes

```dataview
LIST WITHOUT ID
	link(file.path, title)
FROM "projects/<% tp.file.folder(true).split('/').pop() %>"
WHERE file.name != "hub-<% tp.file.folder(true).split('/').pop() %>" 
  AND file.name != "doc-<% tp.file.folder(true).split('/').pop() %>"
SORT file.mtime DESC
LIMIT 50
```

## Active Tasks

```tasks
not done
path includes projects/<% tp.file.folder(true).split('/').pop() %>
sort by due desc
sort by start desc
hide backlink
limit 50
```


## Daily Note Mentions

_tagged or linked_

```dataview
LIST
    L.text
FROM "daily-notes"
FLATTEN file.lists as L
WHERE (contains(L.text, "#project/<% tp.file.folder(true).split('/').pop() %>") OR contains(L.text, "hub-<% tp.file.folder(true).split('/').pop() %>")) AND !contains(L.text, "#type/meeting")
SORT file.cday DESC
LIMIT 50
```

## Linked Notes

_linked, not in daily notes_

```dataview
LIST WITHOUT ID
link(file.path, title)
from !"daily-notes"
where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```

## Recent Meetings

```dataview
LIST WITHOUT ID
	link(file.path, title) + " - " + file.ctime
FROM "meeting-notes"
WHERE project = this.file.link
SORT file.ctime DESC
LIMIT 5
```

## Inline Meeting Notes

```dataview
LIST
    L.text
FROM #type/meeting OR #project/<% tp.file.folder(true).split('/').pop() %>
FLATTEN file.lists as L
WHERE contains(L.text, "#type/meeting") AND contains(L.text, "#project/<% tp.file.folder(true).split('/').pop() %>")
SORT file.cday DESC
LIMIT 10
```