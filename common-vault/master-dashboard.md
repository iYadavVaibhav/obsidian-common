---
aliases: [Master Dashboard]
created: 2025-05-13 11:50
title: Master Dashboard
type: dashboard
updated: 2025-07-09 00:34
---

# Master Dashboard

Welcome to my obsidian vault!

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

## 🔗 Hubs

```dataview
LIST WITHOUT ID
link(file.link, title)
FROM ""
WHERE type = "hub"
SORT updated DESC
LIMIT 15
```

## ⚠️ Overdue Tasks

```tasks
not done
due before today
path does not include templates
path does not include archive
group by due
```

## 🎯 Tasks Due Today

```tasks
not done
due today
path does not include templates
path does not include archive
group by priority
```

## ⏳ Upcoming Tasks (Next 7 Days)

_Not used_

```tasks
not done
due after today and due before today - 8
path does not include templates
path does not include archive
group by due
```

## ✍️ Recent Notes

```dataview
LIST WITHOUT ID
    link(file.link, title)
FROM !"templates" AND !"daily-notes" AND !"weekly-notes" AND !"inbox" AND !"archive" // Exclude certain folders
SORT updated DESC
LIMIT 10
```

## 🚀 Active Projects

```dataview
TABLE WITHOUT ID
    link(file.link, title) AS Project,
    status AS Status,
    priority AS Priority,
    context AS Context,
    deadline AS Deadline
FROM "projects" AND !"templates"
WHERE type = "project_hub"
    AND (status = "inprogress" OR status = "todo" OR status = "onhold")
SORT priority ASC, deadline ASC
LIMIT 10
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

## 👀 Docs to Review

^6d1334

```dataview
TABLE WITHOUT ID
    link(file.path, title) as Note,
    file.folder as Folder
FROM !"templates"
WHERE contains(tags, "status/review")
OR contains(status, "review")
OR contains(file.tags, "status/review")
SORT file.folder ASC, file.mtime DESC
```
