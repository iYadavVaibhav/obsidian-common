---
aliases: [<% tp.file.folder(true).split('/').pop() %>]
area:
context: build
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
description: ''
priority: medium
project: <% tp.file.folder(true).split('/').pop() %>
status: idea
title: Hub - <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project
type: project_hub
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project

up:: [Projects Dashboard](projects-hub.md)

## Overview

**Description**:
**Goal**:

## Quick Links

- [Doc - <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %>](doc-<% tp.file.folder(true).split('/').pop() %>.md) - Doc with Tasks and Overview

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
LIMIT 5
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

```dataview
LIST
FROM #type/meeting AND #project/<% tp.file.folder(true).split('/').pop() %>
LIMIT 5
```

```dataview
TABLE  WITHOUT ID
    link(file.path, title) AS "Meeting",
    file.ctime as "Date"
FROM #type/meeting AND #project/<% tp.file.folder(true).split('/').pop() %>
SORT file.ctime DESC
LIMIT 5
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

## Active Tasks (Linked Task Notes)
```dataview
TABLE WITHOUT ID
    link(file.link, title) AS Task,
    priority,
    status,
    due_date AS "Due",
    effort AS "Effort (h)"
FROM #type/task_note AND !"templates"
WHERE project_link = link(this.file.link) AND (status = "todo" OR status = "inprogress")
SORT priority ASC, due_date ASC
```

## Linked Notes

```dataview
LIST WITHOUT ID
link(file.path, title)
where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```

## Tagged Notes

```dataview
LIST
FROM #project/<% tp.file.folder(true).split('/').pop() %> AND !#type/meeting
SORT file.ctime DESC
LIMIT 3
```

