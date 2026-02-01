---
aliases:
  - Tasks Hub
created: 2025-06-02 11:43
title: Tasks Hub
type: hub
updated: 2026-01-28 09:30
---

up:: [Master Dashboard](master-dashboard.md)

# Tasks Hub

_manage all tasks in the vault_

## 🚨 Action Required

### Overdue Tasks

_Tasks that need immediate attention_

```dataview
TASK
WHERE !completed AND due AND due < date(today) AND !contains(file.path, "templates") AND !contains(file.path, "archive")
SORT file.cday DESC, due ASC
```

### High Priority Tasks

_Focus on these first_

```tasks
not done
priority is high
path does not include templates
path does not include archive
sort by due asc
```

---

## 📅 Due or Start This Week

```dataview
TASK
WHERE !completed AND ((due AND due >= date(today) AND due <= date(today) + dur(7 days)) OR (start AND start >= date(today) AND start <= date(today) + dur(7 days)))
SORT due ASC, start ASC
```

## 📅 Due or Start Beyond This Week

```dataview
TASK
WHERE !completed AND ((due AND due > date(today) + dur(7 days)) OR (start AND start > date(today) + dur(7 days)))
SORT due ASC, start ASC
```

## Prioritized

### Medium Priority

```tasks
not done
priority is medium
path does not include templates
path does not include archive
sort by due asc
```

### Low Priority

```tasks
not done
priority is low
path does not include templates
path does not include archive
sort by due asc
```

---

## 📋 All Recent Tasks

_All tasks in the vault, ordered by most recently created first_

```dataview
TASK
WHERE !completed
SORT file.cday DESC
```

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

---
