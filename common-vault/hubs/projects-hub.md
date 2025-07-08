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

## Projects

```dataview
TABLE WITHOUT ID
	link(file.path, title) AS "Project",
	status
FROM "projects"
WHERE type = "project_hub"
SORT due_date ASC
```

## Tasks by Project

```dataview
TASK
FROM "projects"
WHERE project
GROUP BY project 
```
