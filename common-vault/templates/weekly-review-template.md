---
title: "Weekly Review - <% tp.date.now('YYYY [W]ww') %>"
area: office
type: weekly_review
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
review_from: <% moment().startOf("isoWeek").format("YYYY-MM-DD") %>
review_to:  <% moment().endOf("isoWeek").format("YYYY-MM-DD") %>
---

# Weekly Review - <% tp.date.now('YYYY [W]ww') %>

_<% moment().startOf("isoWeek").format("ddd D") %> - <% moment().endOf("isoWeek").format("ddd D") %>_

Filename: `<% moment().endOf("isoWeek").format("YYYY-MM-DD") %>-<% moment().endOf("isoWeek").format("ddd") %>-<% tp.date.now('[w]ww') %>-review`


- Repetitive things to do in weekly review
   - Process `00 - Inbox`
   - Review notes tagged `#status/review`
   - Reflect last week and Plan next week
   - Archive, delete, merge; as required.

## Reflect: Review Last Week

- **What went well? Accomplishments?**
 -
- **What didn't go well? Challenges?**
 -
- **Review completed tasks & projects.**

## Plan for Coming Week

- Identify 1-3 "Must-Do" Projects/Major Tasks for THIS Week
- [?] how to assign task to slot, calendar?
   - **Monday:**
   - **Tuesday:**
   - ...


---

## Tasks from Daily Notes

```dataview
TASK
FROM "daily-notes"
WHERE !completed
GROUP BY file.name
SORT file.name DESC
```

## Review these Notes

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


## Tasks Due Past Week

```dataview
TASK
FROM !"templates" AND !"archive"
WHERE !completed
 AND due >= this.review_from
 AND due < (this.review_from + dur(7 days))
```

## Tasks Due Next Week

```dataview
TASK
FROM !"templates" AND !"archive"
WHERE !completed
 AND due >= (this.review_from + dur(7 days))
 AND due < (this.review_from + dur(14 days))
```
