---
aliases:
  - Projects Hub
area: office
created: 2025-06-02 17:07
title: Projects Hub
type: hub
updated: 2025-07-07 16:03
---

up:: [Master Dashboard](master-dashboard.md)

# Projects Hub

## 🚀 All Active & Planned Projects

```dataview
TABLE WITHOUT ID
    link(file.link, title) AS Project,
    status AS Status,
    area AS Area,
    context AS Context,
    goal AS Goal
FROM "projects" AND !"templates"
WHERE type = "project_hub"
    AND (status = "inprogress" OR status = "todo" OR status = "onhold")
SORT priority ASC, deadline ASC
```

## Tasks by Project

```dataview
TASK
FROM "projects"
WHERE project
GROUP BY project 
```
