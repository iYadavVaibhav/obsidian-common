---
aliases: [Master Dashboard]
created: 2025-05-13 11:50
modified: 2025-05-23 03:12:55
title: Master Dashboard
type: dashboard
updated: 2025-07-07 15:27
---

# Master Dashboard

`$= '[[daily-notes/'+moment().format("YYYY/MM-MMM/YYYY-MM-DD-ddd")+'|Today Daily Note]]'`

## Handovers

```dataview
TASK
FROM "/"
WHERE !completed 
AND (
	contains(tags, "status/handover")
	OR contains(tags, "status/handover")
)
SORT file.mtime DESC
```

## 📅 Today's Tasks

```tasks
not done
due today
```

## ⚠️ Overdue Tasks

```tasks
not done
due before today
```

## 🚀 Active Projects

```dataview
TABLE WITHOUT ID
	link(file.path, title) AS "Project",
	status
FROM "projects"
WHERE type = "project_hub"
SORT due_date ASC
```

## 👥 Recent People Interactions

_not used_

```dataview
LIST WITHOUT ID
	link(file.path, title)
FROM "people"
SORT file.mtime DESC
LIMIT 5
```

## 📝 Recent Meeting Notes

_not used_

**Last 5 Meeting Notes**

```dataview
LIST WITHOUT ID
	link(file.path, title)
FROM ""
WHERE
	type = "meeting"
SORT file.ctime DESC
LIMIT 10
```

**Last 5 Meeting Blocks**

```dataview
LIST 
	L.text
FROM #type/meeting
FLATTEN file.lists as L
WHERE contains(L.text, "#type/meeting")
SORT file.ctime DESC
Limit 5
```
