---
aliases:
  - Tasks Hub
area: office
created: 2025-06-02 11:43
title: Tasks Hub
type: hub
updated: 2025-07-02 10:14
---

# Tasks Hub

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
