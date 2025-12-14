---
aliases: [Master Dashboard]
created: 2025-05-13 11:50
title: Master Dashboard
type: dashboard
updated: 2025-12-08 12:06
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
SORT file.name ASC
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

```tasks
not done
due after today and due before today + 8
path does not include templates
path does not include archive
group by due
```

## ✍️ Recent Notes

```base
filters:
  and:
    - '!file.inFolder("templates")'
    - '!file.inFolder("daily-notes")'
    - '!file.inFolder("weekly-notes")'
    - '!file.inFolder("inbox")'
    - '!file.inFolder("z_archive")'
    - '!file.inFolder("archive")'
    - '!file.inFolder("hubs")'
    - file.ext != "log"
formulas:
  Title: link(file.asLink(), title)
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - file.folder
    sort:
      - property: file.mtime
        direction: DESC
    limit: 20
    columnSize:
      formula.Title: 400

```

## 👀 Docs to Review

```base
filters:
  and:
    - '!file.inFolder("templates")'
    - or:
        - status == "review"
        - file.tags == ["context/build"]
formulas:
  Title: link(file.asLink(), title)
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - file.folder
    sort:
      - property: file.folder
        direction: ASC
      - property: file.mtime
        direction: DESC

```
