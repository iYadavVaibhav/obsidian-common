---
aliases:
  - Tasks Hub
created: 2025-06-02 11:43
title: Tasks Hub
type: hub
updated: 2025-07-02 10:14
---

up:: [Master Dashboard](master-dashboard.md)

# Tasks Hub

## All Inline Tasks

_This provides a broad overview of all checklist items managed by the Tasks plugin._

```tasks
not done
path does not include templates
path does not include archive
group by filename
sort by start desc
```

## Not Done

```dataview
TASK
FROM "/"
WHERE !completed 
SORT file.mtime DESC
```

## Done

```tasks
done
```
