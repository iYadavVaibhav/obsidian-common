---
aliases:
  - Tasks Hub
created: 2025-06-02 11:43
title: Tasks Hub
type: hub
updated: 2026-02-23 14:31
---

up:: [Master Dashboard](master-dashboard.md)

# Tasks Hub

_manage all tasks in the vault_

## 🚨 Action Required

### Overdue Tasks

```dataview
TASK
WHERE !completed AND due AND due < date(today) AND !contains(file.path, "templates") AND !contains(file.path, "archive")
SORT file.cday DESC, due ASC
```

### Due this week

```dataview
TASK
WHERE !completed AND ((due AND due >= date(today) AND due <= date(today) + dur(7 days)) OR (start AND start >= date(today) AND start <= date(today) + dur(7 days)))
SORT due ASC, start ASC
```

### Due in Future

```dataview
TASK
WHERE !completed AND ((due AND due > date(today) + dur(7 days)) OR (start AND start > date(today) + dur(7 days)))
SORT due ASC, start ASC
```

## Prioritized

### Urgent

```dataview
TASK
WHERE !completed AND !due AND (contains(text, "🔺") OR contains(text, "⏫")) AND !contains(file.path, "templates") AND !contains(file.path, "archive")
SORT due ASC
```

### Priority

```dataview
TASK
WHERE !completed AND !due AND (contains(text, "🔼") OR contains(text, "🔽") OR contains(text, "⏬️")) AND !contains(file.path, "templates") AND !contains(file.path, "archive")
SORT due ASC
```

---

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

## 📋 Other Tasks

_All tasks in the vault, ordered by most recently created first_

```dataview
TASK
WHERE !completed AND !due AND !contains(text, "🔺") AND !contains(text, "⏫") AND !contains(text, "🔼") AND !contains(text, "🔽") AND !contains(text, "⏬️") AND !contains(text, "#status/handover")
SORT file.mday DESC
```

---

_never used_

## 📋 All by File Link

```dataview
TASK
WHERE !completed
GROUP BY file.link
SORT file.cday DESC
```

## ✅ Recently Completed

```dataview
TASK
WHERE completed AND completion >= date(today) - dur(20 days)
SORT completion DESC
LIMIT 20

```
