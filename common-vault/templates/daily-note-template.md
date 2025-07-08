---
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
status: review
title: <% tp.date.now("ddd, DD MMM YYYY") %>
type: daily_note
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# <% tp.date.now("ddd, DD MMM YYYY") %>

<< [[<% tp.date.now("YYYY-MM-DD-ddd", -1) %>]] | [[<% tp.date.now("YYYY-MM-DD-ddd", 1) %>]] >>

- <% tp.file.cursor() %>

- What have you accomplished?
    - 

- What could had been better?
    - 

---

### Tasks from Yesterday

```dataview
TASK
FROM "daily-notes/<% tp.date.now("YYYY-MM-DD-ddd", -1) %>"
WHERE !completed
```

### Tasks Due Today

```tasks
due on today
```

### Overdue Tasks

```tasks
not done
due before today
```

### Notes Created Today

```dataview
LIST FROM "" WHERE file.cday = date("<% tp.date.now("YYYY-MM-DD") %>") SORT file.ctime ASC
```

### Notes Updated Today

```dataview
List FROM "" WHERE file.mday = date("<% tp.date.now("YYYY-MM-DD") %>") SORT file.mtime asc
```